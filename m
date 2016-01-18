Return-Path: <B54851@freescale.com>
X-Greylist: delayed 858 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 09:49:49 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0106.outbound.protection.outlook.com [157.56.110.106])
	by mail.openembedded.org (Postfix) with ESMTP id DBE8965CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:49:49 +0000 (UTC)
Received: from BY2PR03CA005.namprd03.prod.outlook.com (10.255.93.22) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:39 +0000
Received: from BN1BFFO11FD056.protection.gbl (10.255.93.4) by
	BY2PR03CA005.outlook.office365.com (10.255.93.22) with Microsoft SMTP
	Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:39 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD056.mail.protection.outlook.com (10.58.145.11) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:37 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROZ015522; Mon, 18 Jan 2016 02:35:36 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:53 +0800
Message-ID: <1453109582-25485-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD056;
	1:VgoWS4V6VZCdlgqnXwz+LZncZ0PkfULHlfZVUPkLnLXOdDQIJomA3xQtHDTnyLjSoSaYWKCBXfAld7Fg4APjAIisenFmB0NuM54nhxsf8GyoZIbDFm1xXNkCBlBCjh5Sns2whGt+b1l2cV1yKDeS35ed7ar/NAQzKbFbl46rnV2P0r37J84NxMLOtam/j2omM00MXyd8mRJGUQSG2BJfpNP3xjQhGuebmO6kqTFFPDt/f3WR7m+DxpC80rV3QINdpYSWDe7W6fpIL8kj6syPYviLGX5DEzn8+2JTzXIi90+FjfDitbDVAfC59VvccQ6EL5v93WreRIFFXH7EnnihXt/4xJ2DCiO33eS0ParWRvFsLZiW4CPTy6YN74vE+XqCm/Dljkuy1bFgHbZPlBf0D3E8uDsrZRN/SDNUd5vOdF8=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(50226001)(1220700001)(97736004)(50466002)(48376002)(1096002)(230783001)(50986999)(81156007)(76176999)(19580395003)(104016004)(6806005)(36756003)(19580405001)(86362001)(189998001)(586003)(87936001)(2950100001)(5001960100002)(107886002)(15975445007)(450100001)(106466001)(85326001)(92566002)(47776003)(229853001)(4001430100002)(5008740100001)(5003940100001)(11100500001)(4326007)(2351001)(77096005)(33646002)(110136002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 25f5ece3-9a8b-4044-ff63-08d31feab98b
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:XRI+UJD+1AfrWzOryqTiZPzDz1LDj7nUEwmCoqB8waJkH8HUbHkNIy06g+OB/JCNNhpk9TmRbI0f8+0V9RaEosZ1kAiiUPWHi6VeHFJ2CieuSj/uAaf3PhZZtqLHlCr1D5S3Ce5uee6L5tMYSzdM7iHUm5EocM9bmEhg9qnz3YSKm7KNpYTrmbam8F7J+zpw;
	3:hUUWIN8GpO76SxG6MNQ3bxHDjaOuDAdHgI519y6T/uuWoLytjZaMlWJgzaxm9nJQ/lbi6bjZ59i+YUoGnQe6YKRw6dI1lmF2JD0cDsrlKVU9Nowpv5nvHdJoYTJGi9rqTtAO+KjrTRRMyI9ErzPFKrKXzjJKWj5KfT8Z6vRCrfqt756EM0/UhQYUCa2vh98wxk+ctGPdET9Ehs0DHlCgu9x4dAf6F1JsIIx9GBDrvIE=;
	25:BiEBJ9/5xcULt3qKXw47zyWR33pDNHs8Y3S+6aUw+MFOtGa49tF1vtcjpTaBDose72OvXyDKhtaTwxVci9Vjl0uoyInqbrrTyi1lIC7tasNX9oqrWthxFW2I+hO+tSxXCokUpP+gqQwEEgqU31niWXbO0fKGCp8DtCtp7TgbXRUP08BFfiDD6xRR5Uouv5h2HkzPm7yR7sDsf1RCbnMAhFqZziAzj+d7M47BArT9tu5BLrtXSOWC0aR7v0vaT7ti
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:gWbMM3Jx2rWg/2r7oDBLbi0FCeIdzfjfXI5IhMnch5aV1mQheJlg3rI3SeGyIlwBW6u+UX2AdUehFuy4mfKKP3RASj/TrITa1LeIG7BtuRzRvpJKUHERZ+zNqwsUblwkomICQn4WLvU/3q1L4Mdz5Sm16/Zcngful28A4d6j2+y20VZJlMDUpecTE+OLpAYDlMpUz+EoaumNBSMuhMkvR5etx8QWawICtWXYJIT2qtbRbL7Lq9jOc0KoKv3tw1OqHmwcvFUVuI6y1KigEKYJkczWs1Df5Paacgh3nbaCvj91n7nlVdGmTkETLjtwu7/wKVmYoy5HVhTl8v46wi40429TLTcYwG34Jvg2w5RkcH4oLseJ46KSzE8HAVMO10Bn7RVsssgzIlsNNg84SIH+MWZJRxNxFA6CT5QsWsTyKzgutBl9rYZK0m3HsdbmikGA;
	4:zEetCcs34mBEHk0ws1p1RsJ4Xbu1aiJv6d/gG2pTwfeogQhI0l4iQmjRc0LbBSbNcjEEnFufJ1dWLeKb+QIGXaykUOPLsCO/n0TmXmPo6ITGUI9r+OXx7W6k8NxS8ZzgV1Ly+pBzhXe5yx2xLZj66Y/nuksDt551ec9aghBg4jD4vOgNFAG2J6EFT6UYiWMWQw7uGOUSqu651zqw4fWKU1zIycZOXnP6Auak6uS6NCix8wcYjdggDsbmLs10Ga2JCQ7SMmiwZ334gPwhL9PXfu0ASKAT2by3ALOOHQouD7YUqAJoh9b3gBth3j+H0qLgrNrk59CgXgkf06g0MJ/SYqnNXJ9W8RWXunXvW0O9/gsaPFrP5jjXv9ieJk4DOWsneC0XpVdITHQQaYPNnqTcn9ihfI6V0olb5r8fo38lwIsoZteD6nEfu1dOw5Or+iFkalUTCfaOEggXGkhxJq+WzRXR9atX2mnbPblSJDddIKntACeM2gVYyyWbM1F7VRPu
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11759CEB44922BA44C241DC686C00@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13015025)(520078)(13017025)(10201501046)(3002001);
	SRVR:BY1PR0301MB1175; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1175;
	23:uL8pde/Rza0LLzSzuIWdeAAdGJ9MnI2awXjjqcH?=
	=?us-ascii?Q?somlrFHLunrxXDDSo6fqkA0fyZQdfx3/l7ziHXMJiQgz6JgtWgnszZHqzrKE?=
	=?us-ascii?Q?9QJPiPgp9+nwGVOGxZftWupohnFZKYZfOWu5GfQDG1+jpervTUnrzVLcFQah?=
	=?us-ascii?Q?D/TaaBGyrZ1O9mr1tKzljifPey0LiYRYDW1oONWepARQTrm8ZnBpYd0F91Eb?=
	=?us-ascii?Q?bI/BMPhmdogFFTuxLhY4CNyJPITp13NdT+f8hqH2njJrUdcwm+WpYhI/P/xA?=
	=?us-ascii?Q?cEBmi0H+0G/6e3MtqzEQMqF676g0soxfHPa+qLn1JrR2bqzAiQJalV5qkHSz?=
	=?us-ascii?Q?Mn+vN3pKYHKiUd3eFL/4TnBlDQ6AXoYMkDOYe3vHgvLWwrzQuBrt8k7F2ADU?=
	=?us-ascii?Q?QpY/c33DCGcwLKYM6JM8Beer+Y31faYhWQuLSMnkMQcGrrLKedi/tcnKBLmz?=
	=?us-ascii?Q?tpmyBXyS9hP8XyAcKM6XYPACx7lMXI1dM2LMSF6W2DcRw3iHNpLISB1oUrR3?=
	=?us-ascii?Q?5V6hRH/MnaXJxXU50gRnLefN3MYjdrU8WPHynUdImAnueg9ud1eSRCxvAXbL?=
	=?us-ascii?Q?iBYAyl22y+3WU8kf0JiN/hanW9C3ZZgnwsAJYWhU4qAMel4VepYm9ENA7P6V?=
	=?us-ascii?Q?snb50WVP8+m6hhfkjz90Z25azL98uENTySyRLfhHLanPGbHvaTWq2nYh49zB?=
	=?us-ascii?Q?jQMBiXcv/G6Bw6cj6yJjyGT3oaLWUkDx3ebhXH+NMypI+Xiviqdmqj7u+qMZ?=
	=?us-ascii?Q?Cb1JVEOSFugLTCJcKXfGXOeA9XuCfnfygJRyt4GWzXtw3LoZZtKxK0zqMYaz?=
	=?us-ascii?Q?aoykbA9qvGlYx8xT7Kpqr9XB7Aqy7OEO/aGrjHJD1hlKH9jv3PH4Q2t5KCsz?=
	=?us-ascii?Q?v/F47GfdLG8Zmp+gHgYWZvFM66+sS709+rbc1JjaSCfajNw0FwyZEWV/QhRd?=
	=?us-ascii?Q?xgp0vaG/9GK5eWNPRRAwilWSLEHCH0mBRDLZ6cxK6bdpSMTLrtxhN9BajcYh?=
	=?us-ascii?Q?89xOAx55NMo5jV1tQWD203xl/SGshAnVilHGbnShK++m+vZoxHsqNOkYNr1n?=
	=?us-ascii?Q?w75mzdRyBRZ+ZT8wOO/kr5Mn9CcOdxoAHtazycY+P4GpH3MTQBzqPF5oaGF2?=
	=?us-ascii?Q?8/2ppxjCFLE6gNlNQwnWb1pliSxFtYn5+AcaNGxs429lb6pO/KguZtA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:7j9UIvM03v67RM2q7AE6atmLXNKd4RucgbAqsDDA40+zLEpSJkfYwJv6j5l4rzo2q/3D+1KKxfufcGEx+UFW/yaKnIsZsyWpyHvd07BNxEeKqADH2qQe00gNgWi1WBP+v90gPZZxi6sBldrDFq9N9A==;
	24:eQ+XXcvQUc6l5j6jfURl1YA8PDNht9h8ZAPzIGTsChB7eNhGvHrgiv8ylJiOELVXrqQMvFltBiCafOK2nnjIW6gEL0nh0r6bYsy2wRViChY=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:37.6716 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH 04/13] gstreamer1.0-plugins-base: Make gstaudiobasesink print warning instead of returning ERROR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jan 2016 09:49:50 -0000
Content-Type: text/plain

For those clips with corrupt audio track,
there might be no output from audio decoder
and thus the audio track have no chance to negotiate.
We can just print error warning instead of return ERROR,
so that other track can be played normally.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...esink-print-warning-istead-of-return-ERRO.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch
new file mode 100755
index 0000000..cf56afc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch
@@ -0,0 +1,47 @@
+From 5d83c4db60646ce077dfb2460b59c9d30ce06b04 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Tue, 17 Nov 2015 14:56:47 +0800
+Subject: [PATCH] gstaudiobasesink print warning istead of return ERROR.
+
+For those clips with corrupt audio track,
+there might be no output from audio decoder
+and thus the audio track have no chance to negotiate.
+We can just print error warning instead of return ERROR,
+so that other track can be played normally
+
+https://bugzilla.gnome.org/show_bug.cgi?id=758215
+
+Upstream-Status:  Pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/audio/gstaudiobasesink.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+ mode change 100644 => 100755 gst-libs/gst/audio/gstaudiobasesink.c
+
+diff --git a/gst-libs/gst/audio/gstaudiobasesink.c b/gst-libs/gst/audio/gstaudiobasesink.c
+old mode 100644
+new mode 100755
+index 704801e..a4a716b
+--- a/gst-libs/gst/audio/gstaudiobasesink.c
++++ b/gst-libs/gst/audio/gstaudiobasesink.c
+@@ -1133,10 +1133,15 @@ gst_audio_base_sink_wait_event (GstBaseSink * bsink, GstEvent * event)
+     case GST_EVENT_GAP:
+       /* We must have a negotiated format before starting the ringbuffer */
+       if (G_UNLIKELY (!gst_audio_ring_buffer_is_acquired (sink->ringbuffer))) {
+-        GST_ELEMENT_ERROR (sink, STREAM, FORMAT, (NULL),
++  /*      GST_ELEMENT_ERROR (sink, STREAM, FORMAT, (NULL),
+             ("Sink not negotiated before %s event.",
+                 GST_EVENT_TYPE_NAME (event)));
++
+         return GST_FLOW_ERROR;
++   */
++        /* consider there might be chance that corrupt audio track without output buffer and not negotiated.
++             We'd better not return error and quit play, video track can keep playing.*/
++        GST_ERROR_OBJECT(sink, "Sink not negotiated before %s event.",GST_EVENT_TYPE_NAME (event));
+       }
+ 
+       gst_audio_base_sink_force_start (sink);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 014f081..2e7952b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
             file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://0006-handle-audio-video-decoder-error.patch \
+            file://0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1



Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0119.outbound.protection.outlook.com [207.46.100.119])
	by mail.openembedded.org (Postfix) with ESMTP id A50597637A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:35 +0000 (UTC)
Received: from CO2PR03CA0039.namprd03.prod.outlook.com (10.141.194.166) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 09:58:34 +0000
Received: from BL2FFO11FD022.protection.gbl (2a01:111:f400:7c09::151) by
	CO2PR03CA0039.outlook.office365.com (2a01:111:e400:1414::38) with
	Microsoft SMTP Server (TLS) id 15.1.201.16 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:33 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD022.mail.protection.outlook.com (10.173.161.101) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:32 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPei017590; Tue, 28 Jul 2015 02:58:31 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:07 +0800
Message-ID: <1438106291-14986-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD022;
	1:/xaY8dglaDUT3mHqrgXYuwErhNRx/L+2aybuEibFDVNJWgV8nqWZ9QE1Ag4p+e/KvM4HyliADLBzb0fHvmnlK0Ugi3IwyXoOH075apc0r5HIDMcLkSAL0LVC1V1Ojz8h6PbuveDBYEipau/wx1Dd1RnDgBUtDS8e8OVRUS333sVlc5STnsqi/IYHdL7nWbd9ouxGGhjBgb3x3BFq+SHHKWAGcRBloVPiryr24cd5FN7He7PuDTBIakeZwcQLs3j53vNUJl4c/9ATkR0YjxOS7Kho9WE/4LdjrlwY0dR8/Y7RU2H1sjGZ1jWXZeZGaQfO49MdVqRjmFOTIKNzPCjZsA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(85426001)(33646002)(2950100001)(76176999)(2351001)(19580395003)(104016003)(77096005)(6806004)(50986999)(50466002)(229853001)(87936001)(48376002)(62966003)(86362001)(77156002)(46102003)(230783001)(189998001)(92566002)(15975445007)(47776003)(36756003)(106466001)(50226001)(107886002)(19580405001)(5001960100002)(575784001)(5001920100001)(110136002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:kjukuhN5x1/QrYh6gwaHqkzIeUCKaBHZ/0MVwqdSZRi2moSMWnZC95goRpZMtZdWb/c4Oa3zpsilaw3xzH076DIcLZAxlPxM3v3UlgG7kVJE/x7xh1RNtOF7Ec7+ZLYX2EPy1dz8Hq8+s3S4X3J2hhUYHkK3bd7//gOsEX8cPhM=;
	3:Z2vl+ixyUdsdnkCS9ue7l8/EGzm+TjSJZGA3slgcDi1ElqLyKC9a8E+DRP7PxtgIUmODjwrGyIbrK51DlnTtu0U/jFvQsS1zEgaUbfNR2CpYowwtL7wWCDalhU216w+3/E5I2CDdMd6VJiiSslyEhvHih+GRHpmhDmnIxefEmYcdGRDY2S8jcvQm19WRP4pr0l4Gz4Idb+14jZYFW3cbRkK9amH0feFizQ41342tv/8=;
	25:dVOpHvmHaNqvWXoXUY+FymhlwG5RCdS2+xiNLuY4scucyfpx4CaZq68hV3Aqi/je3VcDH6pxTMgl5yXVEOC3dQdgwXZGrfP0f5jvvf0ShwA2bofuGOUC87cgTq7LWdsLy1Nb29IfBJ9j0168nm5Cqt51wsY1VC1F8bj4+VOfuQ+JBvp1851H4Fns2kX2LI1NhT1mmPnIOKTrJAw18wkF95GA1uaTZaSGSWbVUdcFGo4X6Lk7j4lL6YPagh09XsO/cb5/2u0qrGq6q75GIhW5fg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1184;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:DXzftUqQrjMrcYRLePmP76FAp+k2oeGOn4I/2ijrJT8PHF2kbrUQDIjakzYjPupftsLaqFd+Qf/aXWsg+usmn3MkB8fr6qrQF3y/X/83gB/tZF4ZaBYPDt0Zwb21Oll7yOkD3KW02tj+zZ3xbHDzKFJ8KrDeUqcQ4Y9HxesEp05VJvUT+iWFybpghltQxjZTRpSTW40HJk7ErJ3vQKzK4RQM5vpQxOFglvoxFW3IKECE8mdrSqkfRnSVd1FTgj3OsNv10Syb4Mw2YwPRJ7JlNnZK0eCh8YaTHSbeaKKiVYSCfk7fTu3LnzegxTpt9lyiJfDoIkSPODig/EE+ipyE+Q2K2HOh71/vc6dZluZaxrQ=;
	4:+rphvBBCWYsy1faZJsY0DQysQ8QHqTtKIasjFZ6HLuOh9TR/NfpdxpVwrl7FjsfXpj6g3QPBI/EqOayiuTbQ4yTn2oXt1fT/V6o6X0WXYtsgPcLMJZYVMnW8aa7maOlAGRpQEXQfKtf4WytGsc6582wHUSRQo6yPi1tskyDY+UODLmFHwz6x4TcVfiG644Hh07nPxm1ZyZLcdG72zye9PLXvDlrr+fLf2UwM8CXZxd2idJ1hhxQIfA/pJPa6rPf6DIiEVKHArZB7P4HIncu6L0RkOgfQKS13x5wU/nWkN1Y=
DM2PR0301MB1184: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11846BD63CA13320A2988413868D0@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1184; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1184; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:MoJnjz0GHbC374lZCnPodaZReblI9QeUuU6U1Ke?=
	=?us-ascii?Q?uR+/xFqP0jiXbn1rS7BT1bEVozT+SqeiRLcTwxihQos2FFajPuMMQZ9zT82M?=
	=?us-ascii?Q?gXOWf7Xj1BV2NnTqMO85HW6B/OQTboJtBHiHLlCp7yU1legDZFlEO+ZSi7B5?=
	=?us-ascii?Q?WjIKtivUrwybsjAEMl90Y7Wwyau3mAyDQeO5wYFPTUrsA/Mn9K5CLpPlAiOV?=
	=?us-ascii?Q?SgiEzz6sb0R7R6eenoI8wn7WtC79W3an9Z9UJgT5uavue9tlvonXRKLd4Meu?=
	=?us-ascii?Q?wTDzMRjTaRLSCIAyYiZjiCUGJjf9iiZIBz4bNf+141OqcF1W2/9/5+cViH3z?=
	=?us-ascii?Q?WoVdak6cWOVIUCH0tvpx3dog2x1AgwSaf4pz7CUvhxTB+F/PNy2zTKwLhO0N?=
	=?us-ascii?Q?oO72tCa61e5hQ9didsMDXhtj+/ZG3wOe6QsR7s0YalI9uOqkI9Vv4wH/o+/2?=
	=?us-ascii?Q?g0Xeb165YOvNLVcqad/737zXFdK4KP4RMTGuXZf9HQeEl9zmvTPCk3Q0wBoG?=
	=?us-ascii?Q?OPaqf9/Na2tu9Vg9w9zacwi07PaCukUmAtJ5/aT4FRM7gRyzpor2fY13z8Fi?=
	=?us-ascii?Q?qkdXxXC9WOPJH+9zq2DDbdvfOKADeC+GR16dy/imayGmiwgMskbEl/VExxmf?=
	=?us-ascii?Q?EITCPj9DVXYxFYd3s3Nv26Pzrx/oryEF0+zHkG3Y2mb+4g8JI0zmL10sGWXp?=
	=?us-ascii?Q?zwErzLRQgMhGZJPchVvRkcIlJRo6jnw0hgLTLheFnddkF87ZWggDFV7TtUKE?=
	=?us-ascii?Q?hodwbVdmvIxtaG/Oy8N0cAjwE3yL+iNfw533T+Jyg8+e5ngjd4tuFyO0T4Ua?=
	=?us-ascii?Q?fVn4h6EFJUUe9AI//GOSIWAHyRNoMp3L7eNhD4jyaO9kzjm0AYbu+dYZf8+P?=
	=?us-ascii?Q?D8bouJ38CnkDqH3z122WFBDq7ScHsOlfJaHipNayMXhZc+8a7jSwPK8ITQan?=
	=?us-ascii?Q?4Ie9PwsOn+cfPtFa3nhAPzTR0hDJAqAKeP9/z5yBs0W5hYUiXxQmwQRLaEMr?=
	=?us-ascii?Q?GIy9PP14lAnJCYlTMi39OrDOE?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:UCpEod93BJTYEfKGb7Z+aJkA8BAzmhiCMNW8U4yLs2PnaZvUhA1ZkvjdSA7Eau8NE8UZN9KuEcuZPlNBBg6/v6vMLH66BFIat9h/Feyt0L1zJ58J4JjzkVT2tfeaJSaXrKD4jLBJdgKWrPzCG28LIA==;
	24:7qI1EV3LOk3OuQ8yL866a9LXZyMFa71alapF7WcSPgT4tlNRiEI6qcynY54MvtMkgA5xbLivqy3ZKF1V27uYx/ENKqxCJAgIB3wcstHAJYU=;
	20:xwMJjiiDWqQCYbIXl2QZKsrQOpeGOz1ioO4JSO3+ELCpPMOdEeMVn958sTQ0FKRv8eXRjq7fQFoQxaWayjra+A==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:32.6043 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky v3][PATCH 2/6] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:37 -0000
Content-Type: text/plain

If there is input data and no output data to the end of the stream, it will
send GST_ELEMENT_ERROR and quit from playing.
The patch comments the GST_ELEMENT_ERROR() and add GST_ERROR_OBJECT()
information instead.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
new file mode 100755
index 0000000..eb15588
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
@@ -0,0 +1,66 @@
+From bcb2b8b6f49e7c66124a4f5e07dea829d5ebfe59 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Mon, 15 Dec 2014 16:52:07 +0800
+Subject: [PATCH] handle audio/video decoder error
+
+When there is input data and no output data to the end of the stream, it will
+send GST_ELEMENT_ERROR, So the clips playing will quit.
+However, if only one of the tracks is corrupt, there is no need to quit other
+tracks playing.
+
+The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
+information instead.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741542
+
+Upstream-Status: Pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c |    5 +++--
+ gst-libs/gst/video/gstvideodecoder.c |    5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 gst-libs/gst/audio/gstaudiodecoder.c
+ mode change 100644 => 100755 gst-libs/gst/video/gstvideodecoder.c
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+old mode 100644
+new mode 100755
+index c2e7a28..891df0a
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2123,9 +2123,10 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+       GST_AUDIO_DECODER_STREAM_UNLOCK (dec);
+ 
+       if (dec->priv->ctx.had_input_data && !dec->priv->ctx.had_output_data) {
+-        GST_ELEMENT_ERROR (dec, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (dec, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(dec, "No valid frames decoded before end of stream");
+       }
+ 
+       /* send taglist if no valid frame is decoded util EOS */
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+old mode 100644
+new mode 100755
+index ac581e1..4278bcd
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1068,9 +1068,10 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
+ 
+       /* Error out even if EOS was ok when we had input, but no output */
+       if (ret && priv->had_input_data && !priv->had_output_data) {
+-        GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
++        /* GST_ELEMENT_ERROR (decoder, STREAM, DECODE,
+             ("No valid frames decoded before end of stream"),
+-            ("no valid frames found"));
++            ("no valid frames found")); */
++        GST_ERROR_OBJECT(decoder, "No valid frames decoded before end of stream");
+       }
+ 
+       /* Forward EOS immediately. This is required because no
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index aaa1ecb..aa90179 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
+            file://handle-audio-video-decoder-error.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1



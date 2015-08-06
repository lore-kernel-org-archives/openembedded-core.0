Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0142.outbound.protection.outlook.com [65.55.169.142])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA7075BC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:29:25 +0000 (UTC)
Received: from BLUPR0301CA0024.namprd03.prod.outlook.com (10.162.113.162) by
	DM2PR0301MB1182.namprd03.prod.outlook.com (10.160.217.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 6 Aug 2015 10:29:24 +0000
Received: from BY2FFO11FD017.protection.gbl (2a01:111:f400:7c0c::140) by
	BLUPR0301CA0024.outlook.office365.com (2a01:111:e400:5259::34) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Thu, 6 Aug 2015
	10:29:24 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD017.mail.protection.outlook.com (10.1.14.105) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Thu, 6 Aug 2015 10:29:23 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t76ATEAa027298;
	Thu, 6 Aug 2015 03:29:22 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 18:29:28 +0800
Message-ID: <1438856968-9564-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438856968-9564-1-git-send-email-b54851@freescale.com>
References: <1438856968-9564-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD017;
	1:63/9deyhc2iplTJo3nNHF9RiyfEceeThEyXKZPf/Dt1mmr9UjjruEWlwsqio9hPz5uzgSe3Fq5+kQPJxoshMtwV+avFZpqIoCTxAkiq1y9oHQPhQ9DIhT0vb1NR0Ml4CKBVOCG3S0p1yKCY82soXNdB+D+76STA2iGAxXFIRqxVPTShq+nHiVUD0R/u7oEUSoLU+3fuqF9kGCb0eATfMT2k8kpuyQkMKeYVfAtKURMdczSTsUTkDvXUxH+V1/cME/k16OlRuJfQW43d7Mz3080EoSRklRAvQRXctZMuzAHyiKxxiZlBPnbn2U1Y551NIrktGnTDO2bpEPMiURQEfwA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(6806004)(19580395003)(19580405001)(87936001)(575784001)(69596002)(76176999)(50986999)(230783001)(5003940100001)(46102003)(64706001)(47776003)(229853001)(2351001)(33646002)(104016003)(105606002)(48376002)(85426001)(50466002)(5001960100002)(36756003)(5001920100001)(107886002)(110136002)(62966003)(5001860100001)(86362001)(68736005)(77156002)(77096005)(15975445007)(2950100001)(189998001)(106466001)(50226001)(81156007)(4001540100001)(97736004)(5001830100001)(92566002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1182;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	2:toVoNgAkym9iPHF8Uh+KKTE98Fg+RsudG9LYBKb0STi/49pVsSoBTYIF3yG34OHbppMcANes28+FOSjaq/vDhvw4K4cmXP1w5fTegM38Z+qI/xkMFMrdQMo8ttLDu8x9WJFU/UVVLmeqEAwwg0x8sqOkTAtWlTwtr+as5YDF+bA=;
	3:N9+y3UVcgBN93o8+fg4mIS2LNv18NlPnMFBtVBfhjqPKbTzEVBY1ccaCdKUF5YtsurJHSbIkw8dpB6bRQ+G8QcXi2tsfjaXZfpydks8nU7Y44iOKaifc6ObvajRwtDDz2cXw5ILMdNni36ni8Rsd2GyfEpyyAEHjGesPjRnRrJT0VTY3vx9e61WjQTQn92c1Lgx2Tnk2nNmtfg0rIM/GMBsdk0KPIFEpHfEQ+regr3g=;
	25:5D876iZOzIpt7bwZuXXXQdrMgqXTHKKDE++3zFsIy3RuFk2TSDyBNQ6h1YvKFsASDf6BK6miQZmOZxZzX1Q2Fjwc1lohdDFjdIg157/cQZGeFDvXrivjZWWANHzEYaF+4JBHSTVCDpV3nneOW2NvvweEDCcLTa4/cG1YuSOhh5O0VnspQeK0p8zfAmCDG9kpb2ylWzmDZSHqA4JtGflF6s7IpnoHU39jO62NLxuQfzJn3FcdZOMl9S7P+gJZasP2RrUIktkKa8fagUkcVj7/mQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1182;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	20:0fStFIG1mgV3wIO8KUYtawhpKRdWihRPAd/UejmDyGawwUI8tAkUyYTnDBLuM1f1614wqRzuzlbXRZ6Ww1pdgJjyry37b6jIAjHb2EH0L3DCeW7YU1DOJvdm4j56qf8ETVILyOy2l0HgvlDcZ9xxIM7rBABUOUxd9YNXMjQHbWkq4qufl4SJDmIHidB1OMddWRTCjQBCL4ZuGhpOrGOiRUFvSC87+AjjOPR17W3qlV/e4dpwCkeFeP9AnTq9baiXWo837u2RyUzqTy5UbMN0ZBWp8vyAqd+KHyqXGoc1qxKAxEHw3ymMkEtH3VCiCXPCYoC2AuOAm9kiilib4dpwRfy8l/tuwH9oCFE97/gvIwE=;
	4:tvysTl8kDSmiupeh1PW/9UFsd3I81RrJg+NumO8YIyFF9yvrdAstk9/49J08nXhqlaESSZceyTUd3+DSuLaZ+38NopAOL9GJXgUiQLyJqz0N/0CVFeV90ZQkowBSoWxooaJjprvh1swUrXBs77l1LDK2mOqW30mcUHwyQySF4RmC0YY1O21pyLfs3twhJ7i5AVaadlzANxaqmeVF6+XtssWVDvhukDeSddDkejNZCS4mZJHciZNmqSqNRqGixEuwY37/8uQV4GuLbXp1RrYZLdnj/1C4D2dQvlIyNdx7eCg=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1182472F845874F5064FEEF686740@DM2PR0301MB1182.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1182; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1182; 
X-Forefront-PRVS: 06607E485E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1182;
	23:b+dBhk8VxHje8ZyO/9ta4DEtVsN4D+XRw1mJAuW?=
	=?us-ascii?Q?p+QV7m/f6zQy/J/lBVDY5qy5OKLiR6qaQpqnesOtcGqPDTIh3kJwM0qHZdDv?=
	=?us-ascii?Q?tnkVootTFiWdYqUD67cDWelCEWOzVTRDsCc3egyiJHrxQU7l3WCGxKBRK0Ue?=
	=?us-ascii?Q?KKun84YGiy5pNmSS+w0UzdkCwoPrtkKNQL+jxLkGNcZod4skyEf8hjqDKXfP?=
	=?us-ascii?Q?mBimkN6yreK16GD2idqoPZ1XoqXK3nmrO32bIN8fkcsBaCyXLU1yxTX1D1UO?=
	=?us-ascii?Q?kxlX9uqR5myv4TXAC6oX7HFI+LBDke4WPp1OPc2ffyomghxchuniEjao67KU?=
	=?us-ascii?Q?VUovm6J6W0mhGIMrAjL4kJyvGeMr37UOPQnObf6xqpkVaa0A0BonNI75ajaG?=
	=?us-ascii?Q?Xk/cpDL9+SgHJkVPACq70nXHqWVforP3PkJezZVB3/GHVlORoVXbjaplqV78?=
	=?us-ascii?Q?s6FMaFl6EcBBZW5PF/8wlawPrdzAgEFQFTibHDFHlTTHkFav0nblfpO/r0+V?=
	=?us-ascii?Q?JbQfIvoLVl62BV/t2GHOou2/HLVCzMfac3fN3qQxFOLNuySz+Ps7o97yl2fv?=
	=?us-ascii?Q?Mhz0+9d/VQQNWO5ZT/C1/tk9hYzcp5PZQNA2jzmILd2OUgN7nimj3VGU+7GJ?=
	=?us-ascii?Q?UTvxnDXmfPrjzrEhJY9V6Ek0XFPBtVX+rSrpxKG8dbGm8Eavzu1kg9s7tX5v?=
	=?us-ascii?Q?vTmF4sySsgtlul3GemY4tCYoCponaAgLEKzUP/6AWcsM0CvY+b2y4PfeM2bH?=
	=?us-ascii?Q?DUJtbOjjS6/u/EZIbbyQbTkYTRTzPdgwW+dAAw7LwN5kQXLV92XQNAJMUpHH?=
	=?us-ascii?Q?J0tlK7srr/cjflD3LVsYk//k97zHdNiPovOMIArKOGqP8+s220eogMNfKOWu?=
	=?us-ascii?Q?/9hCOHrf/WIWe9LViYWXWqENOzSbLqd12jRIa+HSvj3DS0L+0Phoj+/Cg8uc?=
	=?us-ascii?Q?rkEZdUShO3Fki93KdBfQREu4EIHGDVZ9+t9NFmR7qj5s35tdxe1E+toOOIY6?=
	=?us-ascii?Q?k+reLymCLb5I0Ii5+TK3xSy1D/8O2xc154jQQEpz+jJNRuQ0epOC/ZWo8ze3?=
	=?us-ascii?Q?OCB0SMqNpjmA21gDNKaqvcdO2FEEpm0dpqy2P1bmr71Npa6ZWIKHgcIf24mk?=
	=?us-ascii?Q?NpO7MIY2SmJmnkCDfNYDTxDYAje+Qo6Ru7xXz/HxaP7XVv2r/3Vagz+9wciX?=
	=?us-ascii?Q?vLprqCXazfV9YXM59tesoRBASorW2+0GJW7ioQBgEQydsE1EcQUtJuKpHFcJ?=
	=?us-ascii?Q?zBx6RysxAw+P74g2Y2Oppt6Vci1snMzX56auZHeKb?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	5:bKbNvMfxQiB+hJfzlxBqkAL6f85zBfDKcWiJD69Bb4PIF+saTG/Orzhhped5h+xtkcfIzxDubxN8ppw2jIKWDSlZLp0wmj+yX9DclMw9zXEwnVk7HUnIuEExF0Hj/OYWUOMgRKTmr0AJByZkj8KkvA==;
	24:Xb5dWvl1o3JjlEteBek9DUxMGYcTLsgzNZuI9O3K1ZZzyMhe1I7BvyDfB0PZKhRzTOe6Ct/9nMfJsgb1wXtGMDEowiFLonlE1bMyAzT7jcU=;
	20:MVLDrNqhlhna1HPcuwj3UxSwE3tyAjY2Fte4PKi0xibhwT6rfEKk1iGh3u6N+c1vs7F3PsfHsuyFhjhcQgITWA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2015 10:29:23.5901 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1182
Subject: [poky][PATCH v6 3/3] gstreamer1.0-plugins-base: Add encodebin related patch
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
X-List-Received-Date: Thu, 06 Aug 2015 10:29:26 -0000
Content-Type: text/plain

Need more buffers in output queue for better performance.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...eed-more-buffers-in-output-queue-for-bett.patch | 32 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
new file mode 100644
index 0000000..3256717
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
@@ -0,0 +1,32 @@
+From 540e02c92c75e08b90326863dc787fa5cadf9da6 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Fri, 13 Mar 2015 18:04:31 +0800
+Subject: [PATCH] encodebin: Need more buffers in output queue for better
+ performance
+
+Need more buffers in output queue for better performance
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=744191]
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+---
+ gst/encoding/gstencodebin.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gst/encoding/gstencodebin.c b/gst/encoding/gstencodebin.c
+index 6728e58..32daae4 100644
+--- a/gst/encoding/gstencodebin.c
++++ b/gst/encoding/gstencodebin.c
+@@ -1138,8 +1138,7 @@ _create_stream_group (GstEncodeBin * ebin, GstEncodingProfile * sprof,
+    * We only use a 1buffer long queue here, the actual queueing will be done
+    * in the input queue */
+   last = sgroup->outqueue = gst_element_factory_make ("queue", NULL);
+-  g_object_set (sgroup->outqueue, "max-size-buffers", (guint32) 1,
+-      "max-size-bytes", (guint32) 0, "max-size-time", (guint64) 0,
++  g_object_set (sgroup->outqueue, "max-size-time", (guint64) 0,
+       "silent", TRUE, NULL);
+ 
+   gst_bin_add (GST_BIN (ebin), sgroup->outqueue);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index ba76bdd..b09c2cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1



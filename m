Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0130.outbound.protection.outlook.com [157.56.111.130])
	by mail.openembedded.org (Postfix) with ESMTP id E9745605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:44:14 +0000 (UTC)
Received: from BN3PR0301CA0020.namprd03.prod.outlook.com (10.160.180.158) by
	BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.219.17; Mon, 27 Jul 2015 03:29:56 +0000
Received: from BN1AFFO11FD009.protection.gbl (2a01:111:f400:7c10::165) by
	BN3PR0301CA0020.outlook.office365.com (2a01:111:e400:4000::30) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:29:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD009.mail.protection.outlook.com (10.58.52.69) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:29:55 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3TniO011958; Sun, 26 Jul 2015 20:29:54 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:29:34 +0800
Message-ID: <1437996575-29558-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996575-29558-1-git-send-email-b54851@freescale.com>
References: <1437996575-29558-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD009;
	1:H9SMoVsmMvKfOpJNIk7ipqCTYZks80KB3KN2t1sBccno1VcimVThl01Jln2NLYwVfGHn1vYRDS6/ixrWHeWoSLF0yfTEjiHYLJ4HIpdL0mWjN3btWr8GcYLJzH00XNdCm0LkC0G+8zKl1t/yxEsOI23DXTC7UX2DOcCZL4fzngdDhzXtRc65dJamHkImWLrQ3VFHiU2PSOMHteQWZi9zLL4SRqmWH3gtevuvEyHQdwr5eN2mTC1LyULsyFihXly9Yz/jo3oPNos7p+dDC29lGF2h/kv9Sf+Qw/slneiqrfy/TYkEyajo97DAEZ0QgEtlKBIZ+6AutELC+xabG7TdQw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(36756003)(50226001)(6806004)(19580405001)(33646002)(107886002)(5001920100001)(189998001)(2351001)(229853001)(104016003)(46102003)(110136002)(77156002)(62966003)(76176999)(105606002)(47776003)(92566002)(85426001)(86362001)(575784001)(77096005)(2950100001)(19580395003)(87936001)(50466002)(5001960100002)(48376002)(15975445007)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1172;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	2:At0jXB/SB0tXxzOLxihHtD1zx6jGDFUdz7wAiOSmyJbQ6VQhTDdCz/4L+VeLeX7k;
	3:RllUjGWC8bpab6nRcbdbcRvIwpE9lGWX3sUvuD4coS1P+NEt7m2zzegHyqzRGUIc2Nq/XT1SguZOboqNFYR4JsC4tyAHW1QvkiUTibcG33nbqQ4R4hAn9MF6PpuTLNsi+vRDGgmIOdkHFL1NgQ5q7BoNnr7+1bFLtjCyWE0OU1sIXs05N4OBeBlbBV7nGOvu/kJON6ZtjDsM6mnFgk2iT1ZL986GASfP8HdknJ1d1Ds=;
	25:NxLaJwriNzUudYld6kek/tcXi2Y0S097e4sYRAwT+dXulZ9UB95pFDt6SvKgj1PlBneh6A0z5sciKUkXBwOdHMJiOVv3RCfayMHKArMmRy0w8Lqa1/n2QR7loRYkRAt/OPEjVL5ToomOhWw9SvG2oP2tFwMJXcR9It/eUvPYs3Fu3vsEf9oRBJ9T5PIUUS36QjKPKbIxrAez4LkY4Z9Pna0mpfQ7Aoh3gXMkCIJdsct8W6/XMbhh35urswpMYeby;
	20:5GwpQpX6zyX1Qq6KumXgdiwI1nAuz3EM/cxOmQltUCk9TfmqorMcV6HhLRvLefJHZcJBNv6RpX1EhY+ZBShRYAsTiRkIoDlzn2k5ho62e89dVS2P6mJFL/Ua760GtC8OzfMrlh0GMCNXfMz9X1xF4C+dci/3JD1f41fRVRmvEjMsb3EL+BtRx6aOwQqNIk7zE4O5B9DsQTaNkFXi3C2ZANjEsCPGTo6hKZexpEZjPi39+0RgY/djbdv8+0vWQ8GhGpHVuduzBtP4D9gU3fxU6PcB8Asi5NtGpJkPu9z2iIjlt4RaAF4fmHB/aIya0CxVV0/m2H5wVojSd5ksptGRmN2f5kMLJiyCxJNRCcFoSBA=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1172;
BN3PR0301MB1172: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1172066FD42E1D7D1333CCC8868E0@BN3PR0301MB1172.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1172; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1172; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	4:Hu27SLtGlSlU5bfJQ0iOnRFOifBky3wNSLadiv7DbK3EN2DcW62IbaEw30PqWq4UYkOiXevGsv7ccb7R/Lwtbpogqkr9ueInPVevupTfJXmoum0fahrJQA5yfbhyve94H1zrEdsl+FnY1COOq4ijW10UrMnvNXQX7VR6fB3sg2bSiGaOfdcDDjHu8T9HPpEjYrU0B5hCUQVlp+HR0LmEtxbH3vEAQpqS2kRh+IiyAmO3rwE+4b0VDbuUfns6gfmlD2Yj+n9tHohubPx3JGWHHwWhytMURz/XEu1JfExJIoc=
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1172;
	23:ZhPfgWCqTZ2X8u5CWaEt8E3RCng3QrilZ+gGDTZ?=
	=?us-ascii?Q?u+GE5hBiJT8QzWPsIj8RXrOEYXxNwJLrnN4l9R+tp0VRXAbJMLjvVWoZfp7E?=
	=?us-ascii?Q?XoZTUkMdNpecgv4WQRhEzQzF72Drt6jluIlQ3RZE3wTwVVgCwUnzqf+wQM1y?=
	=?us-ascii?Q?eB+5g9UBwSicH4Kg+vPmkcXdm9JUuUfFm17/Lo168OeSxJ5j9jzHuXfEpmkh?=
	=?us-ascii?Q?REKR/jwNiyhaRg/naDCVte1ITnVAdEXXiOjA0O4+mDwXhvYmKS/z3RkABq8y?=
	=?us-ascii?Q?yEUWexGQgQekY9KICrrIa77p5ueqh45k9o1xDc3foDLI0NIB5rUqMG96WWym?=
	=?us-ascii?Q?5Q6a+H7plCmadZbtRTIYZ2UDkIZm4zP/Sxv7RAJ/FTU8Hq/9do+KX7eyi5zp?=
	=?us-ascii?Q?Pml6JLDMnv2vOpSBHdevN3zSnJNTJ3v61vJkgHOlXfmTwM6QWQmrylctBKWu?=
	=?us-ascii?Q?umlVUAV/PT7bUj+H1L3VtibkmeL8CncsvUHnkgl2AOneCSvxcX3c4EIEnsLp?=
	=?us-ascii?Q?rbSqHFYrVsJOCmwHOxeimEovkCUlzd39UQZdc4dhnUVARgWLubQhnHrrz0Yh?=
	=?us-ascii?Q?zjZMqDi38GAq4xuJ83CcHLJRJFYUSxtEu047Qn4Uhjs8oFctLENZzCRGmcuO?=
	=?us-ascii?Q?PBK/f9up59UYYiCBEaoVVU7blSaAXQ3VtdwJuBiIfiTGejdxVIez8402dqHA?=
	=?us-ascii?Q?VCe9zQt7uEE6wj4/WvBqxA3t4VtpPuKXGiQQi5/CZI6mMbG9fLgTCGJHip0k?=
	=?us-ascii?Q?yVSk3pyWb+7vKfm0MiGdw6OpfCytooyQCwJUeCdr/9uZCjdQyO3Wr/bAZw3W?=
	=?us-ascii?Q?s5VRyfnkV8puSghCTbFWQrNXsTPCEXM6OG/U6JBuXSSHiM3wwIyYz6aeX/52?=
	=?us-ascii?Q?H9rcTnfn/PyMfwsBe5ehqsWSIccgpza8x8cgULfEiyRHAoTU6rxmqKxEBi52?=
	=?us-ascii?Q?rfxEabsJaciXYayl1h8WON8HFoQe7vpMWmMabAp6xCpP9ZI36/ULAEgTqNUO?=
	=?us-ascii?Q?dMfc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	5:USYeoCdlMDxRnc7mNAf5jBcsfCqBjsgG2UTcYpJJSh3Ye1KJID2iS9eZXzBzpFTk0SElPgQ+bb26qfeDRDanVb9VA0QnH36Z+mHyNkxImdJzqqZOI41+N3wxY8r7UiZd4bdTGUOcyxa9wEarxqTdTw==;
	24:BMoTOzVtFMLaIrtTn1FEwat/tDuGT0piKuKXeD99svjd+AI8z56acEVjAZFNDKtZBLcm6P8RCSd0ejOqWLnOAkcPt509ZB243rL7lx9zmCU=;
	20:nPjWnqjEE7UXLfMNHYiVFbdJ2lnol4fKp4oC95wK7hqYeUR8+jlKxrGc+J/c7RP5C+gWRd3F63a8sbEbFjQ/xA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:29:55.8148 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1172
Subject: [poky][PATCH v2 1/2] gstreamer1.0: Add inputselector related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 03:44:16 -0000
Content-Type: text/plain

Fix: ticky events haven't send out when active track reach EOS

EOS event hasn't been send to down-element. The resolution is block EOS event
of inactive pad, send the event after the pad actived.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |   1 +
 2 files changed, 168 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
new file mode 100755
index 0000000..30d8a10
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
@@ -0,0 +1,167 @@
+From 83bed90c306ed3185d48febf6441177d638f7341 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 24 Dec 2014 10:13:51 +0800
+Subject: [PATCH] inputselector: sticky events haven't send out when active
+ track reach EOS
+
+EOS event hasn't been send to down-element. The resolution is block EOS event
+of inactive pad, send the event after the pad actived.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=740949
+
+Upstream Status: Backport-GStreamer 1.5.1
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+---
+ plugins/elements/gstinputselector.c |   58 ++++++++++++++++++++++++++---------
+ plugins/elements/gstinputselector.h |    1 +
+ 2 files changed, 45 insertions(+), 14 deletions(-)
+
+diff --git a/plugins/elements/gstinputselector.c b/plugins/elements/gstinputselector.c
+index fb50802..4461f7c 100644
+--- a/plugins/elements/gstinputselector.c
++++ b/plugins/elements/gstinputselector.c
+@@ -440,6 +440,17 @@ gst_selector_pad_iterate_linked_pads (GstPad * pad, GstObject * parent)
+ }
+ 
+ static gboolean
++gst_input_selector_eos_wait (GstInputSelector * self, GstSelectorPad * pad)
++{
++  while (!self->eos && !self->flushing && !pad->flushing) {
++    /* we can be unlocked here when we are shutting down (flushing) or when we
++     * get unblocked */
++    GST_INPUT_SELECTOR_WAIT (self);
++  }
++  return self->flushing;
++}
++
++static gboolean
+ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+ {
+   gboolean res = TRUE;
+@@ -486,6 +497,7 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+     case GST_EVENT_FLUSH_START:
+       /* Unblock the pad if it's waiting */
+       selpad->flushing = TRUE;
++      sel->eos = FALSE;
+       GST_INPUT_SELECTOR_BROADCAST (sel);
+       break;
+     case GST_EVENT_FLUSH_STOP:
+@@ -523,21 +535,12 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+     case GST_EVENT_EOS:
+       selpad->eos = TRUE;
+ 
+-      if (forward) {
+-        selpad->eos_sent = TRUE;
+-      } else {
+-        GstSelectorPad *active_selpad;
+-
+-        /* If the active sinkpad is in EOS state but EOS
+-         * was not sent downstream this means that the pad
+-         * got EOS before it was set as active pad and that
+-         * the previously active pad got EOS after it was
+-         * active
+-         */
+-        active_selpad = GST_SELECTOR_PAD (active_sinkpad);
+-        forward = (active_selpad->eos && !active_selpad->eos_sent);
+-        active_selpad->eos_sent = TRUE;
++      if (!forward) {
++        /* blocked until active the sind pad or flush */
++        gst_input_selector_eos_wait (sel, selpad);
++        forward = TRUE;
+       }
++      selpad->eos_sent = TRUE;
+       GST_DEBUG_OBJECT (pad, "received EOS");
+       break;
+     case GST_EVENT_GAP:{
+@@ -676,6 +679,12 @@ gst_input_selector_wait_running_time (GstInputSelector * sel,
+         gst_input_selector_activate_sinkpad (sel, GST_PAD_CAST (selpad));
+     active_selpad = GST_SELECTOR_PAD_CAST (active_sinkpad);
+ 
++    if (sel->eos) {
++      GST_DEBUG_OBJECT (sel, "Not waiting because inputselector reach EOS.");
++      GST_INPUT_SELECTOR_UNLOCK (sel);
++      return FALSE;
++    }
++
+     if (seg->format != GST_FORMAT_TIME) {
+       GST_DEBUG_OBJECT (selpad,
+           "Not waiting because we don't have a TIME segment");
+@@ -971,6 +980,12 @@ gst_selector_pad_chain (GstPad * pad, GstObject * parent, GstBuffer * buf)
+       GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)));
+ 
+   GST_INPUT_SELECTOR_LOCK (sel);
++  if (sel->eos) {
++    GST_DEBUG_OBJECT (pad, "inputselector eos.");
++    GST_INPUT_SELECTOR_UNLOCK (sel);
++    goto eos;
++  }
++
+   /* wait or check for flushing */
+   if (gst_input_selector_wait (sel, selpad)) {
+     GST_INPUT_SELECTOR_UNLOCK (sel);
+@@ -1151,6 +1166,13 @@ flushing:
+     res = GST_FLOW_FLUSHING;
+     goto done;
+   }
++eos:
++  {
++    GST_DEBUG_OBJECT (pad, "We are eos, discard buffer %p", buf);
++    gst_buffer_unref (buf);
++    res = GST_FLOW_EOS;
++    goto done;
++  }
+ }
+ 
+ static void gst_input_selector_dispose (GObject * object);
+@@ -1309,6 +1331,7 @@ gst_input_selector_init (GstInputSelector * sel)
+   g_mutex_init (&sel->lock);
+   g_cond_init (&sel->cond);
+   sel->blocked = FALSE;
++  sel->eos = FALSE;
+ 
+   /* lets give a change for downstream to do something on
+    * active-pad change before we start pushing new buffers */
+@@ -1377,6 +1400,11 @@ gst_input_selector_set_active_pad (GstInputSelector * self, GstPad * pad)
+   GST_DEBUG_OBJECT (self, "New active pad is %" GST_PTR_FORMAT,
+       self->active_sinkpad);
+ 
++  if (old != new && new->eos && !new->eos_sent) {
++    self->eos = TRUE;
++    GST_INPUT_SELECTOR_BROADCAST (self);
++  }
++
+   return TRUE;
+ }
+ 
+@@ -1771,6 +1799,7 @@ gst_input_selector_change_state (GstElement * element,
+   switch (transition) {
+     case GST_STATE_CHANGE_READY_TO_PAUSED:
+       GST_INPUT_SELECTOR_LOCK (self);
++      self->eos = FALSE;
+       self->blocked = FALSE;
+       self->flushing = FALSE;
+       GST_INPUT_SELECTOR_UNLOCK (self);
+@@ -1779,6 +1808,7 @@ gst_input_selector_change_state (GstElement * element,
+       /* first unlock before we call the parent state change function, which
+        * tries to acquire the stream lock when going to ready. */
+       GST_INPUT_SELECTOR_LOCK (self);
++      self->eos = TRUE;
+       self->blocked = FALSE;
+       self->flushing = TRUE;
+       GST_INPUT_SELECTOR_BROADCAST (self);
+diff --git a/plugins/elements/gstinputselector.h b/plugins/elements/gstinputselector.h
+index 96c680f..9bf924f 100644
+--- a/plugins/elements/gstinputselector.h
++++ b/plugins/elements/gstinputselector.h
+@@ -77,6 +77,7 @@ struct _GstInputSelector {
+   GMutex lock;
+   GCond cond;
+   gboolean blocked;
++  gboolean eos;
+   gboolean flushing;
+ };
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index 0a2ce86..902f79d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
+    file://inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch \
 "
 SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
 SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-- 
1.9.1



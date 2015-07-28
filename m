Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0104.outbound.protection.outlook.com [65.55.169.104])
	by mail.openembedded.org (Postfix) with ESMTP id E3D33763DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:01:03 +0000 (UTC)
Received: from CO2PR03CA0032.namprd03.prod.outlook.com (10.141.194.159) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 10:01:02 +0000
Received: from BN1AFFO11OLC004.protection.gbl (2a01:111:f400:7c10::114) by
	CO2PR03CA0032.outlook.office365.com (2a01:111:e400:1414::31) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 10:01:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11OLC004.mail.protection.outlook.com (10.58.53.75) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 10:01:01 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6SA0uLs020751; Tue, 28 Jul 2015 03:00:59 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 02:00:41 +0800
Message-ID: <1438106442-15071-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106442-15071-1-git-send-email-b54851@freescale.com>
References: <1438106442-15071-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11OLC004;
	1:s0W9Trw+/lgDG/9VgAMOPqwJ6qcRNMry0+Jh78mWkyzgo6FkntnR5I1SgL5VjC6xs98IdvoAciwnK5ebXGqCR2RZKndvh7RzwZ3+2YocztIa/v7nbfvwEPs/PKZYumC/gDZNazp/bsc+hgX+sgLaTquqe11Y3L/Dappy1DDx4l4EJtGhNrcAscSvTa5T2KXW+9dNM/aYnLBEcpyRNtCkTuP77MrZMTuXKWlfega2IQQG32QzM5n+ZqEL3t2NkHfgr7P02CzPX0zxv0Up+z+xkZnYdoZedhzlBVWEUBUkp84qLQXB13tW0CNAyal+liPQ8SN+fWftmJ4QC4/I9X8NPA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(62966003)(92566002)(575784001)(47776003)(107886002)(76176999)(46102003)(189998001)(36756003)(77096005)(86362001)(50226001)(50986999)(15975445007)(19580395003)(6806004)(110136002)(5001960100002)(48376002)(19580405001)(106466001)(2950100001)(33646002)(104016003)(87936001)(2351001)(50466002)(229853001)(77156002)(85426001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:Hxo9Q4iN2v96t7b/+cGPQJXQGERXNFs6swBHPtYypQXdH4QDVkoBQ72ybN/QM6fx65ClGo7c0Qx9PBko7P3MkyphqJ8BdWF/q2BJfff4ByGv6ku787Vzg4xJt2PUTl2J7r9IjP8EFKtC1YdLwPt+dMMk4caygmmZrue/FJB7qeI=;
	3:0xgOPYIxNxTzLvQX+gs7JKUpU9CzLU0jS0dSeIyld5VJ3wumNaVKlRmQMIbskgr83GREhuPKWZqpVtimjEqORYDqmIXkQ1Ye1Sc5q0A7cz5ejD/suCV5PishSOAR+KuJHoMSzdJsKJX8OeqjIWB5m1La0EMqycz5cBuVeC9aKGHBW7DAXx9TwdAXC4VXFwlUIwkSJnDPY5SFNy0DFU0LtVCw/qTlif9H3afKaToi1IE=;
	25:HNQL5K/JvizgBJjC0uwfmp4iDHoPpoTiq8KYKDE13jpHgy/wIRxMeL/1Yfbs/m67SMBL5H3OgbjFvSFrUUKhWZhs8cSdd1s1qncBlMDdq2Jo4RMbRg/upBLNcHlVjgPsyvLoP08JBqy8zVAlhJhTBJ0L/oWcR6HT/CziDF62J1Bn2O4rSbPweSPne6oIUPNxdwhm9ZALOrQWbepTtRft3rY5nVOlyects2fc3Vc97zVB0XXosKu2mgxOtAQfz9/k
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20://AucRy8h5WxvslorNMXLxATfcvSutb7nHEzuCdygdxwX6v3TKZ4SZfu6QzNaca/y7LftythOpKdQqJETArBjLnLIbtpHR0NKSibc989E2in+lqDwE+qGCb+x8g5xvEHAbMhr5DV/lTxQpY5OZ7nx2ditiutEjW6s6389nHH3vcBjEjF7Rbx6iVFkl/wBrfMBUDC1GnOZbe5g7SrwCe8CprSWECEUTyTyzEdN2ptdoeo64AcopicdEBxPlcSDUmJq+XHRZ8+9D9BMNdv7Grll1SFlE+Qaoph6dwkhhxlISivOKgML38VpE4sfevxhVla48rDPUriZ2IXiTu4Ys9YWSSyZUi5BaqAHovrTzdh55Y=;
	4:hDonAutM1am9eqvtawhZElSfwVU8XFG6GMf6z/SM0QdEkR1Rgg7jmzGjknnZhSAdJIRcj1fAgVS8U9emjkaWAmWYOUOJ/pFK52OL6CDw7QzpndUTSDDoLojGp289rxOLcZKlKo4YNopD+WlU8bU2LTCd7i4ewzrStDS8a067Vb8VDxx4jN4fH1yCquKhhA2wat4d1wgXuseMqROsKLdlqKKdTrBNPdvKcv1slq3cBLlhSajJv3/clxD6TZi5moV/BXODb/Nd2yl1iXmoaC5n+wI4IU2xOwXF7Xa8kHgFEOg=
BN3PR0301MB1171: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1171ADBB10415E7B0B2E4BDB868D0@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:TkT8h0udepy11MAwiVa8EM+kML9F1vFMSBMREqG?=
	=?us-ascii?Q?dzaoiiBimVAzJC6eUrHVOr+ll21kMw00SsU2ehR/jx51jT7RVHqzpUaK9Vxf?=
	=?us-ascii?Q?HEL5x19U/5wFTIm2bvln8yAFvDbCosEL+icmT17twCjDexwJCWNQssWh8IQH?=
	=?us-ascii?Q?OlFVLTjlWP47miUz75OBsurP5Qu1XoyOKsqiegI+1LR34hHYPKLf8WxPHez3?=
	=?us-ascii?Q?B9FVsSwbbEubKDpeJ4AXZ0OWOaIotJ46rWPO+/GzhjgUO4eQQ3K/DtKHVbOR?=
	=?us-ascii?Q?B1qR35XQiPk9tVArw9Y9EAVHq9LQMOo2aQFDzwRExbQSm9lFoLMZYdkAvqO/?=
	=?us-ascii?Q?ddvVCa9Ge3pRGFmTjLdwMQRhl2IbP4Wnkl194YRcQsNMVp5z9w4GXGil5U0I?=
	=?us-ascii?Q?q/lXRXOgF7gBpIUx2g07VRNlyFTAFB51rgtiGe6HqDLNAjjn2XuS5Ha/iyS8?=
	=?us-ascii?Q?U0kIxZu+LeExRwCNAFdJ8bwuZX9K0vpLp8kqrBQEWtRXpaWQMzHaKnJkHUPv?=
	=?us-ascii?Q?+mIT1Oe2UhXJohvHaDRnf9ChkCJFyyy7r8MPVZwKB99kFdLdZJI5hdjw2mLX?=
	=?us-ascii?Q?dHM99CQFk6MMA4FJF1Td3pk8S9RsYmZDFc/PNHpLJRwZjOEtTjn8PijnCuxp?=
	=?us-ascii?Q?DO+sGhpeI/W47vcfNaAlgUtdXvY6t+zHxifFSUMdgEgsmcQM8Ey7eI34vQYS?=
	=?us-ascii?Q?sfsrOcm8BJ63h4UWA1bxqH75x33MV5Av93l3vEA2TMPTjtyYuBDKFwsZca2y?=
	=?us-ascii?Q?l+gopYHAnuXHhdoEWcoGCo4i33dezroUyFSuZeJTMyR+Ex82oKi2WBDenO8w?=
	=?us-ascii?Q?8cY1LkJxJiyhgwLWUEL9EN9/Iv4+U3H8Hizb8coxDwGJIS8RnEhDsH8pw12u?=
	=?us-ascii?Q?DNCPTy+yEkERh7apG3qFxL7y/yz+dnLfyGb+xdqgV/wVloSBamSukhMbKSmA?=
	=?us-ascii?Q?6rVfhNCFvouWm4tF8lYuCS6H/faIwGkqNnRMruJ+efg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:hkzyxrYYtbshbxT2lisWxAJiLCktBZtnul5wXuRv7a7v6my0YLR1BxmfU5uTkOsrzygfcNuPjbiDhqg6u4wYaJfL4sLuLyyQWt2CYMn1XsXAufzcD/KqnWAt7mppzLbWnr8IkZvGNCNasTFYSJgYkg==;
	24:l8krtG+sFTDBFo4/cD6kUMNIcX2NRt2LMlxmIhzcTRqbbVMKbQKTVooj6R/YUESLf/0EABU+jmiUBIl6a7hNmkJha0t9Xzkcnbh48XB2z74=;
	20:EH20D6Ke5jfJW6y6TiTdWrXnfYvN2pr39/fe5wWu3MQYLy4R9nUJkuXkYzv7YRGzSv0lWTC2T1AyihLFsMho2g==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 10:01:01.8726 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v3 1/2] gstreamer1.0: Add inputselector related patch
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
X-List-Received-Date: Tue, 28 Jul 2015 10:01:04 -0000
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
index 0000000..f50ce6f
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
+Upstream-Status: Backport [1.5.1]
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



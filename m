Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0134.outbound.protection.outlook.com [207.46.100.134])
	by mail.openembedded.org (Postfix) with ESMTP id 64FC4763F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:30:13 +0000 (UTC)
Received: from BY2PR03CA066.namprd03.prod.outlook.com (10.141.249.39) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.231.21; Fri, 21 Aug 2015 14:30:11 +0000
Received: from BL2FFO11OLC010.protection.gbl (2a01:111:f400:7c09::184) by
	BY2PR03CA066.outlook.office365.com (2a01:111:e400:2c5d::39) with
	Microsoft SMTP Server (TLS) id 15.1.243.23 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:11 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC010.mail.protection.outlook.com (10.173.160.154) with
	Microsoft SMTP Server (TLS) id 15.1.249.14 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:11 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7LEU6Mt014027;
	Fri, 21 Aug 2015 07:30:09 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 22:29:53 +0800
Message-ID: <1440167394-20065-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440167394-20065-1-git-send-email-b54851@freescale.com>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC010;
	1:P0G/7zU6rJ9HN8GMAGcWve9QdxZLsjwSutyQ5qBQ325f7HmLP+3BOnuEgBBSdmaj2htv8KJMc7dR46MS+dH+ltd8RIp57ZAUt1UAv9N+q9AyVRr7rutFklNvIxh9mU3u+WHSA+6U8koIM2/el70yhB2tyS3mkM+iWVEitS0na28TrZDtBV2oudMOb2AQZfH/lH5M8sGu/VeA9o3Yn0ypp5/BZDJNUJpxejQM6jXBjW+1vLDF06eU7z2iOoxFv+weyUAJixTkmKKKCif05e6QPrjdIgFjvTQVFkrYZ2ZesaPZYgek5JgLjyhZEdLKElg6YMTu8yuWdlDgQhivSUpP5dd2hDOzoT2pgSrUojIrTqFWhUN0nYuAiwh6mgQREifdLZJZgb6+PG3mc++gFlAmnA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(3050300001)(339900001)(189002)(199003)(106466001)(5001920100001)(105606002)(81156007)(50466002)(48376002)(4001540100001)(2351001)(229853001)(110136002)(5001960100002)(50986999)(76176999)(107886002)(189998001)(19580405001)(97736004)(36756003)(46102003)(6806004)(19580395003)(85426001)(69596002)(5001860100001)(5001830100001)(50226001)(5003940100001)(575784001)(86362001)(5007970100001)(15975445007)(92566002)(77096005)(68736005)(104016003)(33646002)(87936001)(47776003)(64706001)(62966003)(450100001)(77156002)(2950100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:inWL/hyN5d4Rei6kJgd6DgT3v0T/Ek4ePrjgrhUcMyFWR4BrThdZRwQro4t+D0QJg6SDDxickBabtEa4S9sDQvMlRx9APV9WjvMhFAmY5KPOxHaJ5KYf6H2mJ/yezZo3cU1oP3H5uSOCVQ1X0hkKdDcpYiamT158CYjpVWJ26nc=;
	3:5CVCKQdR845yxkamjJeTQqYlQXl0k5CsOUoZc0SelbeXSqcINWcre0TORjTDvgmMpvk7inH7cscBL5eNEayy0HornNvHJSvGJeL1Sz51zdqsLDaazHOptjZNGlIpov9jg96SgaK5/HtALAhk+1gacPxBSPdK02ntgGCUdFbjwMlqqUyFOr2Kr7fjQXXszAqvdkcE4FhVj8aNoLRbexLxxwo4YBdwqFnFmc19W+2iv0w=;
	25:qduIWFpVqwLTeCqslrXvGhTJNci5QAKjfY1JaihrQ3GtvAEVt9CnRncWmUPR9Ca8By6j2uvqVeHimlTZxluaHXYG8S74kj2bl3CPbePyBfgBaerS3MuEKfMWIHqgYjQGHS/Cpzt04Xal78P9G1yZtxpNSqE5AuMqe/cAsedIebhZT29k1hvoIGGIpWAZV3gPgVo/69dekXXm55j+jomuDV+DPxNqJYzjPFhY9+2pIq2XyKLeo8kdCNBahchM68KL
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1178;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:EnKplfoa5PDMbcqGlt7ptkR2GG/neOOqNJAYIB88TG+c79SjScmY7/2J6JGKynXkKUDWTC9U66z6P3vao/bLa6GqPYcs1UlTs1TL9etJI83idbYugK+QnS90eatiZhv9xqoSAVuC5RlMY5BDbSw+EVazkDjhlTfN3PfMH9QRf+1R8hEilhs8n39il8zmxwFbKZozNvH9TdhUFp98n0bHiYvl9223sXI5oRiC/NUvXyQqqzBdP3TQe87wrKo8nuTb4fF35Yv4AXZ2tiKXkTR9tzh/5TK0LRRical2ftm72HwZEIneKjbsWk08H5jazry3KUORB9xNEi0NWQGUHuhctB3+qbsgVrEL0Fzie5XqBJU=;
	4:WaFMm+Csp8CHUauhntZ+Gcyzt2pDYFp0ZcBLEGPdB/yr2EWCNteTXZX3P0Wht02axHQjcOKGuoUrXnk6/8BNwqWahEcM04ySpPFCLBkjqY9bNDMF7WS5L6aQc7BTjrKyUcBHHMl815T6+UrEWuQCTz7hjc+XU7w61xW/MyeAldgTs4yF2S7nc1ezoF8d0DCGN2G3LLkqTdhAWuW5s7xqXr/h1yDA9Om5bWb/RpQ3D6QjMkoGbUYwFbRy69nWMN8Ss6FEn2O8YxSfhhyBLxhIvCHPEXV2Z2Ulz1DPCwX+Vo8IjHw7TnVh5DLT7uGcZU+f
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11788E4A867584BEEAD3BA6086650@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:CY1PR0301MB1178; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 067553F396
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1178;
	23:wlZu+Q04IMVJ0jnqE+8nhjjY+DEu1SrClXpAgwY?=
	=?us-ascii?Q?08iqt5ur+KqxuMcfoJKg62e9nu1Z9wN6gZakOx+/ajEgRkwuO1XTk3OLnY7K?=
	=?us-ascii?Q?ZhYAyHmnPqmQgnTSuGIx+6sP4nfwKBTL9dxJm41xdw38g34yrZ8vLD2FdrRl?=
	=?us-ascii?Q?fEL8gUZcZ2zY8DcEXnACCDd/rTrJGNLV+YbZoE9BCLjQUJhyb5BywlvH5Fdp?=
	=?us-ascii?Q?hS4DPqewQKyPyV+SMKwIBoePPS6/XYpnilTKKqEULpHmQ+xW1sRwkGQfBLXz?=
	=?us-ascii?Q?sDtsG5iciYPtPGvZCTtVhuhm5Mjs3KLp5f5w4Z0vxFRlurAioV4IqLVzpzc9?=
	=?us-ascii?Q?EHFmpWhgFdjPvwFlxpy24ZYX77g4/F3P8KJ7o6LzVEDoj22s6PHwFX653ne7?=
	=?us-ascii?Q?SeNc45Q7rwrFkfYXwx2d3hYPqOsMGOTSWMmhHTtoQj+1AYTdCcLoaCZYn4Am?=
	=?us-ascii?Q?NAKzqY9F/93Pmu5ly3FVFo0KvdEFpQKJW8V9+KmQmbiMKOs0rKzWYOYqKMsq?=
	=?us-ascii?Q?HjQKSvdA5aNExWaPDSQ9LoatXwESSzoWrRorajwTCyz4gpj+zcyIE3p5cwNF?=
	=?us-ascii?Q?QePAFp4nGNycjvuFSybBWA0dgwSO0U9EGklbnCW/Ducb0m/hpwfaRjByIwAS?=
	=?us-ascii?Q?mU1XgRlqRmEHnaAw/2DP4/piCq+OaX799Api7htfqmgQ1sVoyoIhhlTT7/vh?=
	=?us-ascii?Q?u+PAL67+atKuw8y0kW/m1Vi5PW2PdJaTElOTeBIi81Z417U3ZLeMWTb0Kj+y?=
	=?us-ascii?Q?mW2aZ1e2VRQk8FaEwo7RIIcVguQP48kx1RZ5xQPA5UfbGzb6I5JpJ8wv1kx0?=
	=?us-ascii?Q?R6uX54N0/FVJr8dpoNgO2ygYRyf5Kc47B9g3Iw6hSqoPGQPLhJHG/ey097+a?=
	=?us-ascii?Q?SO3uNPjP4PRuau+htGEHAxPjPxKkTpbqmEFx+BbS84EN7uD2o4BFYEnM0fGS?=
	=?us-ascii?Q?M914P4IvHOpd7W93oSlqTiwfNdupYfVL930k9PkH3fCBaRfA9nVMOkVaf1g6?=
	=?us-ascii?Q?el3zJa3JsKaCOY904corjNF4C2/HSzGLAP5f6ytrVKQzd/XMxrD6Qzz2KIp6?=
	=?us-ascii?Q?FuOg7VXLMXl12O63Gw9rIDVW1kFtjsFdT0ZftP3sPOHL9iCu8/TjmTp3TONU?=
	=?us-ascii?Q?Qt7PINuTJcmxhiqBm4VRlZQHKnwt/f0X3+8FBQNubWNzDJjZLUHSxYwKgA47?=
	=?us-ascii?Q?gfVWPBuAFxRsl7TJVTE5yvLaziJFMLBe0NCqdO/pBL/ZZYnvQIk7pLBBpzFQ?=
	=?us-ascii?Q?JCi/w5IiJfOczpjttMHRz9FjnTkWBWArGwvuQt7RClPoft5lc2kveILE8O44?=
	=?us-ascii?Q?XJPWNxw7zQ1J7IocJQciFEDUonYuOqk1u+IUyj01nRKqCpgy+OhI2b6sArPF?=
	=?us-ascii?Q?9D9gFlA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:FRcbgzzcpZlMy4zZrxkFg0SFY2us08sDt/Znryvj1dRk+gY3mslxOJJ4MuiRKDmyyZkZAzSYbXgzi2fJ3sGJ4+9qVzDx0USQ650wxjRsSvqeppKF+LUyWBeN5TG4XEfZs7JOE0fzqqIk1Cto0NRM9A==;
	24:AQ1IA+1ga6pCxWYJInmzX+KkoWqCrS2cUCBnTbr3tyLVn5GeJeBO82FeCKCxO6D6N/uituPbAidbhM/jD4oGAKWZZG5yRSMHyG2O8oM5q4w=;
	20:JGLZ8x6kkZis/j6NKv5Q0coWNvfHNWtJHLrXvi8fzoRDO5Rr4BJSSRrtD0Nh7n3MxKrr3t/LrHHUWc7M/eh2QA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2015 14:30:11.1276 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH v4 1/2] gstreamer1.0: Fix ticky events haven't been sent out when active track reach EOS
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
X-List-Received-Date: Fri, 21 Aug 2015 14:30:15 -0000
Content-Type: text/plain

EOS event hasn't been sent to down-element. The resolution is block EOS event
of inactive pad, sending the event after the pad actived.

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



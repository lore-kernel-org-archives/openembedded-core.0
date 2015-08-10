Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0142.outbound.protection.outlook.com [207.46.100.142])
	by mail.openembedded.org (Postfix) with ESMTP id 4C760767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:52 +0000 (UTC)
Received: from DM2PR03CA0039.namprd03.prod.outlook.com (10.141.96.38) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:51 +0000
Received: from BY2FFO11FD004.protection.gbl (2a01:111:f400:7c0c::199) by
	DM2PR03CA0039.outlook.office365.com (2a01:111:e400:2428::38) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:50 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD004.mail.protection.outlook.com (10.1.14.158) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:49 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQY000825;
	Sun, 9 Aug 2015 20:41:48 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:38 +0800
Message-ID: <1439178103-17813-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD004;
	1:PPKOKjbXTSLZBinKOeOlZt5/VOsMT1ULr/DUWDmAJDAnJp2Zz1lxhkdGcRpSzcDpAkI4oT9PD9sJLZmcgsuPVWkgLY5uGKyKEq2AfkOl8zjOHMxZoxxVevDp761KkUFXrgy/osnn8YljHoUoWPUoSh8tuGumfanwq8PKIf9MoqJAjkw2ne9S5q0Igd41JSJR8VkjWb3cJO+692FGQ+WxVKO5hZRK93sdCGBMls4I0DHnqTM4p1N4flZj+YhbxozSFsy0bobonC7q7iM7E94/8jaLKimk9Ddi41nf3rCmBnQfyvNlUTFTQe8mfuS4zNBmi0gdeqBc5KdBSKf+d+CJsg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(46102003)(5001860100001)(575784001)(107886002)(15975445007)(5001960100002)(62966003)(69596002)(50986999)(50466002)(2950100001)(92566002)(85426001)(110136002)(230783001)(76176999)(36756003)(68736005)(77156002)(23676002)(104016003)(77096005)(106466001)(19580405001)(64706001)(2351001)(81156007)(33646002)(450100001)(19580395003)(5001830100001)(229853001)(189998001)(86362001)(50226001)(6806004)(47776003)(5820100001)(97736004)(4001540100001)(105606002)(87936001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:J4XLXUMB8QkWhaiEDzP6Ftob6PtRWla9P3d23OM4lPiqBMlqxyw4jVCKLDO+8Tuqz3+Kx4hv0ofLHUmPUgZNTbs5h4cKafYXBkv9u8wzL3EAoH/S4bPVz6RfnGqzxMRjdlNi5GCV9g48DLNL9FzH13BbkDswvtk4mUuGSJNc1as=;
	3:nuJnjrEinyFdMEoVKGZmpWoiXtKznBTz2DrijvSeeA8TfapVuWEMk5Yo3kRV3VNPE68JldQGtLazeOsR+KxR4BRbuGbooGrTFj9Rjfpt25cLOeaQ4OJaiRDL+tVXxFTiEth5IR59s2MgO6RIpbuB0v1wv4HpVhGpN6sbOmmC3eWR/TbM5U/ubobCHTKaQ35M/4Jn3orTWpi2Euv0IRn15qYPyhmV2Vs1IT3B2zL4S+0=;
	25:/F1I8i2P2F5czWuZsPrYJ288HpiAb5dXJCeYD79uJcfDRBh7IvxmFv9HZQfP8p79JtpoAhEl7sFYJzI5tsRGbM5BGCFj/sX397KAFGCbj8ljHwhL+4yhLco5FbNgf0vrXo2EUF7gDoMWFQSc1faBQSWkNRDcd4B8R6Sk0kthSgvc1s0oOseu3iEvhY/q4T/IjlmB1A06Bkj8Nl/nOHSJIK77CL0GCmipIICaCzBeiEmhM/nSrd90itZTPiWBcMCVttZX/8fVMRL+7NXk52s5Ow==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1175;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:9NOgMeakCMLL9wpGrZOyk+HLkbTy1kEcLZiYMxPl8le2fBpW6MA21tuSDisG0Gu+lCPdbPQE9M5ejNbJP3lYTdZhuAI51TJg5AhZD+v6AsYQKCte3PBCgA6dM5rnVlJqPCPqWQ1GzFk6wG47kGWkCehHFG8i224YwajJY9LjcvntaQ181wHXEkqNBBcaUa2SE/35845eI64NnIn4U5JClm3ILeG46AODx/rIH77Sg/7G7SXe22wwmSgflExaipSrYI7nz54j3iS5U1PxMxraRyMPCTp7iNWtH02XizK+2rD/RQSUzi+eWmf1r9onTnL3byXsZ9O7eJ7cpc8sjfVdxIv18unxgImwtinLKGNZnfA=;
	4:bFseM9vW28xkNSM7wXdVAkPLWss+bpYf5cH4RUf3fYi1cHrrIsOPU1mvQ4FB157ukM9WhZwiTADqsdB0SVctlBOM4kRpkjm/4ZY3dwjTzK2Y+eW4A0kBblbRKLgVBuBuScIaJxKHSg1Pm4ogxV8D6z8fI9RKlAFqvc/2NwC1k4AU+qXd+C/DPBAzta9DHfLnNl3x2nvjtgO5zExqVD8F1pCXpcOVpOyvp7GNxrJZXy5nems1agcKupx+EVg8NsHBC0xXMKXIXI5SOpdZSYck1GMSLHN5uh+HBujIR7xVvjA=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1175D906CF6DCB1AA5666C9F86700@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1175; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAzMDFNQjExNzU7MjM6NlRjZE53SERIUkRReU0rZWxiZUxiUTVj?=
	=?utf-8?B?aTJwRUp2TGYyczRVNE5EZFU2VC9vanUyRUtGVVZLMzR1RGRmSTJqOWwyOHQ3?=
	=?utf-8?B?ZE1XMnJZN0ZVUGQzdnUvRk1YQVdaTVd6U3pvb0YrNGRoT21PVkZhZHVqcHBx?=
	=?utf-8?B?SG1GUU1EMWthSk9KV1JCMWpwaXd5dlpDWGxiN2tsL3NiUGxLN2Q2NnVITFJ4?=
	=?utf-8?B?NEF4OE1oN1pGbi9PdWlWc05oMHFyR0I1Ylk0aWg1bzg5bXAxUHQrYytYKzRa?=
	=?utf-8?B?WjJvS0QzamFEU0YzaW9XK0ZNTWtuZ2tTNlJzM1BjdVN0dm12c08wSXpKS0Nw?=
	=?utf-8?B?K1JPTktFMzBZSEdnNzdzSFVnY2w5YWJWeVlZV2RDQTdjOURJTlBsWkFYb2E2?=
	=?utf-8?B?bG9IUFk1a3h1Y1RqdE9ab2tRRFgrcVNkMlNnLzFoalhza1hwbG5MSDVhanZp?=
	=?utf-8?B?dk53R0cwSE4yU1hKbTc0eWtPaGFHWXJ4TFNZYytaZ1I1NzA4d3h2RWd2cmo1?=
	=?utf-8?B?bHl4R3BheGREdzkwMDQxL3ZpTG9WYlhhZ0pQUXJrNDVUdGNDdkJoMzV5UVVI?=
	=?utf-8?B?dlVLcnE2dHAvMFhUcGJMOHBwaEZ6cEM1MzYxL3BGSXV2T3VUTFo3cVpwdXI5?=
	=?utf-8?B?YkFmRlZtM2MzcUFBR1IvZC96bC9yRnpvZ2x0R08vZjRQTWt0SW5xc3R5amg5?=
	=?utf-8?B?NEZ1dkE4MXJrR3RnNklGSVRHdzFyTlZ2SFdScUhTRmxqNjQ1OUtpYVJ3Z1Np?=
	=?utf-8?B?WlNyeE1BbWRhcDkxYnF6RXRXVDU4MVZMRFdzVEd5TW9WbG5zMG5manFpQWNI?=
	=?utf-8?B?Rzk4OUtsRnZUM3k5TlFFQjFQN3o5TUVGUk91TmI2RU9ZNkFzams2endBUTFK?=
	=?utf-8?B?SXU0NmlmSmpabWtWcWV5VisrcU1Vckwzdjg1Q00wb0piaTZSdFJRS0htNENR?=
	=?utf-8?B?amQ4cTIyRHRWczNOWklYRHcvMmpRM3NPRFk3eVJvenNuSlRJRXR3WWZWbXlB?=
	=?utf-8?B?TlNrSzdCTlk0TEhQS0ZJYmtQZWhWcVAramRHSTA2bEpVakpFMGY3ZGJYaWR6?=
	=?utf-8?B?WWdWK1FjR21EOGU2N213dVNsWGZBSHBoUWhRUElreVFpMEordVdxMjFVOXZ3?=
	=?utf-8?B?SmdyVzVjM1hRcXBzOHRwZG9kY2gvWjVqSjE5ejFvRmVjV041WTJsYUFOczM0?=
	=?utf-8?B?QTlGZHlpRWFpVGRBa3cxOWx4ZDdKdWc0Y3E4elpVcjVYUHdlOS9GRWxqK0wv?=
	=?utf-8?B?TEJBenBHL0dvbUZxYVBKSUU2eHdla2F4NVJtM0t5NWtwTlFCeWpiY1RaQ09T?=
	=?utf-8?B?aml5aDlHYXhIMThUbzJhUjEvNnVEOHUyOXllY0pBc1JHTGgvUnZrWFVQNnRK?=
	=?utf-8?B?T2MwelpoK3BKUGYvdVBBSjZIM1NvMm9MM0wrL3lhV1J5alFJY2U3WndYQ0I3?=
	=?utf-8?B?a0pzazVsb1RNVFB1K2c0NWxLN0dYVXRvNWpUMUJEM1FPWUF6UmUzZmkrTWU5?=
	=?utf-8?B?eXVSRjJlZTdxbzY5MTd2aEx3OVU0eThybmRwK1QzQ3RKYmUwVTNoYXQ2UmlF?=
	=?utf-8?B?bmxSelBYMFlrOTd2MTFlSjdlS01BcFBMTVpYMFBwWjc4S1ZHOHRGTzJiOVpJ?=
	=?utf-8?B?UDNGdjNKQkdkVjdLSnBSbm15bWNoc1dpWGhMdXE5djRDc3VJZXBqSUVrdVRQ?=
	=?utf-8?Q?sUY/memWprhivPryxN3gGOAmAwHqXvtK2ZrIbgxAT?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:6QQ4LhfluiZ+kCQKnfLjnOx3Dv5piEqeDhg/L4rmSd4P09yNQfZeCJu6Tsq3lov8Sc45WDeCQPJimLR0suiZt/GmiqERLDE5l7LA3mRfCezbELCMRYqu3JR4Qmp4sAy5zX1CBs1D1HPhMTBDOc7d2A==;
	24:TEd3t7wuQoRwmdQEshyoN9S+OHhQy3b/hrit80wDMGh31Q/D1gkqyx8xVIKMRM2367SYpZmENLE8wPeL/3Mt6MQ1d3Cjvjo7dlLTzuEOT4A=;
	20:T8aTNQV160ZksL1RCiSnBG2IV5OehLHL6Urh1yVLTPe5cDmALenFI4xqsBDuh7Kk5geawPWPGErgYt3spJ/DUg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:49.8431 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH v8 06/11] gstreamer1.0-plugins-base: Do not change EOS event to GAP event
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-Sending EOS event instead of GAP event as GAP event has error if A/V have the different duration.

-Stop sending second track EOS event when returing failure after sending the first track EOS.
 Fixed by ignoring the return error.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../do-not-change-eos-event-to-gap-event2.patch    | 49 ++++++++++++++++++++++
 .../do-not-change-eos-event-to-gap-event3.patch    | 31 ++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  2 +
 3 files changed, 82 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
new file mode 100755
index 0000000..f24bc7c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
@@ -0,0 +1,49 @@
+commit f9536544f5ad182b4f78d0143d1daa45dd64e624
+Author: Song Bing <b06498@freescale.com>
+Date:   Thu Oct 9 17:37:43 2014 +0800
+
+[gststreamsynchronizer] send EOS event insterd of GAP event as GAP
+event has issue when A/V have different duration.
+    
+send EOS event insterd of GAP event as GAP event has issue when A/V have different duration.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=736655]
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+
+diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
+index 3e17c55..ff42d72 100644
+--- a/gst/playback/gststreamsynchronizer.c
++++ b/gst/playback/gststreamsynchronizer.c
+@@ -488,19 +488,24 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
+         }
+         g_slist_free (pads);
+       } else {
+-        /* if EOS, but no data has passed, then send EOS event */
++        /* if EOS, but no data has passed, then send something to replace EOS
++         * for preroll purposes */
+         if (!seen_data) {
+-          GstEvent *gap_event;
++          GstEvent *eos_event;
+ 
+-          gap_event = gst_event_new_eos ();
+-          ret = gst_pad_push_event (srcpad, gap_event);
++          /* FIXME: change to EOS event as GAP event has issue when A/V have
++           * different duration */
++          eos_event = gst_event_new_eos ();
++          ret = gst_pad_push_event (srcpad, eos_event);
+         } else {
+-          GstEvent *gap_event;
++          GstEvent *eos_event;
+ 
+           /* FIXME: Also send a GAP event to let audio sinks start their
+            * clock in case they did not have enough data yet */
+-          gap_event = gst_event_new_gap (timestamp, GST_CLOCK_TIME_NONE);
+-          ret = gst_pad_push_event (srcpad, gap_event);
++          /* FIXME: change to EOS event as GAP event has issue when A/V have
++           * different duration */
++          eos_event = gst_event_new_eos ();
++          ret = gst_pad_push_event (srcpad, eos_event);
+         }
+       }
+       gst_object_unref (srcpad);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
new file mode 100755
index 0000000..731be68
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
@@ -0,0 +1,31 @@
+commit 3f7052aac5e0118a9a9e09fff2f65091be448972
+Author: Song Bing <b06498@freescale.com>
+Date:   Thu Oct 23 13:35:13 2014 +0800
+
+[streamsynchronizer] One stream can finish playback.
+  
+As changed GAP event EOS event, so EOS will send more times, which will
+cause send function return error.
+Streamsynchronizer will don’t send second track EOS event if send the
+first track EOS return fail. Fixed by ignore the return error.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=736655]
+
+Signed-off-by: Song Bing b06498@freescale.com
+
+diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
+index ff42d72..d1732c3 100644
+--- a/gst/playback/gststreamsynchronizer.c
++++ b/gst/playback/gststreamsynchronizer.c
+@@ -482,7 +482,10 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
+         while (epad) {
+           pad = epad->data;
+           GST_DEBUG_OBJECT (pad, "Pushing EOS");
+-          ret = ret && gst_pad_push_event (pad, gst_event_new_eos ());
++          /* FIXME: remove error check as GAP changed to EOS will send EOS
++           * more times, which will cause return error and then don't send
++           * EOS event to following tracks. */
++          gst_pad_push_event (pad, gst_event_new_eos ());
+           gst_object_unref (pad);
+           epad = g_slist_next (epad);
+         }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 8daf5af..37bef6d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -15,6 +15,8 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch \
             file://0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch \
             file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
+            file://do-not-change-eos-event-to-gap-event2.patch \
+            file://do-not-change-eos-event-to-gap-event3.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1



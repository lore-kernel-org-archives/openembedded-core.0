Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0112.outbound.protection.outlook.com [207.46.100.112])
	by mail.openembedded.org (Postfix) with ESMTP id 0F136763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:04:20 +0000 (UTC)
Received: from DM2PR03CA0008.namprd03.prod.outlook.com (10.141.96.18) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 10:04:20 +0000
Received: from BY2FFO11FD034.protection.gbl (2a01:111:f400:7c0c::190) by
	DM2PR03CA0008.outlook.office365.com (2a01:111:e400:2428::18) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:19 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD034.mail.protection.outlook.com (10.1.14.219) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:18 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UA4Dkg028536; Thu, 30 Jul 2015 03:04:17 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 02:03:53 +0800
Message-ID: <1438279435-16336-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438279435-16336-1-git-send-email-b54851@freescale.com>
References: <1438279435-16336-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD034;
	1:x9Sd2fTH6Xqzmp9VfHCMBe9FzHpZbRkGbocqyWIfA43Tid980Cp7CvNznhqcJAvH7lLwDgvKNMOih/b+VsXUqje5fpm7akX2WL13VGMTWvDYIh+WovETX6vHoh5lzzymj87nGwnNt66QWPo1o66S0ugB/ycW5MpJhaudxgdqe1bGxt5xCmilt1/Kf2foqhavImQ8kUfHqNRILA0Hialb4SK5YGnS7WEoR+lgwickRqdIkC6nbeuPoZKhTn/fMyX69iXb+zv62cZTn0A3Yu+6BhKN5EM8UxtvyhRCfxe0AYyAF7k8tyQytMX2N6BE2WtZFdy2GOPzq/NRLs71kFVstA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(105606002)(36756003)(46102003)(19580405001)(19580395003)(15975445007)(2950100001)(230783001)(77096005)(33646002)(5001960100002)(5820100001)(47776003)(110136002)(76176999)(2351001)(106466001)(229853001)(92566002)(87936001)(50226001)(107886002)(104016003)(77156002)(62966003)(189998001)(6806004)(23676002)(85426001)(86362001)(50466002)(575784001)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:1/oLgrUlZY9ebQH6VVT+AMnA5ozE6sGKyoz/RpVcW1UBNDSsNE82MLaoTIHxeoChewFPySws85hL07vW2jQ73Th4xtrqCGsAGczLtEqItnmlk+lkOqAUINyLJXfX26xQcxhNQLsIKhGocjXhQvhQ9D1RIAkznXgZbv+dQvIHZMI=;
	3:BvkfXuWVFjKIPxQA8ysqYKI73hegRbk3M6DgDp3sL6bueGRTGDWB9lS5xHHHQuczEgfLYCoeRxszYJ6QZrVTKQhQj4V6i7kWa1gsUfzncDLd7UxBYeXd7kAeVSpmqA32iDJIzoQoMUbi5GbmgViCWC7NHoMDEwE3ACZMUhGuosyWJJ8fE/e7IbaGKGotUQV68Ozj4QLVVA9CSXQ/ZMzUE5roKBjrwttpDmbbqWu1fkQ=;
	25:U11kILOHxCT9eAEqFr9YHX6eR4diU+D45chKFgUtgmCauBaIQyoTnq7is0ibHkfQgSIhQdpGknlK3QqsE2Zr2RcZU19SpMH5g+C+NAYUlVKqED4EZye0jbW4xwpH7wlWTH+FPpZzdFWTq+cfxOA4C+dUyDs0c72Jp9TgmKWmgtq4zt4TjXiQHfowzLipEavfEMhwSg+NAbcsFvQ9xjQnctJhzeNzK2NzsKEotyBJtCd6Ag/QZeHk5nhvmkrtAQVfwSuvWINKtQH7rn1tHB29FQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1179;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:5PUGmQm6mi5j7sly0yXIZHcVVpMOCn5nKpj3tabfyLX0bAdmhgwkSQMFL9cLSbME/x2JTb/hAHNNJjV7JkGD2IjldQNtJ/hRer2hImCydjA4cCk4KhCzzeYTamjaKrnBYmKMH87wg0Gd42PgQKLPeviG9giiZzpswna3zti4oAzKUuyr6ai07D9TqRm759RRcZjIXJt7AjXdlyUPbsLsDxyGsffnUchf5v3//n5+ZBij0+MnLjjF64ZT40gdPIc18ZscKK/8GrjCvdZVnkQfnc/SZziY8HUF7r2+c9RofQ9+VxmTM48QAjDrLIxtdRrFiNtftF6MZ3P9CwnMcN5fLoyYUMPdD1MBf35A0MlwkJc=;
	4:+W67W68LzuPqR3rjVUascUXplyNFonMPROVUimseB3jALQvnl+QEZ3D99K9fGkCnZaFFvGZPic7idVYNvOWSADJcTgjQgGMX65SCv7lFqOAhZnAY/7c9edNbrG0ne6YVmEpM+qoO24b0vWbV4kgpLGTPYQBQ935uj9/2mey1olaKlu+l0dDkRFsg0tq8XrxGbOCC461Qb6O0dpRs5uNM3smECgJQqX9W3rBWUZgfpenKPC8+NQ+YkBYT7NsYNPOBBSEXBUk4REAU3Ya872zklqIEBMYdprEWpud74GhfX7w=
CY1PR0301MB1179: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11792725ECFB198D95E22B79868B0@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1179; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAzMDFNQjExNzk7MjM6MnlCK1YrSWVLSFV6M1NBUTIrQ2RJZG1q?=
	=?utf-8?B?clNIano3Qmh0aEVpcDg0cVhRVkZVTTZrZENiQUlic1FoVEVpWkhhaXZIUStS?=
	=?utf-8?B?ZFk4dVVtYk9YRnp4M3hVVlk0eXZuYldHSlVtT2gweEdrNmpqOElNbjRSdXlZ?=
	=?utf-8?B?cFFQRWI4OFYvU2FzVVpLQnNac1NLZEV1L29ZS3NtQ05tQjllY0J1RytYalBI?=
	=?utf-8?B?ckQ1QzgyY2FQYWhJcE42YmRyazl5UWJwVWFjczNKSi9lelVncXlmVjlxb2lS?=
	=?utf-8?B?bHVteUxIcWNYNElSZ0ttVy9JeUx6ZjNqcTI3STRjRy9OaXZWRkpwcXE0L21o?=
	=?utf-8?B?elVZbU82Z3JxblZHWGFBelpMNHFZUjFKVHdhRVNzeC8zNkhvam5nNHEvSlQr?=
	=?utf-8?B?dlY1dENoWU56RWNwa3hoTlBXU3U2R1R3MURFbW9NQlpydmlDR09oVWY2UUFa?=
	=?utf-8?B?SVAwZmgyTzRRUmVvN3pDdVJWbUh6eDVaYlpJaWIyUTlUOFN6cE1OQVVVZ2hx?=
	=?utf-8?B?UGhpcGozS2xrdjJlaTN5MkgyWTVDN0FiNUlrR21MWW1OUnZ6UndYVktHMlBV?=
	=?utf-8?B?SUZVazZNUTlycmgycFZZS1ZOOXo4Rk1vU0RIelk2MXFoVXRueXFUWnV2T1B3?=
	=?utf-8?B?ZWk1OUhMeStDTmVVWXY0N2xGS0Q0RTdCRGNvditCSC9uc2gxWW5Ba3NWRzlu?=
	=?utf-8?B?NGNGcUtnMzNLdnRXRGFFSUdBTlF2UkNpY01HVlo1RHRJME5jdC9wUEsweEtK?=
	=?utf-8?B?RDVVdU5Dd1U5THFaaml3MEdWdFVkY1RZOFV1N01KY2VHZC9KODcvK0JsaXlV?=
	=?utf-8?B?d1ZhSjhnSHkrNUtVeHlhZFNubnFWUEdUZWdRaGhFZDFmUDladVkvMm8xN283?=
	=?utf-8?B?MjlCQWdjUzA5cElpZ2Z1QlhVTEtuNnBHcmRCT3g2aGh0YkRBOTJKaENENlV0?=
	=?utf-8?B?MEp2Nks3R20rbEZjU3VYMi80WUVkZUFEWFgxU0d2dkcvYnk5Z2lCYyttZkMv?=
	=?utf-8?B?N083dzZlSEt1SFh2UVMrNjNkT2xXQ1RKa1lQV0o1YWJxUW5TVkJDT1gySk9Z?=
	=?utf-8?B?U1dJa2dDN0RPSVFxa1RKMnpGelBFZXMxTlZIY2pVRk1QQ3NnSTFDbDYwYXhy?=
	=?utf-8?B?a3dvMjZXTHloeW5Qaks5eFUwSXJzT21VdDFiYnpaQ2t1WUE5MU9VN3JmUmc3?=
	=?utf-8?B?L0pmQlFTdnZnUEV4aThEL1U4VmFTTm10RTVMU2owM1UydjRIVTdGVHZ0K0Jz?=
	=?utf-8?B?amhFaHFvUDlETEVuT25WMWpEKzdOa3pRWFRwaVZGUnpUUWU5UnFhWkYxS3c3?=
	=?utf-8?B?dzlNUGlpTWlWRER1c3RLZWJRM0JNVWdLSDlFdVcyYmdXZUJvTldHQnF5WnlV?=
	=?utf-8?B?aEJUMlFBQ0pIYkg2cVFseVFrbjNnVWwzRmtxTDdHT3c9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:Who7WKrubTWfsyJ06a8uQWUpM62RWo5oxGljJY8/3KiSC0nYRHdO4HSfjlca6XnbtSeeWtV/RIwdENmaMSd6a9hIo96rmsWOZEmSlS+sq1k+8TU77GDeKBjbtN+4MSNivjbzLf/fBgwYcfKPzMrBaA==;
	24:Lho9NLPC2OUXccQ2CUFxKKi2l3rPw8RHVDQY95KTkQxtsE8swZjLQ6hSP72z6PfNO7LU3tD+2dap9Wij8+MUAuGkGw6g3bZT610m8jcPNPU=;
	20:3j0UV0Xlfx7miSEFl6yaMfiGz5A2KkrX10yWOo4xz9dvKHbDN7fZ3vFo3FfCbuh823okWOvdS11GWhhZv4Mv8g==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 10:04:18.7634 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky][PATCH v5 1/3] gstreamer1.0-plugins-base: Add gststreamsynchronizer related patch
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
X-List-Received-Date: Thu, 30 Jul 2015 10:04:22 -0000
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



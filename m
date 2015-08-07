Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0112.outbound.protection.outlook.com [207.46.100.112])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7B276769
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:47 +0000 (UTC)
Received: from BN3PR0301CA0032.namprd03.prod.outlook.com (10.160.180.170) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:46 +0000
Received: from BL2FFO11FD008.protection.gbl (2a01:111:f400:7c09::150) by
	BN3PR0301CA0032.outlook.office365.com (2a01:111:e400:4000::42) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:46 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD008.mail.protection.outlook.com (10.173.161.4) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:46 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN2028512;
	Thu, 6 Aug 2015 23:16:44 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:38 +0800
Message-ID: <1438928203-12256-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD008;
	1:pSPeaGeU+1OqBRQmDdexqr8d7ICv7S2skGD9JMHk1nD5uBxufSZC5UcmcmtzE8z8kYz5osmtoKoKAiiJUOAYom0VTErNuKf4ZQAf5HwUtjdW/oMCuwZbvq/9W8eBHLsxUoxVSADcI1STfnm6acJp1x3J514+/ye6+8kPewhjwVCFBPYXNh5CE5JX0eoPmlBUot7DBDWv61uVEhEo0S0oTdc0pQu1JVNeh+hyoRW0AV9TYmGFllQ+PiWMK9f97MnNf5nXubiQfeN+ZcW4wLFlNDwYaTx1gu9SRPchdhe7grvwA+/TB6inZYOk3Wf/1g9nT5QbKgw3aA0GW6fwycOlVg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(76176999)(19580395003)(19580405001)(106466001)(230783001)(86362001)(575784001)(85426001)(105606002)(47776003)(64706001)(46102003)(229853001)(2351001)(33646002)(23676002)(92566002)(77156002)(4001540100001)(107886002)(62966003)(69596002)(68736005)(104016003)(77096005)(189998001)(81156007)(5001960100002)(97736004)(15975445007)(110136002)(6806004)(36756003)(2950100001)(5001830100001)(5001860100001)(5001920100001)(87936001)(50466002)(50986999)(5820100001)(50226001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:ymbsOijzdl0sIMvJ6of4g5LwHyJcKI3/AzkRqYHakV9gbZz6b4O/Bnxyx96CzKb/P/INDl4dX+mhfAsHl+NXDWHlkkmd2eL9mKZQtozudSzXGY+1lawt7IXGHC4iva4hxzARcjIH0FzcYIZ1lszjwjOIpqhNEukcF+koqa2SvlY=;
	3:iscFLDSWK9BkF4huk6xnzfsER4quXdko3fk4qxQZ4yJeuV735jvNQG49/0jIZ0KjUVp8bQK/l+UE9pl68/0rR6ctE9gAc/I0HWc+QfGgRN+TaalHhTDZUOLsQQLCEd8elM0i67agu27OixjVJ5HPdU5pa6sFr7eAZtFbZEXxS4ZzJGELgisKkQbt73bRh1+VM9wcToIJs4BsFFPEenzta9vSM+fdu66JsMbgjMNw/PA=;
	25:35jKjFrXf6UZVIHkqLXL57ZhYVCL9gktttxRc5Q5U7DAMrQWwnkzILo3Ht4+8FiHZCccRz+MXRwzzErGF5GAwW7ekB6W5nw0jtlJEVmkNip5hiyT4KZ5pL+k8e2IMStEgQYpgeEz2IeFKXgjADlc4nI7l8jDkE51cSJKFPbsJyc8SMNxFn2aXe/wV11nLqkmNdqmXPKWFw1yNSee0rjDD6CUDDNThrozSq4jWBPzEIENTNv0lBdKqazlOXP3ota0qpAwJ+qGXXTN3CJe/gd8mw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:ZVvFDtcJe6+7Y+72/W/xIe8HRfF6rGbmpJdQmxYHq7c0Q0l6zeP4xX+bZdZwXdg8+oTJHxtMLeNfTUZgq/IG9hxEIAImmYRS9Tsid1bEL5cSbopLkTv9pZAcYRrWE7m1wOV1/nPM8M/xkcSS+sct76Q7BSEfi9E4dy9EQvLFwN5yWjtBaB93sMcIalRo29y+5d+LCM8/RQtDO1XAlwqjsf8KZkx3awfp3dpkYCbxjFLGK4vEnPKqBk73Qv7lGgTDv5sPgvJIVbEIAjk4HJ45qvfD0FBwLMJfps6IHsBIimuB41MLrH7KBDKHffoAQce/edBApx6vJpuuqlmqtUpIBLKkq4iKmeIESy2oTcbuTs4=;
	4:jnSJOBmONAGWEhSn+qCA/sDZgOWoHvtrHm9RVMqfILK+nn0jrirPsoVO9g2ljTPc1X0m38H/2rfg4PQZZFimX9qTAedV9IKdyQAVGavJjn1v8z4AVZvTw5E1wjvpYVI+527B4HcdgvYP7MtFX18ClExnEf13NB0WYJNsvslb/kxWpJv/VevVoxaFzuQJMQrWCBqtFUBmYZYQdIaA6e5ODtpQZRho4toesfXYar/payc3Op7CqEk+8Ewyj2tb59gZ6fFrWdV/M5ykeND0LGd2cRD2i7ka38SmoSPIsKBBY88=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB117182A17AAAE99F39B87CE186730@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjNQUjAzMDFNQjExNzE7MjM6TDZUV0tSUStqdGN5eFJ1YUlRK0NZTDlo?=
	=?utf-8?B?dzlZWi92WVFEd2xHTGRQWHp5NnRCb3Bxa1RxcHlkbEJWUGNSM2k1NFdZM0Fx?=
	=?utf-8?B?YTRrazhMdnlMckhSNldqRnRiNW55RXJRQk9nWGxBeE4yVDU3QUsyYWtXWWsy?=
	=?utf-8?B?MkxpMm5FMHhpYm9jRmZYUGRUMk1oTTVqZHlkN0t6Q1hRcTVtZmt5dlhtTWQ0?=
	=?utf-8?B?NVM2cHZYS2oyRmpTT0EzWm8rLzV4VnZLTnNGMkR1UU5LdEJic2M1UDJxWHNj?=
	=?utf-8?B?cGxremRHMktXWjBXOHU1WGhXTDJBQXJxVlBwSTFmUUh1aVVsWWZlS0E0NS9Q?=
	=?utf-8?B?TEszSGlSZXlQZnZWaXBVTmNHdHZ4SGIrUldodW5ZWkR5MDlHa0NWV2pIUmtX?=
	=?utf-8?B?YkVSTDY1Q1V6WHNpWmhiMmovVmI4d3RDM28rRVNIcWpMekNLZXlXSkRwZmxm?=
	=?utf-8?B?ZjFoT1diTktKczF1UzhSMUFxcDZ4OEdMRDZiZjBSaldhanBFdHVxejNCSnFN?=
	=?utf-8?B?MVh6UHNTUDF2NHIzSFowbTUzOXhPMXNNczlSNUlZbFA1WGV6MlZMSE94Nits?=
	=?utf-8?B?QVlHL1JCQjU5QTh3T09qVG9BR0VsQlFQUzlrSUJ3UDNMWFpwVzl6d3c4THBm?=
	=?utf-8?B?cTVUU2xWTjIxNHB1cU5McEFsM3hDWGxxL1Y1bkFrQjRnVUViU3dxaEtzSFY4?=
	=?utf-8?B?Z05RY0pIaENnVVFEYUt3bUpZYUtpb3lma2VpWGNFUlhQS3A2cGRieThDWUY4?=
	=?utf-8?B?MTFpWDVEbDlOQ29vVUdJY0s5QjlkSHdoaXE0QjJ6ODZsSHRjZWVLVjV1SjdG?=
	=?utf-8?B?OEpuQ1RLSEtKQmVzZlBmNkRGeDlLekRkU09FcnRIY1lKOWhEVlE3OHpPY3V6?=
	=?utf-8?B?K2gyNU11ejQyaE40Wkc1RXJYWmFuQ3hKSG4wRGRKWDZrdFdDb1pSSFVuVlh4?=
	=?utf-8?B?R2Rha1FNenIyMWN3WXhkRmJJbHlsRWxBSWVaNUFOMVRYbVFIZm43YTd2T01v?=
	=?utf-8?B?MWxwaG5KNXB1aGxmNTV3M0tvaS8xeDBnT0loRTBLL3lSbERkazI0ZzE2WHVm?=
	=?utf-8?B?QW5EdmFUZXJ2ckhCZURxenFwUnF5czViYWdCSUc2VHdPb3hmN0VYVEwrVlZo?=
	=?utf-8?B?bEovd0F3amp2L3hTTlV2ZlNlckFJNDY1dWxRNkhxVFQvSm1pTkI5R3dNNHM0?=
	=?utf-8?B?TVUwaEUzYmZLajZ5VjJYb0djMEtUbVFTWXRWVXBpRkh2aXR4Wi9Vb0ljb2M3?=
	=?utf-8?B?cnRrRWlwK1JxWGxvQ2JSTUw0eS9oTU4xUncxd2FZNjJPM0I2L1cxOWd0OHJY?=
	=?utf-8?B?eXJ3SXpSZlE4bUhGTnRYRTRMKzQ0YW5ER2RtTTdiSlpYTTgvM25PNjlpOXBY?=
	=?utf-8?B?QzBodUNRMnhJS0lrQ1pubFVTd2x1ZlJubUNFSHpPdEpPckx5TUxkV0wyN3hR?=
	=?utf-8?B?SmV5OHJ3aW84bzY4QWZtRGQvdWFTcURvZHVHK3kvVVdHaUZOL01IZzN4YUpl?=
	=?utf-8?B?QmJMam5BMU9aVVJwekMzcGowa00yVnhQZitNL1dIMWh3S2NJNnVFRGdWLzdZ?=
	=?utf-8?B?TE5XZHY3VHhqMzV5VHVaNFFidnZ2SjlvZ0V2N2MwSld6eXJIQUJHeFBKWGJO?=
	=?utf-8?B?WUlSVUR6NVA1Qjg0akJlZFM5eHBlWkV6SjZUQUJSTEtQSXNEWTd1Y0FTUmNU?=
	=?utf-8?Q?WOy5Xi16kzOJg5F3BrJLkpZvGFvalkOhDghZIBmeN?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:Fc9eZwbyW1oe9+onEBMDrcQ7Gh0FGopTdarLXJ/tN3PIhA+erP3W75oJnN4l7nvHmpWr29v6KvWA7lBSIrsd+u9pGRpcNdzmrTY3B7EnJ8djk6uQyDW13pa8WIJkVSAUB1QxMfNVa8KEABodb9sZAQ==;
	24:ba9cr1lt94H6nB1Yc+ECMg44YCutj8EOnW8s6GLd6ZXg9lQ5TJtXiDEr+BcZnXdoTHdPCcrTS0jlIysz7qSkjLwdO3CZ1wwEMSZyqVo8qxQ=;
	20:JlSF98tlqTLA3Weqp0HTzOxmLnDuIUew+YMlLqpgZ/MN5wooiy6PmGfZVWjTgiCmJgbhOp3Mn2GMKYZ8H1CCYA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:46.4142 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v7 06/11] gstreamer1.0-plugins-base: Add gststreamsynchronizer related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:47 -0000
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



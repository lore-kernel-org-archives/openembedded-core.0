Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0116.outbound.protection.outlook.com [157.56.110.116])
	by mail.openembedded.org (Postfix) with ESMTP id 02F3D73175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:17 +0000 (UTC)
Received: from BN3PR0301CA0008.namprd03.prod.outlook.com (10.160.180.146) by
	CY1PR0301MB1180.namprd03.prod.outlook.com (10.160.165.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:35 +0000
Received: from BY2FFO11FD024.protection.gbl (2a01:111:f400:7c0c::147) by
	BN3PR0301CA0008.outlook.office365.com (2a01:111:e400:4000::18) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:34 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD024.mail.protection.outlook.com (10.1.15.213) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:33 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROX015522; Mon, 18 Jan 2016 02:35:32 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:51 +0800
Message-ID: <1453109582-25485-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD024;
	1:LKhgfZ5//wV7BVIjCut8BbtvWk6iRDGEPf/QYqWCRJnScS2AfEfsM9KnJQ0Ak0o1nkARL06enB/iwJGeyjK17QAbq8YigIZUOv3tcrUkQqtmAGYRpM/mrmcGK/PhbtGAWzNb2kj6bPn4UHsv/LA2puPj+B0hALP5qjPJZYXEEQ3omiHuRze3X6WOsMAcssLgfDETYfq7t350xCGMcxRpUoACrnyTafI4qmNBiTlP7/GwknLy/IGPkwLk56Hu2pUKBGWQ4fUjVfpuRRpIoAOQ2/48jeRMpdh9u0ry/tl5KxIkBZkvxAaUeX9P1NorgdMbouKioWt6NNV2qCz0IOvhx91IRvryiSCYCCeocwad04GIVRtqKW6GfHkINCupIZKIxzhs3y1ELQO90nFlFr4z3pk373qArPi/PXiT1Wr7Ymg=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(15975445007)(19580405001)(19580395003)(106466001)(50466002)(76176999)(77096005)(230783001)(48376002)(5001960100002)(47776003)(107886002)(5003940100001)(189998001)(110136002)(85326001)(2351001)(97736004)(81156007)(50986999)(36756003)(2950100001)(4326007)(6806005)(5008740100001)(586003)(104016004)(1220700001)(2906002)(1096002)(229853001)(33646002)(4001430100002)(92566002)(50226001)(86362001)(450100001)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1180;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 53fa1f07-29cc-4e1e-9581-08d31feab6f3
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	2:e79HcV/ZnKBDE1au5Gcfm+P5KrDUUMtByRhcttqByVqJ05UdnRfzQHc3uquuQy7tT70ywrDZ+aQ2bRnsQWdjB2B09gsG6DoYbDVjcJiE9nvdUUbIsl35DOgYBqLbZ74uXN42PFNUzjLEHTVqRSxudUa9CBNQX/KCyayy+7ZR3kpzlfe0QEPOsZhbH66nBOgN;
	3:1JH20mHNVb9HDOsBjMLjsZlwnTGQXWlYdCSokr62PECtsRMemY+1RLZjb5jMWFb3/d4hLHhmApHPv5xZOI+Hkshu4ehjBuRi2nbTT+2iVQVmcWPZl5eitnfXA9s92Mkn+4L0J0rWLZqOMTZMpCa4640lFWPXpcRXm6P0hrlhjAH7rrwtD1zMTheY649M5hB7w0LYGBB668VFBVc5EFwBdtRL8Za+ZSLAzRoZ2/ijJ+8=;
	25:jbDHwE9peubebPtXs8t1+BCnbmusI8WosJ2USwufWEcfx9wp12Sx5FEdIKtaPR4p4GgZGOfJBMfNr0Idb4fMKfMcZ51Wxh+JrrHcWCyINuArrQHiv6vnzu8GkORW/3gd91V9GtSEs2RDs5soO8O3+M/eJ1gSxVExEUOko3L2NszQOE5YdTkZF/ybma9sWTXsc4NfK5Y+SCJhLPpvXdiE+/8AMJelZIE0OVs8jsRQZIy9hMm4tkO47snz4MS98/Wl
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1180; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	20:AYaMWyRifz+RWmsynVdyt5Dz056QOKS/1MlxskMrWFg7VseCaIp+GbmtsGDGrT8OG3s5OJeUT2/C2MFS/iTtk6mkRlLM58vK04nrF0sKAeH2gJ8/mbJYpFb5T5o6WLafaWV1ylPSdEtYZHZAl7iONLnPfg66sN5RbQpUfF7CDqw7hfgIK1BZLioVaNhEneAlftlmipQPc0o2ubSNfN5+xk15bdjmP7HsQAF0sANomKyxlEddaj+F6qEao34MwIrCKK47YMapqCSlhU7ASObQxHpYHGBZjcA5q05g2p2RzQlbDPB1E0JRZCT8Ruv/YOFvczjYQdZf2hwtH83Hgw985uqI5vBaRJe3H+tcQ5ruwB2bjjpLsPUQ8ZWg1hXi+pIZToYeHHvpAmw9xN2HSFrgrnQM27xmeGv7ZCpN+D/n+qwK19kiKsAug1OAlGtigFi/;
	4:dMyz2UFkhUAgRSPa8vMDh1I3Qo1oMopd3aoYarPtMPmzbcEVyWuCwkVQwg//DR+rIk2hnD24N9IczO0X1pCAd52Ysi3debT5tEQp4QmasdivnuGh/JEyVJHA6HjYrPKeUVh9tt5GVHt8K3WbNBMhfLfsSxnXiobn1qooO+3TOX8XYVsRaRQLpx5JU+dKfOyfzYJVdzv8UldMCC8F0mM1STxGtF4/3wNU7JBPlXDCdO0idkkroN03kqKRYIqxO6eLsCjQ7FztdqhF2P1EC6NFxN4J91CRXds2LkP8ANikCT9pZiYJYQWRp3NoUjTEx2KYyH41wTE9XwsWI5FYw2bAeaWnkoS0Y/5rqe+XYI3kqoCsImRmSEJIkjIWF1TIrAXPn9D5Qb1S0aLS45BwazuIDpKlqZ9sAilvFARMWIKxb7DcF8/v7fGkQSA8nZCNMN1AvAUuiGcco+YPLRaqk6eBJVVCxpAWt94E9WE3ijqAtThOpD3PTTGyL3Bo0JN4Pmqf
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11804EEC9AE6C34D4C8379FA86C00@CY1PR0301MB1180.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:CY1PR0301MB1180; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1180; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1180;
	23:aBpbyQ/XprZ8XT2bN1W6IcYnhQ3j5gfHEnHuxKo?=
	=?us-ascii?Q?qlja6DmfdkCw8jecQ4BBnx/2uLZOL9Qa2boEmFB50Ok/VylYfBb7Qb81B9ex?=
	=?us-ascii?Q?kVAt/2iIqsVFnDw+FoxDGY1/sGzz1H5HPEtyaXQ9El9d0QpMHgKqOD3k4YoE?=
	=?us-ascii?Q?XpoiFZgY+v7fF0zDYcBjT3tgyAVHGUolQCly55oOr4U/hJZ3eyoU0dV2ks4W?=
	=?us-ascii?Q?4fvMMTysNqhat8ZNZz0kmPeLgVznmXxuQyRIdUrra8ZxF/RSe69CQ592r9wP?=
	=?us-ascii?Q?ccyDpOjwFwN7+G2K7Py+leMZ15FAiPZBhDtJolg4A+sjosx+ZQ3ILYlPm1kb?=
	=?us-ascii?Q?7H9ntG8nmkc5f4wroNaLQiIGaIMi/RCm0oi3n/1NIlaSd6XFbRY6nIUqql1t?=
	=?us-ascii?Q?RwWjf15t6t7YEI9OAt5L+dsyhLy0/StwxLqGC+Uusx1+CvmdX67ZlmxPaa0W?=
	=?us-ascii?Q?YLx2hvkZSM+7c34SZeGzo0CULm/4YSKYJ8zY73fA+m2oRXpnMmzD21Fulequ?=
	=?us-ascii?Q?BJmaHdkPJcJco+pcfnhims8G52K+au4sTlOaL6JGSObtqRKAn7By46UR/9Xj?=
	=?us-ascii?Q?mwjpKxjHcOl961oGKZT+uvLU5cV8TzgBUhnI8m5/RkYUvI092oHD3VNyKJsb?=
	=?us-ascii?Q?PsknsDnznZuxalpMrVAUE2SnUdjw3v+NkZ991VMxUB62EJcGdo/vDeif+W2D?=
	=?us-ascii?Q?yuJ8h2Xp0XIZaca8I/w9wRN1P7YPkaxy61ZFyTkAnKvmS/nn94OBw8a+0XW4?=
	=?us-ascii?Q?26aQj8zMUBrYmT2l4rqLqASFUdEgtCGRZozbRH0BgtS6mKbDs4d8LKTBL+Rb?=
	=?us-ascii?Q?AnQ4BCuve18ISxweeB09NMecn/uTNQCOa+/K8ICHSd6cFEkcaQ+hmkd8y7CQ?=
	=?us-ascii?Q?wI5GhV56Duuwo2B8wYF23+6tLp5Vm/hQe5k3OzmxxBGDy7ApR8RTr1gggTHB?=
	=?us-ascii?Q?xCB/6Ne+NcVtCpCaQ2Aqtw/ZbjccSvQQmA70dALvv4wN0MdDyZjXkbakL/Ln?=
	=?us-ascii?Q?3NJV3dWrOtZSMbVYGSPZFVSV8jRUv2n4P+TjuW6abR1vVBn50bT/E5XTmRX6?=
	=?us-ascii?Q?Xc4uzZgxeJSbVsBBhGiqAsBQnVpiEhdwK3t0PCr3wJXvvQJn6n0Du//DbHTb?=
	=?us-ascii?Q?QR5++IHyDpfW9hibVQwOqd0KwW0V6wJy1?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	5:/oEjly86ZrhQzzOpF+MhP9cF4n6gpj78Q7zi0LBdqyBjB0nIwsy8GvOfOiL5RroUKGCSX9BZCX3JJXIqzdb3CYUNevrRV8IAr8UwFwHhkLAP6tVN4FGe+UF3F2MNGe6gEdrCQxKlsSotiSibxk8iVA==;
	24:ZYL3t/KXAAvkCTNwps7XSvsqyrBPZqWOfmjqh3GnOlNDLAs6tMuzu7zc/f6w1cXsdnMvCrE9dUid505sP+HfNVexYY9VoS/ycTXl6PS9+YI=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:33.9569 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1180
Subject: [poky][PATCH 02/13] gstreamer1.0-plugins-base: Fix taglist not being sent to down stream if all the frame corrupted
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:18 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-send-to-down-stream-if-all-the-frame-cor.patch | 58 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
new file mode 100755
index 0000000..1e5ef5d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
@@ -0,0 +1,58 @@
+From 2f2fc40a88061995053c60d700efe20cb17358c9 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Wed, 21 Oct 2015 16:35:43 +0800
+Subject: [PATCH 8/9] taglist not send to down stream if all the frame
+ corrupted
+
+https://bugzilla.gnome.org/show_bug.cgi?id=737246
+
+Upstream-Status: Pending
+
+Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
+---
+ gst-libs/gst/audio/gstaudiodecoder.c | 9 +++++++++
+ gst-libs/gst/video/gstvideodecoder.c | 8 ++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/gst-libs/gst/audio/gstaudiodecoder.c b/gst-libs/gst/audio/gstaudiodecoder.c
+index f4c663a..b68f9eb 100644
+--- a/gst-libs/gst/audio/gstaudiodecoder.c
++++ b/gst-libs/gst/audio/gstaudiodecoder.c
+@@ -2309,6 +2309,15 @@ gst_audio_decoder_sink_eventfunc (GstAudioDecoder * dec, GstEvent * event)
+             ("no valid frames found"));
+       }
+ 
++      /* send taglist if no valid frame is decoded util EOS */
++      if (dec->priv->taglist && dec->priv->taglist_changed) {
++        GST_DEBUG_OBJECT (dec, "codec tag %" GST_PTR_FORMAT, dec->priv->taglist);
++        if (!gst_tag_list_is_empty (dec->priv->taglist))
++          gst_audio_decoder_push_event (dec,
++              gst_event_new_tag (gst_tag_list_ref (dec->priv->taglist)));
++        dec->priv->taglist_changed = FALSE;
++      }
++
+       /* Forward EOS because no buffer or serialized event will come after
+        * EOS and nothing could trigger another _finish_frame() call. */
+       if (dec->priv->pending_events)
+diff --git a/gst-libs/gst/video/gstvideodecoder.c b/gst-libs/gst/video/gstvideodecoder.c
+index f8a5869..514c06f 100644
+--- a/gst-libs/gst/video/gstvideodecoder.c
++++ b/gst-libs/gst/video/gstvideodecoder.c
+@@ -1265,6 +1265,14 @@ gst_video_decoder_sink_event_default (GstVideoDecoder * decoder,
+        * parent class' ::sink_event() until a later time.
+        */
+       forward_immediate = TRUE;
++
++      /* send taglist if no valid frame is decoded util EOS */
++      if (decoder->priv->tags && decoder->priv->tags_changed) {
++        gst_video_decoder_push_event (decoder,
++            gst_event_new_tag (gst_tag_list_ref (decoder->priv->tags)));
++        decoder->priv->tags_changed = FALSE;
++      }
++
+       break;
+     }
+     case GST_EVENT_GAP:
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 473dbcd..3139148 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
+            file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1



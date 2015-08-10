Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0113.outbound.protection.outlook.com [157.56.110.113])
	by mail.openembedded.org (Postfix) with ESMTP id 070DE767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:54 +0000 (UTC)
Received: from BY2PR03CA067.namprd03.prod.outlook.com (10.141.249.40) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:53 +0000
Received: from BL2FFO11FD025.protection.gbl (2a01:111:f400:7c09::186) by
	BY2PR03CA067.outlook.office365.com (2a01:111:e400:2c5d::40) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:52 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD025.mail.protection.outlook.com (10.173.161.104) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Mon, 10 Aug 2015
	03:41:52 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQZ000825;
	Sun, 9 Aug 2015 20:41:50 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:39 +0800
Message-ID: <1439178103-17813-8-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD025;
	1:S4op8hUXc0JrWeYYNEY6/gKKvb/AkxMt8gMEIWdNo4jU5HkTas03mTkQN50BGpyMyXg53rlwuqLxAPQZISKtbcQv+k9YvwR2D/+qNFPvZpEzUCSAIQ00DNQR9k1DCh4QiSCCXF0VQy8wPKQ/098+NTdBgLW3wVfccN0kHk5pUvEHpuovsFrmF1AlB+c7xVVFEtoLGvFac3G2TelyC3nAM7S67z4Tg4uSe6Y80jmGAStTKqZozjp9XjBxY2h8hpEB7Ech+iV4aHo2P0e6eaoFakovaTlyL/QagoDdvth0MZgF1OjCFs1w7dysxnlldkYr82Ga2K3egaDCFyagAO1Xhg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(77096005)(110136002)(97736004)(46102003)(5890100001)(92566002)(189998001)(5001860100001)(50986999)(5001830100001)(81156007)(86362001)(4001540100001)(106466001)(107886002)(5003940100001)(48376002)(68736005)(36756003)(33646002)(450100001)(50466002)(62966003)(77156002)(104016003)(19580405001)(19580395003)(6806004)(5001960100002)(230783001)(575784001)(64706001)(2950100001)(76176999)(229853001)(50226001)(47776003)(85426001)(69596002)(2351001)(87936001)(105606002)(15975445007)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:L56YBk2wBDH1hNthm2nO0I7A3FYmaazM0A7s+EsupbjQsQZOJun5Dg5ApPEqc5G4Ns0wL5iDeBIudbDbbfxSOI7rYExIP/m3VUyBgLCUIzaExnfse5bCLOIB6zbYpGSjXVGNvy5u0kY5RGcEzZ2UL3wEr8g+FlPZGQPFuU+2XLE=;
	3:fHlJzvpi3uWtHmbS3l88jhz8iyxx3Cj05dgtbNvi44Xm0Ua/dZ0shM1ijmvQXqaDtgayyhxSx0Up6nNBbJ5vov+5hDYM4vNpnL1qDexYw7V+fAjfGYmiNUj7LV/KlPxI4rf7sDDa6UaHqYM6qqiVPO0EeVDyOzNhchGOWo9mk5975z8dpffvWPQZC4y7nuDWGo/LL+khWsgWPm6DE6jvfuCbW1UICE+zemhwr7n8KN8=;
	25:qjkHBShzZ4dEt+oA/jmRImv2dnqUmVNPeBr8j027PVd++JlXxO+B6dWNSpt/78KoYD7mf8bXaoKcYazR2NpffGLE912VZpDHwe+1JtttNiqiTrmeW8s+cO6+WvefSxM38FPuSTXjfyI++GbTcDEtB0hjoUWK1Y31iZ7lHvat8PV8Th2MObmn88SifB5KKW8r73E5snZzgkyat9vh3wLgV0fmRJOmggWvvja7i6BdZh8DSHfNeNjfn3rkS4wcmYYJ83EjGPc6W7BOJf8Va5Re+w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1184;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:fp+LWoZujoQS8Zj7moV8vgNxCYTKTSI7crCRRiGjCX1D3Et81mWycpdxzFOZC9yJ71kl9W1CnFM/JFsuDiqEvVadoBU1PKToLWQDGV0jVPrM+3fT19Hnn6Jm7DmVHXoSAUEXlHPOg1FCdBWIMH9/TwtFvZl5WCf2YkT02EvTyYOAaTLQ2wpMexyHwmxT3meXzr3SFDRhYSy60GUSZLZwLjXBcHH74yVkcgEISIYUjLelmRGhyr6UDDsmN7DZJ00cnbKzgLI4DkeLPlPQeCa41crS/l+7k8y8fGYeaapKwUvMOobtI17zq2onUahspUCk4621aLxWMtMxlRH3Ru+PyFVo4HWBpAbxffEsE0Q/bF8=;
	4:i9/SFiHl17PFwNzEbAat++NAwbu9C1SjSNtNNBVloDmqJK8sa7JzmBIbZQakhMbISYIYYG+18ai9XolAKpw/ppft1pNYj6+RcZQynOSmZgK4FlA8PZ0d1OsoTyN02ZRuYY/QCVqPJUfUFRMf8+M92usztJvGNyycxoijXw6NyPB/FUVzma00STziUNu0A2zEkBCEvWO2jY5YSUYhUupXBbvrlEvDEOchbC5a0MKHdcLzuhkA11TZa7s4bS7bCvcJ4wx8tcyI+zvbdoxn3QF+9N52M5rBrIXofcCGXtBHFfQ=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB118491ACE4D0AE930FCFDC4886700@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1184; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1184; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:fntrvtKBAm51apNXOh12lFtw1PLuomdU84jMumh?=
	=?us-ascii?Q?QU2QcYoi8rzgat+TLQWIFKK86b1CiCPPJe9+2yFJfYNwDYJCFI/lkkSb38s1?=
	=?us-ascii?Q?pUeeyw8loDCmi/YbCU1gGvc1P8vHIqpb3liPpSy+jfHUY8A9I8lR6X4QGi1D?=
	=?us-ascii?Q?hIl8CSkyu6NgFdz/IXKxRwrZPFRyPuI9xdackAxp2aDyt02nfLW934fYXVku?=
	=?us-ascii?Q?f+6K360i4U0z//WBzeQwYJLabDQGW/4GmyW6Uml3488pgF0FEIzXH15P6yUV?=
	=?us-ascii?Q?pU+PAcbOvpfFvGP2ZdPboeQBjTDdxbiSok+4Cq94Yp3n18Yf8nSxXNnIS6Zm?=
	=?us-ascii?Q?HeUJBncWHFzXQt9b95vwKV95Ved48PuDM//qq3Sgp3Vdy/Q+SkIf+K4FH8hz?=
	=?us-ascii?Q?qAcUfr2QjwQw47CzheycV4d8MNbinQRRL9qIaMVIPrJWyggqvXc5z46dR2Xg?=
	=?us-ascii?Q?6RYjmgWs/zNXfgrOWECSx5HRc9+Pa6lqPGTgbpj++j3+oqJa3FhjCuapB3PU?=
	=?us-ascii?Q?joHJPuRxN7Xtw0fTgFGm2q2MGCgo6lXTjOzyf336ZFG2aAAuwblyasuTkJez?=
	=?us-ascii?Q?qvaJASP26uRCHAh7oBuxZ/IW6v7dTbaU1eindmLiCYimNYY1WwpYIzMFx2wH?=
	=?us-ascii?Q?oU48kIuik7jW3ITd5NNvNDhnC9pJdNkiBANbaonHLPtvoAI8HCk4QxzfFKhn?=
	=?us-ascii?Q?gXKpR1d7CoR/376G2XgO3rTpq8+FdBNxK91g6GbAbCAkstX+7qfX8yYdGYFb?=
	=?us-ascii?Q?0k78AYyx3RnWp/T7fF6cFE7+x8tpbJhKyAdyGUkgHxxYqYuB/U1v4VZASGmA?=
	=?us-ascii?Q?TYzKwv3zic3U+hxlrle5cX1GKVDFiTO8c8STxNIAFPkCcOnzhGyvE+Z9vFwm?=
	=?us-ascii?Q?cy2avRaxpISaaM13g0EB90BphLo0aijUVcffJcJJYqh4gCtqqkn7ecjpbVpm?=
	=?us-ascii?Q?ods5FHlvFLprhMxF91Y78xYuQcoHPczmG9m/mbMhqnN3c9+6N9CJkus5cNzw?=
	=?us-ascii?Q?kwXE+nd7fOjf04oBn5F3cebSkVAxmVipKkQGOHsajg9iPwVdL5BCBQ/RLpq7?=
	=?us-ascii?Q?GoYZkrVRYO6fTZg2LpASYhXZNA9jcelazH7QfO5sWhUSO+Piqdg+lenF4Gw9?=
	=?us-ascii?Q?2e54HSmP6tDuQT4CUHKBTcVRSg0sZ3CgSRMO6uSNoqwmu5otOgJ7ZwUqs1/T?=
	=?us-ascii?Q?IPxS2ukvWNeV0CN/xEGPKr+0xn1TSmPxFrwkmx4Ddx6H+Qt20+AZN2tqamDt?=
	=?us-ascii?Q?biA5zgKZxh/dz1ZDJvi/8/8LjZQg1cSO+bs4Wrt77ibE18KJqyMF0F0eIljR?=
	=?us-ascii?Q?/Zg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:4ofVN844S7BJTwfNR8PR7cLRPhOdgQU5PY9bpoK6GlNxDfWG4ULiFlGW5lGh7D7ZLhihdggrDZ0vT0bBf4Pt8/Go/rnqp7lt6E5IiIgV0W4jyUdADp/8PmnaH8zQe6jtGprS5Zszu0uOZ/szFEg05Q==;
	24:APc5MyVl5a1NABVT7spnsmNIu2NQUjuhLp359LVygu6eoOfqr+VGmnO++F/UKROhqhDO8VRWMBuTBlcxkIWKrrrThLf9hy5jtwZ0MHebAOA=;
	20:2ZUfqZxnVSoULi4cieFVTI7KxVmItt+A/gjZsKFXMLBxtu1GUpralcZN7siBvrE1Cb+BvPQki+w0Ba6uZ+Zqqg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:52.1693 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky][PATCH v8 07/11] gstreamer1.0-plugins-base: Make memory copy when video buffer's memory is read only
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:55 -0000
Content-Type: text/plain

Detect the memory flag and use gst_buffer_copy_region with GST_BUFFER_COPY_DEEP
parameter to perform deep memory copy.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
new file mode 100644
index 0000000..03dca95
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
@@ -0,0 +1,129 @@
+From 3781d40940d46d7e6a502092d24aac7997f6da5b Mon Sep 17 00:00:00 2001
+From: Mingke Wang <mingke.wang@freescale.com>
+Date: Thu, 5 Mar 2015 12:06:23 +0800
+Subject: [PATCH 1/4] basetextoverlay: make memory copy when video buffer's
+ memory is ready only
+
+1. since gst_buffer_make_writable just lookup the refcount to determine if
+   a buffer is writable, and it will use _gst_buffer_copy() which don't
+   perform a deep memory copy even if the flag of a memory is set to
+   GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
+   gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to perform
+   deep memory copy. if the allocator of a memory don't support mem_copy
+   interface, the it will return NULL, if this case, we can use
+   gst_buffer_make_writable() to get a shared memory buffer or the orignal
+   buffer if the buffer's refcount is 1.
+2.  new feature is no added if caps has no feature during caps negotiation
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747495]
+
+Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
+diff --git a/ext/pango/gstbasetextoverlay.c b/ext/pango/gstbasetextoverlay.c
+index c919861..3c0a1d7 100755
+--- a/ext/pango/gstbasetextoverlay.c
++++ b/ext/pango/gstbasetextoverlay.c
+@@ -747,6 +747,7 @@ gst_base_text_overlay_negotiate (GstBaseTextOverlay * overlay, GstCaps * caps)
+     if (f == NULL) {
+       f = gst_caps_features_new
+           (GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION, NULL);
++      gst_caps_set_features(overlay_caps, 0, f);
+     } else {
+       gst_caps_features_add (f,
+           GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION);
+@@ -1890,16 +1891,71 @@ gst_base_text_overlay_push_frame (GstBaseTextOverlay * overlay,
+   if (gst_pad_check_reconfigure (overlay->srcpad))
+     gst_base_text_overlay_negotiate (overlay, NULL);
+ 
+-  video_frame = gst_buffer_make_writable (video_frame);
+-
+   if (overlay->attach_compo_to_buffer) {
+     GST_DEBUG_OBJECT (overlay, "Attaching text overlay image to video buffer");
++    video_frame = gst_buffer_make_writable (video_frame);
+     gst_buffer_add_video_overlay_composition_meta (video_frame,
+         overlay->composition);
+     /* FIXME: emulate shaded background box if want_shading=true */
+     goto done;
+   }
+ 
++  gint m = gst_buffer_n_memory(video_frame);
++  gboolean mem_rdonly = FALSE;
++  GstMemory *mem;
++  GstBuffer *orig = video_frame;
++
++  while (--m>=0) {
++    mem = gst_buffer_get_memory(video_frame, m);
++    if (GST_MEMORY_IS_READONLY(mem)) {
++      mem_rdonly = TRUE;
++      gst_memory_unref (mem);
++      break;
++    }
++    gst_memory_unref (mem);
++  }
++
++  if (mem_rdonly) {
++    // since gst_buffer_make_writable just lookup the refcount to determine if
++    // a buffer is writable, and it will use _gst_buffer_copy() which don't
++    // perform a deep memory copy even if the flag of a memory is set to
++    // GST_MEMORY_FLAG_READONLY. So, we detect the memory flag and use
++    // gst_buffer_copy_region with GST_BUFFER_COPY_DEEP parameter to perform
++    // deep memory copy. if the allocator of a memory don't support mem_copy
++    // interface, the it will return NULL, if this case, we can use
++    // gst_buffer_make_writable() to get a shared memory buffer or the orignal
++    // buffer if the buffer's refcount is 1.
++    GstBuffer *new_buf = gst_buffer_copy_region (video_frame,
++        GST_BUFFER_COPY_ALL | GST_BUFFER_COPY_DEEP, 0, -1);
++
++    GST_DEBUG_OBJECT (overlay, "copy %s video frame buffer %p -> %p",
++        g_type_name (GST_MINI_OBJECT_TYPE (video_frame)), video_frame, new_buf);
++
++    if (!new_buf) {
++      //maybe the allocator don't support mem_copy interface, the we just use
++      //gst_buffer_make_writable() to get a writable buffer.
++      video_frame = gst_buffer_make_writable (video_frame);
++    } else {
++      gst_mini_object_unref (video_frame);
++      GST_BUFFER_FLAG_UNSET (new_buf, GST_BUFFER_FLAG_TAG_MEMORY);
++      video_frame = new_buf;
++    }
++
++    if (!video_frame) {
++      GST_WARNING_OBJECT (overlay, "make writable buffer failed");
++      return GST_FLOW_OK;
++    }
++
++    m = gst_buffer_n_memory(video_frame);
++    while (--m>=0) {
++      mem = gst_buffer_get_memory(video_frame, m);
++      GST_MEMORY_FLAG_UNSET (mem, GST_MEMORY_FLAG_READONLY);
++      gst_memory_unref (mem);
++    }
++  } else {
++    video_frame = gst_buffer_make_writable (video_frame);
++  }
++
+   if (!gst_video_frame_map (&frame, &overlay->info, video_frame,
+           GST_MAP_READWRITE))
+     goto invalid_frame;
+@@ -1918,6 +1974,18 @@ gst_base_text_overlay_push_frame (GstBaseTextOverlay * overlay,
+ 
+   gst_video_frame_unmap (&frame);
+ 
++  if (mem_rdonly && orig == video_frame) {
++    //if we used the original buffer and it's mem is set to read only,
++    //recover the memory ready only flag since we unset it before
++    // gst_video_frame_map ()
++    m = gst_buffer_n_memory(video_frame);
++    while (--m>=0) {
++      mem = gst_buffer_get_memory(video_frame, m);
++      GST_MEMORY_FLAGS(mem) |= (GST_MEMORY_FLAG_READONLY);
++      gst_memory_unref (mem);
++    }
++  }
++
+ done:
+ 
+   return gst_pad_push (overlay->srcpad, video_frame);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 37bef6d..7aba40d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch \
             file://do-not-change-eos-event-to-gap-event2.patch \
             file://do-not-change-eos-event-to-gap-event3.patch \
+            file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1



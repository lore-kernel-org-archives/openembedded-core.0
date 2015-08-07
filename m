Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0111.outbound.protection.outlook.com [65.55.169.111])
	by mail.openembedded.org (Postfix) with ESMTP id 2348E7673C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:50 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB0864.namprd03.prod.outlook.com (10.160.215.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:50 +0000
Received: from BY2PR03CA010.namprd03.prod.outlook.com (10.255.93.27) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:49 +0000
Received: from BL2FFO11FD033.protection.gbl (10.255.93.4) by
	BY2PR03CA010.outlook.office365.com (10.255.93.27) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:48 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD033.mail.protection.outlook.com (10.173.161.129) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Fri, 7 Aug 2015
	06:16:48 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN3028512;
	Thu, 6 Aug 2015 23:16:46 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:39 +0800
Message-ID: <1438928203-12256-8-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD033;
	1:ORxT3iYRz2Oe+HwDhWbORi6hBlki2vCoIy7bSeHQhACWEQFqmMyqdHjFKe73LSzsgrFW9JUg1PgPnkyVFcjYbdw/qj6J5Inz6oShTYRM2I4k5eV0kGoiOZroFDs/3tPi9ZZR/K2vrc6xfYNqRyI1aBAXXjX/n0A1jOtMsGzcK99rDUwlLiudtP7fH2XVO3ZSz3572RUH1vBea63pntmlmv3qzzIysVMc1Th8fHwS2zReybAyYxniiuPldqf5g527cwZIMga5oOaD/2lg5fzkktJtlXZ1P0NiF8Gw9Xbo0r+2BFBYS3A7pYORDDArPmbqZN6r4516mR3X1Fqml0j5AQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(81156007)(86362001)(575784001)(50226001)(2351001)(5001860100001)(5001830100001)(97736004)(229853001)(4001540100001)(33646002)(46102003)(87936001)(6806004)(19580395003)(19580405001)(104016003)(76176999)(50986999)(77096005)(68736005)(15975445007)(110136002)(92566002)(2950100001)(189998001)(85426001)(5890100001)(5001960100002)(107886002)(36756003)(5003940100001)(50466002)(69596002)(48376002)(47776003)(230783001)(64706001)(77156002)(62966003)(105606002)(106466001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:Ey+oramNv7e2QB2HKBnVzx+x8unCX0ocMxdm/2fGlTOtaPX93njGD9cl+2TcKOYtWPmtCTGf5I7vWnQ1pYzLv2VXTzEEGV0pe5voavrn0fwxk/VQ5lAm/7+vTiZyV7KzuUsrtU8HEOyXZCxmf/NO2STyCxdEZs1rvic7aT0yKl0=;
	3:sY7efcu7yEGYMGE/ucipquWtAh4jv1XD4dEZJvTbT7ZamXOXRzs1cQ6EHEfP8gtZIgbxDeRtSrk5u3WSoUy+wRhlhr/ZfFbmQqHu1XCHwcTtS34wLZqDD4pqxjvhj66DFb1wxTucKq5xFJuzALk9Ser2FqnZHFRL1bi381NBZcgsIm8J7h1ZRAtyJkz/GD7SVM3E47xZFGeweykgA0Aw2+pST/YjS0fcmkSIBDVNMnQ=;
	25:rKGtLd7OxFZzVtBxDamd/0J5fJXuCHPJ4yOXxxgX7BeTwLZT1heUNpFyj9QxdSyACnyOqSlFSgubJ52/DozlnDMRCrDQivZXtvnZO7tqsuB0fJpqC9G5mjJng3JibeBjrRUYisKnbxhXPvnkhHpvxRlE/L1qL/jBXwQV7QEEZXeDAdTaYggWKZ/yWop4t7F2jH1r9Dq6etiySEIX3SPdDa9kTv/AgVky4sFhc74/JC03E/mB77WsLAtYePA93U/4pFWs/hsw8JI905S1/X+JCQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0864; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:frN78RDFCfTECWd5yQCnuY1Fc0vDU/lygtCZucSnhZTIHwXV67k8+m0FHUhkhJwJA1AOHyoBTb7vkqtA/ubkW96B1teMQTR39IYg97fwOAgS8fldRpmgWYA+j9j/5qgAG/ghsRXaFNREkrqveWWJLWhYD2mvD+1GGuDowq6r8f5pI2tDaf47E+V3xGH2BTLF7LgBp3MOvWAoI3tWG/P04ZYv/aYL4Ocnxw7n+NOl/KJD8w+Jo+5lw8qrWkmN+jVPhnacbz8zVbE6ZvpuXl8TSoHchOvIqTypJZGM02PUDEz2wuuPws+hyr9RRNpUgLDeKz1iV2MKLB7OqsFKqStfqx7GYb8JhCv8k53gKU3G2Bg=;
	4:yjRNflMqDmPGP59o66tcoqP4Eauw/1WgctRGVaPX+AmSSzMaN1fnqxAGfMxc9rtH4nR/GAtXDM2vdkw0KDM18j3NU/JFSRQTkNmJ9QjOUvgpXI4FJlEutFDvGFHGNg0G1h2YvK1l9xqzhKr2i6r4+HwdheBGODpu9rbGHLxQmKEjSInquRAaXuX2oyhcD2873lGYtQsEhY35Ep/C8Jg2t2KJFgseG5AmB/zfR+hJay/uPA5Xpv7BIaw8pq0jqRrak929Zp87PMCQ8BU44rIj+qi3uiBqdHsWRhgreJJMP+0=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11838215D97BCB83E0B86E8B86730@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:Az0VZVB0g6BJ7RohRJKwK9mKlbcNF3pbE1sNqSe?=
	=?us-ascii?Q?V8PHTCkzs8WHNhSHGOWovRNZUQLnm+1KSHOpl10DB1+xZBh1c1/w0Uhm1qPg?=
	=?us-ascii?Q?Zur8lbj4QRMwj7KPvs55cFEZ9TEacnSaGyUl8/MnfmxrIeA78+YdMlbJBYcA?=
	=?us-ascii?Q?m2chq+XIL2A5poKw+VpNLCJ8aob3za5RIK09cwITTZS/E189odUWSR/cRYs+?=
	=?us-ascii?Q?xUOsTDSidFLO/vTzDYryR1WvmUZu5Jz61xlSMBbq0/oyVYo3UMzA/JaWjYiA?=
	=?us-ascii?Q?LLhGJWBX2uApVwXeRQ3th0rzxib4zqNP+PERw2712hwNxnDS3LQUjqPoRVKN?=
	=?us-ascii?Q?d/bXzB5q1nvyH3z2/fO0mtZAwAJpOuhfphRSeCKsVF6Xur4z9wwoCH90EcAO?=
	=?us-ascii?Q?KI1gfySKPhmOayXFEXUpxPkuHd9IcNoSUDAup3qIG1w5VbP4dIEJoqqUgZVa?=
	=?us-ascii?Q?Q2ZqoGS8rNnvclykzq9lu0iaS5HflQw68Z8FFoaFmLwRfzt+vOjoOKE7fxal?=
	=?us-ascii?Q?m49YIdUPXt2HykDLYRWQcc/P5O1INaA1okAh/lm16T2xosym5N+CQpfGGqAF?=
	=?us-ascii?Q?UHdqc5oax6QhCqkez7jkmTKEd6WbFLkTtMBWIBclpNm5GG41p5jrk5/p8M9i?=
	=?us-ascii?Q?r2jGW/OikMqI/FxqnC5XBeYzkiCHyKwRVfutcxfrQPGf97+5zVGXKdentBGm?=
	=?us-ascii?Q?xdNinMHJm3SlOoPpg93RY2UyatlwFg/mOxCSHuHYkoq5W9k4AGGwdxVf5HlV?=
	=?us-ascii?Q?eRubmGSuYw9ZusZLxSakON7ZCLgdy12m5oqFLLRhC0CJVBcg30boxJOAJnEf?=
	=?us-ascii?Q?WGDr3CKma7iSr5lxQWgiRSz/pXiq+IfV0EmSnCXcLZbJoCMgvikXjbBa1WVs?=
	=?us-ascii?Q?b2Mv6whIrzw7cSUdJdKlx17WNiUPoSQwNlkUujE8aNoBMqCUU7+1XZamoWmV?=
	=?us-ascii?Q?b5H1xFpIOMmlqd31wk1LB9snen+/Y4G2RSvJS6E1kSOYNYq54IsLxkwkWZcr?=
	=?us-ascii?Q?z1DMM63XeKW234o2SkpeR+00nQN0ODGHSVAbeMXyXw0WZrEGD/ptLO5QpkgX?=
	=?us-ascii?Q?igAd9IQfMDtE/eskFlU36FAT6GlMD6T2YFJeDo8RMvZlonbMY3ww2mwWc6+w?=
	=?us-ascii?Q?/CZBMFVaWgTSvvUTsAN+n+nFYWgWH3D5Vs0g96mdk2VdeYHfeBmgV1fRtWq4?=
	=?us-ascii?Q?HdzjWK0R87JNjVjedGKELlmd8OqjHRuHo/OnDYpLheQI8Gga8Q9R3yRBll0E?=
	=?us-ascii?Q?vSBmkTm2tv3ae0kWI4bqLfm1MUD3LQr5M+BFpP3jQ?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:sjEjeHAVocpoIYLp8qc8NYokstBkrrGMjXPNVAlxKFitpT8wNKx9trxNpbyebknl3Kt8eMih6q5LD1wyepjxU1mFTtOwVSgPIJszlpFFMx56GY5f5LTAOm2NgD8D/z7SimdCOxMh+tWodpkF/BfTdg==;
	24:rVIVlhywGiDYK0UAL7NvzKc3johR+VlQvLcirqhYoEsTD4zAO82bVyePQiT5V55CF/oPw/KhrogU1Z43ggYhMsDxig9Oc2qEuT78baob00E=;
	20:OQthVfWxIxhKJm7uc1w6A8jhrNwM364glQgNP/GHTTS4bgPWMEXpKNv39IJcx5yTgBY9Ixx/Fxq4w9ieRxSXzg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:48.5709 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0864;
	2:xDWZOreUnqOB+3evCNf58Yv3NWnndp/7XtWvoAFF3r/FAu1RVJqQcTjVzSbCE+UGSjEe8YmScRFWsHby2EzTKEE/2UcrwxuduvtnxIuOgpTL93xcDeMZbVuJxceI1MYHyVSCmj2zknLBSQYdZRDIZuQfpcKV0omeD3QNtNP4Wlo=;
	3:9KK9T7Z3V008rBku1G6lUAG8QgcmKi1AgXMRFoiAXw6s/V5YTylc9UTxKOqyXAa3IU/48p75wxy5wJDCBvMqwrhzB+T0dVmvu33VR2MI9Vhl7CdPsSdZdFnJNHyzy9Z+FpAKjlBA62cXkKGi+eWWv67hBRWjuIkZsTPgHDw8ZQ2Yfp1cjxnbTiRZ+zmx+sL9CnoQ8Fg6acd5iFn8rBKf3l6bthx2eew8TeJsLJlouOY=;
	25:KIoa46rRWO4yh5FGMLR0jGBy+jETLq7Dd0VZymDuN9d3QVsNl49F/fwstryV+Wyj+6BLZDGoss0qkJiiSRnNG0tfTt3R54U3WhMqYmC1eHCCP5fLdr+xM/U/yfA3MKojT+/BakbAtaBsAT6nLvRO0x0rq/pm6xDCpTRChoc3glZEdCxjb6yyECXAzUkaaXiBj2wsiKMUkhyO8Cr1iuVJqDWDXMHwdisnl5Eafunr94ABpBQHO3ZLZl3W71UlMdhYuFXHXN9qe0aWmxSKmiUtFA==;
	23:Z8s00ESnVi69pBaLUWij4htuP6gRPozgdQijhp4dkpsFJYJ/aHrUpWCMneLVY7dNnJBdZvXYPhroeTgg4b3nA08n4wtH9eQtgaAyX/3tLU8CgjyKg5G4bJcwUrBWIaUUNWmpqV80luFpAztftXzfy0Yaad/hdh8/JOX61EBKMKBki/9U5eFVyYpbwhvdxgQveA2u5ofZVxW4Z086OFkzWQr8H9T4ZZLqRjZedQaM/Gq3AYpmRNkFdT6aHgSqJIJS
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v7 07/11] gstreamer1.0-plugins-base: Add basetextoverlay related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:52 -0000
Content-Type: text/plain

Make memory copy when video buffer's memory is read only

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



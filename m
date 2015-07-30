Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0108.outbound.protection.outlook.com [207.46.100.108])
	by mail.openembedded.org (Postfix) with ESMTP id 487E7764A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:04:23 +0000 (UTC)
Received: from BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) by
	BN3PR0301MB1217.namprd03.prod.outlook.com (10.161.207.17) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 10:04:22 +0000
Received: from BY2PR03CA074.namprd03.prod.outlook.com (10.141.249.47) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 10:04:22 +0000
Received: from BY2FFO11FD019.protection.gbl (2a01:111:f400:7c0c::191) by
	BY2PR03CA074.outlook.office365.com (2a01:111:e400:2c5d::47) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:21 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD019.mail.protection.outlook.com (10.1.14.107) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 10:04:21 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UA4Dkh028536; Thu, 30 Jul 2015 03:04:19 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 02:03:54 +0800
Message-ID: <1438279435-16336-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438279435-16336-1-git-send-email-b54851@freescale.com>
References: <1438279435-16336-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD019;
	1:J92iN1LI6hmhgy9o4pTTjSQpYHS934Swnln1VI0A3Ck2wnCT3PZy6Kpz+Rehls+tTtkcoadmH7RZ9FHm5yaH2zNTmbnl4LxQXSyRC1+Mep2K7KXPSotIuLzzGRXeLdSVjz/jhgKJeBB9bvM1ScUb6ysHdzZY1ClvHu+HmG9FKBWjIXTxdEhhXYiEYqnAUqSyuXwZTEQduyAGXpNi+XFVAi3/Zrin5+acpvel/zET/76erWDZ/ZhmsI5KWvYQ+JpBdIQzgi1RoywfmB0jqA9nl//cftali3rVDfdBycaFiFX7WmlWQ1WQB88AA0kFithEzuCwpxPcChjOU46hFyjFbQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(104016003)(50466002)(6806004)(62966003)(575784001)(47776003)(19580405001)(86362001)(50986999)(36756003)(76176999)(230783001)(77156002)(5890100001)(46102003)(229853001)(110136002)(2351001)(92566002)(33646002)(189998001)(105606002)(15975445007)(77096005)(106466001)(19580395003)(85426001)(50226001)(48376002)(107886002)(5001960100002)(87936001)(2950100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:H2m6od+thSHdDAnrB86CUthuN0xF9tQc+fOEGWv91mBL8p64CCU3ZEQKPsuXFioy2wUpcZ43GQITVFnozgLmqD5oOzmZ9cybimgMHd++We6HodIW9ZWRtwjGFHn2gi9vwpjPasHZ5xz29DqYZCjYQMi1RnXvcaKraipQy5njjzw=;
	3:PYYjOZcRjk0CsgVWg3rYGOhCxlj7OPcKkvOiYW/GkGmCFomk2Vq/alADcIP0WDzJT0RFUQKFePRXYfd6Ca9b9rw70YlAydG57sVuOvbX7/G/p3Ia151udyLhdub2Z/QIEbZ7RPaL9kkaTU0DHkqia8ABjj3Fljz64oaIUvWCIEWWh7iQNg22cLzUhxCW7fN3JMRalb/ocHqvR+kD0voOZPUyeN82u4AGQBpowA/se2M=;
	25:c6jePG/zb2iK2bvpjfEvB3Rm9NfmuasdNDtfNwcUtPZ2Nfdb/lIFwU7ZcalW/mGc1U1Y4CF7qn7Z+V2AuVGR8m6xAVpV7ntnjsZxc7oH43AMclSS5vorEdcRaMj5rEjA+Q1HkLwPDo0zUBFpio+Qx2s0gYf6QF0VqP+32Ne/2JKl7gFcMies10XGPT8pqsA/Np89YZQIm6XbROuVG1lj8Vl/UU+83kYUx8fRlVb7NYjgO7te5R3WKUwAtEVxJ/OcN3c/bQu/7R/m+vM6oXORlA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1169;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1217; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:ujRAAIbd+omYqso34jtcfv87fpkdb+KUJHVo+1Pa6XSHPXxAhTdKJAyznYQZ/ZA7nmNacOHi9IhV8sVbYb0jRSHxIuIKuazNlxqs4YVmiHSn64RMJIHkwN6n2BKyBLY4Y4GqDoef+iXY1xvZgWsnH2BZ1Y1l2U7wC5dpu43VX5tML4uHBx1ZCALjj1Y1JhKxTxNHff9nzrRxKHY4NcwMqKgtiaK82bjPW+XmRnW3tzs770lbtNHCoGWETAvQ7lBY95037zKLUFgHJhK+R000d/v9K0XM6SGl2JZCbCWH/Yge+pMc+Y2OGxgCSFK0EaU3A3WXVDOZj0CEyOLPD9PJfD5jWw5nhed7/I+38JVibpQ=;
	4:bAryTxZcLXPk0xzr5VIa6tl5CT9Rs1Cy6p6RTZqzhL/LBlIATJetRyJ/KJTq7ItvxvI3MT4fLNEguKqspY89uNF5h2VpswbN5NDxA3emGZOhBMCK7b9rvZsjCcaLMCE5IQNsRcuVxY+8WgO0ZUVEBrFIAo+8LfgiAJl1BbnJVIbVw0F5KmR5CvR8mlmINFe4QCAGVPE1wGCdxjyXZpNxVyRzJ+vs7CgFScZuEU31e8E5BbGSY++OpdWMkmx3jXKg1nJBlsPCkEs+iVvkH5Dv9VX+F57XrVoVG14hPS4doJY=
BN3PR0301MB1169: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11693B6784E1D3BF9B44B1FF868B0@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1169; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:rmAIb3rd0HYy0hSAiuOdlgI+cKr7RiiDEo0SAtv?=
	=?us-ascii?Q?OADw5SDuKpQYb0LzfyBsowrlbkmW1YVDQAEDaGV+AaNY4bZ6KG8JEJ8bNhJb?=
	=?us-ascii?Q?Zohj5sMGkHX00gRagCsjoaq1bJbUlHfAo/KEnH5tbPp2910xMTY6yHssScU4?=
	=?us-ascii?Q?11mf83WTohM0MIZFEvgp8a3P28+rMvEWJmhmRsWrNVhNJvK0egyamc1oO00q?=
	=?us-ascii?Q?if+e5Cm4sNjB5VmA4B7jQRAuzfNiSqH8SFyh7cXCV+B1xC85jRteBCmhfXBB?=
	=?us-ascii?Q?I/8mtoI9aB2ovg4k1vPMyRCUWSRwI41M7UA8DCMQX/2nvgKZ2ddj36p8qcJY?=
	=?us-ascii?Q?w2ds9+7AXUQ8Q4kGixiP3a4wRMHidYMXPUQThqAO2tbUvrFKhx5DU7nVvGdO?=
	=?us-ascii?Q?VNfGO0KaMGVRtckTyQqJKP1QDVaOP4CcZdr1o+UvBoLgO5O0+KCka4clvHpl?=
	=?us-ascii?Q?PP+lB1rhpTqjQx0cfQr+XFgvooooiLoQwlCBn6NaKV8fgQeZPmCnuNjzVQ1H?=
	=?us-ascii?Q?YA+MoMGpCCBbRxqMuZFVNgzU+Nn6/arcxB0ZFXjAz9zcmx0h4Ds5f6/CWgy4?=
	=?us-ascii?Q?25URGDmpigT6JMe9Zmd/TLRQaCqpR9zaFFg9Q5NCIWKprzOC1Lpf/PlfaJnG?=
	=?us-ascii?Q?rZsgENL8YfdnWmwSnwAtRD0H0EBU/6TrnkJqTwmCCFRS2SYCAR5nqZQm4Amk?=
	=?us-ascii?Q?tQdpQsxO85uR+cuiD7zACisxTlOEnPYGMtKDAFcZ42LxIw0O2wwxUWUiLKCE?=
	=?us-ascii?Q?tDVQnR9je7PsWBh/Yka+nVUJj94ZxzXwb0TIxxNu5hoAkt2EK53iioUddN/s?=
	=?us-ascii?Q?tS+qOpzHm0vBtz32+bF7AY6RoW36gAFCNqptdeVnV2sE+lDhkRrLZ1/LPyRf?=
	=?us-ascii?Q?736DExnzTyh5GyElq9KFxJjB/+pwD2QUqXOsGKjonuVWzOyzmZGyn4TWtj6c?=
	=?us-ascii?Q?LHmN2bnpE0kjrHnUyHTEBcX7Txs0I3oS5fDdnDWVMMVhAnLsRes0PZ12PWQe?=
	=?us-ascii?Q?Guzt8d9gx68UHuSf6VDaRWEflepFJxTvayqjNsyS7OqOjTw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:tXlumDx+6kNcKQkIxKjQ1H/zmYRZju/09mMiwnBYXzwoBkQvlkpJw+fTBAe/+EuuYlhvGaRasPXazDhHEXbZ7mnmTIL56SymLHe07yqPpcF9XkVPvi0/OKyeaDIrFLoiZoA77ZNRoNnsBLbw7lp1sQ==;
	24:v/fASBR9nt+I8MbzzRXPKTmsoNJ/rboq0xSIyB3eKH6BxC6++gf08TcpNRmzMHQmzhOqdRBldoNuk4pVJUnvRDyjdkYm33GzHsZA71BT4VA=;
	20:CuSp9kXTTtpjHDC3QX0u3qT94akL7qkakvBntMTD3l97qh0p6QTphyiGZabcst/6X8kKOpAHlp3NmFNLWqcKcg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 10:04:21.2895 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1217;
	2:LgrR9AHMnN47lByiU43R9tQPdlWugyQRPNVzRuZeiu6Ck2xVVHne/9oStVatWlPJFCGBD6QLfZZHkQt+lrz/fOqR/BOAH5NsfF+TA4wzRg4X39htILNXni+WNzaytANvtBX3S+mXugIpfmsvNJ22bp/cg/Ih1IqwOHVb3E+P8bk=;
	3:DU38zF4/WcBXSPtgwF502G3FmS7r6vCqXEKdbt3dmsCWSnkXQz5VoiGLbcWeWCZ43/z+VnPUl8qv2dsaGViXl0rmJ+BUJOXGH/T9MrEanIP9tvM/S/FUmcy3UJGhsRh0OiYPNMLItpIx3Gs6eVmP0aDG0S7BlrRsi9s/kjJfZH2W6BqqAd1gRehmtDfmLBJrGdD/qsavKJUA1oWTGQfB5oqP96aNsOOltXogskb4rgU=;
	25:TAwBU6GN3Ny89tYXJECKxFE3+gAmAy7KiR4yOXAJOYm6D4tNYMUL0Xt7XRrbelLr3KqOb7YZDh/+d+/8ThH/tYGMHcnMG0ZUE86nNNER7bfrmNMTeyPsHn0EEx1ThZ3rkbAL7DQf8r6LHGQC7/dQm6fpu3UWv1f34d0eGw/qUW31CrBtL+u4g1IPpePoKsUpckDjtOjUAQ7IyOeIGofGwUgTepPH/pWvTXN+vIwzbsMjnmx/pypmiwmOn6r5/0buKGIZ+w6s/ELpXTt3bpxzMg==;
	23:0cReMWus2jLcj4oYsyIqIj2zYm9/SsbPSS5/2XgIrMNixHmkZTSaXp6cagmWxt+6yTDCTtIw3UJfEqka9j+p9NuDyARcojJXea1piXAD+/emsFMLntoZXSx+JSK96pWtGzxwNYVc2FbOcQ+rzfRVr2yKlS3UzpM8QtJX1kIYj/2aeUVio/T3U6hKcJpaPlftKQPy/6UnozhHORCBRqAMv6BX23ur7+ZqvIJeELIfEkyk/ouC4RUd2vT0vfCwS+Ad
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v5 2/3] gstreamer1.0-plugins-base: Add basetextoverlay related patch
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
X-List-Received-Date: Thu, 30 Jul 2015 10:04:24 -0000
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



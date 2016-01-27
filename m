Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8C53976C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:23:49 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id wg8so8176282obc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P+v2RGZwQvjz4Rnd9aHwODQ/wonwgzO/NngZvMrXAKM=;
	b=UO0I6gxEKwaixTADB3QANzakwSfOB1C7SCKBExnKg83NZAef46+mE1RceMSaWeGmoT
	AMNbBVTm450H9gFpkfWK5HgFlUZlXyl6G0l6dhYu5bGAwa24afh3IY+DKcNKtrT5Xgxl
	v0RwzAikMvxfb0R2KojS9qpUGaWRle6Vgmo4h6AyCqqBUW9L65BOk6G2YoL1cYmBIQdq
	4V0fWsVwtyyFK4uOtGqTCY8ErrditF99s1US/e+OuBv2qJBk17B7Tenax+iBXlqL/NsP
	INX8V5b4W8A43QlShCD6B313vw7fJyW6bqk6yPZJbm5MjYaj64VhPEIDys+3L4zUyh3n
	obZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P+v2RGZwQvjz4Rnd9aHwODQ/wonwgzO/NngZvMrXAKM=;
	b=EkgnJHzRD6CIz9bCNsz/gLe04h458teWSbUjBO1B/EcfQnnZzQ6YDXW6YDfGDncxZy
	kx7u7FNiyHMzMOaAr4M7MV/yyukow0UeVZ4vVQpwmWExW69wdLcAnCNSglPzYs2IWcTw
	aoh8TwRvnCbmuFoU0bWwyzrywbNhGiAdOk3GadVIRIc/UEfOyJrvHMhupIbp4kVLwyF8
	N5J6RB8cjM8SplWf/wfdNaG5NXtvgGONsTT4l8zsJA75y1vK7MAqrzRBy3AEl5EfK17h
	nBtDAFabK+Cd70q2O4woepY85FkEbkxFVKEQy5VQocLJbCp050CuXynul9dT0wJ7GuSO
	hwpQ==
X-Gm-Message-State: AG10YOQlkJcWy4HCZgIT1qJFnbse6dAUFRAD1y62wPeo+BcBPO7toZ/ozyD0ELGol/Bj7Q==
X-Received: by 10.60.70.7 with SMTP id i7mr12986611oeu.72.1453854230102;
	Tue, 26 Jan 2016 16:23:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id e4sm1790827oic.1.2016.01.26.16.23.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 16:23:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 16:23:31 -0800
Message-Id: <1453854212-8496-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453854212-8496-1-git-send-email-armccurdy@gmail.com>
References: <1453854212-8496-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] gstreamer1.0-plugins-good: fix compiler warnings with -Os in 1.7.1
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
X-List-Received-Date: Wed, 27 Jan 2016 00:23:49 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...itialized-warnings-when-compiling-with-Os.patch | 41 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
new file mode 100644
index 0000000..59addae
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
@@ -0,0 +1,41 @@
+From 63a838d9ae2be480be8d28d6f51762d288b2a54a Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 26 Jan 2016 14:47:36 -0800
+Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ gst/isomp4/qtdemux.c    | 1 +
+ gst/rtp/gstrtph261pay.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 77bb73e..1fc60ac 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -3269,6 +3269,7 @@ qtdemux_parse_cenc_aux_info (GstQTDemux * qtdemux, QtDemuxStream * stream,
+     gst_structure_set (properties, "iv", GST_TYPE_BUFFER, buf, NULL);
+     size = info_sizes[i];
+     if (size > iv_size) {
++      n_subsamples = 0;
+       if (!gst_byte_reader_get_uint16_be (br, &n_subsamples)
+           || !(n_subsamples > 0)) {
+         gst_structure_free (properties);
+diff --git a/gst/rtp/gstrtph261pay.c b/gst/rtp/gstrtph261pay.c
+index 7cdd323..ebcf80e 100644
+--- a/gst/rtp/gstrtph261pay.c
++++ b/gst/rtp/gstrtph261pay.c
+@@ -867,7 +867,7 @@ gst_rtp_h261_packetize_and_push (GstRtpH261Pay * pay, GstBuffer * buffer,
+       gst_rtp_buffer_calc_payload_len (GST_RTP_BASE_PAYLOAD_MTU (pay) -
+       GST_RTP_H261_PAYLOAD_HEADER_LEN, 0, 0);
+   guint startpos;
+-  gint num_gobs;
++  gint num_gobs = 0;
+   Gob gobs[MAX_NUM_GOB];
+   Gob *gob;
+   Macroblock last_mb_in_previous_packet = { 0 };
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 88137ee..5f36f49 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1



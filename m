Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 64C7E77203
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:31 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id jq7so124942285obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ViIGcU5Y2byQOfLp7L8Gu4Y5CwCG4XbtSuw1KnU9HZs=;
	b=naMnpd726CBJAT3TA0346KJkm5YODWTU7GptkI17CHpyyAEsUdyZpCX8bSvRzA8VLP
	fB8VWg+eELNxR9PLUR9rXJLiKIzjdjTeuhJEyQrm7bQJ72FQ8DaQ+em0m2KVjJW0oUep
	jFyFkIG/LlfNtRuudDcwXyouX190MVDEf/cfSKxY9r7/hh30lyO0oU3HTx+qsNdy3E8m
	ix8x/0uo5Xv4oovn794hkj8UmhUVnwIkMTVK4RVhvt57VKvyRxHPEqOwx26nYp/MFE4q
	HsjdCDYMGp1AEuOOeGzthmMHMcT3yfs0ze715EiO9cpcUgZyZt5tm1fchQo/6s4HaDoP
	BKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ViIGcU5Y2byQOfLp7L8Gu4Y5CwCG4XbtSuw1KnU9HZs=;
	b=hvokkc6W8wlkff3l8OFmUPxETUKLyDNzW4s0jd7sTSrUPsdPtWkODNnqGqBDfJSyJM
	HiXrfSCyzmfuhtNus2yYCTC3Da6nPZq2ieHeTJoSQxfhwQFyTLvezlxc1hxN6XDvvMb/
	eGy69h8lI1yKlLqoImtWnh79ZXXUzJrLarKTNvSgwwF7TqmZkS7ruTRAWJxxERd2IrZy
	exjCpkzZsz/yr32Dn9KjBx3L6J8dGkFjxvM0dgTe9stcWh2/kmOTmG9XLbLJpWLgHIUS
	5xd3gVIcvpMicI50DgZO5Pvaou18lsOT64ElkwfhU4eejfOjS2Mo3lnj3olpHTgytEDp
	d64Q==
X-Gm-Message-State: AG10YOQqwKeokMVAosa634o1DMyTMsTl5hORq57pMv2Uw8FV2pU5ZC9EiWrPV+E9UjnjDA==
X-Received: by 10.60.147.137 with SMTP id tk9mr14729372oeb.45.1455936811803;
	Fri, 19 Feb 2016 18:53:31 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:30 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:14 -0800
Message-Id: <1455936797-13430-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/6] gstreamer1.0-plugins-good_git: update 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:31 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...itialized-warnings-when-compiling-with-Os.patch | 41 ----------------------
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  8 ++---
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
deleted file mode 100644
index 59addae..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 63a838d9ae2be480be8d28d6f51762d288b2a54a Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 26 Jan 2016 14:47:36 -0800
-Subject: [PATCH] fix maybe-uninitialized warnings when compiling with -Os
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- gst/isomp4/qtdemux.c    | 1 +
- gst/rtp/gstrtph261pay.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
-index 77bb73e..1fc60ac 100644
---- a/gst/isomp4/qtdemux.c
-+++ b/gst/isomp4/qtdemux.c
-@@ -3269,6 +3269,7 @@ qtdemux_parse_cenc_aux_info (GstQTDemux * qtdemux, QtDemuxStream * stream,
-     gst_structure_set (properties, "iv", GST_TYPE_BUFFER, buf, NULL);
-     size = info_sizes[i];
-     if (size > iv_size) {
-+      n_subsamples = 0;
-       if (!gst_byte_reader_get_uint16_be (br, &n_subsamples)
-           || !(n_subsamples > 0)) {
-         gst_structure_free (properties);
-diff --git a/gst/rtp/gstrtph261pay.c b/gst/rtp/gstrtph261pay.c
-index 7cdd323..ebcf80e 100644
---- a/gst/rtp/gstrtph261pay.c
-+++ b/gst/rtp/gstrtph261pay.c
-@@ -867,7 +867,7 @@ gst_rtp_h261_packetize_and_push (GstRtpH261Pay * pay, GstBuffer * buffer,
-       gst_rtp_buffer_calc_payload_len (GST_RTP_BASE_PAYLOAD_MTU (pay) -
-       GST_RTP_H261_PAYLOAD_HEADER_LEN, 0, 0);
-   guint startpos;
--  gint num_gobs;
-+  gint num_gobs = 0;
-   Gob gobs[MAX_NUM_GOB];
-   Gob *gob;
-   Macroblock last_mb_in_previous_packet = { 0 };
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index e3a2019..9cadc9a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -9,16 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "e016a70a7c97fc61c6cb5cd3821d38bc5ae5c9a4"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_base = "1b6fdce67c15d59957e395b1957aa625322092d4"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
1.9.1



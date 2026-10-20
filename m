Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4773.1792538584210707024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=msUDBHU6;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b001cd92bso65401f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538582; x=1793143382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=po84LSVX1H/5yAOd9XZT3wLXhTUWHWsJznFJ5iJBuG4=;
        b=msUDBHU6BHIIkKc7opzc+DsMS13DqbSeSnM5VNV3alWcp7a8Rvxc2OQNRu/8fA10c1
         csrq4/g6gjor9BI89693J5Bb9K3RbUwk7Z3mYGdfc1TaZj8HxSzYKYv4qEdsloGQ4NEc
         D0OSjpvcKmxDmryNQ2zSTLIotpXAYL72HgTLm1wKxE8kEwtYaQja9/st7bNy9Qn4NdPX
         87HKJ5TjzUq7E7CgcuIJx8FqDHpj4sox8OGWoWKwAhwzWvmj0yuJk5bTvvzrytkitLco
         d4NOUGnhGpCbyKslNoMqcFY8bJg7ckDcuEPatZ8Hsc/Fo+b//AvS5wpF/afCAw2JFWci
         py2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538582; x=1793143382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=po84LSVX1H/5yAOd9XZT3wLXhTUWHWsJznFJ5iJBuG4=;
        b=zyBrt+/JrMaXiqRvE7IdnlCC8kK/3zsYBK5J2esAHHmK0Btng/UX7YeS9oG23aDUyL
         mxCqthGJ01Sqwtz5hLRjW0kQfPmrDilzsWyyk/guOAzNlVRglmLmB1dUpUGgTS+KRwES
         /Zmyan37ZXJxfDx/QN9bVwCfo5oGidh/1j5Onu5XGy0FI578SpEiSJrxHw/sLupjRsdr
         cRgquoR7uD8/tyG9xV92CM8JIunPs4L20H222PTJUGkRVyoxTrStZHYLvM7KvToxHKqU
         PSO/L4+4mUxFC82dQ/9Kx1/KoyNhRjN3jHllOetClabOMWhC4bBZ1Et/Iqdl9UdWOJJu
         AMiQ==
X-Gm-Message-State: AFq9FYJ8te8Bj4uynJn+yRvau5nPaHwoX5idksqrMdDZmXFUxAXa6IKo
	t0kQrEwnYQZ0sClIFr7eb9YRei46o8PR7zXxmQAUYmbbHqJJeTvEG4EZF48hEj4KEdwJX6AQEQG
	GnjggiMg=
X-Gm-Gg: AYBFou0KmlUP7Hz9gxDRGk3UeGxiE+pFN81MpkO7R0SdjqN0zTRTCpEJgKWT5sJcu2r
	N77MCHPU0a6EvCbUUXM9/gaXTH2bzD33jhve/uuM7Od+pdHJ/DjLa6jH3fANiCgWRmCkBZunPld
	Zxd2ZAVs2qUfXXJGlNmfOMJlcdAbPxe+BZhlj35+ESAYUbnnE2wpcJDu7opGzUIIpYaCMjHgntz
	ERX+ahbpbwnaJVSXzriAWECvRI1SYEDWvP5O3M1Lxi4OhNf4odyYKvaMxlKIghwxWUHgrKWZ/Wo
	r7uBzFzBeyoZiEeIQQkizjWuLwCFx/o6abFIegxSMvuplhFlChULISx4FD4VCbncam7xiJbwx1t
	oo7B8ykfGKHiVW8k3ikdJcpiH+8h/AQwSzS/9IdtWWv4fuLvag6B0m0cL/1SINeHoCo8Sq/nxpH
	b1ev2EOIpAXmdCqOvbczg9jl2BYLnZtv1Q1ZCqvi0Uba8/kXShP+8+2KbIgGCmdQH5qNafzPm2S
	olGxgAaICPB5ZNiyT0xAXvIhmWoCyoqPX64RVO7cS05cvJkUhnPB1dv0r/5Fsb5AbVc26SCwQ==
X-Received: by 2002:a05:6000:2287:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e264ddf2emr348567f8f.45.1792538582210;
        Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/25] xz: upgrade 5.8.2 -> 5.8.4
Date: Wed, 21 Oct 2026 01:22:29 +0200
Message-ID: <5133a3664fe4fe624b484509eea52b6cc1fdb2cc.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248338
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Security fixes in 5.8.3-5.8.4:
- CVE-2026-34743: buffer overflow in lzma_index_append() when
  appending records to an lzma_index decoded from an Index with no
  Records
- GHSA-5qpq-xqfv-j9pg: invalid memory access in the alone/lzip/auto/
  microlzma decoders when reinitializing after a failed allocation
- xz: use-after-free showing an error message for --files/--files0
  from XZ_OPT/XZ_DEFAULTS, and another use-after-free with --verbose
  when stderr isn't a terminal

The carried backport of the CVE-2026-34743 fix is dropped: it is
included in 5.8.3 and applying it again duplicated the check in
lzma_index_prealloc().

Other fixes: lzma_index_cat() performance/overflow, lzma_memused()
misreporting, lzma_index_dup() check-type copying, threaded decoder
progress sync, Landlock ABI 9 support.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 -------------------
 .../xz/{xz_5.8.2.bb => xz_5.8.4.bb}           |  3 +-
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb => xz_5.8.4.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
deleted file mode 100644
index d3918233eab..00000000000
--- a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Sun, 29 Mar 2026 19:11:21 +0300
-Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
-
-If lzma_index_decoder() was used to decode an Index that contained no
-Records, the resulting lzma_index had an invalid internal "prealloc"
-value. If lzma_index_append() was called on this lzma_index, too
-little memory would be allocated and a buffer overflow would occur.
-
-While this combination of the API functions is meant to work, in the
-real-world apps this call sequence is rare or might not exist at all.
-
-This bug is older than xz 5.0.0, so all stable releases are affected.
-
-Reported-by: GitHub user christos-spearbit
-
-CVE: CVE-2026-34743
-Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/liblzma/common/index.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
-index 6add6a68..c4aadb9b 100644
---- a/src/liblzma/common/index.c
-+++ b/src/liblzma/common/index.c
-@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
- 	if (records > PREALLOC_MAX)
- 		records = PREALLOC_MAX;
- 
-+	// If index_decoder.c calls us with records == 0, it's decoding
-+	// an Index that has no Records. In that case the decoder won't call
-+	// lzma_index_append() at all, and i->prealloc isn't used during
-+	// the Index decoding either.
-+	//
-+	// Normally the first lzma_index_append() call from the Index decoder
-+	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
-+	// lzma_index_append() isn't called and the resetting of prealloc
-+	// won't occur either. Thus, if records == 0, use the default value
-+	// INDEX_GROUP_SIZE instead.
-+	//
-+	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
-+	// didn't have this check and could set i->prealloc = 0, which would
-+	// result in a buffer overflow if the application called
-+	// lzma_index_append() after decoding an empty Index. Appending
-+	// Records after decoding an Index is a rare thing to do, but
-+	// it is supposed to work.
-+	if (records == 0)
-+		records = INDEX_GROUP_SIZE;
-+
- 	i->prealloc = (size_t)(records);
- 	return;
- }
-@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
- 		++g->last;
- 	} else {
- 		// We need to allocate a new group.
-+		assert(i->prealloc > 0);
- 		g = lzma_alloc(sizeof(index_group)
- 				+ i->prealloc * sizeof(index_record),
- 				allocator);
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/xz/xz_5.8.4.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.4.bb
index 5e7ad1fc704..1c0e972c391 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.4.bb
@@ -26,10 +26,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     "
 
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
-           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f70f9e7ce58a8f1"
+SRC_URI[sha256sum] = "0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4cd33f55b2591d9"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

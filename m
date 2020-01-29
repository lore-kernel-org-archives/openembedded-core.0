Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6046060898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:34:17 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r21so4077278edq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bdu3eskkkJw3TuIK7mi+poW4aChettpBqhYbsNPYaU0=;
	b=dImC+kNUkrdpWQQJQJAgAtjJVmrB1RARYdnbXaHd+/cPQwBT1XbZpWDoAOf90z1hIj
	eVF4ra8/eFxt0xdD59UfwJm45/SC1QHuzMIao784kAwqYF+CrrjKc66qNwOuAbyieKfb
	22g9emzCyMTotT6z/kluNQVzz+ZKaVCt6spLmsN09/rtqACyE9pCIynF6o2od7TDPghB
	GKXPhbqv5d+EZftvwdSZQOQAZpuv9qpvrr+HVhOi098mv6NKcRniMxlNVxNKNxSywNj6
	/B7JVuJoxhmvIAxzgPVlz4chm9G+CMeF/XO8+v2Wf6ThrW50SkrDwoWYzOwL562+crfz
	ce1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bdu3eskkkJw3TuIK7mi+poW4aChettpBqhYbsNPYaU0=;
	b=DBY/+s/CbZYdQdQlOE6kNb8gZucOg3jo5CO7nhT+UKdN4ntBUO1ydNfTy1A8eFh1U/
	yojj/8leE8GyCBd/WGGal8lrSI/HlaDQ/mX0AxEfu+yszZkGIevfJyVpGVkEOFypymC6
	Cu023A5qnj1MUdvjRhgoP1k7KQZN9tabs08HjewWywA3axcgH6RVbQH10a+W+Yjk8x57
	bsWnxksPnvC5vGPal2XTPByVTfdwMpiYSO7yHuHhILemX15UZMc6kHefO+9fM1YmEYXC
	2fS2B/3BiAD1v7cOwoDpSZqIo4Hxkba7psc5JX0daZDhPquQ6fty0dI3UbGaZFGwIzeZ
	lgNw==
X-Gm-Message-State: APjAAAXnYDfSVKNDALTmKJ3HDk27xXes7c+sUG4WGGPkpwzBefISZLCW
	hienCjYHev4s0fnt+N7iqTqQBRDl
X-Google-Smtp-Source: APXvYqyLh1lem5FpbhbluV3Ch2cumQyU4yI7iFt02W9OgeH+UreUrf+g/0LPu8tM+feePmnUwDFKQQ==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr33859109wrv.368.1580288902687; 
	Wed, 29 Jan 2020 01:08:22 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:34 +0100
Message-Id: <20200129090738.1398-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/24] libarchive: upgrade 3.4.0 -> 3.4.1
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
X-List-Received-Date: Thu, 30 Jan 2020 18:08:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libarchive/CVE-2019-19221.patch           | 101 ------------------
 ...ibarchive_3.4.0.bb => libarchive_3.4.1.bb} |   8 +-
 2 files changed, 3 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.4.0.bb => libarchive_3.4.1.bb} (91%)

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
deleted file mode 100644
index b57e87874fe..00000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 22b1db9d46654afc6f0c28f90af8cdc84a199f41 Mon Sep 17 00:00:00 2001
-From: Martin Matuska <martin@matuska.org>
-Date: Thu, 21 Nov 2019 03:08:40 +0100
-Subject: [PATCH] Bugfix and optimize archive_wstring_append_from_mbs()
-
-The cal to mbrtowc() or mbtowc() should read up to mbs_length
-bytes and not wcs_length. This avoids out-of-bounds reads.
-
-mbrtowc() and mbtowc() return (size_t)-1 wit errno EILSEQ when
-they encounter an invalid multibyte character and (size_t)-2 when
-they they encounter an incomplete multibyte character. As we return
-failure and all our callers error out it makes no sense to continue
-parsing mbs.
-
-As we allocate `len` wchars at the beginning and each wchar has
-at least one byte, there will never be need to grow the buffer,
-so the code can be left out. On the other hand, we are always
-allocatng more memory than we need.
-
-As long as wcs_length == mbs_length == len we can omit wcs_length.
-We keep the old code commented if we decide to save memory and
-use autoexpanding wcs_length in the future.
-
-Fixes #1276
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/22b1db9d46654afc6f0c28f90af8cdc84a199f41]
-CVE: CVE-2019-19221
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- libarchive/archive_string.c | 28 +++++++++++++++++-----------
- 1 file changed, 17 insertions(+), 11 deletions(-)
-
-diff --git a/libarchive/archive_string.c b/libarchive/archive_string.c
-index 979a418b6..bd39c96f1 100644
---- a/libarchive/archive_string.c
-+++ b/libarchive/archive_string.c
-@@ -591,7 +591,7 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
- 	 * No single byte will be more than one wide character,
- 	 * so this length estimate will always be big enough.
- 	 */
--	size_t wcs_length = len;
-+	// size_t wcs_length = len;
- 	size_t mbs_length = len;
- 	const char *mbs = p;
- 	wchar_t *wcs;
-@@ -600,7 +600,11 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
- 
- 	memset(&shift_state, 0, sizeof(shift_state));
- #endif
--	if (NULL == archive_wstring_ensure(dest, dest->length + wcs_length + 1))
-+	/*
-+	 * As we decided to have wcs_length == mbs_length == len
-+	 * we can use len here instead of wcs_length
-+	 */
-+	if (NULL == archive_wstring_ensure(dest, dest->length + len + 1))
- 		return (-1);
- 	wcs = dest->s + dest->length;
- 	/*
-@@ -609,6 +613,12 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
- 	 * multi bytes.
- 	 */
- 	while (*mbs && mbs_length > 0) {
-+		/*
-+		 * The buffer we allocated is always big enough.
-+		 * Keep this code path in a comment if we decide to choose
-+		 * smaller wcs_length in the future
-+		 */
-+/*
- 		if (wcs_length == 0) {
- 			dest->length = wcs - dest->s;
- 			dest->s[dest->length] = L'\0';
-@@ -618,24 +628,20 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
- 				return (-1);
- 			wcs = dest->s + dest->length;
- 		}
-+*/
- #if HAVE_MBRTOWC
--		r = mbrtowc(wcs, mbs, wcs_length, &shift_state);
-+		r = mbrtowc(wcs, mbs, mbs_length, &shift_state);
- #else
--		r = mbtowc(wcs, mbs, wcs_length);
-+		r = mbtowc(wcs, mbs, mbs_length);
- #endif
- 		if (r == (size_t)-1 || r == (size_t)-2) {
- 			ret_val = -1;
--			if (errno == EILSEQ) {
--				++mbs;
--				--mbs_length;
--				continue;
--			} else
--				break;
-+			break;
- 		}
- 		if (r == 0 || r > mbs_length)
- 			break;
- 		wcs++;
--		wcs_length--;
-+		// wcs_length--;
- 		mbs += r;
- 		mbs_length -= r;
- 	}
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb b/meta/recipes-extended/libarchive/libarchive_3.4.1.bb
similarity index 91%
rename from meta/recipes-extended/libarchive/libarchive_3.4.0.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.1.bb
index 755a9c7fa40..2d33dd80ab8 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.1.bb
@@ -31,12 +31,10 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
-           file://CVE-2019-19221.patch \
-"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6046396255bd7cf6d0f6603a9bda39ac"
-SRC_URI[sha256sum] = "8643d50ed40c759f5412a3af4e353cffbce4fdf3b5cf321cb72cacf06b2d825e"
+SRC_URI[md5sum] = "59bff5ee6216cbb76c8354f6dd6f5a5a"
+SRC_URI[sha256sum] = "fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.25.0



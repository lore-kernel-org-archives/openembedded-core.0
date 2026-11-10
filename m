Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12912.1794282771221282058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LIe7G1xk;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso594522a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282770; x=1794887570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bMsAUlzQOIx1oosKdPA6lu+UwYX5agj/Gywc/wCfi8=;
        b=LIe7G1xk3uXk6sdGVGp93bCCgslwkH1DC/3oNtYfBK6URqJNA75/yWpShY+wibIKGW
         p+P0ER20msgkDUYABpaAF0mk5gNKmR3Uhv0SL/Wt7Z6u75UWK6p/g1vEO0e4EgqGUdOD
         ua7tEFVvxExe4pW9CiKErp7zdm1tmxMR4gqg0B8YGifig4b2qi9LHqi/bv7jw4MW5jLY
         XsFWqJyasOt59VZUyMzSzBmEE33r7o1RtnlOkf8kegppiyr/tbfMEQ5901CBJqgTbsId
         Nu8q9Y7eRByv10ZpkT/DlF/85HPoHXElIVNPj7uie10DSy8yULYBU4tvN9QDgiO+WSyy
         fEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282770; x=1794887570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bMsAUlzQOIx1oosKdPA6lu+UwYX5agj/Gywc/wCfi8=;
        b=WBkQjpr4YreQjr6KTLZyFXrluWHFhmiMazQI0kD2td2P7LpKpTnZYSZ9QLrv2X8qiq
         46XVHW8f1nHtlHPQl7o3cosiSISZITwr+DIH/ZYUbvDHn2fyn92JdSdPNyKKhQveIqXz
         wMTHU6qcg7gV+lghxbW+nd3J/DoXz4qePCLtp+T0GqTzmrz8GwyJ78DCYuyZX7cZ4lw/
         ByoWFdBjTa+P2o7anjVw8JzTKKUv0qn8mT9DftXlSgWikuBLkwTnqSBAzzdSwvrGa5pn
         DNfolE6aqr0vePmlItQ0uHenzuV4RIkxqDAJNadFs85aQc07aBR4y6JcJe7r7PjetPv/
         DE8g==
X-Gm-Message-State: APuU4Z/4QxT+qQUugBjDoww8+mqP68tHOna7lOeA8Dn8XohmBlsX83LO
	DfIzjWeqLqNrhqavAsYA7R5dq44Bdc3sssbkQkU24cx/TSWx7hl2rdN2+9JM206S
X-Gm-Gg: AYBFou0FXgv7HBd3KYlJHe1NAjm8rfDfdo6UcwWp3qOO6E4+vzud5Z7OSeu6fV6PqpC
	PaTq91wiWNcLHvWinl61O15byUjc7GUBcwP8qWlbeipVaLV61vD0C/9vLB+C1VYjyRmnHNhw1xY
	d64iO5R1XAXxp1ikUdnQUU8LSdvQNlm4Ymw9AUyACFIR9unqQrZVYIasXSFPRWWRApADbQ7XiIh
	FVEBdyPGQOfTcDTNmLtQzwhqGvrZOcHbEpshAqfnHSD5IMB55VVTj1AiPiLkJmwAVgqiDdM8VI9
	5HAXvi97NDQAqkJuzkPS4a3pZaaJAsl9mfGRB5dySBAJC96ZlJki15FbnANCG99zPC9JMsRuvf6
	e5UfWwJxxzDfhNtQw2BiwmSrhVtweOJ459XXv3cz7opgeAYnh3IBL0Gd5z/VurYvKoHFaM5/UCN
	OPzGJ3oAh0OO0numHJBKPsy9fZEC1LPiUmwRQRtqavAQ+yvyQntxkaTxE9S0oO+Rw0Gb4TxO7uE
	xiY6C84szWsCKUgblacScga5AnefV89NO3MHxkA8iStoiGNa+fS3YDuUKmRJSOhtuN0aFf8Jew1
	VD3qrRS4/sAtAvMIG3vbCQyuTAF5rt4ut604NvSdONBYN8tbYsOfDN8mFkZ/uQ==
X-Received: by 2002:a17:90a:d2c6:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b166d12258mr1425226a91.44.1794282770408;
        Mon, 09 Nov 2026 19:52:50 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 7/7] libarchive: upgrade 3.8.10 -> 3.8.11
Date: Tue, 10 Nov 2026 16:52:29 +1300
Message-ID: <20261110035229.2940188-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249894
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed patches for the new version.

Changelog:
https://github.com/libarchive/libarchive/compare/v3.8.10...v3.8.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...er_bidder-Allow-ARCHIVE_STATE_HEADER.patch |  9 ++++----
 ...vert-RPM-reader-into-a-proper-format.patch | 23 ++++++++++---------
 ...0005-Disable-RPM-filter-auto-bidding.patch |  2 +-
 ...archive_3.8.10.bb => libarchive_3.8.11.bb} |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.10.bb => libarchive_3.8.11.bb} (97%)

diff --git a/meta/recipes-extended/libarchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch b/meta/recipes-extended/libarchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch
index cc8f2896a26..e2755b08623 100644
--- a/meta/recipes-extended/libarchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0003-archive_read-register_bidder-Allow-ARCHIVE_STATE_HEADER.patch
@@ -1,6 +1,6 @@
-From 84b6ba6f4ac5f00e70d66bb7c765dd487147d83b Mon Sep 17 00:00:00 2001
+From 72092984cb18db787220543c862452a10b37dd5c Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
-Date: Mon, 25 Aug 2026 22:39:08 +0000
+Date: Tue, 25 Aug 2026 22:39:08 +0000
 Subject: [PATCH] __archive_read_register_bidder(): Allow ARCHIVE_STATE_HEADER
 
 This allows formats to apply filters when they know what they need.
@@ -9,16 +9,15 @@ In the case of RPM, that's after parsing the (uncompressed) header.
 
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846 commit 84b6ba6f4ac5]
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-
 ---
  libarchive/archive_read.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
-index 2f006fb..5c51df5 100644
+index 6235d66..66bd4e8 100644
 --- a/libarchive/archive_read.c
 +++ b/libarchive/archive_read.c
-@@ -1297,7 +1297,8 @@ __archive_read_register_bidder(struct archive_read *a,
+@@ -1325,7 +1325,8 @@ __archive_read_register_bidder(struct archive_read *a,
  	int i, number_slots;
  
  	archive_check_magic(&a->archive, ARCHIVE_READ_MAGIC,
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 34c0cf415e7..6fe9d1b681b 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -1,7 +1,8 @@
-From dcda938b907d3b99e012b52ea1250d01fb0c8546 Mon Sep 17 00:00:00 2001
+From e58093fa1d297cb30984da5fbee0e6d39bfb78d8 Mon Sep 17 00:00:00 2001
 From: Davide Beatrici <git@davidebeatrici.dev>
-Date: Mon, 25 Aug 2026 23:47:31 +0000
+Date: Tue, 25 Aug 2026 23:47:31 +0000
 Subject: [PATCH] Convert RPM reader into a proper format, supporting both
+
  stripped CPIO and SVR4
 
 The filter is kept but is not appended by archive_read_support_filter_all() anymore.
@@ -27,11 +28,11 @@ Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
  libarchive/test/test_read_format_huge_rpm.c   |   13 +-
- 14 files changed, 1154 insertions(+), 14 deletions(-)
+ 14 files changed, 1155 insertions(+), 13 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
-index 8bc70c5..487bef3 100644
+index c171c24..0c150c0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -212,6 +212,7 @@ libarchive_la_SOURCES= \
@@ -67,7 +68,7 @@ index ac039c1..34ba173 100644
    archive_read_support_format_warc.c
    archive_read_support_format_xar.c
 diff --git a/libarchive/archive.h b/libarchive/archive.h
-index 19b316a..f04a747 100644
+index 2c13908..64dbdaa 100644
 --- a/libarchive/archive.h
 +++ b/libarchive/archive.h
 @@ -316,7 +316,9 @@ typedef const char *archive_passphrase_callback(struct archive *,
@@ -80,7 +81,7 @@ index 19b316a..f04a747 100644
  #define	ARCHIVE_FILTER_LZIP	9
  #define	ARCHIVE_FILTER_LRZIP	10
  #define	ARCHIVE_FILTER_LZOP	11
-@@ -387,6 +389,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
+@@ -389,6 +391,7 @@ typedef const char *archive_passphrase_callback(struct archive *,
  #define	ARCHIVE_FORMAT_7ZIP			0xE0000
  #define	ARCHIVE_FORMAT_WARC			0xF0000
  #define	ARCHIVE_FORMAT_RAR_V5			0x100000
@@ -88,7 +89,7 @@ index 19b316a..f04a747 100644
  
  /*
   * Codes returned by archive_read_format_capabilities().
-@@ -480,7 +483,9 @@ __LA_DECL int archive_read_support_filter_program(struct archive *,
+@@ -482,7 +485,9 @@ __LA_DECL int archive_read_support_filter_program(struct archive *,
  __LA_DECL int archive_read_support_filter_program_signature
  		(struct archive *, const char * /* cmd */,
  				    const void * /* match */, size_t);
@@ -98,7 +99,7 @@ index 19b316a..f04a747 100644
  __LA_DECL int archive_read_support_filter_uu(struct archive *);
  __LA_DECL int archive_read_support_filter_xz(struct archive *);
  __LA_DECL int archive_read_support_filter_zstd(struct archive *);
-@@ -501,6 +506,7 @@ __LA_DECL int archive_read_support_format_mtree(struct archive *);
+@@ -503,6 +508,7 @@ __LA_DECL int archive_read_support_format_mtree(struct archive *);
  __LA_DECL int archive_read_support_format_rar(struct archive *);
  __LA_DECL int archive_read_support_format_rar5(struct archive *);
  __LA_DECL int archive_read_support_format_raw(struct archive *);
@@ -149,11 +150,11 @@ index f086773..cc5c2b2 100644
  	archive_read_support_filter_lrzip(a);
  	/* Lzop decompress falls back to "lzop -d" command-line. */
 diff --git a/libarchive/archive_read_support_filter_by_code.c b/libarchive/archive_read_support_filter_by_code.c
-index 4c8b6cb..d3c7d21 100644
+index 6c18421..7a30c49 100644
 --- a/libarchive/archive_read_support_filter_by_code.c
 +++ b/libarchive/archive_read_support_filter_by_code.c
-@@ -49,8 +49,10 @@ archive_read_support_filter_by_code(struct archive *a, int filter_code)
- 		return archive_read_support_filter_xz(a);
+@@ -50,8 +50,10 @@ archive_read_support_filter_by_code(struct archive *a, int filter_code)
+ 	case ARCHIVE_FILTER_B64:
  	case ARCHIVE_FILTER_UU:
  		return archive_read_support_filter_uu(a);
 +#if ARCHIVE_VERSION_NUMBER < 4000000
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
index 86eb48a8045..99c4be8df20 100644
--- a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -1,4 +1,4 @@
-From b367b31b5b764e15c8d484a75c790b6ffa1e20d8 Mon Sep 17 00:00:00 2001
+From e19540f1fb5a15edcad9339150e3e8184b951148 Mon Sep 17 00:00:00 2001
 From: Sumanth Gavini <sumanth.gavini@windriver.com>
 Date: Tue, 11 Aug 2026 12:02:31 -0700
 Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb b/meta/recipes-extended/libarchive/libarchive_3.8.11.bb
similarity index 97%
rename from meta/recipes-extended/libarchive/libarchive_3.8.10.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.11.bb
index 747a6b99693..034aeab7ebd 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.11.bb
@@ -37,7 +37,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "a1bffbe5152cfe869751179e7b16648c87c461cb8c46eee75062efbe164cc57c"
+SRC_URI[sha256sum] = "900fe9fc7237c2b04f090f3c3648de8fe597525771f5035016537ce2d667d12b"
 
 inherit autotools update-alternatives pkgconfig ptest
 

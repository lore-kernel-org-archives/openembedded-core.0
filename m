Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2087.1794939636030274241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=K++YV27W;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1321155e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939634; x=1795544434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eoFWAgbUKOjHrsk2y0+YBJjoJ1XscZnuqJ2h/ArybhE=;
        b=K++YV27WVdKdmnwVUratKff0es2ISQM5S9Pl2eZqA+Xz0/vMXqtNuidE3gRJyi9Nff
         3kxRAB+DwW1KCHXPj4fCpZoRNW6WPkJD9czLo2jkju5cmmWdPpPJZrGCPh5PWkkfOvcJ
         /XMrJ7luD5ARpuBj8j1rcHgG9WoxqH/tHMHdtlXC3UUbnTgnJHoJxMqTljr2QNEACeF0
         TL5nc4//voPHftiK9EgVy0SzqwppRDxUPsSAxfrvyXy3Mc98qre0/lsdIas21r8E21HM
         4n0q0BL5g7MURwt9ANWBz8agahT0L5RMJA17051w03IJCWAQNLiFf36SYA1N+CK0V8IK
         /Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939634; x=1795544434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eoFWAgbUKOjHrsk2y0+YBJjoJ1XscZnuqJ2h/ArybhE=;
        b=To0y5L2FQtPAWlmCa8pRkLCWd5Z0sSKGSO7u8mU6MXdx5ZxHJt2ON+BUFYP3vn6aZY
         EsA2y2Lfi2c92MW9OAbEgUGyETJ94GBIyTU3bVqkNdOhWX299jtqgwAZQ2mbqig8LHD9
         avW4Ou1FdK+3pwhkd2/vQO14L89SKeLEkGt3h8VoJxTFldHm4ogKOJpTEPKcuW55xpiS
         nDPCeloLSAYF+9Hox/448ZjN09iL+8F3pkmuK/Q91yulJHksSTNDCWt2Dt1b//N4qQOU
         GPpIP/XJQ7nD76e9O57HBSFqbvFTEQ0aHibyig+feXLEPqaEnVP4O8KlJZl5BrnMMZX2
         N4BA==
X-Gm-Message-State: APuU4Z8kscHjvciLg8a+9HwB6i0OGxvSi5XhQIaHMXo9n6rYvb/ocZa6
	TF+tK+0e+i2yIwkHBw9MGbbYwmXHl7k4iCn70GUV+vGj+vx44WfmFWP3H7uhCY+T+aVd5jVo+B4
	TzJPoUQ4=
X-Gm-Gg: AYBFou0yIgFgjCGmNzCceNr1T1OA0lP0hYCRAJOabpEDFXMh5qrwgc+5FjJ7wSwq5Mm
	xHYVSTLXKAMTbtxi4zfL1s8YGWcWzkncsFKmDoEuiDhjZavkAekRnD1hjvNmQ1/RMwkMktUOXZQ
	ACRDpYdRfkg3qFBwMPRmnH8xc2+HrgHz9jO/gmLlXO9eTCY/YyR34LnVe1vhd4i0AgJlCKQxmb1
	JxzgCDIna7zGPkAFqv+TACloy6Hm6wMgAQv38GRipSHx8Oo32ilgIGrGrfpxAaZoCNwLltBYfRC
	dTs+u/LrI7ZF9PFNwTrNZGQxFSGHTrVU/dgxapcnonBsJKmUT+CAJiRPte9Mkky6ecm0F3j3aIx
	wpDsPiT2NSC7E/WmUZal2Urqc1erqr/3uSrX6QXAXJj9hGWgcjT2BXBa86vBBsl5dS8fvlDvdGK
	BWR36IsYbLswc7b3wKyqnzpcMRM9DL3f20RqD1F2iEIu65/FlKhUdwU3lCzNqdqW3XztlHtxfa1
	TDKVgPxDjJ79aBldvCli+Srbgj3PXaW3PJaqtE4xG95tMUxT18iUMccPejj08zNiAUlnYFDZY+t
	SjC1IPJtHwxp2AqbHdhGjguPUwPLGirzDltRWZFQ/zEx+YhRT4n8/ygSfXpN5r4aUYWRcR4gdyT
	Rzs7XAlmgCblweuSH7LM9S4SI1PbS
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr310915855e9.21.1794939634019;
        Tue, 17 Nov 2026 10:20:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/17] rsync: upgrade 3.4.1 -> 3.4.2
Date: Tue, 17 Nov 2026 19:20:02 +0100
Message-ID: <81cdc3bb8555dd2defaf9899bab9528d07fdaa72.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250469
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Drop backported CVE patch included in this release.

Parts of the prototypes patch were fixed upstream (in zlib) but some sections
were not, drop the merged sections of the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ae818a6c3635bff7701c339174b6d281a507462)
Suggested-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: NEWS: https://download.samba.org/pub/rsync/NEWS#3.4.2
Compare log: https://github.com/RsyncProject/rsync/compare/v3.4.1...v3.4.2
The Yocto Project TSC granted an exemption to the stable release
policy for this rsync version upgrade, see:
https://lists.openembedded.org/g/openembedded-core/message/248203]
---
 ...-prototypes-to-function-declarations.patch | 68 +++----------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ----------
 .../rsync/files/determism.patch               |  4 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb}  |  3 +-
 5 files changed, 16 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.4.2.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 3011308c61a..e6d3578e85c 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
+From 46cbe5b70b5cbf981cf693137ac081cacbbb2e2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -17,20 +17,17 @@ Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/03
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c   | 2 +-
- exclude.c    | 2 +-
- log.c        | 2 +-
- main.c       | 2 +-
- zlib/crc32.c | 2 +-
- zlib/trees.c | 2 +-
- zlib/zutil.c | 4 ++--
- 7 files changed, 8 insertions(+), 8 deletions(-)
+ checksum.c | 2 +-
+ exclude.c  | 2 +-
+ log.c      | 2 +-
+ main.c     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 66e8089..b24b202 100644
+index 24e46bf..6ae3178 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -40,7 +37,7 @@ index 66e8089..b24b202 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 87edbcf..ae0de2f 100644
+index 24de64f..a787488 100644
 --- a/exclude.c
 +++ b/exclude.c
 @@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
@@ -66,7 +63,7 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 4f070ac..f59eaec 100644
+index ccad28a..bbb09ba 100644
 --- a/main.c
 +++ b/main.c
 @@ -246,7 +246,7 @@ void read_del_stats(int f)
@@ -78,48 +75,3 @@ index 4f070ac..f59eaec 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/zlib/crc32.c b/zlib/crc32.c
-index 05733f4..50c6c02 100644
---- a/zlib/crc32.c
-+++ b/zlib/crc32.c
-@@ -187,7 +187,7 @@ local void write_table(out, table)
- /* =========================================================================
-  * This function can be used by asm versions of crc32()
-  */
--const z_crc_t FAR * ZEXPORT get_crc_table()
-+const z_crc_t FAR * ZEXPORT get_crc_table(void)
- {
- #ifdef DYNAMIC_CRC_TABLE
-     if (crc_table_empty)
-diff --git a/zlib/trees.c b/zlib/trees.c
-index 9c66770..0d9047e 100644
---- a/zlib/trees.c
-+++ b/zlib/trees.c
-@@ -231,7 +231,7 @@ local void send_bits(s, value, length)
- /* ===========================================================================
-  * Initialize the various 'constant' tables.
-  */
--local void tr_static_init()
-+local void tr_static_init(void)
- {
- #if defined(GEN_TREES_H) || !defined(STDC)
-     static int static_init_done = 0;
-diff --git a/zlib/zutil.c b/zlib/zutil.c
-index bbba7b2..61f8dc9 100644
---- a/zlib/zutil.c
-+++ b/zlib/zutil.c
-@@ -27,12 +27,12 @@ z_const char * const z_errmsg[10] = {
- ""};
- 
- 
--const char * ZEXPORT zlibVersion()
-+const char * ZEXPORT zlibVersion(void)
- {
-     return ZLIB_VERSION;
- }
- 
--uLong ZEXPORT zlibCompileFlags()
-+uLong ZEXPORT zlibCompileFlags(void)
- {
-     uLong flags;
- 
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index 1c5661d35b5..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c2ff1647b1d9a0b92b73af106ce133490306e886 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-
-Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index a4d46c39..b1588b70 100644
---- a/sender.c
-+++ b/sender.c
-@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
- 
- 		if (ndx - cur_flist->ndx_start >= 0)
- 			file = cur_flist->files[ndx - cur_flist->ndx_start];
-+		else if (cur_flist->parent_ndx < 0)
-+			exit_cleanup(RERR_PROTOCOL);
- 		else
- 			file = dir_flist->files[cur_flist->parent_ndx];
- 		if (F_PATHNAME(file)) {
--- 
-2.51.2
-
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index f915d658c88..fd96b873c85 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From b810d78a9327b5b313ebc0aa1a0b155de7c10afd Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1d13e8c..2c5cf99 100644
+index 80e9d72..a7d313c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 42af4c55d00..fb195b1e685 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
+From 0608f5ebb26e2e474867bec6c3d67dfd0a7663f0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7c75c26..1d13e8c 100644
+index c2fe775..80e9d72 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+@@ -185,60 +185,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.4.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 509be486b87..5fe1bc2c2b3 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2025-10158.patch \
            "
-SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
+SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846

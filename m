Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4789.1793334058763044632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 21:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GqQGnotn;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12169; q=dns/txt;
  s=iport01; t=1793334059; x=1794543659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vi30sLbDt8Rg4qBhCTEAoZ5wnU42Vu39Jws0hS/aILQ=;
  b=GqQGnotnRfuIu+sDWnEO0lLP+Zg5UrMl/cjy3r9B+W7HlVBBahZVUlJB
   N4KY1t67q9i90SEzC9S/jkrON1nPGXYiA6bbMOMRX9bNl7RGEm7HVzjKm
   sljcu+CgjVbFopA88lTezIh726LyxmYfVMTS6pYYj+tS5kkwNPeE04QYd
   dCrjshP9ObhuDpFMKaFacKv8bUce05mu8Br6p4wi0d+P7JtbC6HvS0cLp
   FhYDXMLK9iEbZmHX8WGoGRAoMnt120hbYBW4DeV4aX0awAQmaxjC1IOA9
   LYqCvOybDSJ2PaMlCleiz+6sLbCz2h+9bZN//ppEEYYN0bYQpVZ6bidN7
   Q==;
X-CSE-ConnectionGUID: pXBfr6FtRi+S3NZfUuAdHA==
X-CSE-MsgGUID: U3knMZrSQKWDuTtJTaaBWw==
X-IPAS-Result: =?us-ascii?q?A0B1AgAxGuRq/47/Ja1aHgEBCxIMggULghg/dWBDSZZLA?=
 =?us-ascii?q?4tlkjiBfg8BAQEPLhYNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDASYLARgBLRAcAwECLyAHBCMIGRqCa?=
 =?us-ascii?q?AGCOgM3AxG0KRs3gXkzgQGDKQE5AdlmDYJaAQsUAYE4hUCCf4UkXRgBhH0nG?=
 =?us-ascii?q?xuBcoEVgTuCLoIfQgIDgU6GVASCIoEMgVoeZYwrAoduSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoEZgQddgSspYAEhgQiBdgKCUYIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyQiCBIJARMaLguBGjU8CSZBFQxkCxoFYggCDQx2ORAxI?=
 =?us-ascii?q?CYyBAMeIxgNSBEsNxUZBD5uB5FygkFNWQE0ASsXCQJ2ZS8RBpMgCDyRe6Aec?=
 =?us-ascii?q?Qoog3eMI40+ggCFfBozhVulFZkIjgqECpEqP10rhD6BaDyBWXAVSASCVglKG?=
 =?us-ascii?q?Q+OLhaBFAEHgkSCVoI9gT3ICicyAgkyAgcCBw4DC5FqgRxgAQE?=
IronPort-Data: A9a23:XO73yKrCp6uDnbn1ZEAUlA1N9JFeBmIOZBIvgKrLsJaIsI4StFCzt
 garIBnVPf6NZTSmKYsnPYqw809XuMOHnNVkSQtl+C40QiNA9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8kI34ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v5HK29Uq
 9IEEjFOVUulteyL3Zu3asA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7WzFbpVacpLs+y2PS1wd2lrPqNbI5f/TXHp4EwR7I9
 zuuE2LRP0oZMvmt0wG80U2Am9PTvx/yUagtC+jtnhJtqBjJroAJMzUUXFqjqOS9zEW+Vt9FL
 UUR0ic1se4u+UerJvHnXha4qWSI+AYBQdZRHsU+6QeQ2qTT/gCVD3QFSTgHb8Yp3OcxXTEs2
 1qDkt/lCDAqu7qPRFqZ96yItnW1ISUTIGoIaCMIQAdD5MPsyLzflTrVRdplVarwhdrvFHSon
 naBrTM1gPMYistjO7iHwG0rSgmE/vDhJjPZLC2NNo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:c/nmda8/+XOwXmxGCvduk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:PV3U8mygMrOyosVV8t8SBgUMKuoraCPz0E3RYHTjL1RndaC8RX+5rfY=
X-Talos-MUID: 9a23:Ccrs6gvmth1otUJiM82nuWphMuJa+Z+XK38hjKkamfWNPAZPJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,185,1787011200"; 
   d="scan'208";a="533970891"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 04:20:57 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 9CECA18000351;
	Fri, 30 Oct 2026 04:20:57 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4316ACBF201; Thu, 29 Oct 2026 21:20:57 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [OE-core][wrynose][PATCH 1/1] rsync: upgrade 3.4.1 -> 3.5.1
Date: Thu, 29 Oct 2026 21:20:54 -0700
Message-Id: <20261030042054.1345082-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261030042054.1345082-1-dkelaiya@cisco.com>
References: <20261030042054.1345082-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 04:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248983
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Consolidate four OE-Core master upgrades into one Wrynose backport
using the published rsync 3.5.1 release tarball.

The TSC approved this exception to the stable branch policy for rsync
on Scarthgap and Wrynose [1]. The upgrade avoids carrying the large
security backport series and includes the regression fixes following
3.5.0. It also aligns the version with master and Blacksail.

The release includes the earlier security fixes from 3.4.x and the
33 security fixes in 3.5.0. The affected version ranges differ between
those CVEs. Version 3.5.1 fixes path handling, standard-stream access
and other regressions introduced in 3.5.0 [2].

Backport Changes:
- Upgrade directly from Wrynose's 3.4.1 recipe to 3.5.1, folding the
  intermediate version updates and source patch refreshes together.
- Remove CVE-2025-10158.patch because its fix is included in the
  release sources.
- Refresh the three retained source patches and add the optional idn
  PACKAGECONFIG from master, disabled by default.

Upstream 3.5.0 security fixes:
CVE-2026-53802 CVE-2026-53803 CVE-2026-53785 CVE-2026-53784
CVE-2026-53793 CVE-2026-53795 CVE-2026-53796 CVE-2026-53797
CVE-2026-53799 CVE-2026-53800 CVE-2026-53801 CVE-2026-53783
CVE-2026-53786 CVE-2026-53798 CVE-2026-53788 CVE-2026-53789
CVE-2026-53791 CVE-2026-53790 CVE-2026-53792 CVE-2026-53794
CVE-2026-70461 CVE-2026-70458 CVE-2026-70456 CVE-2026-70457
CVE-2026-70459 CVE-2026-70464 CVE-2026-70455 CVE-2026-70453
CVE-2026-70452 CVE-2026-70463 CVE-2026-70460 CVE-2026-70462
CVE-2026-70454

The original upgrade authors are credited as follows:
- Richard Purdie: 3.4.1 -> 3.4.2 and 3.4.2 -> 3.4.4.
- Jaipaul Cheernam: 3.4.4 -> 3.5.0 and 3.5.0 -> 3.5.1.

[1] https://lists.openembedded.org/g/openembedded-core/message/248203
[2] https://download.samba.org/pub/rsync/NEWS

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
(cherry picked from commit 7ae818a6c3635bff7701c339174b6d281a507462)
(cherry picked from commit 3f583855eece3b022dec3703e6622eedac0159e9)
(cherry picked from commit 5a5de1c212718d3918dfbe9b6ab770dd76316d6f)
(cherry picked from commit 6367a867b6a6079bf83eeffcc8bca5f5ec22b7ab)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...-prototypes-to-function-declarations.patch | 78 ++++---------------
 .../rsync/files/CVE-2025-10158.patch          | 36 ---------
 .../rsync/files/determism.patch               |  6 +-
 .../rsync/files/makefile-no-rebuild.patch     |  6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb}  |  4 +-
 5 files changed, 23 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 3011308c61..1f1fc3f3b3 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 073caa67f2aa221de113a21f8105940421a2da90 Mon Sep 17 00:00:00 2001
+From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
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
+index 4c91c2b..b3635a0 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -779,7 +779,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -796,7 +796,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -40,10 +37,10 @@ index 66e8089..b24b202 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 87edbcf..ae0de2f 100644
+index 7476f6a..b939a0c 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -460,7 +460,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -53,10 +50,10 @@ index 87edbcf..ae0de2f 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index 889b57b..19e5e98 100644
 --- a/log.c
 +++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
  	}
  }
  
@@ -66,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 4f070ac..f59eaec 100644
+index ed6e554..b5f9448 100644
 --- a/main.c
 +++ b/main.c
-@@ -246,7 +246,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+@@ -250,7 +250,7 @@ void read_del_stats(int f)
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
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
index 1c5661d35b..0000000000
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
index f915d658c8..890275f6d7 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 41b859a9df9611b7b3f6cbe28af47118d947080f Mon Sep 17 00:00:00 2001
+From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,10 +25,10 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1d13e8c..2c5cf99 100644
+index de24949..bb9bb27 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
+@@ -28,6 +28,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 42af4c55d0..59255d15e7 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 603e5862cca832ae925d0c92a8654a57caff5910 Mon Sep 17 00:00:00 2001
+From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 7c75c26..1d13e8c 100644
+index 716171d..de24949 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -184,60 +184,6 @@ conf: configure.sh config.h.in
+@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.4.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.1.bb
index 509be486b8..6b121ab1a8 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
@@ -15,9 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2025-10158.patch \
            "
-SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
+SRC_URI[sha256sum] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
@@ -29,6 +28,7 @@ PACKAGECONFIG ??= "acl attr \
 
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
+PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn2"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-- 
2.35.6

Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5129.1793336567876214823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 22:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GrdYgeN9;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=55134; q=dns/txt;
  s=iport01; t=1793336567; x=1794546167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YOYbilujoxLQucjUqaOxtAn/x9I7NlKlBj72fr/GAK0=;
  b=GrdYgeN93rtXUcyA4XN+m1/7e/3zkV75B985+1x/rZvUTfPx/lcOUMIg
   BGUJ5kcBTEr8M55H+2tZ06unq50gXpQcKncnsFtyCnMWl+hcc0WArzvwr
   KX04BaPQnC63U1JwzS+SXepj0f0EIdzm065CXr5w4Tc4GPBfp0N9KEVum
   MZ52hyWaPlVdvub5qkiLRJBKSzAzEClEqzXxsCX9XDGfeN8npc3Pw4bsj
   KymoLVjrh7ElpNZYOhGqRWFgYDr5cXzYk8uRXgtZUCXnMXAzoPteqE07t
   889yChKb3p8R5fWPlpQ4D+H5juS218hHhlv2klTYzVrLWNCLqQE3RjPn8
   A==;
X-CSE-ConnectionGUID: PHuWc6F9RCOj2B68KZRI3w==
X-CSE-MsgGUID: b6mU/h0USMia/JuYZ+6UfQ==
X-Ironport-Invalid-End-Of-Message: True
X-IPAS-Result: =?us-ascii?q?A0AcAABRJORq/4r/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBghc/dWBDSQOMb4lZA4tlhWaMUoF4Bg8BAQEPLhYNBAEBhQUCjhwCJ?=
 =?us-ascii?q?jQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDA?=
 =?us-ascii?q?RkBDAsBGAEgCgMQHAMBAi8gBwQjCBAJGoJoAYI6AzcDEQa0HRs3gXkzgQGDK?=
 =?us-ascii?q?QE5AdlmDYJaAQsUAYE4AYU/gn+FJF0YAYJKgjMnGxuBcoEUAYE7gi6CH0IBA?=
 =?us-ascii?q?QEBAReBDSEJNYYfBIIigQyBVwMeMjOFTYZeAoduSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM+F4EHGwYFgR2BHoEZgQddgSspYAEhgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLguBGjU8CSZBFQxkCxoFYggCDQx2ORAxICYyB?=
 =?us-ascii?q?AMeIxgNSBEsNxUZBD5uB5FygkFGBgEBLBAcARoHEwEHDBIEAhcJAi41DAcrA?=
 =?us-ascii?q?jMFBxwMBQwGBS+SYwkBBzyCaYxxgiGBNYpLlB5xCiiDd4wjjT6CAIV8GjOEB?=
 =?us-ascii?q?IFXkkGLDhaHMJkIjgoWg3SRKgk2EE0rhD6BaDyBWXAVOw0EglYJShkPjisCA?=
 =?us-ascii?q?RaBFAEHgkSCVoI9gT3ICicyAgkDLwIHAgcOAwuRaAImdmABAQ?=
IronPort-Data: A9a23:joZb9qhMArScTP8DvzqSNmGlX161iREKZh0ujC45NGQN5FlHY01je
 htvX2+CP/7YNjHxe493Po/k9UwFvMTXzd5iGgQ9qnxgH3tjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/jS8E4HUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUg2vtICj9gp
 MYzDzJXRE7TpNCM4emkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWYQd/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DQGZgNwxzJz
 o7A126nByxdNISi8h+E+zWOm9793n3GVrtHQdVU8dYv2jV/3Fc7DRQKVVq2vL+1l0S5WskaI
 VYV8ywihaI181CvT9+7VBq9yFaGtx8EUsdUVeY65QyXzKPRywuCGi4YQzVBAPQ5vck5QC0C2
 EKLns/yGHpkt7j9YWic/bedtz/0ITUPIW4PTSsFSxYV7d7+po06khPISJBkCqHdptrtFDf9x
 jqHoCQzi/AYitQG/6G65kzcxTW0q57ESwQ46gnaUiSi9AwRTIe/bIyh71Gd9fFEJYOBR12Fv
 VAbms6S9uEQAIvLnyuIKNjhB5mz7PqDdTmZill1Etx5rnKm+mWoesZb5zQWyFpVD/vosATBO
 Cf70T69LrcKVJd2Rcebu76MNvk=
IronPort-HdrOrdr: A9a23:ZOo9pKNucRf7NcBcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: 9a23:DAKzGW0se/Ut0gGJ9zro37xfIuA4TXaD4ibqCGi6U0w3GJ6nc37L5/Yx
X-Talos-MUID: 9a23:S5hf9gYiBBCSP+BTvWHpuXZibPpTxqWnT2IQoKdF5fSKDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,185,1787011200"; 
   d="scan'208";a="542450529"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Oct 2026 05:02:46 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id EF693180001D7;
	Fri, 30 Oct 2026 05:02:45 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9B2BFCBF201; Thu, 29 Oct 2026 22:02:45 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Archana Polampalli <archana.polampalli@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [OE-core][scarthgap][PATCH 1/1] rsync: upgrade 3.2.7 -> 3.5.1
Date: Thu, 29 Oct 2026 22:02:43 -0700
Message-Id: <20261030050243.1395053-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261030050243.1395053-1-dkelaiya@cisco.com>
References: <20261030050243.1395053-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 05:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248984
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Consolidate six OE-Core master upgrades into one Scarthgap backport
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
- Upgrade directly from Scarthgap's 3.2.7 recipe to 3.5.1, folding the
  intermediate version updates and source patch refreshes together.
- Remove all fourteen existing CVE patches because their fixes are
  included in the release sources. These cover CVE-2024-12084,
  CVE-2024-12085, CVE-2024-12086, CVE-2024-12087, CVE-2024-12088,
  CVE-2024-12747, CVE-2025-10158 and CVE-2026-41035.
- Retain Scarthgap's WORKDIR-based installation and build
  configuration.
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
- Wang Mingyu: 3.2.7 -> 3.3.0.
- Archana Polampalli: 3.3.0 -> 3.4.1.
- Richard Purdie: 3.4.1 -> 3.4.2 and 3.4.2 -> 3.4.4.
- Jaipaul Cheernam: 3.4.4 -> 3.5.0 and 3.5.0 -> 3.5.1.

[1] https://lists.openembedded.org/g/openembedded-core/message/248203
[2] https://download.samba.org/pub/rsync/NEWS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
(cherry picked from commit 2c3b75a1f3b6d3177603b8982d61c5b8ba73aef0)
(cherry picked from commit 25e139d8b2a52c85cf1353c8da246aedaedb40d1)
(cherry picked from commit 7ae818a6c3635bff7701c339174b6d281a507462)
(cherry picked from commit 3f583855eece3b022dec3703e6622eedac0159e9)
(cherry picked from commit 5a5de1c212718d3918dfbe9b6ab770dd76316d6f)
(cherry picked from commit 6367a867b6a6079bf83eeffcc8bca5f5ec22b7ab)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...-prototypes-to-function-declarations.patch | 126 ++----------
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 --------------
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 ----
 .../rsync/files/CVE-2024-12085.patch          |  32 ---
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 ----
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ----------
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 ----
 .../rsync/files/CVE-2024-12087-0001.patch     |  49 -----
 .../rsync/files/CVE-2024-12087-0002.patch     |  31 ---
 .../rsync/files/CVE-2024-12087-0003.patch     |  40 ----
 .../rsync/files/CVE-2024-12088.patch          | 141 -------------
 .../rsync/files/CVE-2024-12747.patch          | 192 ------------------
 .../rsync/files/CVE-2025-10158.patch          |  36 ----
 .../rsync/files/CVE-2026-41035.patch          |  39 ----
 .../rsync/files/determism.patch               |  20 +-
 .../rsync/files/makefile-no-rebuild.patch     |  11 +-
 .../rsync/{rsync_3.2.7.bb => rsync_3.5.1.bb}  |  17 +-
 18 files changed, 37 insertions(+), 1195 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.7.bb => rsync_3.5.1.bb} (79%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index 8895adad749..1f1fc3f3b3e 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From 651425fced0691d9063fe417388ba6ca1c38c40b Mon Sep 17 00:00:00 2001
+From 56a785a7d964f797a786b2d5b75d9cee51b530b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -15,25 +15,19 @@ Fixes errors like
 
 Upstream-Status: Submitted [https://lists.samba.org/archive/rsync/2022-August/032858.html]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- checksum.c       | 2 +-
- exclude.c        | 2 +-
- hlink.c          | 3 +--
- lib/pool_alloc.c | 2 +-
- log.c            | 2 +-
- main.c           | 2 +-
- syscall.c        | 4 ++--
- zlib/crc32.c     | 2 +-
- zlib/trees.c     | 2 +-
- zlib/zutil.c     | 4 ++--
- 10 files changed, 12 insertions(+), 13 deletions(-)
+ checksum.c | 2 +-
+ exclude.c  | 2 +-
+ log.c      | 2 +-
+ main.c     | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 60de365..67a9e16 100644
+index 4c91c2b..b3635a0 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -796,7 +796,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -43,10 +37,10 @@ index 60de365..67a9e16 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index ffe55b1..a85ea76 100644
+index 7476f6a..b939a0c 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -460,7 +460,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -55,38 +49,11 @@ index ffe55b1..a85ea76 100644
  {
  	if (partial_string_buf) {
  		if (partial_string_len)
-diff --git a/hlink.c b/hlink.c
-index 20291f2..5c26a6b 100644
---- a/hlink.c
-+++ b/hlink.c
-@@ -117,8 +117,7 @@ static void match_gnums(int32 *ndx_list, int ndx_count)
- 	struct ht_int32_node *node = NULL;
- 	int32 gnum, gnum_next;
- 
--	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)()) hlink_compare_gnum);
--
-+	qsort(ndx_list, ndx_count, sizeof ndx_list[0], (int (*)(const void *, const void *)) hlink_compare_gnum);
- 	for (from = 0; from < ndx_count; from++) {
- 		file = hlink_flist->sorted[ndx_list[from]];
- 		gnum = F_HL_GNUM(file);
-diff --git a/lib/pool_alloc.c b/lib/pool_alloc.c
-index a1a7245..4eae062 100644
---- a/lib/pool_alloc.c
-+++ b/lib/pool_alloc.c
-@@ -9,7 +9,7 @@ struct alloc_pool
- 	size_t			size;		/* extent size		*/
- 	size_t			quantum;	/* allocation quantum	*/
- 	struct pool_extent	*extents;	/* top extent is "live" */
--	void			(*bomb)();	/* called if malloc fails */
-+	void			(*bomb)(const char *, const char *, int);	/* called if malloc fails */
- 	int			flags;
- 
- 	/* statistical data */
 diff --git a/log.c b/log.c
-index e4ba1cc..8482b71 100644
+index 889b57b..19e5e98 100644
 --- a/log.c
 +++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
  	}
  }
  
@@ -96,11 +63,11 @@ index e4ba1cc..8482b71 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index d2a7b9b..c50af45 100644
+index ed6e554..b5f9448 100644
 --- a/main.c
 +++ b/main.c
-@@ -244,7 +244,7 @@ void read_del_stats(int f)
- 	stats.deleted_files += stats.deleted_specials = read_varint(f);
+@@ -250,7 +250,7 @@ void read_del_stats(int f)
+ 	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
 -static void become_copy_as_user()
@@ -108,64 +75,3 @@ index d2a7b9b..c50af45 100644
  {
  	char *gname;
  	uid_t uid;
-diff --git a/syscall.c b/syscall.c
-index d92074a..92ca86d 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -389,9 +389,9 @@ OFF_T do_lseek(int fd, OFF_T offset, int whence)
- {
- #ifdef HAVE_LSEEK64
- #if !SIZEOF_OFF64_T
--	OFF_T lseek64();
-+	OFF_T lseek64(int fd, OFF_T offset, int whence);
- #else
--	off64_t lseek64();
-+	off64_t lseek64(int fd, off64_t offset, int whence);
- #endif
- 	return lseek64(fd, offset, whence);
- #else
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
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
deleted file mode 100644
index d654067fab5..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
+++ /dev/null
@@ -1,156 +0,0 @@
-From 0902b52f6687b1f7952422080d50b93108742e53 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 29 Oct 2024 22:55:29 -0700
-Subject: [PATCH] Some checksum buffer fixes.
-
-- Put sum2_array into sum_struct to hold an array of sum2 checksums
-  that are each xfer_sum_len bytes.
-- Remove sum2 buf from sum_buf.
-- Add macro sum2_at() to access each sum2 array element.
-- Throw an error if a sums header has an s2length larger than
-  xfer_sum_len.
-
-CVE: CVE-2024-12084
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0902b52f6687b1f7952422080d50b93108742e53]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- io.c     | 3 ++-
- match.c  | 8 ++++----
- rsync.c  | 5 ++++-
- rsync.h  | 4 +++-
- sender.c | 4 +++-
- 5 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/io.c b/io.c
-index a99ac0ec..bb60eeca 100644
---- a/io.c
-+++ b/io.c
-@@ -55,6 +55,7 @@ extern int read_batch;
- extern int compat_flags;
- extern int protect_args;
- extern int checksum_seed;
-+extern int xfer_sum_len;
- extern int daemon_connection;
- extern int protocol_version;
- extern int remove_source_files;
-@@ -1977,7 +1978,7 @@ void read_sum_head(int f, struct sum_struct *sum)
-		exit_cleanup(RERR_PROTOCOL);
-	}
-	sum->s2length = protocol_version < 27 ? csum_length : (int)read_int(f);
--	if (sum->s2length < 0 || sum->s2length > MAX_DIGEST_LEN) {
-+	if (sum->s2length < 0 || sum->s2length > xfer_sum_len) {
-		rprintf(FERROR, "Invalid checksum length %d [%s]\n",
-			sum->s2length, who_am_i());
-		exit_cleanup(RERR_PROTOCOL);
-diff --git a/match.c b/match.c
-index cdb30a15..36e78ed2 100644
---- a/match.c
-+++ b/match.c
-@@ -232,7 +232,7 @@ static void hash_search(int f,struct sum_struct *s,
-				done_csum2 = 1;
-			}
-
--			if (memcmp(sum2,s->sums[i].sum2,s->s2length) != 0) {
-+			if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0) {
-				false_alarms++;
-				continue;
-			}
-@@ -252,7 +252,7 @@ static void hash_search(int f,struct sum_struct *s,
-					if (i != aligned_i) {
-						if (sum != s->sums[aligned_i].sum1
-						 || l != s->sums[aligned_i].len
--						 || memcmp(sum2, s->sums[aligned_i].sum2, s->s2length) != 0)
-+						 || memcmp(sum2, sum2_at(s, aligned_i), s->s2length) != 0)
-							goto check_want_i;
-						i = aligned_i;
-					}
-@@ -271,7 +271,7 @@ static void hash_search(int f,struct sum_struct *s,
-						if (sum != s->sums[i].sum1)
-							goto check_want_i;
-						get_checksum2((char *)map, l, sum2);
--						if (memcmp(sum2, s->sums[i].sum2, s->s2length) != 0)
-+						if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0)
-							goto check_want_i;
-						/* OK, we have a re-alignment match.  Bump the offset
-						 * forward to the new match point. */
-@@ -290,7 +290,7 @@ static void hash_search(int f,struct sum_struct *s,
-			 && (!updating_basis_file || s->sums[want_i].offset >= offset
-			  || s->sums[want_i].flags & SUMFLG_SAME_OFFSET)
-			 && sum == s->sums[want_i].sum1
--			 && memcmp(sum2, s->sums[want_i].sum2, s->s2length) == 0) {
-+			 && memcmp(sum2, sum2_at(s, want_i), s->s2length) == 0) {
-				/* we've found an adjacent match - the RLL coder
-				 * will be happy */
-				i = want_i;
-diff --git a/rsync.c b/rsync.c
-index cd288f57..b130aba5 100644
---- a/rsync.c
-+++ b/rsync.c
-@@ -437,7 +437,10 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr, cha
-   */
- void free_sums(struct sum_struct *s)
- {
--	if (s->sums) free(s->sums);
-+	if (s->sums) {
-+		free(s->sums);
-+		free(s->sum2_array);
-+	}
-	free(s);
- }
-
-diff --git a/rsync.h b/rsync.h
-index d3709fe0..8ddbe702 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -958,12 +958,12 @@ struct sum_buf {
-	uint32 sum1;	        /**< simple checksum */
-	int32 chain;		/**< next hash-table collision */
-	short flags;		/**< flag bits */
--	char sum2[SUM_LENGTH];	/**< checksum  */
- };
-
- struct sum_struct {
-	OFF_T flength;		/**< total file length */
-	struct sum_buf *sums;	/**< points to info for each chunk */
-+	char *sum2_array;	/**< checksums of length xfer_sum_len */
-	int32 count;		/**< how many chunks */
-	int32 blength;		/**< block_length */
-	int32 remainder;	/**< flength % block_length */
-@@ -982,6 +982,8 @@ struct map_struct {
-	int status;		/* first errno from read errors		*/
- };
-
-+#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
-+
- #define NAME_IS_FILE		(0)    /* filter name as a file */
- #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
- #define NAME_IS_XATTR		(1<<2) /* filter name as an xattr */
-diff --git a/sender.c b/sender.c
-index 3d4f052e..ab205341 100644
---- a/sender.c
-+++ b/sender.c
-@@ -31,6 +31,7 @@ extern int log_before_transfer;
- extern int stdout_format_has_i;
- extern int logfile_format_has_i;
- extern int want_xattr_optim;
-+extern int xfer_sum_len;
- extern int csum_length;
- extern int append_mode;
- extern int copy_links;
-@@ -94,10 +95,11 @@ static struct sum_struct *receive_sums(int f)
-		return(s);
-
-	s->sums = new_array(struct sum_buf, s->count);
-+	s->sum2_array = new_array(char, s->count * xfer_sum_len);
-
-	for (i = 0; i < s->count; i++) {
-		s->sums[i].sum1 = read_int(f);
--		read_buf(f, s->sums[i].sum2, s->s2length);
-+		read_buf(f, sum2_at(s, i), s->s2length);
-
-		s->sums[i].offset = offset;
-		s->sums[i].flags = 0;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
deleted file mode 100644
index 266b80c2411..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 5 Nov 2024 11:01:03 -0800
-Subject: [PATCH] Another cast when multiplying integers.
-
-CVE: CVE-2024-12084
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- rsync.h  | 2 +-
- sender.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/rsync.h b/rsync.h
-index 8ddbe702..0f9e277f 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -982,7 +982,7 @@ struct map_struct {
-	int status;		/* first errno from read errors		*/
- };
-
--#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
-+#define sum2_at(s, i)	((s)->sum2_array + ((size_t)(i) * xfer_sum_len))
-
- #define NAME_IS_FILE		(0)    /* filter name as a file */
- #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
-diff --git a/sender.c b/sender.c
-index ab205341..2bbff2fa 100644
---- a/sender.c
-+++ b/sender.c
-@@ -95,7 +95,7 @@ static struct sum_struct *receive_sums(int f)
-		return(s);
-
-	s->sums = new_array(struct sum_buf, s->count);
--	s->sum2_array = new_array(char, s->count * xfer_sum_len);
-+	s->sum2_array = new_array(char, (size_t)s->count * xfer_sum_len);
-
-	for (i = 0; i < s->count; i++) {
-		s->sums[i].sum1 = read_int(f);
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
deleted file mode 100644
index 165d5a62f95..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 589b0691e59f761ccb05ddb8e1124991440db2c7 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Thu, 14 Nov 2024 09:57:08 +1100
-Subject: [PATCH] prevent information leak off the stack
-
-prevent leak of uninitialised stack data in hash_search
-
-CVE: CVE-2024-12085
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=589b0691e59f761ccb05ddb8e1124991440db2c7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- match.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/match.c b/match.c
-index 36e78ed2..dfd6af2c 100644
---- a/match.c
-+++ b/match.c
-@@ -147,6 +147,9 @@ static void hash_search(int f,struct sum_struct *s,
-	int more;
-	schar *map;
-
-+	// prevent possible memory leaks
-+	memset(sum2, 0, sizeof sum2);
-+
-	/* want_i is used to encourage adjacent matches, allowing the RLL
-	 * coding of the output to work more efficiently. */
-	want_i = 0;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
deleted file mode 100644
index 958a25a37b6..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8ad4b5d912fad1df29717dddaa775724da77d299 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 11:08:03 +1100
-Subject: [PATCH] refuse fuzzy options when fuzzy not selected
-
-this prevents a malicious server providing a file to compare to when
-the user has not given the fuzzy option
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=8ad4b5d912fad1df29717dddaa775724da77d299]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- receiver.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/receiver.c b/receiver.c
-index 6b4b369e..2d7f6033 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -66,6 +66,7 @@ extern char sender_file_sum[MAX_DIGEST_LEN];
- extern struct file_list *cur_flist, *first_flist, *dir_flist;
- extern filter_rule_list daemon_filter_list;
- extern OFF_T preallocated_len;
-+extern int fuzzy_basis;
-
- extern struct name_num_item *xfer_sum_nni;
- extern int xfer_sum_len;
-@@ -716,6 +717,10 @@ int recv_files(int f_in, int f_out, char *local_name)
-				fnamecmp = get_backup_name(fname);
-				break;
-			case FNAMECMP_FUZZY:
-+				if (fuzzy_basis == 0) {
-+					rprintf(FERROR_XFER, "rsync: refusing malicious fuzzy operation for %s\n", xname);
-+					exit_cleanup(RERR_PROTOCOL);
-+				}
-				if (file->dirname) {
-					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
-					fnamecmp = fnamecmpbuf;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
deleted file mode 100644
index 5d25f12dd8b..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 12:26:10 +1100
-Subject: [PATCH] added secure_relative_open()
-
-this is an open that enforces no symlink following for all path
-components in a relative path
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- syscall.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 74 insertions(+)
-
-diff --git a/syscall.c b/syscall.c
-index b4b0f1f1..cffc814b 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -33,6 +33,8 @@
- #include <sys/syscall.h>
- #endif
-
-+#include "ifuncs.h"
-+
- extern int dry_run;
- extern int am_root;
- extern int am_sender;
-@@ -707,3 +709,75 @@ int do_open_nofollow(const char *pathname, int flags)
-
-	return fd;
- }
-+
-+/*
-+  open a file relative to a base directory. The basedir can be NULL,
-+  in which case the current working directory is used. The relpath
-+  must be a relative path, and the relpath must not contain any
-+  elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
-+  applies to all path components, not just the last component)
-+*/
-+int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
-+{
-+	if (!relpath || relpath[0] == '/') {
-+		// must be a relative path
-+		errno = EINVAL;
-+		return -1;
-+	}
-+
-+#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
-+	// really old system, all we can do is live with the risks
-+	if (!basedir) {
-+		return open(relpath, flags, mode);
-+	}
-+	char fullpath[MAXPATHLEN];
-+	pathjoin(fullpath, sizeof fullpath, basedir, relpath);
-+	return open(fullpath, flags, mode);
-+#else
-+	int dirfd = AT_FDCWD;
-+	if (basedir != NULL) {
-+		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
-+		if (dirfd == -1) {
-+			return -1;
-+		}
-+	}
-+	int retfd = -1;
-+
-+	char *path_copy = my_strdup(relpath, __FILE__, __LINE__);
-+	if (!path_copy) {
-+		return -1;
-+	}
-+
-+	for (const char *part = strtok(path_copy, "/");
-+	     part != NULL;
-+	     part = strtok(NULL, "/"))
-+	{
-+		int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
-+		if (next_fd == -1 && errno == ENOTDIR) {
-+			if (strtok(NULL, "/") != NULL) {
-+				// this is not the last component of the path
-+				errno = ELOOP;
-+				goto cleanup;
-+			}
-+			// this could be the last component of the path, try as a file
-+			retfd = openat(dirfd, part, flags | O_NOFOLLOW, mode);
-+			goto cleanup;
-+		}
-+		if (next_fd == -1) {
-+			goto cleanup;
-+		}
-+		if (dirfd != AT_FDCWD) close(dirfd);
-+		dirfd = next_fd;
-+	}
-+
-+	// the path must be a directory
-+	errno = EINVAL;
-+
-+cleanup:
-+	free(path_copy);
-+	if (dirfd != AT_FDCWD) {
-+		close(dirfd);
-+	}
-+	return retfd;
-+#endif // O_NOFOLLOW, O_DIRECTORY
-+}
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
deleted file mode 100644
index de1747adf27..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From c35e28331f10ba6eba370611abd78bde32d54da7 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 12:28:13 +1100
-Subject: [PATCH] receiver: use secure_relative_open() for basis file
-
-this prevents attacks where the basis file is manipulated by a
-malicious sender to gain information about files outside the
-destination tree
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c35e28331f10ba6eba370611abd78bde32d54da7]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- receiver.c | 42 ++++++++++++++++++++++++++----------------
- 1 file changed, 26 insertions(+), 16 deletions(-)
-
-diff --git a/receiver.c b/receiver.c
-index 2d7f6033..8031b8f4 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -552,6 +552,8 @@ int recv_files(int f_in, int f_out, char *local_name)
-	progress_init();
-
-	while (1) {
-+		const char *basedir = NULL;
-+
-		cleanup_disable();
-
-		/* This call also sets cur_flist. */
-@@ -722,27 +724,29 @@ int recv_files(int f_in, int f_out, char *local_name)
-					exit_cleanup(RERR_PROTOCOL);
-				}
-				if (file->dirname) {
--					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
--					fnamecmp = fnamecmpbuf;
--				} else
--					fnamecmp = xname;
-+					basedir = file->dirname;
-+				}
-+				fnamecmp = xname;
-				break;
-			default:
-				if (fnamecmp_type > FNAMECMP_FUZZY && fnamecmp_type-FNAMECMP_FUZZY <= basis_dir_cnt) {
-					fnamecmp_type -= FNAMECMP_FUZZY + 1;
-					if (file->dirname) {
--						stringjoin(fnamecmpbuf, sizeof fnamecmpbuf,
--							   basis_dir[fnamecmp_type], "/", file->dirname, "/", xname, NULL);
--					} else
--						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], xname);
-+						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], file->dirname);
-+						basedir = fnamecmpbuf;
-+					} else {
-+						basedir = basis_dir[fnamecmp_type];
-+					}
-+					fnamecmp = xname;
-				} else if (fnamecmp_type >= basis_dir_cnt) {
-					rprintf(FERROR,
-						"invalid basis_dir index: %d.\n",
-						fnamecmp_type);
-					exit_cleanup(RERR_PROTOCOL);
--				} else
--					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], fname);
--				fnamecmp = fnamecmpbuf;
-+				} else {
-+					basedir = basis_dir[fnamecmp_type];
-+					fnamecmp = fname;
-+				}
-				break;
-			}
-			if (!fnamecmp || (daemon_filter_list.head
-@@ -765,7 +769,7 @@ int recv_files(int f_in, int f_out, char *local_name)
-		}
-
-		/* open the file */
--		fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+		fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
-
-		if (fd1 == -1 && protocol_version < 29) {
-			if (fnamecmp != fname) {
-@@ -776,14 +780,20 @@ int recv_files(int f_in, int f_out, char *local_name)
-
-			if (fd1 == -1 && basis_dir[0]) {
-				/* pre-29 allowed only one alternate basis */
--				pathjoin(fnamecmpbuf, sizeof fnamecmpbuf,
--					 basis_dir[0], fname);
--				fnamecmp = fnamecmpbuf;
-+				basedir = basis_dir[0];
-+				fnamecmp = fname;
-				fnamecmp_type = FNAMECMP_BASIS_DIR_LOW;
--				fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+				fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
-			}
-		}
-
-+		if (basedir) {
-+			// for the following code we need the full
-+			// path name as a single string
-+			pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basedir, fnamecmp);
-+			fnamecmp = fnamecmpbuf;
-+		}
-+
-		one_inplace = inplace_partial && fnamecmp_type == FNAMECMP_PARTIAL_DIR;
-		updating_basis_or_equiv = one_inplace
-		    || (inplace && (fnamecmp == fname || fnamecmp_type == FNAMECMP_BACKUP));
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
deleted file mode 100644
index b85e1dfae4c..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9f86ddc9652247233f32b241a79d5aa4fb9d4afa Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Tue, 26 Nov 2024 09:16:31 +1100
-Subject: [PATCH] disallow ../ elements in relpath for secure_relative_open
-
-CVE: CVE-2024-12086
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=9f86ddc9652247233f32b241a79d5aa4fb9d4afa]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- syscall.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/syscall.c b/syscall.c
-index cffc814b..081357bb 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -716,6 +716,8 @@ int do_open_nofollow(const char *pathname, int flags)
-   must be a relative path, and the relpath must not contain any
-   elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
-   applies to all path components, not just the last component)
-+
-+  The relpath must also not contain any ../ elements in the path
- */
- int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
- {
-@@ -724,6 +726,11 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
-		errno = EINVAL;
-		return -1;
-	}
-+	if (strncmp(relpath, "../", 3) == 0 || strstr(relpath, "/../")) {
-+		// no ../ elements allowed in the relpath
-+		errno = EINVAL;
-+		return -1;
-+	}
-
- #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
-	// really old system, all we can do is live with the risks
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
deleted file mode 100644
index 67abc64a626..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 688f5c379a433038bde36897a156d589be373a98 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Thu, 14 Nov 2024 15:46:50 -0800
-Subject: [PATCH] Refuse a duplicate dirlist.
-
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=688f5c379a433038bde36897a156d589be373a98]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- flist.c | 9 +++++++++
- rsync.h | 1 +
- 2 files changed, 10 insertions(+)
-
-diff --git a/flist.c b/flist.c
-index 464d556e..847b1054 100644
---- a/flist.c
-+++ b/flist.c
-@@ -2584,6 +2584,15 @@ struct file_list *recv_file_list(int f, int dir_ndx)
-		init_hard_links();
- #endif
-
-+	if (inc_recurse && dir_ndx >= 0) {
-+		struct file_struct *file = dir_flist->files[dir_ndx];
-+		if (file->flags & FLAG_GOT_DIR_FLIST) {
-+			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
-+			exit_cleanup(RERR_PROTOCOL);
-+		}
-+		file->flags |= FLAG_GOT_DIR_FLIST;
-+	}
-+
-	flist = flist_new(0, "recv_file_list");
-	flist_expand(flist, FLIST_START_LARGE);
-
-diff --git a/rsync.h b/rsync.h
-index 0f9e277f..b9a7101a 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -84,6 +84,7 @@
- #define FLAG_DUPLICATE (1<<4)	/* sender */
- #define FLAG_MISSING_DIR (1<<4)	/* generator */
- #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
-+#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
- #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
- #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
- #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
deleted file mode 100644
index 8a22e0c371e..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 344327385fa47fa5bb67a32c237735e6240cfb93 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Tue, 26 Nov 2024 16:12:45 +1100
-Subject: [PATCH] range check dir_ndx before use
-
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=344327385fa47fa5bb67a32c237735e6240cfb93]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- flist.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/flist.c b/flist.c
-index 847b1054..087f9da6 100644
---- a/flist.c
-+++ b/flist.c
-@@ -2585,6 +2585,10 @@ struct file_list *recv_file_list(int f, int dir_ndx)
- #endif
-
-	if (inc_recurse && dir_ndx >= 0) {
-+		if (dir_ndx >= dir_flist->used) {
-+			rprintf(FERROR_XFER, "rsync: refusing invalid dir_ndx %u >= %u\n", dir_ndx, dir_flist->used);
-+			exit_cleanup(RERR_PROTOCOL);
-+		}
-		struct file_struct *file = dir_flist->files[dir_ndx];
-		if (file->flags & FLAG_GOT_DIR_FLIST) {
-			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
deleted file mode 100644
index 0ece69c4e75..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 996af4a79f9afe4d7158ecdd87c78cee382c6b39 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 15 Jan 2025 15:10:24 +0100
-Subject: [PATCH] Fix FLAG_GOT_DIR_FLIST collission with FLAG_HLINKED
-
-fixes commit 688f5c379a43 (Refuse a duplicate dirlist.)
-
-Fixes: https://github.com/RsyncProject/rsync/issues/702
-Fixes: https://github.com/RsyncProject/rsync/issues/697
-CVE: CVE-2024-12087
-
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/996af4a79f9afe4d7158ecdd87c78cee382c6b39]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- rsync.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsync.h b/rsync.h
-index 9be1297b..479ac484 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -84,7 +84,6 @@
- #define FLAG_DUPLICATE (1<<4)	/* sender */
- #define FLAG_MISSING_DIR (1<<4)	/* generator */
- #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
--#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
- #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
- #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
- #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
-@@ -93,6 +92,7 @@
- #define FLAG_SKIP_GROUP (1<<10)	/* receiver/generator */
- #define FLAG_TIME_FAILED (1<<11)/* generator */
- #define FLAG_MOD_NSEC (1<<12)	/* sender/receiver/generator */
-+#define FLAG_GOT_DIR_FLIST (1<<13)/* sender/receiver/generator - dir_flist only */
-
- /* These flags are passed to functions but not stored. */
-
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
deleted file mode 100644
index b2a3a86e1aa..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From 407c71c7ce562137230e8ba19149c81ccc47c387 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Nov 2024 15:15:53 +1100
-Subject: [PATCH] make --safe-links stricter
-
-when --safe-links is used also reject links where a '../' component is
-included in the destination as other than the leading part of the
-filename
-
-CVE: CVE-2024-12088
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=407c71c7ce562137230e8ba19149c81ccc47c387]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- testsuite/safe-links.test    | 55 ++++++++++++++++++++++++++++++++++++
- testsuite/unsafe-byname.test |  2 +-
- util1.c                      | 26 ++++++++++++++++-
- 3 files changed, 81 insertions(+), 2 deletions(-)
- create mode 100644 testsuite/safe-links.test
-
-diff --git a/testsuite/safe-links.test b/testsuite/safe-links.test
-new file mode 100644
-index 00000000..6e95a4b9
---- /dev/null
-+++ b/testsuite/safe-links.test
-@@ -0,0 +1,55 @@
-+#!/bin/sh
-+
-+. "$suitedir/rsync.fns"
-+
-+test_symlink() {
-+	is_a_link "$1" || test_fail "File $1 is not a symlink"
-+}
-+
-+test_regular() {
-+	if [ ! -f "$1" ]; then
-+		test_fail "File $1 is not regular file or not exists"
-+	fi
-+}
-+
-+test_notexist() {
-+        if [ -e "$1" ]; then
-+                test_fail "File $1 exists"
-+	fi
-+        if [ -h "$1" ]; then
-+                test_fail "File $1 exists as a symlink"
-+	fi
-+}
-+
-+cd "$tmpdir"
-+
-+mkdir from
-+
-+mkdir "from/safe"
-+mkdir "from/unsafe"
-+
-+mkdir "from/safe/files"
-+mkdir "from/safe/links"
-+
-+touch "from/safe/files/file1"
-+touch "from/safe/files/file2"
-+touch "from/unsafe/unsafefile"
-+
-+ln -s ../files/file1 "from/safe/links/"
-+ln -s ../files/file2 "from/safe/links/"
-+ln -s ../../unsafe/unsafefile "from/safe/links/"
-+ln -s a/a/a/../../../unsafe2 "from/safe/links/"
-+
-+#echo "LISTING FROM"
-+#ls -lR from
-+
-+echo "rsync with relative path and just -a"
-+$RSYNC -avv --safe-links from/safe/ to
-+
-+#echo "LISTING TO"
-+#ls -lR to
-+
-+test_symlink to/links/file1
-+test_symlink to/links/file2
-+test_notexist to/links/unsafefile
-+test_notexist to/links/unsafe2
-diff --git a/testsuite/unsafe-byname.test b/testsuite/unsafe-byname.test
-index 75e72014..d2e318ef 100644
---- a/testsuite/unsafe-byname.test
-+++ b/testsuite/unsafe-byname.test
-@@ -40,7 +40,7 @@ test_unsafe ..//../dest 		from/dir			unsafe
- test_unsafe ..				from/file			safe
- test_unsafe ../..			from/file			unsafe
- test_unsafe ..//..			from//file			unsafe
--test_unsafe dir/..			from				safe
-+test_unsafe dir/..			from				unsafe
- test_unsafe dir/../..			from				unsafe
- test_unsafe dir/..//..			from				unsafe
-
-diff --git a/util1.c b/util1.c
-index da50ff1e..f260d398 100644
---- a/util1.c
-+++ b/util1.c
-@@ -1318,7 +1318,14 @@ int handle_partial_dir(const char *fname, int create)
-  *
-  * "src" is the top source directory currently applicable at the level
-  * of the referenced symlink.  This is usually the symlink's full path
-- * (including its name), as referenced from the root of the transfer. */
-+ * (including its name), as referenced from the root of the transfer.
-+ *
-+ * NOTE: this also rejects dest names with a .. component in other
-+ * than the first component of the name ie. it rejects names such as
-+ * a/b/../x/y. This needs to be done as the leading subpaths 'a' or
-+ * 'b' could later be replaced with symlinks such as a link to '.'
-+ * resulting in the link being transferred now becoming unsafe
-+ */
- int unsafe_symlink(const char *dest, const char *src)
- {
-	const char *name, *slash;
-@@ -1328,6 +1335,23 @@ int unsafe_symlink(const char *dest, const char *src)
-	if (!dest || !*dest || *dest == '/')
-		return 1;
-
-+	// reject destinations with /../ in the name other than at the start of the name
-+	const char *dest2 = dest;
-+	while (strncmp(dest2, "../", 3) == 0) {
-+	    dest2 += 3;
-+	    while (*dest2 == '/') {
-+		// allow for ..//..///../foo
-+		dest2++;
-+	    }
-+	}
-+	if (strstr(dest2, "/../"))
-+	    return 1;
-+
-+	// reject if the destination ends in /..
-+	const size_t dlen = strlen(dest);
-+	if (dlen > 3 && strcmp(&dest[dlen-3], "/..") == 0)
-+	    return 1;
-+
-	/* find out what our safety margin is */
-	for (name = src; (slash = strchr(name, '/')) != 0; name = slash+1) {
-		/* ".." segment starts the count over.  "." segment is ignored. */
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
deleted file mode 100644
index b1dd0a03b9f..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 0590b09d9a34ae72741b91ec0708a820650198b0 Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Wed, 18 Dec 2024 08:59:42 +1100
-Subject: [PATCH] fixed symlink race condition in sender
-
-when we open a file that we don't expect to be a symlink use
-O_NOFOLLOW to prevent a race condition where an attacker could change
-a file between being a normal file and a symlink
-
-CVE: CVE-2024-12747
-
-Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0590b09d9a34ae72741b91ec0708a820650198b0]
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- checksum.c  |  2 +-
- flist.c     |  2 +-
- generator.c |  4 ++--
- receiver.c  |  2 +-
- sender.c    |  2 +-
- syscall.c   | 20 ++++++++++++++++++++
- t_unsafe.c  |  3 +++
- tls.c       |  3 +++
- trimslash.c |  2 ++
- util1.c     |  2 +-
- 10 files changed, 35 insertions(+), 7 deletions(-)
-
-diff --git a/checksum.c b/checksum.c
-index cb21882c..66e80896 100644
---- a/checksum.c
-+++ b/checksum.c
-@@ -406,7 +406,7 @@ void file_checksum(const char *fname, const STRUCT_STAT *st_p, char *sum)
-	int32 remainder;
-	int fd;
-
--	fd = do_open(fname, O_RDONLY, 0);
-+	fd = do_open_checklinks(fname);
-	if (fd == -1) {
-		memset(sum, 0, file_sum_len);
-		return;
-diff --git a/flist.c b/flist.c
-index 087f9da6..17832533 100644
---- a/flist.c
-+++ b/flist.c
-@@ -1390,7 +1390,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
-
-	if (copy_devices && am_sender && IS_DEVICE(st.st_mode)) {
-		if (st.st_size == 0) {
--			int fd = do_open(fname, O_RDONLY, 0);
-+			int fd = do_open_checklinks(fname);
-			if (fd >= 0) {
-				st.st_size = get_device_size(fd, fname);
-				close(fd);
-diff --git a/generator.c b/generator.c
-index 110db28f..3f13bb95 100644
---- a/generator.c
-+++ b/generator.c
-@@ -1798,7 +1798,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
-
-	if (write_devices && IS_DEVICE(sx.st.st_mode) && sx.st.st_size == 0) {
-		/* This early open into fd skips the regular open below. */
--		if ((fd = do_open(fnamecmp, O_RDONLY, 0)) >= 0)
-+		if ((fd = do_open_nofollow(fnamecmp, O_RDONLY)) >= 0)
-			real_sx.st.st_size = sx.st.st_size = get_device_size(fd, fnamecmp);
-	}
-
-@@ -1867,7 +1867,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
-	}
-
-	/* open the file */
--	if (fd < 0 && (fd = do_open(fnamecmp, O_RDONLY, 0)) < 0) {
-+	if (fd < 0 && (fd = do_open_checklinks(fnamecmp)) < 0) {
-		rsyserr(FERROR, errno, "failed to open %s, continuing",
-			full_fname(fnamecmp));
-	  pretend_missing:
-diff --git a/receiver.c b/receiver.c
-index 8031b8f4..edfbb210 100644
---- a/receiver.c
-+++ b/receiver.c
-@@ -775,7 +775,7 @@ int recv_files(int f_in, int f_out, char *local_name)
-			if (fnamecmp != fname) {
-				fnamecmp = fname;
-				fnamecmp_type = FNAMECMP_FNAME;
--				fd1 = do_open(fnamecmp, O_RDONLY, 0);
-+				fd1 = do_open_nofollow(fnamecmp, O_RDONLY);
-			}
-
-			if (fd1 == -1 && basis_dir[0]) {
-diff --git a/sender.c b/sender.c
-index 2bbff2fa..a4d46c39 100644
---- a/sender.c
-+++ b/sender.c
-@@ -350,7 +350,7 @@ void send_files(int f_in, int f_out)
-			exit_cleanup(RERR_PROTOCOL);
-		}
-
--		fd = do_open(fname, O_RDONLY, 0);
-+		fd = do_open_checklinks(fname);
-		if (fd == -1) {
-			if (errno == ENOENT) {
-				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
-diff --git a/syscall.c b/syscall.c
-index 081357bb..8cea2900 100644
---- a/syscall.c
-+++ b/syscall.c
-@@ -45,6 +45,8 @@ extern int preallocate_files;
- extern int preserve_perms;
- extern int preserve_executability;
- extern int open_noatime;
-+extern int copy_links;
-+extern int copy_unsafe_links;
-
- #ifndef S_BLKSIZE
- # if defined hpux || defined __hpux__ || defined __hpux
-@@ -788,3 +790,21 @@ cleanup:
-	return retfd;
- #endif // O_NOFOLLOW, O_DIRECTORY
- }
-+
-+/*
-+  varient of do_open/do_open_nofollow which does do_open() if the
-+  copy_links or copy_unsafe_links options are set and does
-+  do_open_nofollow() otherwise
-+
-+  This is used to prevent a race condition where an attacker could be
-+  switching a file between being a symlink and being a normal file
-+
-+  The open is always done with O_RDONLY flags
-+ */
-+int do_open_checklinks(const char *pathname)
-+{
-+	if (copy_links || copy_unsafe_links) {
-+		return do_open(pathname, O_RDONLY, 0);
-+	}
-+	return do_open_nofollow(pathname, O_RDONLY);
-+}
-diff --git a/t_unsafe.c b/t_unsafe.c
-index 010cac50..e10619a2 100644
---- a/t_unsafe.c
-+++ b/t_unsafe.c
-@@ -28,6 +28,9 @@ int am_root = 0;
- int am_sender = 1;
- int read_only = 0;
- int list_only = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-+
- short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
-
- int
-diff --git a/tls.c b/tls.c
-index e6b0708a..858f8f10 100644
---- a/tls.c
-+++ b/tls.c
-@@ -49,6 +49,9 @@ int list_only = 0;
- int link_times = 0;
- int link_owner = 0;
- int nsec_times = 0;
-+int safe_symlinks = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-
- #ifdef SUPPORT_XATTRS
-
-diff --git a/trimslash.c b/trimslash.c
-index 1ec928ca..f2774cd7 100644
---- a/trimslash.c
-+++ b/trimslash.c
-@@ -26,6 +26,8 @@ int am_root = 0;
- int am_sender = 1;
- int read_only = 1;
- int list_only = 0;
-+int copy_links = 0;
-+int copy_unsafe_links = 0;
-
- int
- main(int argc, char **argv)
-diff --git a/util1.c b/util1.c
-index f260d398..d84bc414 100644
---- a/util1.c
-+++ b/util1.c
-@@ -365,7 +365,7 @@ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
-	int len;   /* Number of bytes read into `buf'. */
-	OFF_T prealloc_len = 0, offset = 0;
-
--	if ((ifd = do_open(source, O_RDONLY, 0)) < 0) {
-+	if ((ifd = do_open_nofollow(source, O_RDONLY)) < 0) {
-		int save_errno = errno;
-		rsyserr(FERROR_XFER, errno, "open %s", full_fname(source));
-		errno = save_errno;
---
-2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
deleted file mode 100644
index a19cc15107c..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 797e17fc4a6f15e3b1756538a9f812b63942686f Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Sat, 23 Aug 2025 17:26:53 +1000
-Subject: [PATCH] fixed an invalid access to files array
-
-
-this was found by Calum Hutton from Rapid7. It is a real bug, but
-analysis shows it can't be leverged into an exploit. Worth fixing
-though.
-
-Many thanks to Calum and Rapid7 for finding and reporting this
-
-CVE: CVE-2025-10158
-Upstream-Status: Backport
-[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
-Signed-off-by: Adarsh Jagadish Kamini<adarsh.jagadish.kamini@est.tech>
----
- sender.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sender.c b/sender.c
-index 2bbff2fa..5528071e 100644
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
-2.44.1
-
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch b/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
deleted file mode 100644
index 66b1b936720..00000000000
--- a/meta/recipes-devtools/rsync/files/CVE-2026-41035.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c Mon Sep 17 00:00:00 2001
-From: Andrew Tridgell <andrew@tridgell.net>
-Date: Wed, 22 Apr 2026 09:57:45 +1000
-Subject: [PATCH] xattrs: fixed count in qsort
-
-this fixes the count passed to the sort of the xattr list. This issue
-was reported here:
-
-https://www.openwall.com/lists/oss-security/2026/04/16/2
-
-the bug is not exploitable due to the fork-per-connection design of
-rsync, the attack is the equivalent of the user closing the socket
-themselves.
-
-CVE: CVE-2026-41035
-Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/bb0a8118c2d2ab01140bac5e4e327e5e1ef90c9c]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- xattrs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xattrs.c b/xattrs.c
-index 26e50a6..65166ee 100644
---- a/xattrs.c
-+++ b/xattrs.c
-@@ -860,8 +860,8 @@ void receive_xattr(int f, struct file_struct *file)
- 		rxa->num = num;
- 	}
- 
--	if (need_sort && count > 1)
--		qsort(temp_xattr.items, count, sizeof (rsync_xa), rsync_xal_compare_names);
-+	if (need_sort && temp_xattr.count > 1)
-+		qsort(temp_xattr.items, temp_xattr.count, sizeof (rsync_xa), rsync_xal_compare_names);
- 
- 	ndx = rsync_xal_store(&temp_xattr); /* adds item to rsync_xal_l */
- 
--- 
-2.50.1
-
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index e3494fdded0..890275f6d7c 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,7 +1,12 @@
+From e784131e4ccbaf8ad7107d1f7a7f13da8c675827 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 21 Feb 2021 09:45:48 +0000
+Subject: [PATCH] rsync: Fix a file sorting determinism issue
+
 The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
 but the order depends on the locale settings, particularly whether
 "util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
-they sort one way, in C, they sort the other. The sorting order changes 
+they sort one way, in C, they sort the other. The sorting order changes
 the output binaries. The behaviour also changes dependning on whether
 SHELL (/bin/sh) is dash or bash.
 
@@ -15,12 +20,15 @@ Upstream-Status: Backport [ish, see below]
 After discussion upstream renamed util.c to util1.c which avoids the problem
 in a different way. This patch can be dropped when we upgrade to include:
 https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
+---
+ Makefile.in | 5 +++++
+ 1 file changed, 5 insertions(+)
 
-Index: rsync-3.2.3/Makefile.in
-===================================================================
---- rsync-3.2.3.orig/Makefile.in
-+++ rsync-3.2.3/Makefile.in
-@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
+diff --git a/Makefile.in b/Makefile.in
+index de24949..bb9bb27 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -28,6 +28,11 @@ MKDIR_P=@MKDIR_P@
  VPATH=$(srcdir)
  SHELL=/bin/sh
  
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 92ed1f4419b..59255d15e72 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 81700d1a0e51391028c761cc8ef1cd660084d114 Mon Sep 17 00:00:00 2001
+From 0e1f2aec0dbfc150013860b42b41645cebe236b7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -8,18 +8,17 @@ generally overcomplicated, and we ensure that autoreconf is invoked if required.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  Makefile.in | 54 -----------------------------------------------------
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3cde955..d963a70 100644
+index 716171d..de24949 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -190,60 +190,6 @@ gensend: gen
- 	fi
- 	rsync -aic $(GENFILES) git-version.h $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/ || true
+@@ -267,60 +267,6 @@ conf: configure.sh config.h.in
+ .PHONY: gen
+ gen: conf proto.h man git-version.h
  
 -aclocal.m4: $(srcdir)/m4/*.m4
 -	aclocal -I $(srcdir)/m4
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
similarity index 79%
rename from meta/recipes-devtools/rsync/rsync_3.2.7.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.1.bb
index 2a1c3d9d56e..fe6b86e6a5e 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.1.bb
@@ -15,22 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
-           file://CVE-2024-12084-0001.patch \
-           file://CVE-2024-12084-0002.patch \
-           file://CVE-2024-12085.patch \
-           file://CVE-2024-12086-0001.patch \
-           file://CVE-2024-12086-0002.patch \
-           file://CVE-2024-12086-0003.patch \
-           file://CVE-2024-12086-0004.patch \
-           file://CVE-2024-12087-0001.patch \
-           file://CVE-2024-12087-0002.patch \
-           file://CVE-2024-12087-0003.patch \
-           file://CVE-2024-12088.patch \
-           file://CVE-2024-12747.patch \
-           file://CVE-2025-10158.patch \
-           file://CVE-2026-41035.patch \
            "
-SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
+SRC_URI[sha256sum] = "c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef"
 
 inherit autotools-brokensep
 
@@ -40,6 +26,7 @@ PACKAGECONFIG ??= "acl attr \
 
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
+PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn2"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-- 
2.35.6

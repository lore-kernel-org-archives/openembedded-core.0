Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36074.1795583576509514036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RzZy0i6a;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22960; q=dns/txt;
  s=iport01; t=1795583577; x=1796793177;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Vpaobjtl18lfZOw6gtDfj6GP6NeEpAr383UObPLKzQM=;
  b=RzZy0i6a6or/eY+XizbAnUhwU5/Yg6XeylaSUr0znIVT58GJG7BY9Shw
   +FU55Pp66WLiAiQ94o07epDHO4L/k+cj1cVi0TVp40C8rMKS2s/S2+/qM
   juA9IAy1NEBhBB3AG9AWn+XKpPrdaVd9DmP79rr0FkJ/oofqQgwb1FjLx
   XtYHSeXorI2FX7S1SuA/GHWmd84Ha9O3ZXJ5J3gsGurCBukp6jhem3kMo
   6qcs7ayCpPOpCUDI6tacSjJyhEPrI7ff4w0mlxYSXHUGL/H4/aE/DAX4X
   bH77PeQu7if1iFD0VBHTcqKdlCoM4j1H+bbbINmsvSHAM11fxRyH+1LfE
   A==;
X-CSE-ConnectionGUID: IaDDQ3stS3+SGE4Gxae08w==
X-CSE-MsgGUID: fO49JSbsQcaqQnoRu4xq1Q==
X-IPAS-Result: =?us-ascii?q?A0AnAACpbAZr/89K/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJjHKHOIIhA4tmkkOBfg8BAQEPRA0EAQGCEoJzAo4iAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAxoNCwEYASgVH?=
 =?us-ascii?q?AMBAi8gCyMIGYMCAYI6AzcCAREGuX2BeTOBAYMpAYFU2EwNgloBCxQBgTgBh?=
 =?us-ascii?q?UGDAIUlXRgBhH4nGxuBcoR/gQWBGkICgTiGbgSCIoEMgVQeMYxEAoFJiFJIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheI?=
 =?us-ascii?q?YEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaB?=
 =?us-ascii?q?WEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPm4Hl?=
 =?us-ascii?q?BOCMUoZBwEwShMBCiEXgQFrCBUMky4JATmPY4IhgTWeHk1xCiiDeYwkjz6Ff?=
 =?us-ascii?q?BozhASBV5JDklQLmH2OCoQKkgVChGqBaDyBWXAVgyIJShkPV41UAgELC4MCX?=
 =?us-ascii?q?oZQyAsjNQIBAQEGMgEBBwIHDgMLgWiEYYsgASYHgU8BAQ?=
IronPort-Data: A9a23:Pd3P9aDRyBAPiBVW/33iw5YqxClBgxIJ4kV8jS/XYbTApGgn0j0Dn
 DQaC2iEM6vbMTChfo90YNmz8ExXusCDyYBkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4vxCIHhtJpEjoaVMLkwS2
 uwRJWhdcUXW7w626OrTpuhEj8k5ac2uN4QFtzQ4k3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWUHgBfoO3WjPn8eE4o3huKhnFH0ciZTrxSeoq9fD237klQvieayb4G9ltqiS+IJz2Sjr
 Hn/9G3gOxcdDsHD2SPcyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnTjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:m8epVKxLnw03oGEHbDEzKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AnRAFEGrqgZpfmFXFDY0/gJDmUeEsXlHkl2zMGBT?=
 =?us-ascii?q?7MklEFJKFQFLIqLwxxg=3D=3D?=
X-Talos-MUID: 9a23:n00QOQunjfJHFDSh9M2nihY+ZeVT6b+XA0kUqJMBgdTYJTUpAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60616773"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:54 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id BFEA9180001DA
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:53 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 764DDCBF222; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 4/6] git: fix CVE-2026-111760
Date: Tue, 24 Nov 2026 21:12:44 -0800
Message-Id: <20261125051246.3108822-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125051246.3108822-1-asparmar@cisco.com>
References: <20261125051246.3108822-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251136
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-111760. The upstream fix merge is referenced in [1],
and the security release notes are referenced in [2]. Individual
fix links are recorded in the embedded patch headers.

[1] https://github.com/git/git/commit/74fe079482062f1df7c2b8dfa50950838d8fc19e
[2] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.50.2.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-111760_p1.patch          | 349 ++++++++++++++++++
 .../git/git/CVE-2026-111760_p2.patch          |  47 +++
 .../git/git/CVE-2026-111760_p3.patch          |  48 +++
 .../git/git/CVE-2026-111760_p4.patch          | 102 +++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   4 +
 5 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-111760_p1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-111760_p2.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-111760_p3.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-111760_p4.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-111760_p1.patch b/meta/recipes-devtools/git/git/CVE-2026-111760_p1.patch
new file mode 100644
index 0000000000..f4b1c4afb6
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-111760_p1.patch
@@ -0,0 +1,349 @@
+From d145010e6e2be3c8d73b5701f07b7af5ddf6b9ea Mon Sep 17 00:00:00 2001
+From: Elijah Newren <newren@gmail.com>
+Date: Fri, 16 Oct 2026 20:36:16 +0200
+Subject: [PATCH] read-cache: reject cache entries with over-long names
+
+We intermix size_t and unsigned int when dealing with cache entries.  A
+cache entry's name length is stored in the 32-bit ce_namelen field, but
+the length is computed as a size_t; for example, create_ce_entry() in
+unpack-trees.c derives it from traverse_path_len() while flattening a
+tree during checkout:
+
+   size_t len = traverse_path_len(...);        /* 64-bit, e.g. 2^32 + 4 */
+   ce = make_empty_cache_entry(istate, len);   /* ~4 GiB buffer */
+   ce->ce_namelen = len;                       /* truncates to N = 4 */
+   make_traverse_path(ce->name, len + 1, ...); /* writes 2^32 + 4 bytes */
+
+Consider crafted trees that build a path of the form
+
+   .gitz/z...z/z
+
+with 2^32 bytes following the ".git".  The full path is written into
+ce->name, but ce->ce_namelen wraps to (len % 2^32) = 4.  Our path-safety
+check,
+
+   verify_path_internal(ce->name, mode)
+
+walks the whole NUL-terminated name and finds nothing wrong with
+".gitz/z...z/z".  Yet when checkout_entry_ca() writes the entry to disk
+it uses
+
+   strbuf_add(&path, ce->name, ce_namelen(ce))
+
+which evaluates to
+
+   strbuf_add(&path, ".gitz/z...z/z", 4)
+
+A path that passed validation as ".gitz/z...z/z" is thus written as
+".git".  If the entry is a symlink, checking out such a tree tries to
+overwrite ".git" with a symlink pointing at a location that holds
+malicious hooks or config.  While cloning, git refuses to replace a
+".git" directory with a symlink, but a freshly cloned submodule's ".git"
+is a gitfile rather than a directory, so the symlink is written -- which
+can lead to arbitrary code execution if the symlinked directory has
+malicious hooks or config.
+
+Funnel every cache-entry allocation through a single check that refuses
+a name length larger than INT_MAX, and do so before allocating.  Widen
+the two strlen()-based helpers to size_t as well, so the length is not
+narrowed before the check runs.
+
+Additionally, reject paths longer than index.maxPathLen in
+verify_path_internal().  Default the limit to INT_MAX / 2 - 1024 to
+leave headroom for code that combines two path lengths.  Parse the
+configuration as unsigned and cap it at INT_MAX.
+
+Add a "test-tool cache-entry" helper that exercises the guard without
+having to materialize a multi-gigabyte name in memory, plus t1600 tests
+covering both the accepted and rejected cases.
+
+Add command-level tests for paths entering the index from both the
+filesystem and a tree, along with tests for invalid index.maxPathLen
+values.
+
+CVE: CVE-2026-111760
+Upstream-Status: Backport [https://github.com/git/git/commit/29411cf59fd417d8fce1be40ab2911e3e0885f26]
+
+Backport Changes:
+Place the unchanged index.maxpathlen configuration block in
+environment.c, where Git 2.53.0 defines git_default_config(). The
+original config.c hunk conflicts because the callback moved.
+
+Reported-by: Robert Chen <r@osec.io>
+Helped-by: Johannes Schindelin <Johannes.Schindelin@gmx.de>
+Helped-by: Jeff King <peff@peff.net>
+Co-authored-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Elijah Newren <newren@gmail.com>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ Documentation/config/index.adoc |  5 +++++
+ Makefile                        |  1 +
+ environment.c                   | 11 ++++++++++
+ environment.h                   |  1 +
+ read-cache.c                    | 17 +++++++++++++--
+ t/helper/meson.build            |  1 +
+ t/helper/test-cache-entry.c     | 35 +++++++++++++++++++++++++++++++
+ t/helper/test-tool.c            |  1 +
+ t/helper/test-tool.h            |  1 +
+ t/t1600-index.sh                | 37 +++++++++++++++++++++++++++++++++
+ 10 files changed, 108 insertions(+), 2 deletions(-)
+ create mode 100644 t/helper/test-cache-entry.c
+
+diff --git a/Documentation/config/index.adoc b/Documentation/config/index.adoc
+index 3eff4203..a23be914 100644
+--- a/Documentation/config/index.adoc
++++ b/Documentation/config/index.adoc
+@@ -1,3 +1,8 @@
++index.maxPathLen::
++	Specify the maximum length of a pathname that Git will add to
++	the index or check out. Longer pathnames are rejected. The default
++	is 1073740799 bytes, and values larger than 2147483647 are rejected.
++
+ index.recordEndOfIndexEntries::
+ 	Specifies whether the index file should include an "End Of Index
+ 	Entry" section. This reduces index load time on multiprocessor
+diff --git a/Makefile b/Makefile
+index 8aa489f3..cd111e2b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -804,6 +804,7 @@ TEST_BUILTINS_OBJS += test-advise.o
+ TEST_BUILTINS_OBJS += test-bitmap.o
+ TEST_BUILTINS_OBJS += test-bloom.o
+ TEST_BUILTINS_OBJS += test-bundle-uri.o
++TEST_BUILTINS_OBJS += test-cache-entry.o
+ TEST_BUILTINS_OBJS += test-cache-tree.o
+ TEST_BUILTINS_OBJS += test-chmtime.o
+ TEST_BUILTINS_OBJS += test-config.o
+diff --git a/environment.c b/environment.c
+index 8ffbf92d..290a1938 100644
+--- a/environment.c
++++ b/environment.c
+@@ -44,6 +44,7 @@ int trust_executable_bit = 1;
+ int trust_ctime = 1;
+ int check_stat = 1;
+ int has_symlinks = 1;
++unsigned int max_ce_namelen = INT_MAX / 2 - 1024;
+ int minimum_abbrev = 4, default_abbrev = -1;
+ int ignore_case;
+ int assume_unchanged;
+@@ -724,6 +725,16 @@ int git_default_config(const char *var, const char *value,
+ 	if (starts_with(var, "sparse."))
+ 		return git_default_sparse_config(var, value);
+ 
++	if (!strcmp(var, "index.maxpathlen")) {
++		unsigned long maxlen = git_config_ulong(var, value, ctx->kvi);
++
++		if (maxlen > INT_MAX)
++			return error(_("value for '%s' exceeds maximum of %d"),
++				     var, INT_MAX);
++		max_ce_namelen = maxlen;
++		return 0;
++	}
++
+ 	/* Add other config variables here and to Documentation/config.adoc. */
+ 	return 0;
+ }
+diff --git a/environment.h b/environment.h
+index 27f657af..8dc5b5ed 100644
+--- a/environment.h
++++ b/environment.h
+@@ -148,6 +148,7 @@ extern int trust_executable_bit;
+ extern int trust_ctime;
+ extern int check_stat;
+ extern int has_symlinks;
++extern unsigned int max_ce_namelen;
+ extern int minimum_abbrev, default_abbrev;
+ extern int ignore_case;
+ extern int assume_unchanged;
+diff --git a/read-cache.c b/read-cache.c
+index 0c07c3ae..8a198ba9 100644
+--- a/read-cache.c
++++ b/read-cache.c
+@@ -92,9 +92,17 @@ enum index_search_mode {
+ 	EXPAND_SPARSE = 1
+ };
+ 
++static inline void verify_ce_namelen(size_t len)
++{
++	if (len > INT_MAX)
++		die(_("index entry path is too long (%"PRIuMAX" bytes)"),
++		    (uintmax_t)len);
++}
++
+ static inline struct cache_entry *mem_pool__ce_alloc(struct mem_pool *mem_pool, size_t len)
+ {
+ 	struct cache_entry *ce;
++	verify_ce_namelen(len);
+ 	ce = mem_pool_alloc(mem_pool, cache_entry_size(len));
+ 	ce->mem_pool_allocated = 1;
+ 	return ce;
+@@ -103,6 +111,7 @@ static inline struct cache_entry *mem_pool__ce_alloc(struct mem_pool *mem_pool,
+ static inline struct cache_entry *mem_pool__ce_calloc(struct mem_pool *mem_pool, size_t len)
+ {
+ 	struct cache_entry * ce;
++	verify_ce_namelen(len);
+ 	ce = mem_pool_calloc(mem_pool, 1, cache_entry_size(len));
+ 	ce->mem_pool_allocated = 1;
+ 	return ce;
+@@ -821,6 +830,7 @@ struct cache_entry *make_empty_transient_cache_entry(size_t len,
+ {
+ 	if (ce_mem_pool)
+ 		return mem_pool__ce_calloc(ce_mem_pool, len);
++	verify_ce_namelen(len);
+ 	return xcalloc(1, cache_entry_size(len));
+ }
+ 
+@@ -845,7 +855,7 @@ struct cache_entry *make_cache_entry(struct index_state *istate,
+ 				     unsigned int refresh_options)
+ {
+ 	struct cache_entry *ce, *ret;
+-	int len;
++	size_t len;
+ 
+ 	if (verify_path_internal(path, mode) == PATH_INVALID) {
+ 		error(_("invalid path '%s'"), path);
+@@ -874,7 +884,7 @@ struct cache_entry *make_transient_cache_entry(unsigned int mode,
+ 					       struct mem_pool *ce_mem_pool)
+ {
+ 	struct cache_entry *ce;
+-	int len;
++	size_t len;
+ 
+ 	if (!verify_path(path, mode)) {
+ 		error(_("invalid path '%s'"), path);
+@@ -992,6 +1002,9 @@ static enum verify_path_result verify_path_internal(const char *path,
+ 	if (!is_valid_path(path))
+ 		return PATH_INVALID;
+ 
++	if (strlen(path) > max_ce_namelen)
++		return PATH_INVALID;
++
+ 	goto inside;
+ 	for (;;) {
+ 		if (!c)
+diff --git a/t/helper/meson.build b/t/helper/meson.build
+index 675e64c0..0e38ca3a 100644
+--- a/t/helper/meson.build
++++ b/t/helper/meson.build
+@@ -4,6 +4,7 @@ test_tool_sources = [
+   'test-bitmap.c',
+   'test-bloom.c',
+   'test-bundle-uri.c',
++  'test-cache-entry.c',
+   'test-cache-tree.c',
+   'test-chmtime.c',
+   'test-config.c',
+diff --git a/t/helper/test-cache-entry.c b/t/helper/test-cache-entry.c
+new file mode 100644
+index 00000000..65e0bb91
+--- /dev/null
++++ b/t/helper/test-cache-entry.c
+@@ -0,0 +1,35 @@
++#define USE_THE_REPOSITORY_VARIABLE
++#include "test-tool.h"
++#include "read-cache-ll.h"
++
++/*
++ * Exercise the cache-entry name-length guard without having to construct a
++ * multi-gigabyte pathname in memory.  make_empty_cache_entry()
++ * dies on any length that would not survive being stored in the 32-bit
++ * "ce_namelen" field, and it does so before allocating, so an out-of-range
++ * length is cheap to test.
++ */
++int cmd__cache_entry(int argc, const char **argv)
++{
++	size_t len;
++	char *end;
++	struct cache_entry *ce;
++
++	if (argc != 2)
++		die("usage: test-tool cache-entry <namelen>");
++
++	errno = 0;
++	len = strtoumax(argv[1], &end, 10);
++	if (errno || *end)
++		die("cannot parse namelen '%s'", argv[1]);
++
++	/* Dies here if 'len' is too large to be represented safely. */
++	ce = make_empty_cache_entry(the_repository->index, len);
++	if (!ce)
++		die("failed to create cache entry");
++
++	printf("ok: allocated cache entry for namelen %"PRIuMAX"\n",
++	       (uintmax_t)len);
++	discard_cache_entry(ce);
++	return 0;
++}
+diff --git a/t/helper/test-tool.c b/t/helper/test-tool.c
+index a7abc618..feb5b6f4 100644
+--- a/t/helper/test-tool.c
++++ b/t/helper/test-tool.c
+@@ -14,6 +14,7 @@ static struct test_cmd cmds[] = {
+ 	{ "bitmap", cmd__bitmap },
+ 	{ "bloom", cmd__bloom },
+ 	{ "bundle-uri", cmd__bundle_uri },
++	{ "cache-entry", cmd__cache_entry },
+ 	{ "cache-tree", cmd__cache_tree },
+ 	{ "chmtime", cmd__chmtime },
+ 	{ "config", cmd__config },
+diff --git a/t/helper/test-tool.h b/t/helper/test-tool.h
+index 7f150fa1..669c7bef 100644
+--- a/t/helper/test-tool.h
++++ b/t/helper/test-tool.h
+@@ -7,6 +7,7 @@ int cmd__advise_if_enabled(int argc, const char **argv);
+ int cmd__bitmap(int argc, const char **argv);
+ int cmd__bloom(int argc, const char **argv);
+ int cmd__bundle_uri(int argc, const char **argv);
++int cmd__cache_entry(int argc, const char **argv);
+ int cmd__cache_tree(int argc, const char **argv);
+ int cmd__chmtime(int argc, const char **argv);
+ int cmd__config(int argc, const char **argv);
+diff --git a/t/t1600-index.sh b/t/t1600-index.sh
+index 03239e9f..93305d45 100755
+--- a/t/t1600-index.sh
++++ b/t/t1600-index.sh
+@@ -122,6 +122,43 @@ test_index_version () {
+ 	)
+ }
+ 
++test_expect_success 'cache entry with a representable name length is accepted' '
++	test-tool cache-entry 100 >actual &&
++	test_grep "^ok: allocated cache entry for namelen 100" actual
++'
++
++test_expect_success SIZE_T_IS_64BIT \
++	'over-long cache entry name length is rejected rather than truncated' '
++	# 4294967296 == 2^32
++	test_must_fail test-tool cache-entry 4294967296 2>err &&
++	test_grep "index entry path is too long" err
++'
++
++test_expect_success 'path length enforced from filesystem to index' '
++	name=a-somewhat-long-path-name &&
++	echo foo >"$name" &&
++	test_must_fail git -c index.maxPathLen=10 add "$name" 2>err &&
++	test_grep "invalid path" err
++'
++
++test_expect_success 'path length enforced from tree to index' '
++	name=a-somewhat-long-path-name &&
++	echo foo >"$name" &&
++	git add "$name" &&
++	git commit -m long-path &&
++	test_when_finished "rm -rf long-clone.git" &&
++	test_must_fail git -c index.maxPathLen=10 clone . long-clone.git 2>err &&
++	test_grep "invalid path" err
++'
++
++test_expect_success 'index.maxPathLen rejects out-of-range values' '
++	test_must_fail git -c index.maxPathLen=-1 status 2>err &&
++	test_grep "bad numeric config value" err &&
++	test_must_fail git -c index.maxPathLen=2147483648 status 2>err &&
++	test_grep "exceeds maximum" err
++'
++
++# This must be the last test case because it deletes .git/config
+ test_expect_success 'index version config precedence' '
+ 	test_index_version 0 false 0 2 &&
+ 	test_index_version 2 false 0 2 &&
diff --git a/meta/recipes-devtools/git/git/CVE-2026-111760_p2.patch b/meta/recipes-devtools/git/git/CVE-2026-111760_p2.patch
new file mode 100644
index 0000000000..76c4fec69c
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-111760_p2.patch
@@ -0,0 +1,47 @@
+From 911c7c83ca72bbc9e4bacf32c18edbe65c101522 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Fri, 16 Oct 2026 20:36:17 +0200
+Subject: [PATCH] checkout: use size_t and st_add() for cache entry length in
+ update_some()
+
+In update_some(), the combined length of the base path and the pathname
+is computed as an int and then passed to make_empty_cache_entry().  For
+very long paths, this can truncate the result or overflow, causing us to
+allocate a smaller cache entry than needed and then copy more data than
+was allocated.
+
+Use size_t instead and compute the sum with st_add(), which catches
+overflow before it can lead to a heap overflow during checkout.
+
+CVE: CVE-2026-111760
+Upstream-Status: Backport [https://github.com/git/git/commit/fd48e6f35621ebd4657acb4a74d8638466a4dbbc]
+
+Assisted-by: Kimi-K2.7-Code
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ builtin/checkout.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/builtin/checkout.c b/builtin/checkout.c
+index 0ba4f03f..bd2a67d2 100644
+--- a/builtin/checkout.c
++++ b/builtin/checkout.c
+@@ -149,14 +149,14 @@ static int post_checkout_hook(struct commit *old_commit, struct commit *new_comm
+ static int update_some(const struct object_id *oid, struct strbuf *base,
+ 		       const char *pathname, unsigned mode, void *context UNUSED)
+ {
+-	int len;
++	size_t len;
+ 	struct cache_entry *ce;
+ 	int pos;
+ 
+ 	if (S_ISDIR(mode))
+ 		return READ_TREE_RECURSIVE;
+ 
+-	len = base->len + strlen(pathname);
++	len = st_add(base->len, strlen(pathname));
+ 	ce = make_empty_cache_entry(the_repository->index, len);
+ 	oidcpy(&ce->oid, oid);
+ 	memcpy(ce->name, base->buf, base->len);
diff --git a/meta/recipes-devtools/git/git/CVE-2026-111760_p3.patch b/meta/recipes-devtools/git/git/CVE-2026-111760_p3.patch
new file mode 100644
index 0000000000..11fd19d8d1
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-111760_p3.patch
@@ -0,0 +1,48 @@
+From 56064c42605275bed7d4101a42309413929cfd86 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Fri, 16 Oct 2026 20:36:18 +0200
+Subject: [PATCH] read-cache: use size_t and st_add() for cache entry size in
+ read_one_entry_opt()
+
+read_one_entry_opt() stores strlen(pathname) in a signed int, which can
+narrow or truncate the length.  The combined length passed to
+make_empty_cache_entry() can also overflow, and the signed type causes
+problems near the INT_MAX boundary.
+
+Switch to size_t and use st_add() when computing the allocation size,
+preventing truncation and signed overflow when reading tree entries with
+over-long basenames, such as those used by ls-files --with-tree and
+partial-commit overlays.
+
+CVE: CVE-2026-111760
+Upstream-Status: Backport [https://github.com/git/git/commit/df246839249110b852848db70501296d99bf1d7d]
+
+Assisted-by: Kimi-K2.7-Code
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ read-cache.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/read-cache.c b/read-cache.c
+index 8a198ba9..381ef3b2 100644
+--- a/read-cache.c
++++ b/read-cache.c
+@@ -3769,14 +3769,14 @@ static int read_one_entry_opt(struct index_state *istate,
+ 			      const char *pathname,
+ 			      unsigned mode, int opt)
+ {
+-	int len;
++	size_t len;
+ 	struct cache_entry *ce;
+ 
+ 	if (S_ISDIR(mode))
+ 		return READ_TREE_RECURSIVE;
+ 
+ 	len = strlen(pathname);
+-	ce = make_empty_cache_entry(istate, base->len + len);
++	ce = make_empty_cache_entry(istate, st_add(base->len, len));
+ 
+ 	ce->ce_mode = create_ce_mode(mode);
+ 	ce->ce_flags = create_ce_flags(1);
diff --git a/meta/recipes-devtools/git/git/CVE-2026-111760_p4.patch b/meta/recipes-devtools/git/git/CVE-2026-111760_p4.patch
new file mode 100644
index 0000000000..41ae73121f
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-111760_p4.patch
@@ -0,0 +1,102 @@
+From a3e3e36920865b8b4fee6fd3a6c9bd98f5895ece Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Fri, 16 Oct 2026 20:36:19 +0200
+Subject: [PATCH] t1600-index: add expensive tests for over-long tree paths
+
+The fixes for over-long cache entry names need regression coverage.
+Add helper functions make_large_tree and check_overlong_tree, along with
+four EXPENSIVE tests gated by SIZE_T_IS_64BIT and LONG_IS_64BIT that
+exercise the oversized-path boundary for checkout, restore, and ls-files,
+plus one more EXPENSIVE test for ls-files at the INT_MAX terminator
+boundary.
+
+These tests require 64-bit size_t/long and large allocations, so they are
+opt-in and only run when the appropriate EXPENSIVE prerequisites are
+satisfied.
+
+CVE: CVE-2026-111760
+Upstream-Status: Backport [https://github.com/git/git/commit/89048b48fb3acc7b24e38c42139b3a03fa54e09f]
+
+Assisted-by: Kimi-K2.7-Code
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+Signed-off-by: Toon Claes <toon@iotcl.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ t/t1600-index.sh | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 64 insertions(+)
+
+diff --git a/t/t1600-index.sh b/t/t1600-index.sh
+index 93305d45..9c51cc04 100755
+--- a/t/t1600-index.sh
++++ b/t/t1600-index.sh
+@@ -158,6 +158,70 @@ test_expect_success 'index.maxPathLen rejects out-of-range values' '
+ 	test_grep "exceeds maximum" err
+ '
+ 
++make_large_tree () {
++	{
++		printf "100644 " &&
++		test-tool genzeros "$1" | tr "\000" a &&
++		printf "\0" &&
++		test-tool genzeros "$(test_oid rawsz)"
++	} >"tree-$1" &&
++	git hash-object --literally -w -t tree "tree-$1"
++}
++
++check_overlong_tree () {
++	test_must_fail git -C overlong "$@" >actual 2>err &&
++	test_cmp expect-overlong err &&
++	test_must_be_empty actual
++}
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT \
++		"set up a tree path whose length wraps to a small int" '
++	test_create_repo overlong &&
++	(
++		cd overlong &&
++		subtree=$(make_large_tree 4294967294) &&
++		printf "040000 tree %s\tabc\n" "$subtree" |
++		git mktree >tree
++	) &&
++	overlong_tree=$(cat overlong/tree) &&
++	echo "fatal: index entry path is too long" \
++		"(4294967298 bytes)" >expect-overlong
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT \
++		"checkout rejects a path before its length is truncated" '
++	check_overlong_tree checkout "$overlong_tree" -- :/
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT \
++		"restore rejects a path before its length is truncated" '
++	check_overlong_tree restore --source="$overlong_tree" --staged -- :/
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT \
++		"ls-files rejects a path before its length is truncated" '
++	check_overlong_tree ls-files --with-tree="$overlong_tree"
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT \
++		"clean up the large tree" '
++	rm -rf overlong
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT \
++		"ls-files includes the terminator without signed overflow" '
++	test_create_repo boundary &&
++	test_when_finished "rm -rf boundary" &&
++	(
++		cd boundary &&
++		make_large_tree 2147483647 >tree
++	) &&
++	echo 100644 >expect &&
++	git -C boundary ls-files --with-tree="$(cat boundary/tree)" \
++		--format="%(objectmode)" >actual &&
++	test_cmp expect actual
++'
++
+ # This must be the last test case because it deletes .git/config
+ test_expect_success 'index version config precedence' '
+ 	test_index_version 0 false 0 2 &&
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 3940fe8769..c5bf87e44f 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -17,6 +17,10 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2026-113408_p3.patch \
            file://CVE-2026-114466_p1.patch \
            file://CVE-2026-114466_p2.patch \
+           file://CVE-2026-111760_p1.patch \
+           file://CVE-2026-111760_p2.patch \
+           file://CVE-2026-111760_p3.patch \
+           file://CVE-2026-111760_p4.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


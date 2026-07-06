Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38BFC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:42:44 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156906.1783359757741019010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=krP9rW0t;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4075; q=dns/txt;
  s=iport01; t=1783359757; x=1784569357;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6dmTw24aP7iczJZV9iE3B2YpYsj+cLUyUrfgW2TQy8=;
  b=krP9rW0tDIgMQf1VyeGh7YzUniLVGQ8+LYQ8lcBz5uKz9pJ4HZFshEIx
   /V7Y5Cw8/7/MAtgEKRu14bDn14LUbelMMAwNst98l9qJOUNY5sBaeYjDc
   k40KjE2EAHi+aMLP4S3uZVmKmytdzHZ345Ta3UwcgFYuu9Y4+MR2r0taP
   A//gJ4DAAz2XBn71RLWlxd+a0BqwB1aW2AjTqXwUuukiuGehGmaHbjEb9
   j66/RrCorQ+YIEu77JWHFpqCPo69yxCPPCmTnPkwkMosRx6gkji+znYxO
   sotv6kLERO58d20g3ETjs8hcSNQxkHLdzCzhX162RD9NQblKR4g+AsQcf
   A==;
X-CSE-ConnectionGUID: b0FHywvwSBqxsuZVtHjBjQ==
X-CSE-MsgGUID: 5r66/0OyTGCcxQyUV6W9KA==
X-IPAS-Result: =?us-ascii?q?A0BDAgCw6Etq/47/Ja1aHgEBCxIMggULgld0X0JJA5Qng?=
 =?us-ascii?q?iGBFopRkjeBfg8BAQEPOBkEAQGSVQImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAS0LAXIDAQJPCyMhgwIBgjoDNgIBEQa5eoF5M?=
 =?us-ascii?q?4EBg1oFCQJDUNhJDYJWAQUGFAGBOIU/gnyFI1sYAYR8JxsbgXKBFYE7gTh2g?=
 =?us-ascii?q?QWBGkIBAgEYiAsEgiKBDIFaj0ZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XgQwbBwWBHYFrgQKEeSMfAzl/gTB1SnktgQMSHgqBUoEqAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeMfBcPgj0BgQ0BByICIoFbL5MukkiBNZ5pcQoog3WMIY8+hXwaM4QEl?=
 =?us-ascii?q?BeSUZkIjgqECZJHhGiBaDyBRwsHcBWDIlMZD444g2uBf4MUyUckNQIJAzABB?=
 =?us-ascii?q?wIHDwKBc5F9AQE?=
IronPort-Data: A9a23:OMYIr6tG/dDVfm+rFjGGS3upSufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTyGPPbfZDaheo90btuz9UIG7cLTxoBnQAs9+SE9Fi8bgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3b9ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8L5ZIXBR6
 +MjAikddQ2xuf6Wwpi5c7w57igjBJGD0II3oHpsy3TdSP0hW52GG/iM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtNYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoHSGJ0FxxrH/
 Qoq+UykGE9Ec4S42Aaq2Xm8v/7yo33ECaE7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:CaSMWa02URey9Cp2+LM3jQqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoWpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: 9a23:cpHIvGD9GIPm74X6EyM/2m4FBd46SVfE3GzNEXGkKWRDSoTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AZat4jAwt9myO6J7V0hj1G3j4GguaqPm0Vh5KybI?=
 =?us-ascii?q?Xh+avPjxJKgqj0gvmYaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,151,1779148800"; 
   d="scan'208";a="505081473"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 17:42:36 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 9C49A180000B4
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 17:42:36 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 43419CB6A93; Mon,  6 Jul 2026 10:42:36 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Mon,  6 Jul 2026 10:39:34 -0700
Message-ID: <20260706173934.4044670-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240335

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], which addresses two out-of-bounds
read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The changes
shown in [2] are referenced by [3] and [4].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/xcofflink.c;h=1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=fde21c9f9583baff05e72e390e6bb896d02f9d43;hb=c2bf7de1eb77a91d7a3c86d56408bf57de540faf;hpb=d7f532cb3a46527
[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3441
[4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-3442

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3441
https://nvd.nist.gov/vuln/detail/CVE-2026-3442
https://www.suse.com/security/cve/CVE-2026-3441.html
https://www.suse.com/security/cve/CVE-2026-3442.html

Tested with binutils-testsuite (bitbake binutils-testsuite -c check):
  binutils: PASSED: 327, FAILED: 0, SKIPPED: 5

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index cab270cea5..4eb1b2e098 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -40,4 +40,5 @@ SRC_URI = "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://CVE-2026-4647.patch \
      file://CVE-2026-6846.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 0000000000..5b79144761
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From de8bd9410e3548fe7f7dc4dd759a6ef55ecb0d71 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH] xcofflink buffer overflows
+
+This fixes two fuzzed object file out-of-bounds accesses.
+
+	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
+	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
+	to index sym hashes.
+
+CVE: CVE-2026-3441 CVE-2026-3442
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf]
+
+(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 691acc854ae..e1716262871 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1908,12 +1908,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
+ 	     cause the XTY_LD to not follow the XTY_SD symbol. */
+ 	  {
+-	    bool bad;
+-
+-	    bad = false;
+-	    if (aux.x_csect.x_scnlen.u64
+-		>= (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
+-	      bad = true;
++	    bool bad = (aux.x_csect.x_scnlen.u64
++			>= ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
++			    / symesz));
+ 	    if (! bad)
+ 	      {
+ 		section = xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
+@@ -2279,6 +2276,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.51.0
+
-- 
2.35.6



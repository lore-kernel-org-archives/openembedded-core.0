Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B635FCD3423
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 14:24:34 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7182.1777731874243935583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 07:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hb9f2WZq;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3949; q=dns/txt;
  s=iport01; t=1777731874; x=1778941474;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6xuYVtcpFrqrOceUGK3Pt6jQPZCWm6CMci3oFXanyes=;
  b=hb9f2WZqgNM3UgxXCFSFG5gaNp8vttAogmdszXgEv8V2ffJxdrkt6FM7
   x6UYvwv9hUUrCoiPBET/RpU81TF0NzCxDsTVrZxv3QTGgJl/EP/JtsmaU
   75QVWOLZMl53GulnyEaVWH/WRtThkusAqssxovwsKggkNS3EgUQTlPXRK
   gSP7JHJHl61uN4wewXX6WPG3KoV8JqE66AAk7/gqQqjbKuaH0qvhp1dkv
   u0f6y2d535VcnPCFxZKz1xf0eDpoHJTjlOXxoqZI8jngpJIoZKiPAW/PQ
   jla8FV0oa18P9aWZ5AbVwhkAMMooB2QN3M8ab+bGzInF8pUnYmynzvGrS
   A==;
X-CSE-ConnectionGUID: OW4/lqhCTCewjCjUjSKAXg==
X-CSE-MsgGUID: hCgUwgCnRNuSRSFhQqw+RA==
X-IPAS-Result: =?us-ascii?q?A0BxAgC1CPZp/5H/Ja1aglmCV3FfQkkDlCeCIYEWilGSN?=
 =?us-ascii?q?oF/DwEBAQ84GQQBAZI5AiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAS0LAXIDAQJPCyMhgwIBgjoDNgIBEQaycYF5M4EBg?=
 =?us-ascii?q?1oFCQJDUNhIDYJSAQUGFAGBOIU/gnmFI1sYAYR6JxsbgXKBFYE7gTd2gQWBG?=
 =?us-ascii?q?kIBAgEYiAoEgiKBDoFgHo0cSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EMGwcFgUuDAG1qgQOEYHgjLANOcgMLGA1IESw3FBsEPm4HimQdD4IwAYENA?=
 =?us-ascii?q?QciAiKCCqV0oB1xCiiDdIwejz6FfBozhASUFZJSmQaOCYQJkkeEaIFoPIFHC?=
 =?us-ascii?q?wdwFYMiUxkPjjiDa4F/gxTAECM1AgkDLwEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:zr0Xva8Ym6haOTs3IsJBDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WpKCj2COK3fNmOjf90lOt7joUhTvp/UnIdiGQpopSBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbzpOs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kRAtFf/v93Kl1l+
 OMaAzIwbCugrtK5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+zm3XidjdYoXqepLE85C7YywkZPL3Fb4GLJ4PWFJwK9qqej
 mLt8FnmDTocDvqC8gC+3HKVn/CMpwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:7HPT2aMghFi2ZcBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:EyIB5221kd5x+d/sxsqeYbxfPf95NXnEzFzsCEKnC01rdb+uanag9/Yx
X-Talos-MUID: 9a23:s/YcIQUqeyepGUPq/D/Hiwx9O+xu2YKzM3o2v5U/otbHDwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,212,1770595200"; 
   d="scan'208";a="736574917"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 May 2026 14:24:33 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 2D24818000460
	for <openembedded-core@lists.openembedded.org>; Sat,  2 May 2026 14:24:33 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id CA831CC12B5; Sat,  2 May 2026 07:24:32 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Sat,  2 May 2026 07:23:54 -0700
Message-Id: <20260502142354.3840615-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 14:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236307

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

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242e..5d91a41648 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0028-CVE-2025-11494.patch \
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 0000000000..28cface2c9
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,50 @@
+From 88a051b765a7684b24250907c2dad9fa8cd4124a Mon Sep 17 00:00:00 2001
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
+index e0165d202a9..88c49755c64 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1873,12 +1873,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
+	     cause the XTY_LD to not follow the XTY_SD symbol. */
+	  {
+-	    bool bad;
+-
+-	    bad = false;
+-	    if (aux.x_csect.x_scnlen.u64
+-		>= (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
+-	      bad = true;
++	    bool bad = (aux.x_csect.x_scnlen.u64
++			>= ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
++			    / symesz));
+	    if (! bad)
+	      {
+		section = xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
+@@ -2244,6 +2241,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+		 functions imported from dynamic objects.  */
+	      if (info->output_bfd->xvec == abfd->xvec
+		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+		{
+		  struct xcoff_link_hash_entry *h;
+--
+2.44.4
-- 
2.44.4



Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD70C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:45:56 +0000 (UTC)
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3231.1788252349451145602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ixhgbeVn;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4021; q=dns/txt;
  s=iport01; t=1788252349; x=1789461949;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NuvFfLhD0F8xbgSHSrO4X5nuLZ3HaJAg7+4ZXprWqb4=;
  b=ixhgbeVn30dSrS1ZZRxvUYecBvj7R1sQmQywoVw9iErM5RVNS/yzskHW
   PBWM0YePWVczsK6hgEDOduW9UPJbcPtQCOv8Mrt/td/idFApWshQ74Ahr
   WsX2wJFobZ3ThohsdCLyxlDWyC0BFAJAfI2Tz6h/1XG3USlYndCLn4m4E
   kKe3r1xUrb7UY9Kd+LM7o2VtGZhPVjk4JqcTFCtR2diy2D/djPvs9Vos6
   7BMZSwWwR3lwQfLhNuqNz+9egWvs6169IL6LBbNSnertC4Tu6+ElvOXXe
   9J6NcLAPdPspPrcglxRsvfbge5C7+O85e+OO47uKWBsuBdM5AMx2EPxXT
   Q==;
X-CSE-ConnectionGUID: OVMBBXX9SMuFhrsIqTcRjg==
X-CSE-MsgGUID: 1dS664wZTs2vJlqmE4YUgw==
X-IPAS-Result: =?us-ascii?q?A0BEAgDmj5Zq/9BK/pBaHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGBFopRkjeBfg8BAQEPOBkEAQGSfgImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAS0LAXIDAQJPCyMZCIMCAYI6AzcDEQa8DIF5M?=
 =?us-ascii?q?4EBg1oFCQJDUNhLDYJYAQUGFAGBOIU/gn+FI10YAYR8JxsbgXKBFYE7gTh2g?=
 =?us-ascii?q?QWBGkIBAgEYiAsEgiKBDIFaHpFrSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ENGwYFgR2BKINEIxk2eoEJXoErKWESF4EJgggCgleCAwIBSUMOB0dTC?=
 =?us-ascii?q?SoCCQsYDUgRLDcVGQQ+bgeOXx+CUgGBDQEHIgIiggqlc6AhcQoog3aMIo8+h?=
 =?us-ascii?q?XwaM4QElBeSUZkIjgqECZJHhGmBaDyBRwsHcBWDIlMZD444g2uBf4MUxw48N?=
 =?us-ascii?q?QIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:N8x5Y6/nHDHVwCes4GBYDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 mUZC2uBbK6OMWGgKt4jbY/goxwCuMXTyYQwQQRtriFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYzpNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kRA6gy0NZHUFpr6
 NIYMissdyyIveC5lefTpulE3qzPLeHiMZlavjRryivUSK55B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YM3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwYYqJJ4HWH625mG7Bq
 lmYoTjmMC0BbsK9zSOA3y6du+DQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:w/nfcquWqInylqWUfhRmTx5h7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:R7m+rmDFt5GMtej6Ew5Z0WQ+KvB0SVjA4nfKOG6hNW1TSrLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AXvyQKA+I3xCQcPXxbaM+JsKQf55k2PrwVF8/rY5?=
 =?us-ascii?q?cpeuALCldZwaggyviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,255,1779148800"; 
   d="scan'208";a="59845542"
Received: from aer-l-core-07.cisco.com ([144.254.74.208])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Sep 2026 08:45:47 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-07.cisco.com (Postfix) with ESMTPS id D0C8E18000231
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 08:45:46 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 4C977CC037D; Tue,  1 Sep 2026 14:15:45 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v3 1/2] binutils: fix CVE-2026-3441 and CVE-2026-3442
Date: Tue,  1 Sep 2026 14:15:36 +0530
Message-Id: <20260901084537.377060-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244809

From: Deepak Rathore <deeratho@cisco.com>

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

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v2 to v3: Refreshed the patches on top of latest scarthgap commits.
 .../binutils/binutils-2.42.inc                |  1 +
 .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d395ae1b1e..8665a2549a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -82,5 +82,6 @@ SRC_URI = "\
      file://CVE-2025-8224.patch \
      file://CVE-2026-15003.patch \
      file://CVE-2026-18220.patch \
+     file://CVE-2026-3441_CVE-2026-3442.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
new file mode 100644
index 0000000000..61b1c7dc19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442.patch
@@ -0,0 +1,51 @@
+From 0f650fc3fc147b05f819ef96af02238cee02c68e Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 28 Feb 2026 13:16:40 +1030
+Subject: [PATCH 1/2] xcofflink buffer overflows
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
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ bfd/xcofflink.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index a48cc94fed0..dbfa17c6d58 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1888,12 +1888,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
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
+@@ -2259,6 +2256,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_info *info)
+ 		 functions imported from dynamic objects.  */
+ 	      if (info->output_bfd->xvec == abfd->xvec
+ 		  && *rel_csect != bfd_und_section_ptr
++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
+ 		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] != NULL)
+ 		{
+ 		  struct xcoff_link_hash_entry *h;
+-- 
+2.44.4
+
-- 
2.35.6



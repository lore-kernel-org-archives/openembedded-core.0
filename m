Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE00ACD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 14:26:14 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7179.1777731973706370832
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 07:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Mtn5gqRW;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10002; q=dns/txt;
  s=iport01; t=1777731973; x=1778941573;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Fzd6/tytQ1p/6b9fTPj+oYOe3HR1pPgi+n0wrJNMmaY=;
  b=Mtn5gqRW9i+/hluaWsW9+giTBhVx8jGMBEQbCCbICHFe2aPs0dUtFGDt
   67+J3JXb7vZuDwTG7xevNb+7orLjJQSHS+K4XNpDkIa+e53GsYK2ZWMV5
   T4BmO9bo/4p55lKcSK2pXXkTzVz4/y24+2UIH4MEca/gzec2SumaN4vpF
   1G6uLGZTYsgUTOxyVfA0wicdVTZP+SfZmtDxxdvxOQwT7+y2YU3bobRUu
   AZdjvYnkmOjaGuRbK9ADseYQVuaDObFeGYftKgNQk4hB9svhpL3siO5Os
   dgBbyX8tOj9SiynT9a+WDu86nw3gap0ODUKU/XBLpjbEeAXj/xBN+pKWG
   g==;
X-CSE-ConnectionGUID: f1F62q1jRImvPNhd7tacwQ==
X-CSE-MsgGUID: I8kQvauoRD+atWR8op+hcw==
X-IPAS-Result: =?us-ascii?q?A0B2AgAlCfZp/4//Ja1aglmCV3FfQkkDlCeCIQOBE4pRk?=
 =?us-ascii?q?jaBfw8BAQEPRA0EAQGFBgKNMQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMnCwFWHAMBAi8gCyMIGYMCAYI6AzYCA?=
 =?us-ascii?q?REGsneBeTOBAYNaBQkCQ1DYSA2CUgEFBhQBgTiFP4J5hSNbGAGEeicbG4Fyg?=
 =?us-ascii?q?RQBgTuBN3aBBYEaQgECARh+boYeBIIigQ6BYB6NHEiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDBsHBYFLgwBtaoEDhGB4IywDTnIDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB4pkHQ+BPnIBLGEBKQIggV0SHZM/kBSCIaAdcQoog3SMHo8+hXwaM4QEl?=
 =?us-ascii?q?BWSUpkGjgmECZJHhGiBaDyBRwsHcBWDIlMZD44tCwuDYIF/gxTAECM1AgkDL?=
 =?us-ascii?q?wEBBwIHDQMLgWiQEYFsAQE?=
IronPort-Data: A9a23:i1OMt6ib05+BGlhdxpXUbIL2X161MREKZh0ujC45NGQN5FlHY01je
 htvXGmGO6qDMGfwf491btiw805T7ZHRz4RhSFdvqCg0QnhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMtvrZ8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUWo8gpW3gX9
 8Y5LS41SBCP2P6/y62CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHkbjFFrViVrII84nPYy0p6172F3N/9JYfSGp0EzxnFz
 o7A10WpASgEPcGY8xbG+26TvL/IhWD7U51HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:e7dnq6nRv8gWMPPHJmpk99m06Q/pDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:ElTZFmFPXNb5Qm36qmJprWBKQNl8cEf8yWnoBU+0VnpgQ6KsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ANf6JNA4jwFhHE8BOAoMF99f6xoxJs6eXFkkQlq8?=
 =?us-ascii?q?q+MCYChYgPC/ejD+oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,212,1770595200"; 
   d="scan'208";a="730709975"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 May 2026 14:26:10 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CC0771800039B
	for <openembedded-core@lists.openembedded.org>; Sat,  2 May 2026 14:26:10 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 79061CC12B5; Sat,  2 May 2026 07:26:10 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/2] binutils: fix CVE-2026-4647
Date: Sat,  2 May 2026 07:23:56 -0700
Message-Id: <20260502142354.3840615-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260502142354.3840615-1-sudumbha@cisco.com>
References: <20260502142354.3840615-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 14:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236308

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], which addresses an out-of-bounds
read issue in XCOFF relocation processing, as described in [2].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=33919

Reference:
https://bugzilla.suse.com/show_bug.cgi?id=1260338
https://www.suse.com/security/cve/CVE-2026-4647.html
https://nvd.nist.gov/vuln/detail/CVE-2026-4647

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-4647.patch     | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5d91a41648..b1546de02c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -70,5 +70,6 @@ SRC_URI = "\
      file://0029-CVE-2025-11839.patch \
      file://0030-CVE-2025-11840.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
+     file://CVE-2026-4647.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
new file mode 100644
index 0000000000..cece5afefe
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-4647.patch
@@ -0,0 +1,228 @@
+From 3e24faeffc0116c271d048137b340586d800e17c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 13 Mar 2026 17:28:28 +1030
+Subject: [PATCH] PR33919 Out-of-bounds read in XCOFF relocation processing
+
+	PR 33919
+	* coff-rs6000.c (xcoff_calculate_relocation): Don't use explicit
+	array size.
+	(xcoff_complain_overflow): Likewise.
+	(xcoff_rtype2howto): Return a NULL howto rather than aborting.
+	(_bfd_xcoff_reloc_name_lookup): Use ARRAY_SIZE.
+	(xcoff_ppc_relocate_section): Sanity check reloc r_type before
+	accessing xcoff_howto_table.  Print r_type using %#x.  Remove
+	now redundant later reloc r_type sanity check.
+	* coff64-rs6000.c: Similarly.
+	* libxcoff.h (XCOFF_MAX_CALCULATE_RELOCATION): Don't define.
+	(XCOFF_MAX_COMPLAIN_OVERFLOW): Don't define.
+
+CVE: CVE-2026-4647
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=9e99dbc1f19ffaf18d0250788951706066ebe7f2]
+
+(cherry picked from commit 9e99dbc1f19ffaf18d0250788951706066ebe7f2)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ bfd/coff-rs6000.c   | 36 +++++++++++++++++++++---------------
+ bfd/coff64-rs6000.c | 33 ++++++++++++++++++++-------------
+ bfd/libxcoff.h      |  3 ---
+ 3 files changed, 41 insertions(+), 31 deletions(-)
+
+diff --git a/bfd/coff-rs6000.c b/bfd/coff-rs6000.c
+index 87feb672bf1..0f2cc496b63 100644
+--- a/bfd/coff-rs6000.c
++++ b/bfd/coff-rs6000.c
+@@ -155,8 +155,7 @@ static xcoff_complain_function xcoff_complain_overflow_bitfield_func;
+ static xcoff_complain_function xcoff_complain_overflow_signed_func;
+ static xcoff_complain_function xcoff_complain_overflow_unsigned_func;
+ 
+-xcoff_reloc_function *const
+-xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS   (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG   (0x01) */
+@@ -210,8 +209,7 @@ xcoff_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
+   xcoff_reloc_type_toc,  /* R_TOCL    (0x31) */
+ };
+ 
+-xcoff_complain_function *const
+-xcoff_complain_overflow[XCOFF_MAX_COMPLAIN_OVERFLOW] =
++xcoff_complain_function *const xcoff_complain_overflow[] =
+ {
+   xcoff_complain_overflow_dont_func,
+   xcoff_complain_overflow_bitfield_func,
+@@ -1158,8 +1156,11 @@ reloc_howto_type xcoff_howto_table[] =
+ void
+ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff_howto_table[internal->r_type];
+@@ -1183,7 +1184,7 @@ xcoff_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x1f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1236,9 +1237,7 @@ _bfd_xcoff_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff_howto_table) / sizeof (xcoff_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff_howto_table); i++)
+     if (xcoff_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff_howto_table[i].name, r_name) == 0)
+       return &xcoff_howto_table[i];
+@@ -3776,6 +3775,14 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -3795,7 +3802,7 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
++		(_("%pB: relocation (%#x) at 0x%" PRIx64 " has wrong r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, (uint64_t) rel->r_vaddr, rel->r_size);
+ 	      return false;
+ 	    }
+@@ -3871,10 +3878,9 @@ xcoff_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff_calculate_relocation[rel->r_type])
+-	       (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-		addend, &relocation, contents, info)))
++      if (!((*xcoff_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/coff64-rs6000.c b/bfd/coff64-rs6000.c
+index 0f8d9e08783..c74698070d5 100644
+--- a/bfd/coff64-rs6000.c
++++ b/bfd/coff64-rs6000.c
+@@ -177,8 +177,7 @@ static bool xcoff64_bad_format_hook
+ /* Relocation functions */
+ static xcoff_reloc_function xcoff64_reloc_type_br;
+ 
+-xcoff_reloc_function *const
+-xcoff64_calculate_relocation[XCOFF_MAX_CALCULATE_RELOCATION] =
++xcoff_reloc_function *const xcoff64_calculate_relocation[] =
+ {
+   xcoff_reloc_type_pos,  /* R_POS     (0x00) */
+   xcoff_reloc_type_neg,  /* R_NEG     (0x01) */
+@@ -1439,8 +1438,11 @@ reloc_howto_type xcoff64_howto_table[] =
+ void
+ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+ {
+-  if (internal->r_type > R_TOCL)
+-    abort ();
++  if (internal->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++    {
++      relent->howto = NULL;
++      return;
++    }
+ 
+   /* Default howto layout works most of the time */
+   relent->howto = &xcoff64_howto_table[internal->r_type];
+@@ -1473,7 +1475,7 @@ xcoff64_rtype2howto (arelent *relent, struct internal_reloc *internal)
+   if (relent->howto->dst_mask != 0
+       && (relent->howto->bitsize
+ 	  != ((unsigned int) internal->r_size & 0x3f) + 1))
+-    abort ();
++    relent->howto = NULL;
+ }
+ 
+ reloc_howto_type *
+@@ -1528,9 +1530,7 @@ xcoff64_reloc_name_lookup (bfd *abfd ATTRIBUTE_UNUSED,
+ {
+   unsigned int i;
+ 
+-  for (i = 0;
+-       i < sizeof (xcoff64_howto_table) / sizeof (xcoff64_howto_table[0]);
+-       i++)
++  for (i = 0; i < ARRAY_SIZE (xcoff64_howto_table); i++)
+     if (xcoff64_howto_table[i].name != NULL
+ 	&& strcasecmp (xcoff64_howto_table[i].name, r_name) == 0)
+       return &xcoff64_howto_table[i];
+@@ -1574,6 +1574,14 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	 the csect including the symbol which it references.  */
+       if (rel->r_type == R_REF)
+ 	continue;
++      if (rel->r_type >= ARRAY_SIZE (xcoff64_howto_table))
++	{
++	  /* xgettext:c-format */
++	  _bfd_error_handler (_("%pB: unsupported relocation type %#x"),
++			      input_bfd, rel->r_type);
++	  bfd_set_error (bfd_error_bad_value);
++	  return false;
++	}
+ 
+       /* Retrieve default value in HOWTO table and fix up according
+ 	 to r_size field, if it can be different.
+@@ -1595,7 +1603,7 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 
+ 	    default:
+ 	      _bfd_error_handler
+-		(_("%pB: relocation (%d) at (0x%" PRIx64 ") has wrong"
++		(_("%pB: relocation (%#x) at (0x%" PRIx64 ") has wrong"
+ 		   " r_rsize (0x%x)\n"),
+ 		 input_bfd, rel->r_type, rel->r_vaddr, rel->r_size);
+ 	      return false;
+@@ -1668,10 +1676,9 @@ xcoff64_ppc_relocate_section (bfd *output_bfd,
+ 	    }
+ 	}
+ 
+-      if (rel->r_type >= XCOFF_MAX_CALCULATE_RELOCATION
+-	  || !((*xcoff64_calculate_relocation[rel->r_type])
+-	      (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
+-	       addend, &relocation, contents, info)))
++      if (!((*xcoff64_calculate_relocation[rel->r_type])
++	    (input_bfd, input_section, output_bfd, rel, sym, &howto, val,
++	     addend, &relocation, contents, info)))
+ 	return false;
+ 
+       /* address */
+diff --git a/bfd/libxcoff.h b/bfd/libxcoff.h
+index 81c4e205e06..ca716a9ef3a 100644
+--- a/bfd/libxcoff.h
++++ b/bfd/libxcoff.h
+@@ -215,9 +215,6 @@ struct xcoff_backend_data_rec
+ #define bfd_xcoff_text_align_power(a) ((xcoff_data (a)->text_align_power))
+ #define bfd_xcoff_data_align_power(a) ((xcoff_data (a)->data_align_power))
+ 
+-/* xcoff*_ppc_relocate_section macros  */
+-#define XCOFF_MAX_CALCULATE_RELOCATION (0x32)
+-#define XCOFF_MAX_COMPLAIN_OVERFLOW (4)
+ /* N_ONES produces N one bits, without overflowing machine arithmetic.  */
+ #ifdef N_ONES
+ #undef N_ONES
+-- 
+2.44.4
+
-- 
2.44.4



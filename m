Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3861049523
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:46:05 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17343.1773222358694415763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SgCjdO0b;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3432; q=dns/txt;
  s=iport01; t=1773222358; x=1774431958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+K485bb4r0/9pz2iDKHdX64+6484NGIru6K8wPrgk7Y=;
  b=SgCjdO0boxxbAksPZT1TFmGvbDuEO+BMO7j5UB+mZ+T7FEXx27aFtEvw
   NdD4Zk/Sp7rg/6DGkSmlVU78ZJTwda35ZU+dfA7UTIFpF9RHZ8IjKF04J
   2o9VwW1fqNgpFDj7I09QQSrwo47utDFc8JEQuVXhvceMyW3hTBpMNyoiE
   F4T57i1mn3rjpds76Yf9snhfWsKSigUCs3z3tIhZWuPnLDJkPArRO3nvy
   /ZNZO1HXuFeVZR8S971SGapJeaWkK4X1aweCMgP65iG+w+eu1bss3CZza
   bdlEostUiCh9qOiVSQs75K2EeMj2YhcZex7xRVXW3O4Q2ZTyoqcy2LVbw
   A==;
X-CSE-ConnectionGUID: Lb/ZdYgPQherLIJn+C1Z6w==
X-CSE-MsgGUID: a6CudH9iR6aUfv3p6dMgOg==
X-IPAS-Result: =?us-ascii?q?A0CNBQDUOLFp/5T/Ja1aHgEBCxIMggULgkgPcV5DSQOWS?=
 =?us-ascii?q?AOeGoF/DwEBAQ9EDQQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBAi8rIwgZG4JnAYJzA?=
 =?us-ascii?q?xGuCoF5M4EBg2gCQ0/bJgELFAGBOIU8iBlbGAGEeicbG4FygRWDaIEFgVwBA?=
 =?us-ascii?q?YEnEYZsBIIiehSBYR+FPgaCTYkSSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ELGwcFhR4PiHB0boERgykDCxgNSBEsNxQbBD5uB411PYI0PVEBK10+K?=
 =?us-ascii?q?mcRkwBpkXqhDgoog3SMHpU6GjOFW6UQC5h7izaCU5ZQhGiBaDyBRwsHcBWDI?=
 =?us-ascii?q?glJGQ+OOINpgX/HTyYyCwMuAgcLAQEDCZFqASeBVQEB?=
IronPort-Data: A9a23:q6dmXarLOaBtpRHqDFUjuYUZDiBeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmCaf6OYTT3fN0katmw80hV78SAnYRlSgc9/C5gQyxH9uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrY8Uo35ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sJ9RlNCx
 PMgETAAdDSipeT16+uJFPY506zPLOGzVG8ekmtrwTecCbMtRorOBvyTo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LWPrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TUFJ8KwxrD/
 DiuE2LRC08xKdC/mDu/rHuRiPGUhX33fY01G+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:ZQxwsa0zv/SJ/kSGSct1ggqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WByB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:C4jAGWEh4nAT/KvHqmJD/gkmFvEqSkTdwW30Am2+Sk0weuOKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AjaV5Eg4olTH1zzGS2qD6VeZ/xoxhvY+zBGBckK9?=
 =?us-ascii?q?YsvSKK3doZTu4gxO4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,113,1770595200"; 
   d="scan'208";a="692754322"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 09:45:57 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id A5D5B18000171;
	Wed, 11 Mar 2026 09:45:57 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 4C27FCC12A6; Wed, 11 Mar 2026 02:45:57 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH V2 1/2] vim: Fix CVE-2026-25749
Date: Wed, 11 Mar 2026 02:45:10 -0700
Message-ID: <20260311094528.2744479-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <131089.1773220389419496773@lists.openembedded.org>
References: <131089.1773220389419496773@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232854

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../vim/files/CVE-2026-25749.patch            | 63 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 0000000000..4236464c99
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,63 @@
+From 04c5e03c2c638e6c82c250f7b612eab29fe7d9ba Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 5 Feb 2026 18:51:54 +0000
+Subject: [PATCH] patch 9.1.2132: [security]: buffer-overflow in 'helpfile'
+ option handling
+
+Problem:  [security]: buffer-overflow in 'helpfile' option handling by
+          using strcpy without bound checks (Rahul Hoysala)
+Solution: Limit strncpy to the length of the buffer (MAXPATHL)
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
+
+CVE: CVE-2026-25749
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9]
+
+Backport Changes:
+- Excluded changes to src/version.c and runtime/doc/version9.txt
+  from this backport. This file only tracks upstream version increments.
+  We are applying a security fix, not a version upgrade. These changes
+  were skipped to maintain current package versioning and avoid merge conflicts.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 0714b15940b245108e6e9d7aa2260dd849a26fa9)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tag.c                 | 2 +-
+ src/testdir/test_help.vim | 9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/tag.c b/src/tag.c
+index 6912e8743..a32bbb245 100644
+--- a/src/tag.c
++++ b/src/tag.c
+@@ -3348,7 +3348,7 @@ get_tagfname(
+	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+		return FAIL;
+	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+	    slash_adjust(buf);
+diff --git a/src/testdir/test_help.vim b/src/testdir/test_help.vim
+index dac153d86..f9e4686bb 100644
+--- a/src/testdir/test_help.vim
++++ b/src/testdir/test_help.vim
+@@ -222,4 +222,13 @@ func Test_helptag_navigation()
+ endfunc
+
+
++" This caused a buffer overflow
++func Test_helpfile_overflow()
++  let _helpfile = &helpfile
++  let &helpfile = repeat('A', 5000)
++  help
++  helpclose
++  let &helpfile = _helpfile
++endfunc
++
+ " vim: shiftwidth=2 sts=2 expandtab
+--
+2.43.7
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c730f1d0cf..044117a57f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"
-- 
2.44.1



Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AF10FCACA
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 18:19:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20046.1775067536578925520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 11:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GMZKU4VG;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3426; q=dns/txt;
  s=iport01; t=1775067536; x=1776277136;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ne5vT5b55Evr9COUrhRL7CLbvuWvHZP/rSJgeiHj6iw=;
  b=GMZKU4VGMGLr+wWyOoS/oeMwfu5VBtF3zuUn+J8+AotNxFLks4/WubV7
   Dc2CbwaXoNdX4ThkIcYRqKn/qcXq4hx5EgDkT0GCwISwkon8IYuSGI73t
   qRTg2kEUG6vCtqlu9PZEmCGoaVZdXAMm4CLCt0YQNRmsvwZJJtBkL+xBy
   /CMW8uwuvVkLyQzxS0paEbHwRlXZCqxbT9vEiyIpaCyzoXIlbGyBhM1eK
   LaU0rJ4gy7cbthVN/d/l+6ehva0nPl+vSawoMI+cwNb8G7Iua2R3ENB6+
   ZyFE27witGdBGP+Z7BSPw5HZT53lFUZhf78ZBpgcuODGp0dXB4bcth4wO
   g==;
X-CSE-ConnectionGUID: AtBpa4K2T5esrZQ7YFnpaA==
X-CSE-MsgGUID: utvDTfnpR/+aHdUPfYTxMA==
X-IPAS-Result: =?us-ascii?q?A0BCBwAhYc1p/5H/Ja1aglmCSA9xXkNJA5ZInh2Bfw8BA?=
 =?us-ascii?q?QEPRA0EAQGFB40nAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBKgsBRiwDAQJaIyEbgmcBgnMDEbRtgXkzgQGDaAJDT?=
 =?us-ascii?q?9smAQsUAYE4hT6IHFsYAYR6JxsbgXKBFYNogQWBXAEBgScRhmwEgiJ6FIFhg?=
 =?us-ascii?q?l8Ggk2JXUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFLh1x0b?=
 =?us-ascii?q?YETg35OAwsYDUgRLDcUGwQ+bgeLcCmCNj1RAStdPipnEZMAaZF6oQ4KKIN0j?=
 =?us-ascii?q?B6VOhozhVulEAuYe4s2glOWUIRogWg8gUcLB3AVgyIJSRkPjjiDaYF/wVYmM?=
 =?us-ascii?q?gsDLwEBBwIHDQMLgWiQAAEngVUBAQ?=
IronPort-Data: A9a23:iTrCM6o4OLRaenkgtMUfXHykGbZeBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnQb6vYNmameox1YNvkoxsBvseAyNVjHgdurSo0EipA8OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgTNNwJcaDpOtfrf8Eo35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0s9rK3lHq
 d9CFG0AdQqxvr2H7rSjQ8A506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WzRUr1SarLA6y2PS1wd2lrPqNbI5f/TVHZgKwB/J9
 z+uE2LRHw0EGOCRzyK/tTGlpuPypS3KZJI3PejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZOJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:tDeu66Cfwn52QKTlHemn55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoWpPhfZq0z/cciuMs1NyZMjUO1lHFEGgb1/qA/9UlcBeOkdK0Es
 xbAsxDNOE=
X-Talos-CUID: =?us-ascii?q?9a23=3Ar6HXpGr4B/iEIf0rwWvl3WjmUek5WGXUkFSKHxK?=
 =?us-ascii?q?1EnxbceKkZ1mI8Yoxxg=3D=3D?=
X-Talos-MUID: 9a23:IU1w9AoczrtQTr9EOyUezyx+KutU7aK2MgdOmLUKhvGKBBBgHh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,153,1770595200"; 
   d="scan'208";a="705761995"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 01 Apr 2026 18:18:55 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 9196A1800059A;
	Wed,  1 Apr 2026 18:18:55 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id E75DBCC12A6; Wed,  1 Apr 2026 11:18:54 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Scarthgap] [PATCH v3 1/2] vim: Fix CVE-2026-25749
Date: Wed,  1 Apr 2026 11:18:46 -0700
Message-ID: <20260401181852.3154298-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 18:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234457

From: Anil Dongare <adongare@cisco.com>

Pick patch from [1] also mentioned in [2]
[1] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-25749

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../vim/files/CVE-2026-25749.patch            | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-25749.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-25749.patch b/meta/recipes-support/vim/files/CVE-2026-25749.patch
new file mode 100644
index 0000000000..8b04379b9b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-25749.patch
@@ -0,0 +1,64 @@
+From e0065a61a42bdff9c75aa18104f8ff546938395f Mon Sep 17 00:00:00 2001
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
+ 	    if (tnp->tn_hf_idx > tag_fnames.ga_len || *p_hf == NUL)
+ 		return FAIL;
+ 	    ++tnp->tn_hf_idx;
+-	    STRCPY(buf, p_hf);
++	    vim_strncpy(buf, p_hf, MAXPATHL - 1);
+ 	    STRCPY(gettail(buf), "tags");
+ #ifdef BACKSLASH_IN_FILENAME
+ 	    slash_adjust(buf);
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
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be70..ae1c95973d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-25749.patch \
            "
 
 PV .= ".1683"
-- 
2.44.1



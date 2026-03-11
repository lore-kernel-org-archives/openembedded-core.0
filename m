Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B55D1049527
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:52:35 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17121.1773222752870721838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bEY/e4gR;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3432; q=dns/txt;
  s=iport01; t=1773222752; x=1774432352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+K485bb4r0/9pz2iDKHdX64+6484NGIru6K8wPrgk7Y=;
  b=bEY/e4gR4szACDqnUguan6oc97LFRUQA8QaOdEb3JoO2aotQLeFtSXY4
   JFCrk+mGVzt71/yk/K/8sEwFTkQlaQ13yHQDZDhQJAhqBFq2TICmSjtK7
   bwfBHbQ7WZhlVS8GGKJn107fCKeIF3wWffU1eQgQ273KgdqCB9b0w/kza
   Z2etkP8mcQ30ITj4XiI1OVgSo3IeaEf1pg6ZEUz//BpjHwLteAd2Yx/tZ
   SK+LB9GhbQZON5ONoydSw8WTklVk0LHocBcyvNyJU4D7LXDDUhyc+fmxP
   ZUN7zAjp3njOpAqfGzkaHejOSZlU49Bma3CX4lbVxK8tTsUkS5j1oug83
   w==;
X-CSE-ConnectionGUID: vCSAocA1SLGmynQTnerIwg==
X-CSE-MsgGUID: E3xwR4QqTPKkUHCMGc3IMg==
X-IPAS-Result: =?us-ascii?q?A0CNBQBIOrFp/47/Ja1aHgEBCxIMggULgkgPcV5DSQOWS?=
 =?us-ascii?q?AOeGoF/DwEBAQ9EDQQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLAUYQHAMBAi8rIwgZG4JnAYJzA?=
 =?us-ascii?q?xGuBoF5M4EBg2gCQ0/bJgELFAGBOIU8iBlbGAGEeicbG4FygRWDaIEFgVwBA?=
 =?us-ascii?q?YEnEYZsBIIiehSBYR+FPgaCTYkSSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdg?=
 =?us-ascii?q?SM+F4ELGwcFhR4PiHB0boERgykDCxgNSBEsNxQbBD5uB411PYI0PVEBK10+K?=
 =?us-ascii?q?mcRkwBpkXqhDgoog3SMHpU6GjOFW6UQC5h7izaCU5ZQhGiBaDyBRwsHcBWDI?=
 =?us-ascii?q?glJGQ+OOINpgX/HNiYyCwMuAgcLAQEDCZFqASeBVQEB?=
IronPort-Data: A9a23:W9wTUaDsIBFcyBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDl31jFVn
 WNKUWmHMveLMWGhKth/b9uz90gPu5PTzd83OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT8gmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3d5VJUY9FNQj3slyEGd3y
 foVMhESYUXW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FIhjuixYIeKI7RmQ+14xVaHn
 D7/5ljBIRInFPe65jHe01ej07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOb9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:BMI7ZqHyUHpTI7jepLqE78eALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1rZ
 0QEJSXzLbLfCFHZQGQ2njfL+od
X-Talos-CUID: =?us-ascii?q?9a23=3AxLrGiGqjOwoWsycvtX0+0UPmUd4OSVTax16JGGu?=
 =?us-ascii?q?XDHdvcYGTREWx56wxxg=3D=3D?=
X-Talos-MUID: 9a23:BDBO/AUJv71iYXPq/BK3lC5YaP5x35yNC30turApsJKlECMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,113,1770595200"; 
   d="scan'208";a="686848571"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Mar 2026 09:52:31 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id CECE018000D07;
	Wed, 11 Mar 2026 09:52:31 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 75D0ACC12A6; Wed, 11 Mar 2026 02:52:31 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [Whinlatter] [PATCH V2 1/2] vim: Fix CVE-2026-25749
Date: Wed, 11 Mar 2026 02:51:50 -0700
Message-ID: <20260311095159.2755236-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <131089.1773220389419496773@lists.openembedded.org>
References: <131089.1773220389419496773@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232857

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



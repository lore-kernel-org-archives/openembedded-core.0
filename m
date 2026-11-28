Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2755.1795845257174215375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 21:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jz3ecgv/;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1865; q=dns/txt;
  s=iport01; t=1795845257; x=1797054857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hysIeMre1ZfbDjEzkNpHhnIN3SgB6+5QjN89LLr+cno=;
  b=jz3ecgv/3Bw67k4u2Qm1JGmke0Y3+0WBSiWzvNHCtuZFOQvxYeXKKu2h
   UaWbvFlWWGlRLBEo2uKchQxaMRkrc02qdRgq4gvv4+rgjyp5YMQezrOly
   pqZfEuu3ku8LiKh5oI4m9wcRz5SVmZ3hjB8ntY4RoMEsp/BvdrEu2oBI5
   z6Job0WYpn/TofneMBFsaYfjgrhB1nVOkA+Fjs2QI3pYD5kvV9Yi+DVyH
   2Y0O3I646oyMrdeFKup8LIyb4sDDP/6Z1OKhWTs6/HmJeNRUv9TSSBtZX
   NAYzMteXZAcs4XznBcxRhI40a9Ef3lg0XIrhuxtiqW3gpoBvgzH6PV3SV
   w==;
X-CSE-ConnectionGUID: l/MSRcNrRYWuTOUsEa0xeQ==
X-CSE-MsgGUID: Te5KFxQPQIecDbqXzRDkRg==
X-IPAS-Result: =?us-ascii?q?A0BFAgAWbApr/9JK/pBaglmCV3VgQ0mWSwOeKYF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFAo4jAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZATAgEDMgFGECAxKx0BDRmDAgGCdAMRugGCLIEBg2kCQ1DbMwELF?=
 =?us-ascii?q?AGBOIVCiCV2hH4nGxuBcoR/gQWBXAGCLoV5BIINFYEMgXKDAolxiiFIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA1uBKyZdASGBB?=
 =?us-ascii?q?oF2AoJRggACAUZBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhC?=
 =?us-ascii?q?AINDHI5EDAcJC8FFyY8GweBDCcdGxcOAigGFSELQxgNSBEsNxUZBD5uB5QSg?=
 =?us-ascii?q?xyBDysEHIFjKQ8CpWShEQoog3mMJJU6GjOqc5kIjgqWUoRqgWg8gUcLB3AVg?=
 =?us-ascii?q?yIJShkPjjknhUPMXCYyPQEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:eFSDnaApkciR6hVW/33iw5YqxClBgxIJ4kV8jS/XYbTApGt31mdTz
 2sXWmzTb/3ZMGfyKNh1a42/8kIGupeHn95iOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/i2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEx7JLN3s9G5ciy9lqPUZz7
 tERcCAAV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4nHfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGIHgBfoO3WjPn8bC586lea5j1H0ciZTrxSeoq9fD237klctjuO9boW9ltqiecgIvWiIn
 1r/3mnyLhsDBM6l5Tm//Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVncjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:7Z3G46DWsy4lsdvlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: 9a23:Ani1OGFZymv+TuTzqmJjs2svIMsDaEfs82rsBHKjJG8xWLCsHAo=
X-Talos-MUID: 9a23:DQD0ggtdFWGcFcfzqM2nuDw/F+l42pyXKU0GvZ8fi9u+GS9KNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,238,1787011200"; 
   d="scan'208";a="63463867"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 28 Nov 2026 05:54:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id CD4F61800081A;
	Sat, 28 Nov 2026 05:54:14 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 7760BCBF202; Fri, 27 Nov 2026 21:54:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 3/3] vim: move CVE-2025-66476 status to shared include
Date: Fri, 27 Nov 2026 21:54:10 -0800
Message-Id: <20261128055410.1928584-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261128055410.1928584-1-dkelaiya@cisco.com>
References: <20261128055410.1928584-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251472
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Move the existing CVE_STATUS entry from vim_9.1.bb to vim.inc so
vim-tiny also inherits the platform exclusion. Both recipes require
the shared include.

The vulnerability concerns command lookup through cmd.exe on Windows
and does not apply to these Linux recipes.

Reference: https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta/recipes-support/vim/vim.inc    | 2 ++
 meta/recipes-support/vim/vim_9.1.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3a8b67085a2..34201807775 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -69,6 +69,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
 # Ignore that the upstream version .z in x.y.z is always newer
 UPSTREAM_VERSION_UNKNOWN = "1"
 
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"
+
 CVE_STATUS[CVE-2026-51400] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
 
 CVE_STATUS[CVE-2026-51401] = "not-applicable-platform: Vulnerable code is in src/os_vms.c, which is not compiled for Linux builds."
diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index 5465a6ef91c..d31d277faee 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -23,5 +23,3 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
-
-CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.35.6

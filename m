Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F853782EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:50:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8D7otiw019992
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 13 Sep 2017 00:50:55 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 13 Sep 2017 00:50:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>,
	<randy.macleod@windriver.com>
Date: Wed, 13 Sep 2017 15:49:55 +0800
Message-ID: <1505288995-19743-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505288995-19743-1-git-send-email-yi.zhao@windriver.com>
References: <1505288995-19743-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] binutils: bump SRCREV to latest 2.29 branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 07:50:55 -0000
Content-Type: text/plain

Update to the latest commit on the 2.29 branch to fix CVEs:
CVE-2017-12448, CVE-2017-12449. CVE-2017-12451, CVE-2017-12452,
CVE-2017-12454, CVE-2017-12455, CVE-2017-12456, CVE-2017-12457,
CVE-2017-12458, CVE-2017-12459, CVE-2017-12799, CVE-2017-12967,
CVE-2017-13710

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-12448
https://nvd.nist.gov/vuln/detail/CVE-2017-12449
https://nvd.nist.gov/vuln/detail/CVE-2017-12451
https://nvd.nist.gov/vuln/detail/CVE-2017-12452
https://nvd.nist.gov/vuln/detail/CVE-2017-12454
https://nvd.nist.gov/vuln/detail/CVE-2017-12455
https://nvd.nist.gov/vuln/detail/CVE-2017-12456
https://nvd.nist.gov/vuln/detail/CVE-2017-12457
https://nvd.nist.gov/vuln/detail/CVE-2017-12458
https://nvd.nist.gov/vuln/detail/CVE-2017-12459
https://nvd.nist.gov/vuln/detail/CVE-2017-12799
https://nvd.nist.gov/vuln/detail/CVE-2017-12967
https://nvd.nist.gov/vuln/detail/CVE-2017-13710

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc b/meta/recipes-devtools/binutils/binutils-2.29.inc
index 8e38093..27d46eb 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "dd241688aee3712803a917315df089f4c714b5ef"
+SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
-- 
2.7.4



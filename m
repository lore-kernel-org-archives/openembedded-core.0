Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51F58745AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 07:53:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U7r2TF005397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 00:53:02 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 30 Oct 2018 00:53:01 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 30 Oct 2018 15:53:00 +0800
Message-ID: <1540885980-278826-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mtd-utils: Update SRC_URI
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
X-List-Received-Date: Tue, 30 Oct 2018 07:53:03 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

The official repo for mtd-utils is git://git.infradead.org/mtd-utils.git,
however there comes below error:
$ git ls-remote git://git.infradead.org/mtd-utils.git
fatal: unable to connect to git.infradead.org:
git.infradead.org[0: 198.137.202.133]: errno=Connection timed out
git.infradead.org[1: 2607:7c80:54:e::133]: errno=Network is unreachable

Use the alternative one instead currently.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index f53c6c1..b71c997 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -13,7 +13,7 @@ RDEPENDS_mtd-utils-tests += "bash"
 PV = "2.0.2+${SRCPV}"
 
 SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
+SRC_URI = "git://github.com/sigma-star/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
 "
-- 
2.7.4



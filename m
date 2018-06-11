Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79BDB6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 02:26:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5B2QN9x014343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 19:26:39 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 10 Jun 2018 19:26:12 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jun 2018 10:26:10 +0800
Message-ID: <1528683970-28397-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [rocko][PATCH] lsb/lsbtests: Update package lists to use latest version of binary
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
X-List-Received-Date: Mon, 11 Jun 2018 02:26:48 -0000
Content-Type: text/plain

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Currently  package list is pointing to  "lsb-setup-4.1.0-1.noarch.rpm"
which is not available anymore on
http://ftp.linuxfoundation.org/pub/lsb/base/released-all/binary/ hence
BASE_PACKAGES_LIST is updated to point to the latest available version.

[YOCTO #12240]

(From OE-Core rev: a1e61b05d83de0feeb6d05851477108902d1dfb0)

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index 959f931..1a6c116 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -1,7 +1,7 @@
 LSB_RELEASE="released-5.0"
 LSB_ARCH="lsbarch"
 
-BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
+BASE_PACKAGES_LIST="lsb-setup-5.0.0-2.noarch.rpm"
 
 RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-5.0.0.1-1.targetarch.rpm \
 	lsb-tet3-lite-3.7-27.lsb5.targetarch.rpm \
-- 
2.7.4



Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4599660017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B5wb6H014686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:38 +0800
Message-ID: <f31da8104da2e90fe4d15510726f8e6f35533471.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] pciutils: upgrade to 3.4.1
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:39 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.3.1.bb => pciutils_3.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.3.1.bb => pciutils_3.4.1.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.3.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
index 91a8cd3..794419a 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "4c340a317987d61a11ee2cf139ef1191"
-SRC_URI[sha256sum] = "514a3bdb77e4cdbe9e970e1885af46e0ba2011bf97364368c455ade0edd4e3a9"
+SRC_URI[md5sum] = "35763bb1eab7bc9bf6eb6efb72cbc8a1"
+SRC_URI[sha256sum] = "865554cc5604d1644bd8da38d94845405e2a319a6d5acabc6a0296417684a82a"
 
 inherit multilib_header
 
-- 
1.9.1



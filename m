Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38D7273C48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 02:25:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3R2PvWH023189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 19:25:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 26 Apr 2015 19:25:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 10:25:54 +0800
Message-ID: <bbe315926983b536785530aadbadb36b285ec9c4.1430101500.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430101500.git.Qi.Chen@windriver.com>
References: <cover.1430101500.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] pciutils: upgrade to 3.3.1
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
X-List-Received-Date: Mon, 27 Apr 2015 02:25:59 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.3.0.bb => pciutils_3.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.3.0.bb => pciutils_3.3.1.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
index 7a3a0c6..91a8cd3 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.3.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "3c19adf32a8457983b71ff376ef7dafe"
-SRC_URI[sha256sum] = "413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7801301"
+SRC_URI[md5sum] = "4c340a317987d61a11ee2cf139ef1191"
+SRC_URI[sha256sum] = "514a3bdb77e4cdbe9e970e1885af46e0ba2011bf97364368c455ade0edd4e3a9"
 
 inherit multilib_header
 
-- 
1.9.1



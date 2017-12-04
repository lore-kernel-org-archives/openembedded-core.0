Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 04D9D7856A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 10:24:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4AOI7u007503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 02:24:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 4 Dec 2017 02:24:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Dec 2017 18:25:35 +0800
Message-ID: <4d8a69a3f850503261b08904db050d7af38a124c.1512383059.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1512383059.git.Qi.Chen@windriver.com>
References: <cover.1512383059.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] pciutils: upgrade to 3.5.6
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
X-List-Received-Date: Mon, 04 Dec 2017 10:24:18 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/{pciutils_3.5.5.bb => pciutils_3.5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.5.5.bb => pciutils_3.5.6.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.5.5.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
index 0051fd8..b18b7da 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.5.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
@@ -11,8 +11,8 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[md5sum] = "238d9969cc0de8b9105d972007d9d546"
-SRC_URI[sha256sum] = "1d62f8fa192f90e61c35a6fc15ff3cb9a7a792f782407acc42ef67817c5939f5"
+SRC_URI[md5sum] = "8e52278399b7b35fcfc031bc05da80a8"
+SRC_URI[sha256sum] = "f346eeb90cce0910c05b877fe49eadc760fa084c0455fd313e39d4b2c2d4bb21"
 
 inherit multilib_header pkgconfig
 
-- 
1.9.1



Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7066BC09
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 02:34:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r892Y60q029810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Sep 2013 19:34:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 8 Sep 2013 19:34:04 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 10:34:40 +0800
Message-ID: <3fa6f36a10a2dad95c58d9525e631848df987c0a.1378694025.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378694025.git.Qi.Chen@windriver.com>
References: <cover.1378694025.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sysvinit: fix indentation
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
X-List-Received-Date: Mon, 09 Sep 2013 02:34:03 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix indentation in SRC_URI to conform to the indentation convention in OE.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 03bbc1b..ac915b7 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -10,15 +10,15 @@ PR = "r11"
 RDEPENDS_${PN} = "${PN}-inittab"
 
 SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
-	   file://install.patch \
-	   file://crypt-lib.patch \
-	   file://pidof-add-m-option.patch \
+           file://install.patch \
+           file://crypt-lib.patch \
+           file://pidof-add-m-option.patch \
            file://need \
            file://provide \
            file://rcS-default \
            file://rc \
            file://rcS \
-	   file://bootlogd.init"
+           file://bootlogd.init"
 
 SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
 SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
-- 
1.7.9.5



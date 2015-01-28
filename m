Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6110A718E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 08:57:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S8v7If023230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 00:57:07 -0800 (PST)
Received: from android-OptiPlex-980.corp.ad.wrs.com (128.224.163.162) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 28 Jan 2015 00:57:06 -0800
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jan 2015 16:57:05 +0800
Message-ID: <1422435425-20620-1-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V2][PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Wed, 28 Jan 2015 08:57:10 -0000
Content-Type: text/plain

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 .../mesa/{mesa-gl_10.3.4.bb => mesa-gl_10.4.0.bb}  |    0
 .../mesa/{mesa_10.3.4.bb => mesa_10.4.0.bb}        |    4 ++--
 meta/recipes-graphics/mesa/mesa_git.bb             |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.3.4.bb => mesa-gl_10.4.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.3.4.bb => mesa_10.4.0.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.4.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa_10.3.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_10.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_10.4.0.bb
index 50092c9..7d3723e 100644
--- a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "fa0558a3d02c2bb8c208c030ccdc992e"
-SRC_URI[sha256sum] = "e6373913142338d10515daf619d659433bfd2989988198930c13b0945a15e98a"
+SRC_URI[md5sum] = "b7b37117eecbdfaaf3075acfb063d5a3"
+SRC_URI[sha256sum] = "98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index b046ae2..e554ff4 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -4,8 +4,8 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
 
-SRCREV = "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
-PV = "10.3.4+git${SRCPV}"
+SRCREV = "f70e4d4afd16e66506ce3b055edb3b71b1464890"
+PV = "10.4.3+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.4"
 
-- 
1.7.9.5



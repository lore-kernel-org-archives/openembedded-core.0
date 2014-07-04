Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A42265CA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 09:16:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s649Gb2H021959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 02:16:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Jul 2014 02:16:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 02:16:37 -0700
Message-ID: <28a4822de67dfb01eddd7cc9f10bd820411e1425.1404465351.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404465351.git.liezhi.yang@windriver.com>
References: <cover.1404465351.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass/buildtools-tarball: cleanup the RDEPENDS
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
X-List-Received-Date: Fri, 04 Jul 2014 09:16:37 -0000
Content-Type: text/plain

The "RDEPENDS =" should be replaced by RDEPENDS_${PN}, the similar to
RRECOMMENDS

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass                   |    4 ++--
 meta/recipes-core/meta/buildtools-tarball.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a03b880..136fe82 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -11,8 +11,8 @@ inherit gzipnative
 LICENSE = "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
-RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
-RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
+RDEPENDS_${PN} += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
+RRECOMMENDS_${PN} += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 62e1e0b..7501525 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -45,7 +45,7 @@ TOOLCHAIN_HOST_TASK ?= "\
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
 
-RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
+RDEPENDS_${PN} = "${TOOLCHAIN_HOST_TASK}"
 
 EXCLUDE_FROM_WORLD = "1"
 
-- 
1.7.9.5



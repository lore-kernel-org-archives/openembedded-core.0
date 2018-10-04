Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 826E8799F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 15:24:27 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w94FORFH010259
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Oct 2018 17:24:28 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.77.245])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w94FOR17023963;
	Thu, 4 Oct 2018 17:24:27 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 88E111019FD3;
	Thu,  4 Oct 2018 17:24:28 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 17:24:19 +0200
Message-Id: <20181004152419.27370-2-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004152419.27370-1-pascal.bach@siemens.com>
References: <20181004152419.27370-1-pascal.bach@siemens.com>
Subject: [PATCH 2/2] piglit: inherit pkgconfig
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
X-List-Received-Date: Thu, 04 Oct 2018 15:24:28 -0000

The CMakeLists.txt of piglit uses pkgconfig internally.
This makes sure pkgconfig-native is available in any case.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3292d4cad0..9e45751648 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
-inherit cmake python3native distro_features_check bash-completion
+inherit cmake pkgconfig python3native distro_features_check bash-completion
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.11.0



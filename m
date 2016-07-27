Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 479B360746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:55:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 14:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854815527"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:55:45 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 21:52:58 +0000
Message-Id: <4da54d831c7002a28d51e3edf23fbee28d98d948.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/5] cronie: upgrade to 1.5.1
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
X-List-Received-Date: Wed, 27 Jul 2016 21:55:44 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.0.bb => cronie_1.5.1.bb} (95%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.0.bb b/meta/recipes-extended/cronie/cronie_1.5.1.bb
similarity index 95%
rename from meta/recipes-extended/cronie/cronie_1.5.0.bb
rename to meta/recipes-extended/cronie/cronie_1.5.1.bb
index 697501a..99b2bb5 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.5.1.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "9db75e1884d83a45e002d145c6c54d45"
-SRC_URI[sha256sum] = "9cf0e3f4f5042a9c09413d62c8e0c055e12401f70b112465f0f81f2c84ebfb3f"
+SRC_URI[md5sum] = "910e6effcc032998b0a49fbd46322e18"
+SRC_URI[sha256sum] = "6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.6.6



Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4w0K-0005Cy-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:41:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 08:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190888399"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 08:28:22 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 17:33:07 +0300
Message-Id: <4b1568a3462441f970fb69d042e74074d4649a42.1345818232.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
Subject: [PATCH 4/4] base-passwd: upgrade to 3.5.26
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 15:41:01 -0000

The S variable is now the default one.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../nobash.patch                                   |    0
 .../root-home.patch                                |    0
 ...base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} |    6 ++----
 3 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/root-home.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} (94%)

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.24/nobash.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.26/nobash.patch
similarity index 100%
rename from meta/recipes-core/base-passwd/base-passwd-3.5.24/nobash.patch
rename to meta/recipes-core/base-passwd/base-passwd-3.5.26/nobash.patch
diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.24/root-home.patch b/meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch
similarity index 100%
rename from meta/recipes-core/base-passwd/base-passwd-3.5.24/root-home.patch
rename to meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.24.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
similarity index 94%
rename from meta/recipes-core/base-passwd/base-passwd_3.5.24.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
index 0d6f580..2073b3f 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.24.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.26.bb
@@ -9,10 +9,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/b/base-passwd/base-passwd_${PV}.tar.gz \
            file://nobash.patch \
            file://root-home.patch"
 
-SRC_URI[md5sum] = "8f6b9420c50e90edaff41eb2fb7e9e16"
-SRC_URI[sha256sum] = "196083d6f675190d4e2cede0a5fa6b3c91088705c5386f76292fec8e74b6369e"
-
-S = "${WORKDIR}/base-passwd"
+SRC_URI[md5sum] = "74245e5c21dc74d9675c77cd8dfa02e6"
+SRC_URI[sha256sum] = "258a78317aa563143d10375c6e1e63a60898e503887f00fffd70b6b297c1b429"
 
 inherit autotools
 
-- 
1.7.9.5




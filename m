Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEM-0000rV-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129564323"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:32:31 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:09 +0800
Message-Id: <f01cdb8dfd2799c5409a1a36788855298edcadbc.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 12/60] ofono: upgrade to 1.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:41:18 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../ofono/{ofono_1.3.bb => ofono_1.5.bb}           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.3.bb => ofono_1.5.bb} (66%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.3.bb b/meta/recipes-connectivity/ofono/ofono_1.5.bb
similarity index 66%
rename from meta/recipes-connectivity/ofono/ofono_1.3.bb
rename to meta/recipes-connectivity/ofono/ofono_1.5.bb
index ed664a2..d0f273b 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.3.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.5.bb
@@ -10,5 +10,5 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
 "
 
-SRC_URI[md5sum] = "dbe381b739c0e7830e6c075f81c8e168"
-SRC_URI[sha256sum] = "02a9f1f7c1b8eeb8868290d119fe5dc90b0b5c0b6199bed5293dc06a8bf7ebeb"
+SRC_URI[md5sum] = "a54935a2a86b90300410c6c033284f6c"
+SRC_URI[sha256sum] = "3a70608c17f3dca34c1e057aacdf836021322dfdcaf9edc777119eafe48076b3"
-- 
1.7.6




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RlTHS-0005hh-F8
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:37:58 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 14:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97808823"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 14:30:25 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 14:30:18 -0800
Message-Id: <eba3057f651fab065aa053095e5d0bb0c53e1c41.1326406744.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
References: <e7790b276b6dfce808bb6b70fe2847af657cd7b5.1326406744.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326406744.git.nitin.a.kamble@intel.com>
References: <cover.1326406744.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/7] libpcre: upgrade from 8.20 to 8.21
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
X-List-Received-Date: Thu, 12 Jan 2012 22:37:58 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libpcre/{libpcre_8.20.bb => libpcre_8.21.bb}   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.20.bb => libpcre_8.21.bb} (93%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.20.bb b/meta/recipes-support/libpcre/libpcre_8.21.bb
similarity index 93%
rename from meta/recipes-support/libpcre/libpcre_8.20.bb
rename to meta/recipes-support/libpcre/libpcre_8.21.bb
index 58c6ecf..4eb65d7 100644
--- a/meta/recipes-support/libpcre/libpcre_8.20.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
@@ -12,8 +12,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch"
 
-SRC_URI[md5sum] = "a1931c70e1273e3450d5036fe273d25c"
-SRC_URI[sha256sum] = "e06b0943ce4b0f15324a20020d6086760a75b72f5ad7c23b9b2bfe690ed49acd"
+SRC_URI[md5sum] = "0a7b592bea64b7aa7f4011fc7171a730"
+SRC_URI[sha256sum] = "a4b8509d11fc2764fb4e1415b764ad2c214459edc011ce48aeeb6bbe1ac599e3"
+
 S = "${WORKDIR}/pcre-${PV}"
 
 PROVIDES = "pcre"
-- 
1.7.6.4




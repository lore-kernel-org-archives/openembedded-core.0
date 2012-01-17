Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ap-0006gw-He
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632872"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:57 -0800
Message-Id: <2e918130f8b2c0a5ba05f82327a36e2a9f963aa9.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/62] libpcre: upgrade from 8.20 to 8.21
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:36 -0000

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
1.7.6.5




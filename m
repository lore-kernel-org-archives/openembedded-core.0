Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7O-0006a3-R7
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147105"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:36:13 -0700
Message-Id: <527a7669b89693abe83d557ba22e64d6a5554c81.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 21/22] external-*toolchain: remove glibc-utils provide
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:56 -0000

This was causing a multiple providers error

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../meta/external-csl-toolchain_2008q3-72.bb       |    4 ++--
 meta/recipes-core/meta/external-poky-toolchain.bb  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index a874c8b..1cd45d2 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -16,9 +16,9 @@ PROVIDES = "\
 	virtual/libiconv \
 	glibc-thread-db \
 	virtual/linux-libc-headers "
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
+RPROVIDES = "libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r1"
+PR = "r2"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
 
diff --git a/meta/recipes-core/meta/external-poky-toolchain.bb b/meta/recipes-core/meta/external-poky-toolchain.bb
index 5507746..b4b4418 100644
--- a/meta/recipes-core/meta/external-poky-toolchain.bb
+++ b/meta/recipes-core/meta/external-poky-toolchain.bb
@@ -9,10 +9,10 @@ PROVIDES = "\
     virtual/libintl \
     virtual/libiconv \
     virtual/linux-libc-headers "
-RPROVIDES = "glibc-utils libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
+RPROVIDES = "libsegfault glibc-thread-db libgcc-dev libstdc++-dev libstdc++"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
 INHIBIT_DEFAULT_DEPS = "1"
-PR = "r1"
+PR = "r2"
 
 # License applies to this recipe code, not the toolchain itself
 LICENSE = "MIT"
-- 
1.7.3.4




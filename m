Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJz88-00086h-Oi
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 04:26:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 19:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="745470679"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2011 19:23:41 -0700
Message-Id: <4959de180c316a6f7b54bec5e5080eaf110eea2d.1305080470.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305080470.git.nitin.a.kamble@intel.com>
References: <cover.1305080470.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 19:00:10 -0700
Date: Tue, 10 May 2011 19:23:44 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] poky-defaults: fix defaults for libgcc recipes
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
X-List-Received-Date: Wed, 11 May 2011 02:26:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug: [YOCTO #1021]

the libgcc version was getting picked up as latest, which may not match
with the version of gcc. And because of this the crt*.o files were
missing from the resulting libgcc-dev package.

libgcc1-4.6.0-r0.i586
perl-module-extutils-cbuilder-platform-windows-gcc-5.12.3-r0.i586
gcc-4.5.1-r4.i586
libgcc-s-dev-4.6.0-r0.i586
gcc-symlinks-4.5.1-r4.i586

/lib
/lib/libgcc_s.so

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/poky-default.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro/include/poky-default.inc
index 91985b3..0003865 100644
--- a/meta/conf/distro/include/poky-default.inc
+++ b/meta/conf/distro/include/poky-default.inc
@@ -35,6 +35,8 @@ PREFERRED_VERSION_gcc-crosssdk-intermediate ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_gcc-cross-canadian ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-runtime-nativesdk ?= "${SDKGCCVERSION}"
+PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
+PREFERRED_VERSION_libgcc-nativesdk ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-cross ?= "${BINUVERSION}"
 PREFERRED_VERSION_binutils-crosssdk ?= "${BINUVERSION}"
-- 
1.7.2.2




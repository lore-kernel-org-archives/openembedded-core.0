Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PxjQv-0001F2-Hm
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 18:13:56 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Mar 2011 08:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,297,1297065600"; d="scan'208";a="895914524"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2011 08:51:39 -0800
Message-Id: <56fde9d6e6adfddc3ee3a01082f7013e6120da18.1299775598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299775598.git.sgw@linux.intel.com>
References: <cover.1299775598.git.sgw@linux.intel.com>
Old-Date: Tue, 8 Mar 2011 18:50:02 -0600
Date: Thu, 10 Mar 2011  8:51:37 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Liping Ke <liping.ke@intel.com>
Subject: [PATCH 4/8] gcc-runtime: Ensure that gcc-runtime builds a debug package
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
X-List-Received-Date: Thu, 10 Mar 2011 17:13:56 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The gcc-runtime package will now create the proper dbg package.  The
RRECOMMENDS change is required to deal with the default.  This is
documented in bug 824.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-package-runtime.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index e8c9011..04c70c0 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -1,4 +1,5 @@
 PACKAGES = "\
+  ${PN}-dbg \
   libstdc++ \
   libstdc++-precompile-dev \
   libstdc++-dev \
@@ -11,6 +12,8 @@ PACKAGES = "\
   libmudflap \
   libmudflap-dev \
 "
+# The base package doesn't exist, so we clear the recommends.
+RRECOMMENDS_${PN}-dbg = ""
 
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
 FILES_libg2c-dev = "\
-- 
1.7.1.1




Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJYHB-0006va-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 23:46:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 May 2011 14:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,342,1301900400"; d="scan'208";a="433218803"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2011 14:43:15 -0700
Message-Id: <cover.1304977276.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 9 May 2011 14:41:16 -0700
Date: Mon, 09 May 2011 14:43:15 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/5] Misc fixes related to gcc 4.6.0
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
X-List-Received-Date: Mon, 09 May 2011 21:46:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Khem Raj (1):
  gcc-4.6.0: Apply linaro patches

Nitin A Kamble (4):
  mdadm: compilation fix for gcc 4.6.0
  pax: fix for compiling with gcc 4.6.0
  systemtap: fix for compilation with gcc 4.6.0
  kexec-tools: fix compiler errors with gcc 4.6.0

 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   51 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   63 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   32 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   28 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  653 ++++++++++++++++++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  126 ++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  177 ++++++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
 .../mdadm/fix_for_compilation_with_gcc-4.6.0.patch |  174 ++++++
 meta/recipes-extended/mdadm/mdadm_3.2.1.bb         |    5 +-
 .../pax/pax/fix_for_compile_with_gcc-4.6.0.patch   |   25 +
 meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
 .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 ++
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb     |    3 +-
 .../fix_for_compilation_with_gcc-4.6.0.patch       |  119 ++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
 17 files changed, 1511 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
 create mode 100644 meta/recipes-extended/mdadm/mdadm/fix_for_compilation_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch

-- 
1.7.3.4




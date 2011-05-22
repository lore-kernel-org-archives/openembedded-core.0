Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOCE9-0007sM-UV
	for openembedded-core@lists.openembedded.org;
	Sun, 22 May 2011 19:14:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 May 2011 10:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,252,1304319600"; d="scan'208";a="440891695"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2011 10:11:05 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Sun, 22 May 2011 10:10:48 -0700
Message-Id: <cover.1306080531.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
Subject: [PATCH 0/3] switch to newer eglibc & gcc versions
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
X-List-Received-Date: Sun, 22 May 2011 17:14:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Switch to eglibc 2.13 from 2.12
Switch to gcc 4.6.0 from 4.5.1 for mips & powerpc

Tested meta-toolchain, core-image-lsb-sdk & core-image-sato-sdk images with 
these commits. And didn't notice any breakage. sdk compiler is working inside
the images. and basic programs are working well inside the images.

Also update patch status for some gplv2 recipes

The following changes since commit fc55b224caa3eeac4abda099ec9ed505db59fb28:

  base.bbclass: use oe.data for OE_IMPORTS (2011-05-20 17:34:23 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  tcmode-default: switch to eglibc 2.13 from 2.12
  tcmode-default: switch to gcc 4.6.0 for ppc & mips also
  gplv2 recipes update upstream status of patches

 meta/conf/distro/include/tcmode-default.inc        |    6 +-----
 meta/recipes-extended/at/at-3.1.12/configure.patch |    2 ++
 .../cpio/cpio-2.8/m4extensions.patch               |    2 ++
 meta/recipes-extended/cpio/cpio-2.8/statdef.patch  |    2 ++
 .../grep/grep-2.5.1a/uclibc-fix.patch              |    2 ++
 .../recipes-extended/tar/tar-1.17/gcc43build.patch |    2 ++
 .../tar/tar-1.17/m4extensions.patch                |    2 ++
 7 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.7.3.4




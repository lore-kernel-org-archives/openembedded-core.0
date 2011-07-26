Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qlbvb-0000tH-Jp
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:19:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2011 00:15:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="31467620"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 00:15:29 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	nitin.a.kamble@intel.com
Date: Mon, 25 Jul 2011 17:48:26 -0700
Message-Id: <cover.1311641177.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RFC x32 0/3] X32 commits on top of rpurdie/ml3 branch
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
X-List-Received-Date: Tue, 26 Jul 2011 07:19:44 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits are getting tested. sending out just for review now.

The following changes since commit f5a884ab6c7db44152f17b6ca7e07967df87710a:

  bitbake/cache: allow class names with arguments to be specified (2011-07-22 18:50:56 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/ml3.x32
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/ml3.x32

Nitin A Kamble (3):
  x86 tune inc files: add x32 abi tune parameters
  toolchain-scripts & other classes: add TARGET_LD_ARCH &
    TARGET_AS_ARCH     vars
  siteinfo: select right siteinfo as per x86_64 ABIs

 meta/classes/allarch.bbclass                 |    2 +
 meta/classes/cross-canadian.bbclass          |    2 +
 meta/classes/cross.bbclass                   |    2 +
 meta/classes/crosssdk.bbclass                |    2 +
 meta/classes/native.bbclass                  |   10 ++++++--
 meta/classes/nativesdk.bbclass               |    4 +++
 meta/classes/siteinfo.bbclass                |   14 ++++++++++++-
 meta/classes/toolchain-scripts.bbclass       |    9 ++++---
 meta/conf/bitbake.conf                       |   23 ++++++++++++++++-----
 meta/conf/machine/include/ia32/arch-ia32.inc |   27 +++++++++++++++++++++----
 meta/conf/machine/include/tune-core2.inc     |    8 +++++-
 meta/conf/machine/include/tune-i586.inc      |    4 +-
 meta/conf/machine/include/tune-x86_64.inc    |    2 +-
 13 files changed, 85 insertions(+), 24 deletions(-)

-- 
1.7.6




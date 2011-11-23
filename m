Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RT5ua-0004AK-0Z
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 07:02:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 21:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79104182"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 21:55:51 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 21:55:46 -0800
Message-Id: <cover.1322027494.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/3] Various Fixes
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
X-List-Received-Date: Wed, 23 Nov 2011 06:02:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This set has fixes for gmp, at & site/x86-64-linux

- Nitin

The following changes since commit 40fe6457d5ca49fe113bc26c60d5add59d85b34f:

  matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:26 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (3):
  gmp: also generate the libgmpcxx library
  at: update the upstream-status of patches
  site/x86_64-linux: add cvs config variables

 .../at/at-3.1.12/configure-add-enable-pam.patch    |    5 +++++
 meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |    3 +++
 .../at/files/file_replacement_with_gplv2.patch     |    2 ++
 .../at/files/nonstripbinaries.patch                |    1 +
 meta/recipes-extended/at/files/use-ldflags.patch   |    5 +++++
 meta/recipes-support/gmp/gmp.inc                   |    4 ++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
 meta/site/x86_64-linux                             |    3 +++
 9 files changed, 25 insertions(+), 2 deletions(-)

-- 
1.7.6.4




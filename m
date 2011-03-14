Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Pz6Vi-000540-L4
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:04:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2011 05:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="612680978"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Pz6MI-0005FP-7G; Mon, 14 Mar 2011 19:54:46 +0800
Message-Id: <cover.1300103431.git.qing.he@intel.com>
Old-Date: Mon, 14 Mar 2011 19:50:31 +0800
Date: Mon, 14 Mar 2011 19:54:46 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 0/4] zypper architecture tuning
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
X-List-Received-Date: Mon, 14 Mar 2011 12:04:30 -0000

From: Qing He <qing.he@intel.com>

Zypper and its dependencies used a hard coded list for all the
archs it supports, which doesn't contains several cpu archs like mips,
as well as the ${MACHINE_ARCH} used in poky. This patch set intends to
add this support.

Also fixes package archs of qemux86-64.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: qhe/zypp1
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=qhe/zypp1

Thanks,
    Qing He <qing.he@intel.com>
---


Qing He (4):
  sat-solver: add machine arch support
  libzypp: add machine arch support
  zypper: add machine arch support
  qemux86-64: set qemux86_64 as package arch name

 meta/conf/bitbake.conf                             |    3 +-
 .../libzypp/libzypp/archconf.patch                 |   15 +++
 .../libzypp/libzypp/builtin-arch.patch             |  122 +++++++++++++++++++
 .../libzypp/libzypp/no-builtin-arch.patch          |  128 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |   28 ++++-
 .../sat-solver/sat-solver/builtin-arch.patch       |   28 +++++
 .../sat-solver/sat-solver/no-builtin-arch.patch    |   29 +++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   28 ++++-
 meta/recipes-extended/zypper/zypper_git.bb         |    4 +-
 9 files changed, 380 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/archconf.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/builtin-arch.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/no-builtin-arch.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch




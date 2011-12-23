Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Re7bS-0003eO-3R
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:04:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 07:57:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="50123305"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.71])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Dec 2011 07:57:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 15:57:00 +0000
Message-Id: <cover.1324655504.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix reported issue with CentOS 5.4
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
X-List-Received-Date: Fri, 23 Dec 2011 16:04:15 -0000

Chris Larson reported that the previous fix to automatically disable kvm
support in qemu-native didn't work for him on CentOS 5.4 - he needed to
explicitly add --disable-kvm rather than just omit --enable-kvm. Although
5.4 is quite old by now if it doesn't cause any harm (and it causes no
ill effects on CentOS 5.7) given the trivial nature of the patch I
figured it was worthwhile.

The following changes since commit c38693f78c968ab5f4bb557c20d1c8c55393ed6b:

  opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qemu-kvm2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qemu-kvm2

Paul Eggleton (1):
  qemu: explicitly disable kvm support for native without kvm header

 meta/recipes-devtools/qemu/qemu.inc       |    2 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.5.4




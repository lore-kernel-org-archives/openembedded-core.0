Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFC016D138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:45:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 09:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418598701"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 09:44:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 16:44:37 +0000
Message-Id: <cover.1382978401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/3] Recipe upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2013 16:45:14 -0000

The following changes since commit 8081dcb03f54efd551d1c8fe8a0484f8270053e0:

  pigz: bump to 2.3.1 (2013-10-26 16:08:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (3):
  ethtool: upgrade to 3.11
  openssh: upgrade to 6.3p1
  cmake: upgrade to 2.8.12

 .../openssh/openssh-6.2p2/mac.patch                | 76 ----------------------
 .../openssh/{openssh-6.2p2 => openssh-6.3p1}/init  |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/nostrip.patch |  0
 .../openssh-CVE-2011-4327.patch                    |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/ssh_config    |  0
 .../openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd  |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd.socket   |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd@.service |  0
 .../{openssh-6.2p2 => openssh-6.3p1}/sshd_config   |  0
 .../sshdgenkeys.service                            |  0
 .../volatiles.99_sshd                              |  0
 .../openssh/{openssh_6.2p2.bb => openssh_6.3p1.bb} |  6 +-
 ...e-native_2.8.11.2.bb => cmake-native_2.8.12.bb} |  4 +-
 .../cmake/{cmake_2.8.11.2.bb => cmake_2.8.12.bb}   |  7 +-
 .../{ethtool-3.10 => ethtool-3.11}/run-ptest       |  0
 .../ethtool/{ethtool_3.10.bb => ethtool_3.11.bb}   |  4 +-
 16 files changed, 8 insertions(+), 89 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.2p2 => openssh-6.3p1}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.2p2.bb => openssh_6.3p1.bb} (96%)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.11.2.bb => cmake-native_2.8.12.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.2.bb => cmake_2.8.12.bb} (78%)
 rename meta/recipes-extended/ethtool/{ethtool-3.10 => ethtool-3.11}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.10.bb => ethtool_3.11.bb} (87%)

-- 
1.8.1.2



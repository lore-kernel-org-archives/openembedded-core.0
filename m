Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 06EC16F203
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064772"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:17 +0000
Message-Id: <cover.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/6] Recipe upgrades
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:29 -0000

The following changes since commit 9c5734b91c274be85200a9790202326dd6debfc1:

  linux-yocto-dev: bump to v3.14-rc4 (2014-02-28 14:51:35 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (6):
  openssh: upgrade to 6.5p1
  ethtool: upgrade to 3.13
  cmake: upgrade to 2.8.12.2
  augeas: upgrade to 1.2.0
  chrpath: upgrade to 0.16
  dropbear: upgrade to 2014.63

 .../openssh/{openssh-6.4p1 => openssh}/init        |  0
 .../{openssh-6.4p1 => openssh}/nostrip.patch       |  0
 .../openssh-CVE-2011-4327.patch                    |  0
 .../openssh/{openssh-6.4p1 => openssh}/ssh_config  |  0
 .../openssh/{openssh-6.4p1 => openssh}/sshd        |  0
 .../openssh/{openssh-6.4p1 => openssh}/sshd.socket |  0
 .../{openssh-6.4p1 => openssh}/sshd@.service       |  0
 .../openssh/{openssh-6.4p1 => openssh}/sshd_config |  0
 .../{openssh-6.4p1 => openssh}/sshdgenkeys.service |  0
 .../{openssh-6.4p1 => openssh}/volatiles.99_sshd   |  0
 .../openssh/{openssh_6.4p1.bb => openssh_6.5p1.bb} |  4 +-
 meta/recipes-core/dropbear/dropbear.inc            |  1 -
 .../dropbear/dropbear/0002-static_build_fix.patch  | 64 ----------------------
 meta/recipes-core/dropbear/dropbear_2013.62.bb     |  4 --
 meta/recipes-core/dropbear/dropbear_2014.63.bb     |  4 ++
 .../chrpath/{chrpath_0.15.bb => chrpath_0.16.bb}   |  6 +-
 ...native_2.8.12.1.bb => cmake-native_2.8.12.2.bb} |  4 +-
 .../cmake/{cmake_2.8.12.1.bb => cmake_2.8.12.2.bb} |  4 +-
 meta/recipes-extended/augeas/augeas_1.1.0.bb       |  6 --
 meta/recipes-extended/augeas/augeas_1.2.0.bb       |  5 ++
 .../ethtool/{ethtool-3.12.1 => ethtool}/run-ptest  |  0
 .../ethtool/{ethtool_3.12.1.bb => ethtool_3.13.bb} |  6 +-
 22 files changed, 21 insertions(+), 87 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.4p1.bb => openssh_6.5p1.bb} (97%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.62.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2014.63.bb
 rename meta/recipes-devtools/chrpath/{chrpath_0.15.bb => chrpath_0.16.bb} (78%)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.12.1.bb => cmake-native_2.8.12.2.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.12.1.bb => cmake_2.8.12.2.bb} (88%)
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.1.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.2.0.bb
 rename meta/recipes-extended/ethtool/{ethtool-3.12.1 => ethtool}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.12.1.bb => ethtool_3.13.bb} (81%)

-- 
1.8.5.3



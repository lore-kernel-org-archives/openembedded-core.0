Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB0E6D476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:59:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2013 05:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="406830929"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.166])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2013 05:59:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 13:59:08 +0000
Message-Id: <cover.1384176729.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] Recipe upgrades
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
X-List-Received-Date: Mon, 11 Nov 2013 13:59:22 -0000

The following changes since commit eac8cb7cacab7f2fb392128aa5ebc2046ca4a793:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (4):
  cmake: upgrade to 2.8.12.1
  ethtool: upgrade to 3.12.1
  nfs-utils: upgrade to 1.2.9
  openssh: upgrade to 6.4p1

 .../nfs-utils/{nfs-utils_1.2.8.bb => nfs-utils_1.2.9.bb}              | 4 ++--
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/init                     | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/nostrip.patch            | 0
 .../{openssh-6.3p1 => openssh-6.4p1}/openssh-CVE-2011-4327.patch      | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/ssh_config               | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd                     | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd.socket              | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd@.service            | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd_config              | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshdgenkeys.service      | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/volatiles.99_sshd        | 0
 .../openssh/{openssh_6.3p1.bb => openssh_6.4p1.bb}                    | 4 ++--
 .../cmake/{cmake-native_2.8.12.bb => cmake-native_2.8.12.1.bb}        | 4 ++--
 meta/recipes-devtools/cmake/{cmake_2.8.12.bb => cmake_2.8.12.1.bb}    | 4 ++--
 .../ethtool/{ethtool-3.11 => ethtool-3.12.1}/run-ptest                | 0
 meta/recipes-extended/ethtool/{ethtool_3.11.bb => ethtool_3.12.1.bb}  | 4 ++--
 16 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.8.bb => nfs-utils_1.2.9.bb} (95%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.3p1.bb => openssh_6.4p1.bb} (97%)
 rename meta/recipes-devtools/cmake/{cmake-native_2.8.12.bb => cmake-native_2.8.12.1.bb} (58%)
 rename meta/recipes-devtools/cmake/{cmake_2.8.12.bb => cmake_2.8.12.1.bb} (88%)
 rename meta/recipes-extended/ethtool/{ethtool-3.11 => ethtool-3.12.1}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.11.bb => ethtool_3.12.1.bb} (87%)

-- 
1.8.1.2



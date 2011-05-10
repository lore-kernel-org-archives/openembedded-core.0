Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QJdAX-0003YV-0N
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 04:59:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 19:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,344,1301900400"; d="scan'208";a="744821801"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 19:56:42 -0700
Message-Id: <cover.1304995908.git.dexuan.cui@intel.com>
Old-Date: Tue, 10 May 2011 10:51:48 +0800
Date: Tue, 10 May 2011 10:54:07 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/1] rsync (GPLv2): fix security vulnerability CVE-2007-4091
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
X-List-Received-Date: Tue, 10 May 2011 02:59:29 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

The patch is from https://issues.rpath.com/browse/RPL-1647 and is used to
address http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2007-4091

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (1):
  rsync (GPLv2):  fix security vulnerability CVE-2007-4091

 .../rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch  |   70 ++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_2.6.9.bb         |    3 +-
 2 files changed, 72 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rsync/rsync-2.6.9/rsync-2.6.9-fname-obo.patch

-- 
1.7.2




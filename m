Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QKTUe-0008DA-Sv
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 12:51:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 03:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434856559"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 03:48:55 -0700
Message-Id: <cover.1305196874.git.dexuan.cui@intel.com>
Old-Date: Thu, 12 May 2011 18:41:14 +0800
Date: Thu, 12 May 2011 18:49:27 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/1] Automatically generate package repos for rpm and deb [bug #1024]
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
X-List-Received-Date: Thu, 12 May 2011 10:51:45 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

This was made to address http://bugzilla.yoctoproject.org/show_bug.cgi?id=1024.
Please comment.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (1):
  package-index-{ipk, rpm, deb}.bb: add the package-index for rpm and
    deb

 meta/recipes-core/meta/package-index-deb.bb        |   10 ++++++++++
 meta/recipes-core/meta/package-index-ipk.bb        |   11 +++++++++++
 meta/recipes-core/meta/package-index-rpm.bb        |   10 ++++++++++
 .../meta/{package-index.bb => package-index.inc}   |    8 --------
 4 files changed, 31 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/meta/package-index-deb.bb
 create mode 100644 meta/recipes-core/meta/package-index-ipk.bb
 create mode 100644 meta/recipes-core/meta/package-index-rpm.bb
 rename meta/recipes-core/meta/{package-index.bb => package-index.inc} (69%)

-- 
1.7.2




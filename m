Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RQ7iB-0008O9-NZ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 02:21:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="75374489"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.81])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2011 17:14:57 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 17:14:53 -0800
Message-Id: <cover.1321319621.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Some Upstream-Status patch updates
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
X-List-Received-Date: Tue, 15 Nov 2011 01:21:19 -0000

Taking care of a few patch straglers that were missing Upstream-Status.

The following changes since commit f2316ff39670ed99382411e15ac035550360fbdd:

  opkg: Ensure we use the uname/gname fields when extracting tarballs (2011-11-14 11:15:36 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgarman/upstream-status-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstream-status-updates

Scott Garman (2):
  dosfstools: add Upstream-Status to patches
  base-passwd: add Upstream-Status to patches, remove unused patch

 .../base-passwd/base-passwd-3.5.22/mysql.patch     |   13 ----------
 .../base-passwd/base-passwd-3.5.22/nobash.patch    |   25 +++++++++++--------
 .../base-passwd/base-passwd-3.5.22/root-home.patch |   11 ++++++--
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |    7 +++++
 .../dosfstools/dosfstools/alignment_hack.patch     |    4 +++
 .../dosfstools/dosfstools-msdos_fs-types.patch     |    7 +++++
 .../dosfstools/include-linux-types.patch           |    5 ++++
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |    7 +++++
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |    7 +++++
 .../dosfstools/msdos_fat12_undefined.patch         |    7 +++++
 10 files changed, 66 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.22/mysql.patch

-- 
1.7.5.4




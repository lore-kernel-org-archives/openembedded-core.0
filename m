Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLe-0003ik-Bv
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8298976"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:36 -0700
Message-Id: <cover.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/13] 06-June-2011
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:10 -0000

Updates for the kernel and lots of distro tracking updates for
manual based updates checking.

Sau!


The following changes since commit 925de3b3e74d15547840a2edaceff437e135bddd:

  tzcode: Update to 2011g (2011-06-06 15:52:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (2):
  linux-yocto: update target/meta SRCREVs
  linux-yocto: make e1000e structure common [commit: bec3f1e8c]

Koen Kooi (1):
  util-linux: package agetty seperately

Phil Blundell (1):
  sqlite: remove dependency on tcl-native

Saul Wold (4):
  json-glib: Update to 0.12.4
  distro tracking: update Qing -> Saul
  distro tracking: fixup some bad entries
  distro tracking: Manual Updates

Scott Garman (5):
  distro-tracking: updates
  openssh: upgrade to v5.8p2
  grep: upgrade to v2.8
  tar: upgrade to v1.26
  distro-tracking: update openssh, tar, and grep

 .../conf/distro/include/distro_tracking_fields.inc |  225 +++++++++++---------
 .../openssh/{openssh-5.6p1 => openssh-5.8p2}/init  |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/ssh_config    |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/sshd_config   |    0
 .../openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} |    9 +-
 meta/recipes-core/util-linux/util-linux.inc        |    3 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../grep/{grep_2.7.bb => grep_2.8.bb}              |    7 +-
 ...tive_1.25.bb => tar-replacement-native_1.26.bb} |    0
 meta/recipes-extended/tar/tar.inc                  |    1 +
 meta/recipes-extended/tar/tar_1.25.bb              |    9 -
 meta/recipes-extended/tar/tar_1.26.bb              |    9 +
 .../{json-glib_0.12.2.bb => json-glib_0.12.4.bb}   |    0
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   14 +-
 meta/recipes-support/sqlite/sqlite3.inc            |    4 +-
 16 files changed, 153 insertions(+), 130 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} (93%)
 rename meta/recipes-extended/grep/{grep_2.7.bb => grep_2.8.bb} (84%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.25.bb => tar-replacement-native_1.26.bb} (100%)
 delete mode 100644 meta/recipes-extended/tar/tar_1.25.bb
 create mode 100644 meta/recipes-extended/tar/tar_1.26.bb
 rename meta/recipes-gnome/json-glib/{json-glib_0.12.2.bb => json-glib_0.12.4.bb} (100%)

-- 
1.7.3.4




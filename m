Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QTRoD-0003nO-Nr
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 06:53:01 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2A2832FF67;
	Mon,  6 Jun 2011 00:49:40 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 21:49:29 -0700
Message-Id: <cover.1307331820.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2A2832FF67.E067F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/4] Recipe upgrades: openssh, grep, tar
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
X-List-Received-Date: Mon, 06 Jun 2011 04:53:02 -0000

Good day,

Here are some straightforward recipe upgrades for openssh, grep,
and tar.

Build tested on all five qemu MACHINEs we support. Runtime tested on
qemuarm.

The following changes since commit 6b5d323b6c8960a0999dbafa0422fe127fd0fa97:

  event: don't catch systemexit from handler execution (2011-06-02 23:58:05 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades

Scott Garman (4):
  openssh: upgrade to v5.8p2
  grep: upgrade to v2.8
  tar: upgrade to v1.26
  distro-tracking: update openssh, tar, and grep

 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 .../openssh/{openssh-5.6p1 => openssh-5.8p2}/init  |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/ssh_config    |    0
 .../{openssh-5.6p1 => openssh-5.8p2}/sshd_config   |    0
 .../openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} |    9 ++++---
 .../grep/{grep_2.7.bb => grep_2.8.bb}              |    7 +++--
 ...tive_1.25.bb => tar-replacement-native_1.26.bb} |    0
 meta/recipes-extended/tar/tar.inc                  |    1 +
 meta/recipes-extended/tar/tar_1.25.bb              |    9 -------
 meta/recipes-extended/tar/tar_1.26.bb              |    9 +++++++
 11 files changed, 32 insertions(+), 29 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.6p1 => openssh-5.8p2}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.6p1.bb => openssh_5.8p2.bb} (93%)
 rename meta/recipes-extended/grep/{grep_2.7.bb => grep_2.8.bb} (84%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.25.bb => tar-replacement-native_1.26.bb} (100%)
 delete mode 100644 meta/recipes-extended/tar/tar_1.25.bb
 create mode 100644 meta/recipes-extended/tar/tar_1.26.bb




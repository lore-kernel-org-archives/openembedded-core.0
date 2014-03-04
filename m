Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67B7E6EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 22:51:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2014 14:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,588,1389772800"; d="scan'208";a="466667132"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.227])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2014 14:51:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:51:02 -0800
Message-Id: <cover.1393973357.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/6] Patches and Updates
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
X-List-Received-Date: Tue, 04 Mar 2014 22:51:06 -0000

Ricahrd,

Some patches and updates that I have been working on to resolve
various issues.

The bind and dhcp go hand in hand and address some CVE issues.

Sau!


The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (6):
  util-linux: Update to 2.24.1
  bind: Update to 9.9.5
  dhcp: Update to 4.3.0
  grub-efi: use autotools-brokensep
  parted: add patch to handle deprecated readline function
  security_flags: Update to correctly link X modules

 meta/conf/distro/include/security_flags.inc        |   9 ++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   2 +-
 .../bind-9.8.1-CVE-2012-5166.patch                 |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch  |   0
 .../{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch  |   0
 .../bind-Fix-CVE-2012-4244.patch                   |   0
 .../bind/{bind-9.8.1 => bind}/conf.patch           |   0
 .../{bind-9.8.1 => bind}/cross-build-fix.patch     |   0
 .../make-etc-initd-bind-stop-work.patch            |   0
 .../mips1-not-support-opcode.diff                  |   0
 .../bind/{bind_9.8.1.bb => bind_9.9.5.bb}          |  15 +--
 meta/recipes-connectivity/dhcp/dhcp.inc            |   2 +-
 .../dhcp/dhcp/fix-external-bind.patch              | 115 +++++++++++----------
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |  12 ---
 meta/recipes-core/util-linux/util-linux.inc        |  12 +--
 .../{util-linux_2.23.2.bb => util-linux_2.24.1.bb} |   7 +-
 .../parted-3.1/fix-deprecated-readline.patch       |  34 ++++++
 meta/recipes-extended/parted/parted_3.1.bb         |   1 +
 20 files changed, 121 insertions(+), 88 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-9.8.1-CVE-2012-5166.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2011-4313.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-1667.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2012-3817.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-CVE-2013-2266.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/bind-Fix-CVE-2012-4244.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/cross-build-fix.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.8.1 => bind}/mips1-not-support-opcode.diff (100%)
 rename meta/recipes-connectivity/bind/{bind_9.8.1.bb => bind_9.9.5.bb} (77%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
 rename meta/recipes-core/util-linux/{util-linux_2.23.2.bb => util-linux_2.24.1.bb} (79%)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch

-- 
1.8.3.1



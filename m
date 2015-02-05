Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E4C5E72DF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 18:40:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 05 Feb 2015 10:33:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,525,1418112000"; d="scan'208";a="523192611"
Received: from swold-mobl.jf.intel.com ([10.24.2.202])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2015 10:32:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:39:38 -0800
Message-Id: <1423161588-6867-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/10][daisy] Patches for Daisy
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
X-List-Received-Date: Thu, 05 Feb 2015 18:40:14 -0000

Richard,

Here is a set of tested patches for Daisy, there is one other pending for the Yocto-BSP
on the Poky side.

We have one know issue for QEMU and SDL on Debian8 which is a new Host OS Distro
which is not guaranteed to work

Sau!

Bian Naimeng (2):
  cpio: fix bug CVE-2014-9112 for cpio-2.11
  cpio: fix bug CVE-2014-9112 for cpio-2.8

Chong Lu (1):
  file: CVE-2014-9620 and CVE-2014-9621

Jonathan Liu (1):
  systemd: backport patch to fix reading journal backwards

Martin Jansa (1):
  update-rc.d: Allow to use different initscripts provider

Saul Wold (3):
  resolvconf: add fixes for busybox and make it work
  openssh: move setting LD to allow for correct override
  btrfs: create an empty file to build the fs in

Sona Sarmadi (2):
  python: Disables SSLv3
  bind: fix for CVE-2014-8500

 meta/classes/image_types.bbclass                   |    4 +-
 meta/classes/update-rc.d.bbclass                   |    3 +-
 .../bind/bind/bind9_9_5-CVE-2014-8500.patch        |  990 ++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    1 +
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |    2 +-
 .../resolvconf/resolvconf/99_resolvconf            |    4 +
 .../resolvconf/fix-path-for-busybox.patch          |   20 +
 .../resolvconf/resolvconf_1.74.bb                  |   19 +-
 ...-Fix-navigating-backwards-missing-entries.patch |   34 +
 meta/recipes-core/systemd/systemd_211.bb           |    1 +
 .../file-CVE-2014-9620-and-CVE-2014-9621.patch     | 1359 ++++++++++++++++++++
 meta/recipes-devtools/file/file_5.16.bb            |    1 +
 .../python/python/python2.7.3-nossl3.patch         |   37 +
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 .../cpio/cpio-2.11/fix-memory-overrun.patch        |  220 ++++
 .../cpio/cpio-2.8/fix-memory-overrun.patch         |  217 ++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |    3 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |    7 +-
 18 files changed, 2911 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-2014-8500.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-Fix-navigating-backwards-missing-entries.patch
 create mode 100644 meta/recipes-devtools/file/file/file-CVE-2014-9620-and-CVE-2014-9621.patch
 create mode 100644 meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/fix-memory-overrun.patch

-- 
2.1.0



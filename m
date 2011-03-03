Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvEkv-0001xm-R9
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:04:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2011 12:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,259,1297065600"; d="scan'208";a="663580393"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2011 12:02:43 -0800
Message-Id: <cover.1299182375.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 11:59:35 -0800
Date: Thu, 03 Mar 2011 12:02:38 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/10] Colsolidated Pull Request
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
X-List-Received-Date: Thu, 03 Mar 2011 20:04:14 -0000

From: Saul Wold <sgw@linux.intel.com>

This group of patches addresses a number of bug fixes
from the Yocto Project Bugzilla. It also includes some
support for LSB testing.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Kang Kai (3):
  recipe: add chkconfig for LSB command test
  recipe: add newt from OE
  recipe: add slang from OE

Liping Ke (2):
  Add libtool-nativesdk for ADT
  ADT: Bug fix for Suse Linux

Qing He (1):
  libpcre: fix the name collision with libc

Saul Wold (1):
  task-poky-lsb: add chkconfig

Zhai Edwin (3):
  x11vnc: Fix the start failure
  sato-icon-theme: Explictly use "Sato" as gtk icon theme
  gstreamer: install the sound card driver of es1370

 .../adt-installer/scripts/adt_installer_internal   |    5 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 .../recipes-extended/chkconfig/chkconfig_1.3.49.bb |   27 ++++++++
 .../newt/files/include-without-python.patch        |   71 ++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |   37 ++++++++++
 meta/recipes-extended/slang/slang/fix-uclibc.patch |   11 +++
 meta/recipes-extended/slang/slang_2.2.2.bb         |   25 +++++++
 meta/recipes-extended/tasks/task-poky-lsb.bb       |    1 +
 .../x11vnc/files/starting-fix.patch                |   18 +++++
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb      |    3 +-
 .../gstreamer/gstreamer_0.10.31.bb                 |    3 +
 .../sato-icon-theme/sato-icon-theme.inc            |    3 +
 .../libpcre/files/fix-pcre-name-collision.patch    |   40 +++++++++++
 meta/recipes-support/libpcre/libpcre_8.10.bb       |    5 +-
 14 files changed, 246 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
 create mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 create mode 100644 meta/recipes-extended/newt/libnewt_0.52.12.bb
 create mode 100644 meta/recipes-extended/slang/slang/fix-uclibc.patch
 create mode 100644 meta/recipes-extended/slang/slang_2.2.2.bb
 create mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.patch
 create mode 100644 meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch




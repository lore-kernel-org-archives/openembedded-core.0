Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHM7-0005dG-78
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:50:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Mar 2011 14:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="715899292"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2011 14:49:17 -0800
Message-Id: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 14:48:15 -0800
Date: Thu, 03 Mar 2011 14:49:16 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 00/10] Consolidated Pull Request [v2]
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
X-List-Received-Date: Thu, 03 Mar 2011 22:50:47 -0000

From: Saul Wold <sgw@linux.intel.com>

This contains a batch of bug fixes and a set of recipes
to address some LSB test failures.

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

 .../installer/adt-installer/adt_installer          |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    5 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 .../recipes-extended/chkconfig/chkconfig_1.3.49.bb |   25 +++++++
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
 15 files changed, 245 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
 create mode 100644 meta/recipes-extended/newt/files/include-without-python.patch
 create mode 100644 meta/recipes-extended/newt/libnewt_0.52.12.bb
 create mode 100644 meta/recipes-extended/slang/slang/fix-uclibc.patch
 create mode 100644 meta/recipes-extended/slang/slang_2.2.2.bb
 create mode 100644 meta/recipes-graphics/x11vnc/files/starting-fix.patch
 create mode 100644 meta/recipes-support/libpcre/files/fix-pcre-name-collision.patch




Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 090916041E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:53:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 08:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323973211"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 08:51:21 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:53:32 +0300
Message-Id: <cover.1372434126.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/12] Package upgrades
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
X-List-Received-Date: Fri, 28 Jun 2013 15:53:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Tested on core-image-sato on all architectures (x86, x86-64, ppc, mips, arm)
* apt: tested on core-image-minimal (with apt installed)
* libxext: LIC_FILES_CHKSUM was changed because the line "Copyright (c) 1999, 2005, 2006, Oracle and/or its affiliates. All rights reserved."
in COPYING file was changed into "Copyright (c) 1999, 2005, 2006, 2013, Oracle and/or its affiliates. All rights reserved." in 1.3.2
* libxtst: LIC_FILES_CHKSUM was changed because the following lines have been added in COPYING file:
"Copyright © 1992 by UniSoft Group Ltd."
"Copyright © 1992, 1994, 1995 X Consortium"
"Copyright 1994 Network Computing Devices, Inc."
* gpgme: LIC_FILES_CHKSUM was changed because the line "File: @configure_input@  */" was replace by
"Generated from gpgme.h.in for @GPGME_CONFIG_HOST@.  */" in gpgme.h.in

The following changes since commit 8e9501ffa8726d69412d669580d787ffedb88d34:

  populate_sdk_base, adt_installer: abort install if path contains spaces (2013-06-25 17:59:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (12):
  libxext: Update from 1.3.1 to 1.3.2
  libxcursor: Update from 1.1.13 to 1.1.14
  libxinerama: Updated from 1.1.2 to 1.1.3
  libxau: Updated from 1.0.7 to 1.0.8
  libxres: Updated from 1.0.6 to 1.0.7
  libxv: Updated from 1.0.7 to 1.0.8
  libxtst: Updated from 1.2.1 to 1.2.2
  libxxf86vm: Updated from 1.1.2 to 1.1.3
  libxfixes: Updated from 5.0 to 5.0.1
  libxcb: Updated from 1.9 to 1.9.1
  apt: Updated from 0.9.8.1 to 0.9.8.2
  gpgme: Updated from 1.4.1 to 1.4.2

 .../disable-configure-in-makefile.patch                         |    0
 .../fix-gcc-4.6-null-not-defined.patch                          |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch             |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-ko-translation.patch    |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch          |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch          |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch                |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/truncate-filename.patch    |    0
 .../apt/{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch             |    0
 .../apt/{apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb}        |    0
 meta/recipes-devtools/apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb}    |    4 ++--
 meta/recipes-graphics/xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb}    |    4 ++--
 .../xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb}               |    5 ++---
 .../xorg-lib/{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb}     |    5 ++---
 .../xorg-lib/{libxext_1.3.1.bb => libxext_1.3.2.bb}             |    7 +++----
 .../xorg-lib/{libxfixes_5.0.bb => libxfixes_5.0.1.bb}           |    4 ++--
 .../xorg-lib/{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb}     |    4 ++--
 .../xorg-lib/{libxres_1.0.6.bb => libxres_1.0.7.bb}             |    4 ++--
 .../xorg-lib/{libxtst_1.2.1.bb => libxtst_1.2.2.bb}             |    6 +++---
 .../xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb}                 |    4 ++--
 .../xorg-lib/{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb}       |    4 ++--
 .../{gpgme-1.4.1 => gpgme-1.4.2}/disable_gpgconf_check.patch    |    0
 meta/recipes-support/gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb}   |    6 +++---
 23 files changed, 27 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.1 => apt-0.9.8.2}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.1.bb => apt-native_0.9.8.2.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.1.bb => apt_0.9.8.2.bb} (74%)
 rename meta/recipes-graphics/xcb/{libxcb_1.9.bb => libxcb_1.9.1.bb} (55%)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.7.bb => libxau_1.0.8.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.13.bb => libxcursor_1.1.14.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.1.bb => libxext_1.3.2.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.bb => libxfixes_5.0.1.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.2.bb => libxinerama_1.1.3.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.6.bb => libxres_1.0.7.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.1.bb => libxtst_1.2.2.bb} (68%)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.7.bb => libxv_1.0.8.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.2.bb => libxxf86vm_1.1.3.bb} (78%)
 rename meta/recipes-support/gpgme/{gpgme-1.4.1 => gpgme-1.4.2}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.1.bb => gpgme_1.4.2.bb} (83%)

-- 
1.7.10.4



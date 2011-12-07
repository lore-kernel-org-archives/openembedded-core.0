Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNNy-0002YK-Jx
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:42:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Dec 2011 11:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83324286"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 11:34:39 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:31 -0800
Message-Id: <cover.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/8] License Consolidated Pull
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
X-List-Received-Date: Wed, 07 Dec 2011 19:42:35 -0000

These are the changes from the RFCs Chris Larson and I sent out this
weekend merged into one branch along with a gettext minimal fix from
RP. I've trimmed the diffs in the PULL down some as there are a number 
of license text diffs that cause send-patch-request to choke.


The following changes since commit f17e0ae38b2e6c4cbe7f0f9d76c3e1a386335fd1:

  conf/machine: Don't poke around providers which aren't machine specific/safe (2011-12-06 22:47:09 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/consolidated_license
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/consolidated_license

Christopher Larson (4):
  oe.test_types: move into an oe.tests package
  license: split license parsing into oe.license
  oe.license: add license flattening code
  Add copyleft compliance class

Elizabeth Flanagan (3):
  [YOCTO #1776] license: manifest and license path
  OECore license fixes: meta/*
  package.bbclass: Adding license collection

Richard Purdie (1):
  gettext-minimal-native: Fix License

 meta/classes/copyleft_compliance.bbclass           |   94 +++
 meta/classes/license.bbclass                       |  258 +++++---
 meta/classes/package.bbclass                       |    1 +
 meta/conf/licenses.conf                            |   54 ++-
 meta/files/common-licenses/AFL-1                   |   92 ---
 meta/files/common-licenses/AFL-2                   |  155 -----
 meta/files/common-licenses/AGPL-3                  |  213 ------
 meta/files/common-licenses/APL-1                   |  327 ----------
 meta/files/common-licenses/APSL-1                  |  334 ----------
 meta/files/common-licenses/APSL-2                  |  337 ----------
 meta/files/common-licenses/Adobe                   |   14 +
 meta/files/common-licenses/Apache-1                |   59 --
 meta/files/common-licenses/Apache-2                |  203 ------
 meta/files/common-licenses/Artistic                |  131 ----
 meta/files/common-licenses/Artistic-1              |   97 ---
 meta/files/common-licenses/Artistic-2              |  202 ------
 meta/files/common-licenses/BSL-1                   |   25 -
 meta/files/common-licenses/BitstreamVera           |  160 +++++
 meta/files/common-licenses/CATOSL-1                |  335 ----------
 meta/files/common-licenses/CC-BY-1                 |  185 ------
 meta/files/common-licenses/CC-BY-2                 |  205 ------
 meta/files/common-licenses/CC-BY-3                 |  283 --------
 meta/files/common-licenses/CC-BY-NC-1              |  194 ------
 meta/files/common-licenses/CC-BY-NC-2              |  220 -------
 meta/files/common-licenses/CC-BY-NC-3              |  297 ---------
 meta/files/common-licenses/CC-BY-NC-ND-1           |  146 -----
 meta/files/common-licenses/CC-BY-NC-ND-2           |  209 ------
 meta/files/common-licenses/CC-BY-NC-ND-3           |  272 --------
 meta/files/common-licenses/CC-BY-NC-SA-1           |  209 ------
 meta/files/common-licenses/CC-BY-NC-SA-2           |  242 -------
 meta/files/common-licenses/CC-BY-NC-SA-3           |  320 ---------
 meta/files/common-licenses/CC-BY-ND-2              |  194 ------
 meta/files/common-licenses/CC-BY-ND-3              |  259 --------
 meta/files/common-licenses/CC-BY-SA-1              |  201 ------
 meta/files/common-licenses/CC-BY-SA-2              |  227 -------
 meta/files/common-licenses/CC-BY-SA-3              |  319 ---------
 meta/files/common-licenses/CDDL-1                  |  313 ---------
 meta/files/common-licenses/CECILL-1                |  462 -------------
 meta/files/common-licenses/CECILL-2                |  451 -------------
 meta/files/common-licenses/CPAL-1                  |  435 -------------
 meta/files/common-licenses/CPL-1                   |  250 -------
 meta/files/common-licenses/CUA-OPL-1               |  482 --------------
 meta/files/common-licenses/DSSSL                   |   49 ++
 meta/files/common-licenses/ECL-1                   |   61 --
 meta/files/common-licenses/ECL-2                   |  218 -------
 meta/files/common-licenses/EDL-1.0                 |   13 +
 meta/files/common-licenses/EFL-1                   |   30 -
 meta/files/common-licenses/EFL-2                   |   27 -
 meta/files/common-licenses/EPL-1                   |  204 ------
 meta/files/common-licenses/EUPL-1                  |  302 ---------
 meta/files/common-licenses/Elfutils-Exception      |   12 +
 meta/files/common-licenses/ErlPL-1                 |  293 ---------
 meta/files/common-licenses/FSF-Unlimited           |    4 +
 meta/files/common-licenses/Frameworx-1             |  181 ------
 meta/files/common-licenses/FreeType                |  170 +++++
 meta/files/common-licenses/GPL-1                   |  259 --------
 meta/files/common-licenses/GPL-1.0+                |  252 --------
 meta/files/common-licenses/GPL-2                   |   23 -
 .../common-licenses/GPL-2,0-with-GCC-exception     |   17 -
 .../common-licenses/GPL-2,0-with-font-exception    |   18 -
 meta/files/common-licenses/GPL-2.0+                |  132 ----
 .../common-licenses/GPL-2.0-with-GCC-exception     |   13 +-
 .../common-licenses/GPL-2.0-with-font-exception    |   14 +-
 meta/files/common-licenses/GPL-3                   |   70 --
 meta/files/common-licenses/GPL-3.0                 |  224 +++++++-
 meta/files/common-licenses/GPL-3.0+                |    3 -
 meta/files/common-licenses/IPL-1                   |  222 -------
 meta/files/common-licenses/LGPL-2                  |  461 -------------
 meta/files/common-licenses/LGPL-2.0                |  189 +++++-
 meta/files/common-licenses/LGPL-2.0+               |  173 -----
 meta/files/common-licenses/LGPL-2.1+               |  176 -----
 meta/files/common-licenses/LGPL-3                  |  147 -----
 meta/files/common-licenses/LGPL-3.0                |   53 +-
 meta/files/common-licenses/LGPL-3.0+               |   66 --
 meta/files/common-licenses/LPL-1                   |  213 ------
 meta/files/common-licenses/LPPL-1                  |  422 ------------
 meta/files/common-licenses/MIT-style               |    1 -
 meta/files/common-licenses/MPL-1                   |  433 -------------
 meta/files/common-licenses/NASA-1                  |  246 -------
 meta/files/common-licenses/NPOSL-3                 |  206 ------
 meta/files/common-licenses/OASIS                   |   13 +
 meta/files/common-licenses/OCLC-2                  |  207 ------
 meta/files/common-licenses/OFL-1                   |   96 ---
 meta/files/common-licenses/OLDAP-2                 |   54 --
 meta/files/common-licenses/OSL-1                   |  172 -----
 meta/files/common-licenses/OSL-1.0                 |    2 +-
 meta/files/common-licenses/OSL-2                   |  171 -----
 meta/files/common-licenses/OSL-3                   |  157 -----
 meta/files/common-licenses/PHP-3                   |   70 --
 meta/files/common-licenses/Proprietary             |    1 +
 meta/files/common-licenses/Python-2                |  192 ------
 meta/files/common-licenses/QPL-1                   |   96 ---
 meta/files/common-licenses/RPL-1                   |  582 -----------------
 meta/files/common-licenses/RPSL-1                  |  535 ---------------
 meta/files/common-licenses/SPL                     |  519 ---------------
 meta/files/common-licenses/Simple-2                |   53 --
 meta/files/common-licenses/UCB                     |   26 +
 meta/files/common-licenses/VSL-1                   |   54 --
 meta/files/common-licenses/Watcom-1                |  389 -----------
 meta/files/common-licenses/XFree86-1               |   50 --
 meta/files/common-licenses/YPL-1                   |  140 ----
 meta/files/common-licenses/ZPL-1                   |   60 --
 meta/files/common-licenses/ZPL-2                   |   44 --
 meta/files/common-licenses/Zimbra-1                |  140 ----
 meta/files/common-licenses/eCos-2                  |   38 --
 meta/lib/oe/license.py                             |   62 ++
 .../CC-BY-ND-1 => lib/oe/tests/__init__.py}        |    0
 meta/lib/oe/tests/test_license.py                  |   68 ++
 meta/lib/oe/{ => tests}/test_types.py              |    0
 .../base-files/base-files/licenses/Artistic        |  131 ----
 .../base-files/base-files/licenses/BSD             |   26 -
 .../base-files/base-files/licenses/GFDL-1.2        |  397 ------------
 .../base-files/base-files/licenses/GPL-3           |  676 -------------------
 .../base-files/base-files/licenses/LGPL-2          |  481 --------------
 .../base-files/base-files/licenses/LGPL-2.1        |  510 ---------------
 .../base-files/base-files/licenses/LGPL-3          |  165 -----
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   20 +-
 meta/recipes-core/busybox/busybox.inc              |    3 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 .../gettext/gettext-minimal-0.18.1.1/COPYING       |  678 +-------------------
 .../gettext/gettext-minimal-native_0.18.1.1.bb     |    4 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +-
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    4 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    4 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    4 +-
 .../squashfs-tools/squashfs-tools_4.2.bb           |    4 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    4 +-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    4 +-
 .../transfig/transfig-native_3.2.5d.bb             |    4 +-
 meta/recipes-extended/byacc/byacc_20110908.bb      |   10 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    4 +-
 meta/recipes-extended/less/less_444.bb             |    7 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |    4 +-
 meta/recipes-extended/xinetd/xinetd_2.3.14.bb      |    5 +-
 meta/recipes-extended/zip/zip.inc                  |    2 +-
 meta/recipes-extended/zip/zip_3.0.bb               |    2 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    4 +-
 meta/recipes-graphics/clutter/clutter-box2d.inc    |    2 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 meta/recipes-graphics/freetype/freetype_2.4.6.bb   |    4 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    4 +-
 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    4 +-
 .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |    4 +-
 meta/recipes-graphics/xorg-font/font-util_1.2.0.bb |    5 +-
 .../linux-firmware/linux-firmware_git.bb           |    5 +
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    4 +-
 .../matchbox-theme-sato/matchbox-theme-sato.inc    |    2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb |    2 +-
 .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    2 +-
 meta/recipes-support/boost/boost.inc               |    4 +-
 152 files changed, 1439 insertions(+), 20828 deletions(-)
 create mode 100644 meta/classes/copyleft_compliance.bbclass
 delete mode 100644 meta/files/common-licenses/AFL-1
 delete mode 100644 meta/files/common-licenses/AFL-2
 delete mode 100644 meta/files/common-licenses/AGPL-3
 delete mode 100644 meta/files/common-licenses/APL-1
 delete mode 100644 meta/files/common-licenses/APSL-1
 delete mode 100644 meta/files/common-licenses/APSL-2
 create mode 100644 meta/files/common-licenses/Adobe
 delete mode 100644 meta/files/common-licenses/Apache-1
 delete mode 100644 meta/files/common-licenses/Apache-2
 delete mode 100644 meta/files/common-licenses/Artistic
 delete mode 100644 meta/files/common-licenses/Artistic-1
 delete mode 100644 meta/files/common-licenses/Artistic-2
 delete mode 100644 meta/files/common-licenses/BSL-1
 create mode 100644 meta/files/common-licenses/BitstreamVera
 delete mode 100644 meta/files/common-licenses/CATOSL-1
 delete mode 100644 meta/files/common-licenses/CC-BY-1
 delete mode 100644 meta/files/common-licenses/CC-BY-2
 delete mode 100644 meta/files/common-licenses/CC-BY-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2
 delete mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3
 delete mode 100644 meta/files/common-licenses/CC-BY-ND-2
 delete mode 100644 meta/files/common-licenses/CC-BY-ND-3
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-1
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-2
 delete mode 100644 meta/files/common-licenses/CC-BY-SA-3
 delete mode 100644 meta/files/common-licenses/CDDL-1
 delete mode 100644 meta/files/common-licenses/CECILL-1
 delete mode 100644 meta/files/common-licenses/CECILL-2
 delete mode 100644 meta/files/common-licenses/CPAL-1
 delete mode 100644 meta/files/common-licenses/CPL-1
 delete mode 100644 meta/files/common-licenses/CUA-OPL-1
 create mode 100644 meta/files/common-licenses/DSSSL
 delete mode 100644 meta/files/common-licenses/ECL-1
 delete mode 100644 meta/files/common-licenses/ECL-2
 create mode 100644 meta/files/common-licenses/EDL-1.0
 delete mode 100644 meta/files/common-licenses/EFL-1
 delete mode 100644 meta/files/common-licenses/EFL-2
 delete mode 100644 meta/files/common-licenses/EPL-1
 delete mode 100644 meta/files/common-licenses/EUPL-1
 create mode 100644 meta/files/common-licenses/Elfutils-Exception
 delete mode 100644 meta/files/common-licenses/ErlPL-1
 create mode 100644 meta/files/common-licenses/FSF-Unlimited
 delete mode 100644 meta/files/common-licenses/Frameworx-1
 create mode 100644 meta/files/common-licenses/FreeType
 delete mode 100644 meta/files/common-licenses/GPL-1
 delete mode 100644 meta/files/common-licenses/GPL-1.0+
 delete mode 100644 meta/files/common-licenses/GPL-2
 delete mode 100644 meta/files/common-licenses/GPL-2,0-with-GCC-exception
 delete mode 100644 meta/files/common-licenses/GPL-2,0-with-font-exception
 delete mode 100644 meta/files/common-licenses/GPL-2.0+
 delete mode 100644 meta/files/common-licenses/GPL-3
 delete mode 100644 meta/files/common-licenses/GPL-3.0+
 delete mode 100644 meta/files/common-licenses/IPL-1
 delete mode 100644 meta/files/common-licenses/LGPL-2
 delete mode 100644 meta/files/common-licenses/LGPL-2.0+
 delete mode 100644 meta/files/common-licenses/LGPL-2.1+
 delete mode 100644 meta/files/common-licenses/LGPL-3
 delete mode 100644 meta/files/common-licenses/LGPL-3.0+
 delete mode 100644 meta/files/common-licenses/LPL-1
 delete mode 100644 meta/files/common-licenses/LPPL-1
 delete mode 120000 meta/files/common-licenses/MIT-style
 delete mode 100644 meta/files/common-licenses/MPL-1
 delete mode 100644 meta/files/common-licenses/NASA-1
 delete mode 100644 meta/files/common-licenses/NPOSL-3
 create mode 100644 meta/files/common-licenses/OASIS
 delete mode 100644 meta/files/common-licenses/OCLC-2
 delete mode 100644 meta/files/common-licenses/OFL-1
 delete mode 100644 meta/files/common-licenses/OLDAP-2
 delete mode 100644 meta/files/common-licenses/OSL-1
 delete mode 100644 meta/files/common-licenses/OSL-2
 delete mode 100644 meta/files/common-licenses/OSL-3
 delete mode 100644 meta/files/common-licenses/PHP-3
 create mode 100644 meta/files/common-licenses/Proprietary
 delete mode 100644 meta/files/common-licenses/Python-2
 delete mode 100644 meta/files/common-licenses/QPL-1
 delete mode 100644 meta/files/common-licenses/RPL-1
 delete mode 100644 meta/files/common-licenses/RPSL-1
 delete mode 100644 meta/files/common-licenses/SPL
 delete mode 100644 meta/files/common-licenses/Simple-2
 create mode 100644 meta/files/common-licenses/UCB
 delete mode 100644 meta/files/common-licenses/VSL-1
 delete mode 100644 meta/files/common-licenses/Watcom-1
 delete mode 100644 meta/files/common-licenses/XFree86-1
 delete mode 100644 meta/files/common-licenses/YPL-1
 delete mode 100644 meta/files/common-licenses/ZPL-1
 delete mode 100644 meta/files/common-licenses/ZPL-2
 delete mode 100644 meta/files/common-licenses/Zimbra-1
 delete mode 100644 meta/files/common-licenses/eCos-2
 create mode 100644 meta/lib/oe/license.py
 rename meta/{files/common-licenses/CC-BY-ND-1 => lib/oe/tests/__init__.py} (100%)
 create mode 100644 meta/lib/oe/tests/test_license.py
 rename meta/lib/oe/{ => tests}/test_types.py (100%)
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/Artistic
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/BSD
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/GFDL-1.2
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/GPL-3
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-2
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-2.1
 delete mode 100644 meta/recipes-core/base-files/base-files/licenses/LGPL-3




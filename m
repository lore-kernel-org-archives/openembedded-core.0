Return-Path: <sergeimir@emcraft.com>
Received: from ocean.emcraft.com (ocean.emcraft.com [185.75.190.205])
	by mail.openembedded.org (Postfix) with ESMTP id 74250606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 13:20:46 +0000 (UTC)
Received: from sergmir.emcraft.com ([172.17.0.19] helo=sergmir.localdomain)
	by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
	(envelope-from <sergeimir@emcraft.com>)
	id 1bS2Hp-0001ot-40; Tue, 26 Jul 2016 16:20:41 +0300
From: Sergei Miroshnichenko <sergeimir@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:19:52 +0300
Message-Id: <1469539192-18406-1-git-send-email-sergeimir@emcraft.com>
X-Mailer: git-send-email 2.1.0
Cc: Sergei Miroshnichenko <sergeimir@emcraft.com>,
	Roger Meier <r.meier@siemens.com>,
	Alexander Dyachenko <sasha_d@emcraft.com>
Subject: [PATCH v3 0/4] license: Sync with SPDX 2.0, pull request
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
X-List-Received-Date: Tue, 26 Jul 2016 13:20:48 -0000

Hi all,

Here are the request for a community review for a synchronization with
the SPDX License List (git.spdx.org/license-list.git) and adding license
operators to meet SPDX 2.0 specification compliance
(https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX
License Expression).

The whole patch series is way too big to send them to the mailing list
(the biggest one is ~3MiB), so please find the diffs via gitweb of the
-contrib repo.

Best regards,
Sergei Miroshnichenko

The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  http://git.openembedded.org/openembedded-core-contrib/ sergeimir/spdx2_sync
  http://git.openembedded.org/openembedded-core-contrib/log/?h=sergeimir/spdx2_sync

for you to fetch changes up to 46b0722248b9704f539e50d73f42ef6ac86533ef:

  license: Remove deprecated references (2016-07-26 10:54:44 +0300)

----------------------------------------------------------------
Sergei Miroshnichenko (4):
      common-licenses: Sync license files with SPDX repo
      common-licenses: Add SPDX license exception files
      license: Add support for SPDX 2.0 operators
      license: Remove deprecated references

 meta-selftest/recipes-test/recipetool/selftest-recipetool-appendfile.bb                             |   2 +-
 meta/classes/license.bbclass                                                                        |  17 +-
 meta/conf/licenses.conf                                                                             |   7 -
 meta/files/common-licenses/389-exception                                                            |   7 +
 meta/files/common-licenses/AAL                                                                      |  64 ++--
 meta/files/common-licenses/AFL-1.2                                                                  | 127 +-------
 meta/files/common-licenses/AFL-2.0                                                                  |  53 ++-
 meta/files/common-licenses/AFL-2.1                                                                  |  31 +-
 meta/files/common-licenses/AFL-3.0                                                                  |  38 ++-
 meta/files/common-licenses/AGPL-3.0                                                                 | 856 +++++++++++++------------------------------------
 meta/files/common-licenses/ANTLR-PD                                                                 |  33 +-
 meta/files/common-licenses/APL-1.0                                                                  | 223 ++++++++-----
 meta/files/common-licenses/APSL-1.0                                                                 | 449 ++++++--------------------
 meta/files/common-licenses/APSL-1.1                                                                 | 444 +++++--------------------
 meta/files/common-licenses/APSL-1.2                                                                 |  84 +++--
 meta/files/common-licenses/APSL-2.0                                                                 |  94 +++---
 meta/files/common-licenses/Adobe                                                                    |   2 +-
 meta/files/common-licenses/Adobe-2006                                                               |  12 +
 meta/files/common-licenses/Adobe-Glyph                                                              |  10 +
 meta/files/common-licenses/Apache-1.0                                                               |  71 +---
 meta/files/common-licenses/Apache-1.1                                                               |  75 ++---
 meta/files/common-licenses/Apache-2.0                                                               | 271 ++++------------
 meta/files/common-licenses/Artistic-1.0                                                             |  41 ++-
 meta/files/common-licenses/Artistic-1.0-Perl                                                        |  51 +++
 meta/files/common-licenses/Artistic-1.0-cl8                                                         |  51 +++
 meta/files/common-licenses/Artistic-2.0                                                             | 226 ++++---------
 meta/files/common-licenses/Autoconf-exception-2.0                                                   |   5 +
 meta/files/common-licenses/{GPL-3.0-with-autoconf-exception => Autoconf-exception-3.0}              |  12 +-
 meta/files/common-licenses/BSD-2-Clause                                                             |  12 +-
 meta/files/common-licenses/BSD-2-Clause-FreeBSD                                                     |  13 +
 meta/files/common-licenses/BSD-2-Clause-NetBSD                                                      |  11 +
 meta/files/common-licenses/BSD-3-Clause                                                             |  14 +-
 meta/files/common-licenses/BSD-3-Clause-Attribution                                                 |  11 +
 meta/files/common-licenses/BSD-3-Clause-Clear                                                       |  14 +
 meta/files/common-licenses/BSD-3-Clause-LBNL                                                        |  12 +
 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License                                          |  15 +
 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License-2014                                     |  16 +
 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-Warranty                                         |  14 +
 meta/files/common-licenses/BSD-4-Clause                                                             |  35 +-
 meta/files/common-licenses/BSD-4-Clause-UC                                                          |  15 +
 meta/files/common-licenses/BSD-Protection                                                           |  53 +++
 meta/files/common-licenses/BSD-Source-Code                                                          |  10 +
 meta/files/common-licenses/BSL-1.0                                                                  |  24 +-
 meta/files/common-licenses/{GPL-2-with-bison-exception => Bison-exception-2.2}                      |   6 +-
 meta/files/common-licenses/BitstreamVera                                                            |   2 +-
 meta/files/common-licenses/CATOSL-1.1                                                               |  30 +-
 meta/files/common-licenses/CC-BY-1.0                                                                |  80 +++--
 meta/files/common-licenses/CC-BY-2.0                                                                |  80 +++--
 meta/files/common-licenses/CC-BY-2.5                                                                |  80 +++--
 meta/files/common-licenses/CC-BY-3.0                                                                |  95 +++---
 meta/files/common-licenses/CC-BY-4.0                                                                | 154 +++++++++
 meta/files/common-licenses/CC-BY-NC-1.0                                                             |  78 +++--
 meta/files/common-licenses/CC-BY-NC-2.0                                                             |  81 +++--
 meta/files/common-licenses/CC-BY-NC-2.5                                                             |  81 +++--
 meta/files/common-licenses/CC-BY-NC-3.0                                                             |  99 +++---
 meta/files/common-licenses/CC-BY-NC-4.0                                                             | 156 +++++++++
 meta/files/common-licenses/CC-BY-NC-ND-1.0                                                          |  74 ++++-
 meta/files/common-licenses/CC-BY-NC-ND-2.0                                                          |  74 +++--
 meta/files/common-licenses/CC-BY-NC-ND-2.5                                                          |  74 +++--
 meta/files/common-licenses/CC-BY-NC-ND-3.0                                                          |  90 ++++--
 meta/files/common-licenses/CC-BY-NC-ND-4.0                                                          | 153 +++++++++
 meta/files/common-licenses/CC-BY-NC-SA-1.0                                                          |  87 +++--
 meta/files/common-licenses/CC-BY-NC-SA-2.0                                                          |  91 +++---
 meta/files/common-licenses/CC-BY-NC-SA-2.5                                                          |  91 +++---
 meta/files/common-licenses/CC-BY-NC-SA-3.0                                                          | 105 +++---
 meta/files/common-licenses/CC-BY-NC-SA-4.0                                                          | 168 ++++++++++
 meta/files/common-licenses/CC-BY-ND-1.0                                                             |  72 +++--
 meta/files/common-licenses/CC-BY-ND-2.0                                                             |  73 +++--
 meta/files/common-licenses/CC-BY-ND-2.5                                                             |  73 +++--
 meta/files/common-licenses/CC-BY-ND-3.0                                                             |  87 +++--
 meta/files/common-licenses/CC-BY-ND-4.0                                                             | 152 +++++++++
 meta/files/common-licenses/CC-BY-SA-1.0                                                             |  84 +++--
 meta/files/common-licenses/CC-BY-SA-2.0                                                             |  88 +++--
 meta/files/common-licenses/CC-BY-SA-2.5                                                             |  88 +++--
 meta/files/common-licenses/CC-BY-SA-3.0                                                             | 105 +++---
 meta/files/common-licenses/CC-BY-SA-4.0                                                             | 168 ++++++++++
 meta/files/common-licenses/CC0-1.0                                                                  |  39 ++-
 meta/files/common-licenses/CDDL-1.0                                                                 |  78 ++---
 meta/files/common-licenses/CDDL-1.1                                                                 | 123 +++++++
 meta/files/common-licenses/CECILL-1.0                                                               | 216 ++++++-------
 meta/files/common-licenses/CECILL-1.1                                                               | 229 +++++++++++++
 meta/files/common-licenses/CECILL-2.0                                                               | 186 ++++++-----
 meta/files/common-licenses/CECILL-2.1                                                               | 249 ++++++++++++++
 meta/files/common-licenses/CECILL-B                                                                 | 188 ++++++-----
 meta/files/common-licenses/CECILL-C                                                                 | 186 ++++++-----
 meta/files/common-licenses/CLISP-exception-2.0                                                      |  15 +
 meta/files/common-licenses/CPAL-1.0                                                                 | 175 ++++++----
 meta/files/common-licenses/CPL-1.0                                                                  | 206 +++---------
 meta/files/common-licenses/CPOL-1.02                                                                |  98 ++++++
 meta/files/common-licenses/CUA-OPL-1.0                                                              | 504 +++++------------------------
 meta/files/common-licenses/ClArtistic                                                               | 187 ++++-------
 meta/files/common-licenses/Classpath-exception-2.0                                                  |   3 +
 meta/files/common-licenses/DigiRule-FOSS-exception                                                  |  54 ++++
 meta/files/common-licenses/ECL-1.0                                                                  |  56 +---
 meta/files/common-licenses/ECL-2.0                                                                  |  39 ++-
 meta/files/common-licenses/EDL-1.0                                                                  |   2 +-
 meta/files/common-licenses/EFL-1.0                                                                  |  24 +-
 meta/files/common-licenses/EFL-2.0                                                                  |  13 +-
 meta/files/common-licenses/EPL-1.0                                                                  |  57 ++--
 meta/files/common-licenses/EUDatagrid                                                               |  15 +-
 meta/files/common-licenses/EUPL-1.0                                                                 | 306 ++++++++----------
 meta/files/common-licenses/EUPL-1.1                                                                 | 319 ++++++++----------
 meta/files/common-licenses/Entessa                                                                  |  22 +-
 meta/files/common-licenses/ErlPL-1.1                                                                | 299 +++--------------
 meta/files/common-licenses/FLTK-exception                                                           |  17 +
 meta/files/common-licenses/Fair                                                                     |   6 +-
 meta/files/common-licenses/Fawkes-Runtime-exception                                                 |   1 +
 meta/files/common-licenses/Font-exception-2.0                                                       |   1 +
 meta/files/common-licenses/Frameworx-1.0                                                            |  46 +--
 meta/files/common-licenses/FreeType                                                                 |   2 +-
 meta/files/common-licenses/GCC-exception-2.0                                                        |   1 +
 meta/files/common-licenses/GCC-exception-3.1                                                        |  33 ++
 meta/files/common-licenses/GFDL-1.1                                                                 | 378 ++++------------------
 meta/files/common-licenses/GFDL-1.2                                                                 | 419 +++++-------------------
 meta/files/common-licenses/GFDL-1.3                                                                 | 476 +++++----------------------
 meta/files/common-licenses/GPL-1.0                                                                  | 332 ++++++-------------
 meta/files/common-licenses/GPL-2.0                                                                  |  73 ++---
 meta/files/common-licenses/GPL-2.0-with-GCC-exception                                               |  17 -
 meta/files/common-licenses/GPL-2.0-with-OpenSSL-exception                                           |  20 +-
 meta/files/common-licenses/GPL-2.0-with-autoconf-exception                                          |   6 -
 meta/files/common-licenses/GPL-2.0-with-font-exception                                              |  18 --
 meta/files/common-licenses/GPL-3.0                                                                  |  96 +++---
 meta/files/common-licenses/HPND                                                                     |   4 -
 meta/files/common-licenses/ICU                                                                      |   7 +-
 meta/files/common-licenses/IPA                                                                      |  82 ++---
 meta/files/common-licenses/IPL-1.0                                                                  |  80 ++---
 meta/files/common-licenses/ISC                                                                      |   8 +-
 meta/files/common-licenses/LGPL-2.0                                                                 | 204 ++----------
 meta/files/common-licenses/LGPL-2.1                                                                 |  79 +++--
 meta/files/common-licenses/LGPL-3.0                                                                 |  64 ++--
 meta/files/common-licenses/LPL-1.02                                                                 |  61 ++--
 meta/files/common-licenses/LPPL-1.0                                                                 | 214 +++----------
 meta/files/common-licenses/LPPL-1.1                                                                 | 347 +++++---------------
 meta/files/common-licenses/LPPL-1.2                                                                 | 360 ++++++---------------
 meta/files/common-licenses/LPPL-1.3c                                                                | 468 +++++++--------------------
 meta/files/common-licenses/LZMA-exception                                                           |   3 +
 meta/files/common-licenses/Libpng                                                                   | 110 +++----
 meta/files/common-licenses/Libtool-exception                                                        |   1 +
 meta/files/common-licenses/MIT                                                                      |  20 +-
 meta/files/common-licenses/MPL-1.0                                                                  | 112 ++++---
 meta/files/common-licenses/MPL-1.1                                                                  | 176 ++++------
 meta/files/common-licenses/MPL-2.0                                                                  | 415 ++++++------------------
 meta/files/common-licenses/MS-PL                                                                    |  33 +-
 meta/files/common-licenses/MS-RL                                                                    |  41 ++-
 meta/files/common-licenses/MirOS                                                                    |  68 ++--
 meta/files/common-licenses/Motosoto                                                                 | 466 +++++----------------------
 meta/files/common-licenses/Multics                                                                  |  37 +--
 meta/files/common-licenses/NASA-1.3                                                                 |  56 ++--
 meta/files/common-licenses/NCSA                                                                     |  41 +--
 meta/files/common-licenses/NGPL                                                                     |  28 +-
 meta/files/common-licenses/NPOSL-3.0                                                                |  32 +-
 meta/files/common-licenses/NTP                                                                      |   6 +-
 meta/files/common-licenses/Nokia                                                                    | 456 ++++++--------------------
 meta/files/common-licenses/Nokia-Qt-exception-1.1                                                   |  16 +
 meta/files/common-licenses/OCCT-exception-1.0                                                       |   3 +
 meta/files/common-licenses/OCLC-2.0                                                                 |  12 +-
 meta/files/common-licenses/ODbL-1.0                                                                 | 616 +++++++++--------------------------
 meta/files/common-licenses/OFL-1.1                                                                  |  95 ++----
 meta/files/common-licenses/OGTSL                                                                    | 165 +++-------
 meta/files/common-licenses/OLDAP-2.8                                                                |  49 +--
 meta/files/common-licenses/OSL-1.0                                                                  | 197 +++---------
 meta/files/common-licenses/OSL-2.0                                                                  |  25 +-
 meta/files/common-licenses/OSL-3.0                                                                  |  42 ++-
 meta/files/common-licenses/OpenSSL                                                                  | 146 +++------
 meta/files/common-licenses/PHP-3.0                                                                  |  76 +----
 meta/files/common-licenses/PostgreSQL                                                               |   4 +-
 meta/files/common-licenses/Python-2.0                                                               | 242 ++++----------
 meta/files/common-licenses/QPL-1.0                                                                  |  20 +-
 meta/files/common-licenses/Qwt-exception-1.0                                                        |  12 +
 meta/files/common-licenses/RHeCos-1.1                                                               |  90 +++---
 meta/files/common-licenses/RPL-1.5                                                                  | 657 ++++++++-----------------------------
 meta/files/common-licenses/RPSL-1.0                                                                 | 109 +++----
 meta/files/common-licenses/RSCPL                                                                    | 153 +++------
 meta/files/common-licenses/Ruby                                                                     |  61 +---
 meta/files/common-licenses/SAX-PD                                                                   |   8 +-
 meta/files/common-licenses/SGI-1                                                                    |  12 +-
 meta/files/common-licenses/SGI-B-1.0                                                                |  82 +++++
 meta/files/common-licenses/SGI-B-1.1                                                                |  84 +++++
 meta/files/common-licenses/SGI-B-2.0                                                                |  12 +
 meta/files/common-licenses/SMAIL_GPL                                                                |   4 +-
 meta/files/common-licenses/SPL-1.0                                                                  | 552 ++++++-------------------------
 meta/files/common-licenses/Sleepycat                                                                | 123 ++-----
 meta/files/common-licenses/SugarCRM-1.1.3                                                           | 141 ++++----
 meta/files/common-licenses/VSL-1.0                                                                  |  45 +--
 meta/files/common-licenses/W3C                                                                      |  22 +-
 meta/files/common-licenses/WXwindows                                                                |   6 +-
 meta/files/common-licenses/Watcom-1.0                                                               | 120 +++----
 meta/files/common-licenses/WxWindows-exception-3.1                                                  |   9 +
 meta/files/common-licenses/XFree86-1.1                                                              |  12 +-
 meta/files/common-licenses/Xnet                                                                     |  24 +-
 meta/files/common-licenses/YPL-1.1                                                                  |  59 ++--
 meta/files/common-licenses/ZPL-1.1                                                                  |  31 +-
 meta/files/common-licenses/ZPL-2.0                                                                  |  58 +---
 meta/files/common-licenses/ZPL-2.1                                                                  |  19 +-
 meta/files/common-licenses/Zimbra-1.3                                                               |  47 ++-
 meta/files/common-licenses/Zlib                                                                     |  20 +-
 meta/files/common-licenses/bzip2-1.0.6                                                              |  15 +
 meta/files/common-licenses/deprecated_GPL-2.0-with-GCC-exception                                    |   4 +
 meta/files/common-licenses/deprecated_GPL-2.0-with-autoconf-exception                               |   9 +
 meta/files/common-licenses/deprecated_GPL-2.0-with-bison-exception                                  |   5 +
 .../{GPL-2.0-with-classpath-exception => deprecated_GPL-2.0-with-classpath-exception}               |   6 +-
 meta/files/common-licenses/deprecated_GPL-2.0-with-font-exception                                   |   5 +
 meta/files/common-licenses/{GPL-3.0-with-GCC-exception => deprecated_GPL-3.0-with-GCC-exception}    |   8 +-
 meta/files/common-licenses/deprecated_GPL-3.0-with-autoconf-exception                               |  26 ++
 meta/files/common-licenses/eCos-exception-2.0                                                       |   3 +
 meta/files/common-licenses/freertos-exception-2.0                                                   |  19 ++
 meta/files/common-licenses/gSOAP-1.3b                                                               | 151 ++++-----
 meta/files/common-licenses/gnu-javamail-exception                                                   |   1 +
 meta/files/common-licenses/i2p-gpl-java-exception                                                   |   1 +
 meta/files/common-licenses/mif-exception                                                            |   1 +
 meta/files/common-licenses/openvpn-openssl-exception                                                |   3 +
 meta/files/common-licenses/u-boot-exception-2.0                                                     |   6 +
 meta/lib/oe/license.py                                                                              |  21 +-
 meta/recipes-connectivity/connman/connman-conf.bb                                                   |   2 +-
 meta/recipes-core/glibc/glibc-collateral.inc                                                        |   4 +-
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb                                           |   2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb                                                    |   2 +-
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb                                              |   2 +-
 meta/recipes-devtools/gcc/gcc-5.4.inc                                                               |   2 +-
 meta/recipes-devtools/gcc/gcc-6.1.inc                                                               |   2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc                                                           |   2 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc                                                        |   2 +-
 meta/recipes-devtools/gcc/libgcc.inc                                                                |   6 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb                                                  |   2 +-
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb                                                         |   2 +-
 meta/recipes-extended/xz/xz_5.2.2.bb                                                                |  14 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb                                                          |   2 +-
 227 files changed, 8619 insertions(+), 12544 deletions(-)
 create mode 100644 meta/files/common-licenses/389-exception
 create mode 100644 meta/files/common-licenses/Adobe-2006
 create mode 100644 meta/files/common-licenses/Adobe-Glyph
 create mode 100644 meta/files/common-licenses/Artistic-1.0-Perl
 create mode 100644 meta/files/common-licenses/Artistic-1.0-cl8
 create mode 100644 meta/files/common-licenses/Autoconf-exception-2.0
 rename meta/files/common-licenses/{GPL-3.0-with-autoconf-exception => Autoconf-exception-3.0} (91%)
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-FreeBSD
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-NetBSD
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Attribution
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Clear
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-LBNL
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-License-2014
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-No-Nuclear-Warranty
 create mode 100644 meta/files/common-licenses/BSD-4-Clause-UC
 create mode 100644 meta/files/common-licenses/BSD-Protection
 create mode 100644 meta/files/common-licenses/BSD-Source-Code
 rename meta/files/common-licenses/{GPL-2-with-bison-exception => Bison-exception-2.2} (87%)
 create mode 100644 meta/files/common-licenses/CC-BY-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-ND-4.0
 create mode 100644 meta/files/common-licenses/CC-BY-SA-4.0
 create mode 100644 meta/files/common-licenses/CDDL-1.1
 create mode 100644 meta/files/common-licenses/CECILL-1.1
 create mode 100644 meta/files/common-licenses/CECILL-2.1
 create mode 100644 meta/files/common-licenses/CLISP-exception-2.0
 create mode 100644 meta/files/common-licenses/CPOL-1.02
 create mode 100644 meta/files/common-licenses/Classpath-exception-2.0
 create mode 100644 meta/files/common-licenses/DigiRule-FOSS-exception
 create mode 100644 meta/files/common-licenses/FLTK-exception
 create mode 100644 meta/files/common-licenses/Fawkes-Runtime-exception
 create mode 100644 meta/files/common-licenses/Font-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-2.0
 create mode 100644 meta/files/common-licenses/GCC-exception-3.1
 delete mode 100644 meta/files/common-licenses/GPL-2.0-with-GCC-exception
 delete mode 100644 meta/files/common-licenses/GPL-2.0-with-autoconf-exception
 delete mode 100644 meta/files/common-licenses/GPL-2.0-with-font-exception
 create mode 100644 meta/files/common-licenses/LZMA-exception
 create mode 100644 meta/files/common-licenses/Libtool-exception
 create mode 100644 meta/files/common-licenses/Nokia-Qt-exception-1.1
 create mode 100644 meta/files/common-licenses/OCCT-exception-1.0
 create mode 100644 meta/files/common-licenses/Qwt-exception-1.0
 create mode 100644 meta/files/common-licenses/SGI-B-1.0
 create mode 100644 meta/files/common-licenses/SGI-B-1.1
 create mode 100644 meta/files/common-licenses/SGI-B-2.0
 create mode 100644 meta/files/common-licenses/WxWindows-exception-3.1
 create mode 100644 meta/files/common-licenses/bzip2-1.0.6
 create mode 100644 meta/files/common-licenses/deprecated_GPL-2.0-with-GCC-exception
 create mode 100644 meta/files/common-licenses/deprecated_GPL-2.0-with-autoconf-exception
 create mode 100644 meta/files/common-licenses/deprecated_GPL-2.0-with-bison-exception
 rename meta/files/common-licenses/{GPL-2.0-with-classpath-exception => deprecated_GPL-2.0-with-classpath-exception} (97%)
 create mode 100644 meta/files/common-licenses/deprecated_GPL-2.0-with-font-exception
 rename meta/files/common-licenses/{GPL-3.0-with-GCC-exception => deprecated_GPL-3.0-with-GCC-exception} (98%)
 create mode 100644 meta/files/common-licenses/deprecated_GPL-3.0-with-autoconf-exception
 create mode 100644 meta/files/common-licenses/eCos-exception-2.0
 create mode 100644 meta/files/common-licenses/freertos-exception-2.0
 create mode 100644 meta/files/common-licenses/gnu-javamail-exception
 create mode 100644 meta/files/common-licenses/i2p-gpl-java-exception
 create mode 100644 meta/files/common-licenses/mif-exception
 create mode 100644 meta/files/common-licenses/openvpn-openssl-exception
 create mode 100644 meta/files/common-licenses/u-boot-exception-2.0


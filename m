Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QWxIB-0004Sg-Ew
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 23:06:28 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 15 Jun 2011 14:01:47 -0700
Received: by eyg24 with SMTP id 24so313767eyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 14:01:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.120.199 with SMTP id p47mr31077eeh.163.1308171706460; Wed,
	15 Jun 2011 14:01:46 -0700 (PDT)
Received: by 10.14.48.66 with HTTP; Wed, 15 Jun 2011 14:01:46 -0700 (PDT)
Date: Wed, 15 Jun 2011 14:01:46 -0700
Message-ID: <BANLkTi=vPH3A6oO_OuT84nKorWiF2=N2Bg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] More LICENSE cleanup and additional common-licenses
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
X-List-Received-Date: Wed, 15 Jun 2011 21:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've added some more licenses from the SPDX project as well as
corrected some text.
GCC's LICENSE field was problematic and I've corrected it to the
actual GPL exception
license text. I've also cleaned up gdb's LICENSE field.

The following changes since commit e1f6ebba3ab2fc8a469c1d96fc6d4c4b8f16845c:

  meta-yocto: use FILESEXTRAPATHS_prepend := in all bbappends
(2011-06-15 11:49:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/license_corrections
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_corrections

Beth Flanagan (1):
  common-licenses: Additions and corrections

 meta/files/common-licenses/AAL                     |    6 +-
 meta/files/common-licenses/AFL-1.2                 |  123 ++++
 meta/files/common-licenses/AFL-2.0                 |   48 ++
 meta/files/common-licenses/AFL-2.1                 |   50 ++
 meta/files/common-licenses/AFL-3.0                 |   27 +
 meta/files/common-licenses/AGPL-3.0                |    3 +
 meta/files/common-licenses/ANTLR-PD                |   32 +
 meta/files/common-licenses/APL-1.0                 |  218 +++++++
 meta/files/common-licenses/APSL-1.0                |  372 +++++++++++
 meta/files/common-licenses/APSL-1.1                |  374 +++++++++++
 meta/files/common-licenses/APSL-1.2                |  105 ++++
 meta/files/common-licenses/APSL-2.0                |  102 +++
 meta/files/common-licenses/Apache-1.0              |   61 ++
 meta/files/common-licenses/Apache-1.1              |   60 ++
 meta/files/common-licenses/Apache-2.0              |    4 +-
 meta/files/common-licenses/Artistic-1.0            |   50 ++
 meta/files/common-licenses/Artistic-2.0            |  203 ++++++
 meta/files/common-licenses/BSD-2-Clause            |   26 +-
 meta/files/common-licenses/BSD-3-Clause            |   26 +-
 meta/files/common-licenses/BSD-4-Clause            |   17 +-
 meta/files/common-licenses/BSL-1.0                 |   25 +
 meta/files/common-licenses/CATOSL-1.1              |  116 ++++
 meta/files/common-licenses/CC-BY-1.0               |   60 ++
 meta/files/common-licenses/CC-BY-2.0               |   63 ++
 meta/files/common-licenses/CC-BY-2.5               |   63 ++
 meta/files/common-licenses/CC-BY-3.0               |   70 ++
 meta/files/common-licenses/CC-BY-NC-1.0            |   63 ++
 meta/files/common-licenses/CC-BY-NC-2.0            |   66 ++
 meta/files/common-licenses/CC-BY-NC-2.5            |   66 ++
 meta/files/common-licenses/CC-BY-NC-3.0            |   72 +++
 meta/files/common-licenses/CC-BY-NC-ND-1.0         |    5 +
 meta/files/common-licenses/CC-BY-NC-ND-2.0         |   63 ++
 meta/files/common-licenses/CC-BY-NC-ND-2.5         |   63 ++
 meta/files/common-licenses/CC-BY-NC-ND-3.0         |   69 ++
 meta/files/common-licenses/CC-BY-NC-SA-1.0         |   64 ++
 meta/files/common-licenses/CC-BY-NC-SA-2.0         |   68 ++
 meta/files/common-licenses/CC-BY-NC-SA-2.5         |   68 ++
 meta/files/common-licenses/CC-BY-NC-SA-3.0         |   74 +++
 meta/files/common-licenses/CC-BY-ND-1.0            |   59 ++
 meta/files/common-licenses/CC-BY-ND-2.0            |   62 ++
 meta/files/common-licenses/CC-BY-ND-2.5            |   62 ++
 meta/files/common-licenses/CC-BY-ND-3.0            |   68 ++
 meta/files/common-licenses/CC-BY-SA-1.0            |   63 ++
 meta/files/common-licenses/CC-BY-SA-2.0            |   67 ++
 meta/files/common-licenses/CC-BY-SA-2.5            |   67 ++
 meta/files/common-licenses/CC-BY-SA-3.0            |   74 +++
 meta/files/common-licenses/CC0-1.0                 |   32 +
 meta/files/common-licenses/CDDL-1.0                |  131 ++++
 meta/files/common-licenses/CECILL-1.0              |  242 +++++++
 meta/files/common-licenses/CECILL-2.0              |  243 +++++++
 meta/files/common-licenses/CECILL-B                |  440 ++++----------
 meta/files/common-licenses/CECILL-C                |  447 ++++----------
 meta/files/common-licenses/CPAL-1.0                |  109 ++++
 meta/files/common-licenses/CPL-1.0                 |  215 +++++++
 meta/files/common-licenses/CUA-OPL-1.0             |  471 ++++++++++++++
 meta/files/common-licenses/ClArtistic              |  110 ++--
 meta/files/common-licenses/ECL-1.0                 |   55 ++
 meta/files/common-licenses/ECL-2.0                 |   99 +++
 meta/files/common-licenses/EFL-1.0                 |   25 +
 meta/files/common-licenses/EFL-2.0                 |   12 +
 meta/files/common-licenses/EPL-1.0                 |   72 +++
 meta/files/common-licenses/EUDatagrid              |   65 +--
 meta/files/common-licenses/EUPL-1.0                |  184 ++++++
 meta/files/common-licenses/EUPL-1.1                |  204 ++++++
 meta/files/common-licenses/Entessa                 |   48 +--
 meta/files/common-licenses/ErlPL-1.1               |  288 +++++++++
 meta/files/common-licenses/Fair                    |    9 +-
 meta/files/common-licenses/Frameworx-1.0           |   69 ++
 meta/files/common-licenses/GFDL-1.2                |   20 +-
 meta/files/common-licenses/GFDL-1.3                |   18 +-
 meta/files/common-licenses/GPL-1.0                 |  252 ++++++++
 meta/files/common-licenses/GPL-1.0+                |  252 ++++++++
 .../common-licenses/GPL-2-with-bison-exception     |   17 +-
 meta/files/common-licenses/GPL-2.0                 |  132 ++++
 meta/files/common-licenses/GPL-2.0+                |  132 ++++
 .../common-licenses/GPL-2.0-with-GCC-exception     |    6 +
 .../GPL-2.0-with-autoconf-exception                |    6 +
 .../GPL-2.0-with-classpath-exception               |    7 +
 .../common-licenses/GPL-2.0-with-font-exception    |    6 +
 meta/files/common-licenses/GPL-3.0                 |    3 +
 meta/files/common-licenses/GPL-3.0+                |    3 +
 .../common-licenses/GPL-3.0-with-GCC-exception     |   27 +
 .../GPL-3.0-with-autoconf-exception                |   28 +
 meta/files/common-licenses/HPND                    |   23 +-
 meta/files/common-licenses/IPA                     |  182 ++-----
 meta/files/common-licenses/IPL-1.0                 |  213 +++++++
 meta/files/common-licenses/ISC                     |   21 +-
 meta/files/common-licenses/LGPL-2.0                |  173 +++++
 meta/files/common-licenses/LGPL-2.0+               |  173 +++++
 meta/files/common-licenses/LGPL-2.1                |  658 +++++---------------
 meta/files/common-licenses/LGPL-2.1+               |  176 ++++++
 meta/files/common-licenses/LGPL-3.0                |   66 ++
 meta/files/common-licenses/LGPL-3.0+               |   66 ++
 meta/files/common-licenses/LPL-1.02                |   76 +++
 meta/files/common-licenses/LPPL-1.0                |  213 +++++++
 meta/files/common-licenses/LPPL-1.1                |  316 ++++++++++
 meta/files/common-licenses/LPPL-1.2                |  320 ++++++++++
 meta/files/common-licenses/LPPL-1.3c               |  418 +++++++++++++
 meta/files/common-licenses/Libpng                  |   79 +--
 meta/files/common-licenses/MIT                     |   11 +-
 meta/files/common-licenses/MPL-1.0                 |  109 ++++
 meta/files/common-licenses/MPL-1.1                 |  185 ++++++
 meta/files/common-licenses/MS-PL                   |   58 +--
 meta/files/common-licenses/MS-RL                   |   69 +--
 meta/files/common-licenses/MirOS                   |   49 +-
 meta/files/common-licenses/Motosoto                |   34 +-
 meta/files/common-licenses/Multics                 |    8 +-
 meta/files/common-licenses/NASA-1.3                |   79 +++
 meta/files/common-licenses/NCSA                    |   16 +-
 meta/files/common-licenses/NGPL                    |  117 +---
 meta/files/common-licenses/NPOSL-3.0               |   61 ++
 meta/files/common-licenses/NTP                     |   15 +-
 meta/files/common-licenses/Nauman                  |    5 -
 meta/files/common-licenses/Nokia                   |   95 ++--
 meta/files/common-licenses/OCLC-2.0                |   78 +++
 meta/files/common-licenses/ODbL-1.0                |  543 ++++++++++++++++
 meta/files/common-licenses/OFL-1.1                 |   88 +++
 meta/files/common-licenses/OGTSL                   |   73 +--
 meta/files/common-licenses/OLDAP-2.8               |   49 ++
 meta/files/common-licenses/OSL-1.0                 |  164 +++++
 meta/files/common-licenses/OSL-2.0                 |   48 ++
 meta/files/common-licenses/OSL-3.0                 |   27 +
 meta/files/common-licenses/OpenSSL                 |  212 +++----
 meta/files/common-licenses/PHP-3.0                 |   70 ++
 meta/files/common-licenses/PostgreSQL              |   22 +-
 meta/files/common-licenses/Python-2.0              |  192 ++++++
 meta/files/common-licenses/QPL-1.0                 |   48 ++
 meta/files/common-licenses/RHeCos-1.1              |  151 +++++
 meta/files/common-licenses/RPL-1.5                 |  546 ++++++++++++++++
 meta/files/common-licenses/RPSL-1.0                |  182 ++++++
 meta/files/common-licenses/RSCPL                   |  363 ++---------
 meta/files/common-licenses/Ruby                    |   82 ++--
 meta/files/common-licenses/SAX-PD                  |   33 +
 meta/files/common-licenses/SPL-1.0                 |  507 +++++++++++++++
 meta/files/common-licenses/Simple-2.0              |   27 +
 meta/files/common-licenses/Sleepycat               |   11 +-
 meta/files/common-licenses/SugarCRM-1.1.3          |  160 +++++
 meta/files/common-licenses/VSL-1.0                 |   49 ++
 meta/files/common-licenses/W3C                     |   55 +--
 meta/files/common-licenses/WXwindows               |  106 ++--
 meta/files/common-licenses/Watcom-1.0              |  140 +++++
 meta/files/common-licenses/XFree86-1.1             |   18 +
 meta/files/common-licenses/Xnet                    |   11 +-
 meta/files/common-licenses/YPL-1.1                 |   30 +
 meta/files/common-licenses/ZPL-1.1                 |   28 +
 meta/files/common-licenses/ZPL-2.0                 |   61 ++
 meta/files/common-licenses/ZPL-2.1                 |   18 +
 meta/files/common-licenses/Zimbra-1.3              |   30 +
 meta/files/common-licenses/Zlib                    |   34 +-
 meta/files/common-licenses/eCos-2.0                |   18 +
 meta/files/common-licenses/gSOAP-1.3b              |  157 +++++
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
 meta/recipes-devtools/gdb/gdb_7.2.bb               |    2 +-
 154 files changed, 13946 insertions(+), 2621 deletions(-)
 create mode 100644 meta/files/common-licenses/AFL-1.2
 create mode 100644 meta/files/common-licenses/AFL-2.0
 create mode 100644 meta/files/common-licenses/AFL-2.1
 create mode 100644 meta/files/common-licenses/AFL-3.0
 create mode 100644 meta/files/common-licenses/AGPL-3.0
 create mode 100644 meta/files/common-licenses/ANTLR-PD
 create mode 100644 meta/files/common-licenses/APL-1.0
 create mode 100644 meta/files/common-licenses/APSL-1.0
 create mode 100644 meta/files/common-licenses/APSL-1.1
 create mode 100644 meta/files/common-licenses/APSL-1.2
 create mode 100644 meta/files/common-licenses/APSL-2.0
 create mode 100644 meta/files/common-licenses/Apache-1.0
 create mode 100644 meta/files/common-licenses/Apache-1.1
 create mode 100644 meta/files/common-licenses/Artistic-1.0
 create mode 100644 meta/files/common-licenses/Artistic-2.0
 create mode 100644 meta/files/common-licenses/BSL-1.0
 create mode 100644 meta/files/common-licenses/CATOSL-1.1
 create mode 100644 meta/files/common-licenses/CC-BY-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-3.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-NC-3.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-NC-ND-3.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-3.0
 create mode 100644 meta/files/common-licenses/CC-BY-ND-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-ND-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-ND-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-ND-3.0
 create mode 100644 meta/files/common-licenses/CC-BY-SA-1.0
 create mode 100644 meta/files/common-licenses/CC-BY-SA-2.0
 create mode 100644 meta/files/common-licenses/CC-BY-SA-2.5
 create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0
 create mode 100644 meta/files/common-licenses/CC0-1.0
 create mode 100644 meta/files/common-licenses/CDDL-1.0
 create mode 100644 meta/files/common-licenses/CECILL-1.0
 create mode 100644 meta/files/common-licenses/CECILL-2.0
 create mode 100644 meta/files/common-licenses/CPAL-1.0
 create mode 100644 meta/files/common-licenses/CPL-1.0
 create mode 100644 meta/files/common-licenses/CUA-OPL-1.0
 create mode 100644 meta/files/common-licenses/ECL-1.0
 create mode 100644 meta/files/common-licenses/ECL-2.0
 create mode 100644 meta/files/common-licenses/EFL-1.0
 create mode 100644 meta/files/common-licenses/EFL-2.0
 create mode 100644 meta/files/common-licenses/EPL-1.0
 create mode 100644 meta/files/common-licenses/EUPL-1.0
 create mode 100644 meta/files/common-licenses/EUPL-1.1
 create mode 100644 meta/files/common-licenses/ErlPL-1.1
 create mode 100644 meta/files/common-licenses/Frameworx-1.0
 create mode 100644 meta/files/common-licenses/GPL-1.0
 create mode 100644 meta/files/common-licenses/GPL-1.0+
 create mode 100644 meta/files/common-licenses/GPL-2.0
 create mode 100644 meta/files/common-licenses/GPL-2.0+
 create mode 100644 meta/files/common-licenses/GPL-2.0-with-GCC-exception
 create mode 100644 meta/files/common-licenses/GPL-2.0-with-autoconf-exception
 create mode 100644 meta/files/common-licenses/GPL-2.0-with-classpath-exception
 create mode 100644 meta/files/common-licenses/GPL-2.0-with-font-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0
 create mode 100644 meta/files/common-licenses/GPL-3.0+
 create mode 100644 meta/files/common-licenses/GPL-3.0-with-GCC-exception
 create mode 100644 meta/files/common-licenses/GPL-3.0-with-autoconf-exception
 create mode 100644 meta/files/common-licenses/IPL-1.0
 create mode 100644 meta/files/common-licenses/LGPL-2.0
 create mode 100644 meta/files/common-licenses/LGPL-2.0+
 create mode 100644 meta/files/common-licenses/LGPL-2.1+
 create mode 100644 meta/files/common-licenses/LGPL-3.0
 create mode 100644 meta/files/common-licenses/LGPL-3.0+
 create mode 100644 meta/files/common-licenses/LPL-1.02
 create mode 100644 meta/files/common-licenses/LPPL-1.0
 create mode 100644 meta/files/common-licenses/LPPL-1.1
 create mode 100644 meta/files/common-licenses/LPPL-1.2
 create mode 100644 meta/files/common-licenses/LPPL-1.3c
 create mode 100644 meta/files/common-licenses/MPL-1.0
 create mode 100644 meta/files/common-licenses/MPL-1.1
 create mode 100644 meta/files/common-licenses/NASA-1.3
 create mode 100644 meta/files/common-licenses/NPOSL-3.0
 create mode 100644 meta/files/common-licenses/OCLC-2.0
 create mode 100644 meta/files/common-licenses/ODbL-1.0
 create mode 100644 meta/files/common-licenses/OFL-1.1
 create mode 100644 meta/files/common-licenses/OLDAP-2.8
 create mode 100644 meta/files/common-licenses/OSL-1.0
 create mode 100644 meta/files/common-licenses/OSL-2.0
 create mode 100644 meta/files/common-licenses/OSL-3.0
 create mode 100644 meta/files/common-licenses/PHP-3.0
 create mode 100644 meta/files/common-licenses/Python-2.0
 create mode 100644 meta/files/common-licenses/QPL-1.0
 create mode 100644 meta/files/common-licenses/RHeCos-1.1
 create mode 100644 meta/files/common-licenses/RPL-1.5
 create mode 100644 meta/files/common-licenses/RPSL-1.0
 create mode 100644 meta/files/common-licenses/SAX-PD
 create mode 100644 meta/files/common-licenses/SPL-1.0
 create mode 100644 meta/files/common-licenses/Simple-2.0
 create mode 100644 meta/files/common-licenses/SugarCRM-1.1.3
 create mode 100644 meta/files/common-licenses/VSL-1.0
 create mode 100644 meta/files/common-licenses/Watcom-1.0
 create mode 100644 meta/files/common-licenses/XFree86-1.1
 create mode 100644 meta/files/common-licenses/YPL-1.1
 create mode 100644 meta/files/common-licenses/ZPL-1.1
 create mode 100644 meta/files/common-licenses/ZPL-2.0
 create mode 100644 meta/files/common-licenses/ZPL-2.1
 create mode 100644 meta/files/common-licenses/Zimbra-1.3
 create mode 100644 meta/files/common-licenses/eCos-2.0
 create mode 100644 meta/files/common-licenses/gSOAP-1.3b



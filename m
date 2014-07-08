Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 15B16703CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 09:48:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s689m9Ac015919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 02:48:10 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 02:48:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 17:47:52 +0800
Message-ID: <cover.1404812342.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/8] support xmlto
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
X-List-Received-Date: Tue, 08 Jul 2014 09:48:14 -0000
Content-Type: text/plain

The xmlto was shipped from meta-oe, and fixed the defects that
'xmlto/xsltproc stylesheets cannot be found even when they are
installed in sysroot'

The xmlto required docbook-xml-dtd and docbook-xsl-stylesheets,
we refered debian's docbook-xml-dtd and ubuntu config.

We also enable xmlto for alsa-utils, xorg-proto-common.inc,
xorg-lib-common.inc, xserver-xorg.inc.

The test is easy, just build alsa-utils.

BTW: after this merged, I will clean up the duplicate one in meta-oe.

[YOCTO #2416]

//Hongxu

The following changes since commit a5531a2b8983318b99c119a87b78a92cf84160b8:

  bitbake: fetch2/svn: Add transportuser parameter (2014-07-04 09:28:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/support-xmlto
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/support-xmlto

Hongxu Jia (8):
  libxml2: enable Catalog support
  docbook-xml: add docbook-xsl-stylesheets 1.78.1
  docbook-xml: add docbook-xml-dtd4
  xmlto: add version 0.0.25
  alsa-utils: enable xmlto
  xorg-proto-common.inc: enable xmlto
  xorg-lib-common.inc: enable xmlto
  xserver-xorg.inc: enable xmlto

 meta/conf/licenses.conf                            |   2 +-
 meta/files/common-licenses/XSL                     |  48 ++
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 .../docbook-xml/docbook-xml-dtd4/LICENSE-OASIS     |  16 +
 .../docbook-xml-update-catalog.xml.patch           | 515 +++++++++++++++++++++
 .../docbook-xml/docbook-xml-dtd4/docbook-xml.xml   |  68 +++
 .../docbook-xml/docbook-xml-dtd4_4.5.bb            |  75 +++
 .../docbook-xsl-stylesheets/docbook-xsl.xml        |   6 +
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |  67 +++
 meta/recipes-devtools/xmlto/files/catalog.xml      |  19 +
 ....in-drop-the-test-of-xmllint-and-xsltproc.patch |  30 ++
 .../xmlto-0.0.25/obsolete_automake_macros.patch    |  12 +
 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb        |  42 ++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |   6 +-
 .../xorg-proto/xorg-proto-common.inc               |   6 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   4 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |   4 +-
 17 files changed, 911 insertions(+), 11 deletions(-)
 create mode 100644 meta/files/common-licenses/XSL
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
 create mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
 create mode 100644 meta/recipes-devtools/xmlto/files/catalog.xml
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto_0.0.25.bb

-- 
1.8.1.2



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D8D056E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97FeG009770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:08 -0700
Message-ID: <cover.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Package Upgrades
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:14 -0000
Content-Type: text/plain

The following changes since commit 8d207e55031c0b93387e728f4312b8cb34ad5b12:

  libgpg-error 1.18: simplify tupple handling and add armv8b support (2015-04-13 22:32:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Chong Lu (2):
  gstreamer: change priv_gst_parse_yylex arguments
  webkit-gtk: ANGLE doesn't build with bison 3

Robert Yang (4):
  gnu-efi: 3.0.1 -> 3.0.2
  tcl: 8.6.3 -> 8.6.4
  python-git: 0.3.6 -> 1.0.0
  bison: 2.7.1 -> 3.0.4

 .../gnu-efi/{gnu-efi_3.0.1.bb => gnu-efi_3.0.2.bb} |    4 +--
 .../bison/bison/dont-depend-on-help2man.patch      |   32 -------------------
 .../bison/bison/fix_cross_manpage_building.patch   |   19 -----------
 .../bison/{bison_2.7.1.bb => bison_3.0.4.bb}       |   20 ++++++------
 .../{python-git_0.3.6.bb => python-git_1.0.0.bb}   |    4 +--
 .../tcltk/{tcl_8.6.3.bb => tcl_8.6.4.bb}           |   16 +++++-----
 ...mer-change-priv_gst_parse_yylex-arguments.patch |   33 ++++++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bb                 |    1 +
 ...bkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch |   26 +++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    1 +
 10 files changed, 82 insertions(+), 74 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.1.bb => gnu-efi_3.0.2.bb} (93%)
 delete mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
 rename meta/recipes-devtools/bison/{bison_2.7.1.bb => bison_3.0.4.bb} (70%)
 rename meta/recipes-devtools/python/{python-git_0.3.6.bb => python-git_1.0.0.bb} (85%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.3.bb => tcl_8.6.4.bb} (81%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
 create mode 100644 meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch

-- 
1.7.9.5



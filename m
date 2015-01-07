Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82D1772916
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 15:02:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t07F2822014781
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 07:02:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 07:02:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 07:02:04 -0800
Message-ID: <cover.1420642796.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade libtool, git and file
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
X-List-Received-Date: Wed, 07 Jan 2015 15:02:12 -0000
Content-Type: text/plain

Tested:
$ bitbake core-image-minimal core-image-sato meta-toolchain adt-installer meta-ide-support world core-image-sato-sdk

// Robert

The following changes since commit 95f7d2c8fd5ee6ad0b7d202906073066f35a268d:

  insane.bbclass: fix desktop (2015-01-07 14:52:48 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (4):
  file: upgrade to 5.22
  git: upgrade to 2.2.1
  libtool: upgrade to 2.4.4
  opkg: fix error for new libtoolize

 .../file/{file_5.21.bb => file_5.22.bb}            |    4 +-
 .../git/{git_2.2.0.bb => git_2.2.1.bb}             |    4 +-
 .../{libtool-2.4.2.inc => libtool-2.4.4.inc}       |   16 +--
 ...btool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} |   19 ++-
 ...ool-native_2.4.2.bb => libtool-native_2.4.4.bb} |    1 -
 .../avoid_absolute_paths_for_general_utils.patch   |   39 -------
 .../libtool/libtool/dont-depend-on-help2man.patch  |   32 +++---
 .../libtool/libtool/fix-final-rpath.patch          |   22 ++--
 .../libtool/libtool/fix-resolve-lt-sysroot.patch   |   15 +--
 .../libtool/libtool/fix-rpath.patch                |    8 +-
 .../libtool/libtool/fixinstall.patch               |   35 +++---
 .../libtool/libtool/norm-rpath.patch               |    8 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |  121 +++++++++-----------
 .../libtool/libtool/rename-with-sysroot.patch      |   68 +++++------
 .../libtool/libtool/respect-fstack-protector.patch |   53 ---------
 .../libtool/libtool/trailingslash.patch            |   11 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |   12 +-
 .../libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} |    4 +-
 ...libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} |    2 -
 .../opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch |   32 ++++++
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |    1 +
 21 files changed, 219 insertions(+), 288 deletions(-)
 rename meta/recipes-devtools/file/{file_5.21.bb => file_5.22.bb} (86%)
 rename meta/recipes-devtools/git/{git_2.2.0.bb => git_2.2.1.bb} (61%)
 rename meta/recipes-devtools/libtool/{libtool-2.4.2.inc => libtool-2.4.4.inc} (77%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} (57%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.2.bb => libtool-native_2.4.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} (91%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} (97%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch

-- 
1.7.9.5



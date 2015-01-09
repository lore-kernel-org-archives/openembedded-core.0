Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7238B72730
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 05:33:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t095XhJo027461
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Jan 2015 21:33:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 8 Jan 2015 21:33:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Jan 2015 21:33:38 -0800
Message-ID: <cover.1420781433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Ugrade binutils, gnu-efi, python-git and python-gitdb
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
X-List-Received-Date: Fri, 09 Jan 2015 05:33:48 -0000
Content-Type: text/plain

Tested:
MACHINE="qemux86-64"
MACHINE="qemuarm"
MACHINE="qemuarm64"
MACHINE="qemuppc"
MACHINE="qemumips"
MACHINE="qemumips64"

$ bitbake core-image-minimal core-image-sato meta-toolchain adt-installer meta-ide-support world core-image-sato-sdk

// Robert

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/binutils
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/binutils

Robert Yang (4):
  python-git: upgrade to 0.3.3
  python-gitdb: upgrade to 0.6.1
  gnu-efi: upgrade to 3.0.1
  binutils: upgrade to 2.24

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb}  |    0
 .../{binutils-2.24.inc => binutils-2.25.inc}       |   20 +-
 ...ian_2.24.bb => binutils-cross-canadian_2.25.bb} |    0
 ...nutils-cross_2.24.bb => binutils-cross_2.25.bb} |    0
 ...-crosssdk_2.24.bb => binutils-crosssdk_2.25.bb} |    0
 .../binutils/binutils/binutils-poison.patch        |   40 +-
 .../binutils/binutils/binutils-xlp-support.patch   |  296 +++++------
 .../binutils/binutils/binutils_CVE-2014-8484.patch |   67 ---
 .../binutils/binutils/binutils_CVE-2014-8485.patch |  102 ----
 .../binutils/binutils/binutils_CVE-2014-8501.patch |   60 ---
 .../binutils/binutils/binutils_CVE-2014-8502.patch |   89 ----
 .../binutils/binutils_CVE-2014-8502_1.patch        |  523 --------------------
 .../binutils/binutils/binutils_CVE-2014-8503.patch |   47 --
 .../binutils/binutils/binutils_CVE-2014-8504.patch |   75 ---
 .../binutils/binutils/binutils_CVE-2014-8737.patch |  177 -------
 .../binutils/binutils/fix-pr15815.patch            |   36 --
 .../binutils/binutils/fix-pr16428.patch            |  123 -----
 .../binutils/binutils/fix-pr16476.patch            |  220 --------
 .../binutils/binutils/fix-pr2404.patch             |   76 ---
 .../binutils/binutils/libtool-2.4-update.patch     |  301 +++++------
 .../binutils/mips64-default-ld-emulation.patch     |   38 +-
 .../replace_macros_with_static_inline.patch        |  188 -------
 .../{binutils_2.24.bb => binutils_2.25.bb}         |    0
 ...python-git_0.3.2.RC1.bb => python-git_0.3.3.bb} |    5 +-
 ...python-gitdb_0.5.4.bb => python-gitdb_0.6.1.bb} |    5 +-
 26 files changed, 346 insertions(+), 2144 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.24.inc => binutils-2.25.inc} (58%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.24.bb => binutils-cross-canadian_2.25.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.24.bb => binutils-cross_2.25.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.24.bb => binutils-crosssdk_2.25.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr16428.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr16476.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr2404.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
 rename meta/recipes-devtools/binutils/{binutils_2.24.bb => binutils_2.25.bb} (100%)
 rename meta/recipes-devtools/python/{python-git_0.3.2.RC1.bb => python-git_0.3.3.bb} (85%)
 rename meta/recipes-devtools/python/{python-gitdb_0.5.4.bb => python-gitdb_0.6.1.bb} (78%)

-- 
1.7.9.5



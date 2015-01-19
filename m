Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F54972C94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7Ggh0018146
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:42 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:33 -0800
Message-ID: <cover.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] Package Upgrade
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

Hello,
I had sent "binutils: upgrade to 2.25" before, now send it again, they
are the same.

// Robert

The following changes since commit eaea05c88661a88a89fa6b139f7e6b243155d492:

  depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR (2015-01-17 17:05:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pus
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pus

Robert Yang (9):
  binutils: upgrade to 2.25
  autogen-native: upgrade to 5.18.4
  mklibs-native: upgrade to 0.1.40
  automake: upgrade to 1.15
  libtool: upgraded to 2.4.4
  opkg: fix libtoolize error
  gettext: upgrade to 0.19.4
  texinfo: update po_document/Makefile.in.in for new gettext
  texi2html: update po_document/Makefile.in.in for new gettext

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../parallel.patch                                 |   13 -
 .../gettext-minimal-0.18.3.2/Makevars.template     |   53 --
 .../gettext/gettext-minimal-0.18.3.2/aclocal.tgz   |  Bin 37591 -> 0 bytes
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   43 --
 .../COPYING                                        |    2 +-
 .../Makefile.in.in                                 |   47 +-
 .../gettext/gettext-minimal-0.19.4/aclocal.tgz     |  Bin 0 -> 39744 bytes
 .../config.rpath                                   |   18 +-
 .../remove-potcdate.sin                            |    0
 ....18.3.2.bb => gettext-minimal-native_0.19.4.bb} |    3 +-
 .../{gettext_0.18.3.2.bb => gettext_0.19.4.bb}     |    4 +-
 ...n-native_5.18.3.bb => autogen-native_5.18.4.bb} |    4 +-
 .../{automake_1.14.1.bb => automake_1.15.bb}       |    4 +-
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
 .../{libtool-2.4.2.inc => libtool-2.4.4.inc}       |   16 +-
 ...btool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} |   22 +-
 ...ool-native_2.4.2.bb => libtool-native_2.4.4.bb} |    1 -
 .../avoid_absolute_paths_for_general_utils.patch   |   39 --
 .../libtool/libtool/dont-depend-on-help2man.patch  |   32 +-
 .../libtool/libtool/fix-final-rpath.patch          |   22 +-
 .../libtool/libtool/fix-resolve-lt-sysroot.patch   |   15 +-
 .../libtool/libtool/fix-rpath.patch                |    8 +-
 .../libtool/libtool/fixinstall.patch               |   35 +-
 .../libtool/libtool/norm-rpath.patch               |    8 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |  121 ++---
 .../libtool/libtool/rename-with-sysroot.patch      |   68 +--
 .../libtool/libtool/respect-fstack-protector.patch |   53 --
 .../libtool/libtool/trailingslash.patch            |   11 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |   12 +-
 .../libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} |    4 +-
 ...libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} |    2 -
 ...bs-native_0.1.39.bb => mklibs-native_0.1.40.bb} |    8 +-
 .../opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch |   32 ++
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |    1 +
 .../texi2html-5.0/fix_gettext_version.patch        |   31 --
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   15 +-
 meta/recipes-extended/texinfo/texinfo_5.2.bb       |    6 +
 59 files changed, 618 insertions(+), 2615 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.18.3.2 => gettext-0.19.4}/parallel.patch (58%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/Makevars.template
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/aclocal.tgz
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.2/iconv-m4-remove-the-test-to-convert-euc-jp.patch
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/COPYING (76%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/Makefile.in.in (93%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/config.rpath (98%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.3.2 => gettext-minimal-0.19.4}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.3.2.bb => gettext-minimal-native_0.19.4.bb} (86%)
 rename meta/recipes-core/gettext/{gettext_0.18.3.2.bb => gettext_0.19.4.bb} (97%)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.3.bb => autogen-native_5.18.4.bb} (90%)
 rename meta/recipes-devtools/automake/{automake_1.14.1.bb => automake_1.15.bb} (89%)
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
 rename meta/recipes-devtools/libtool/{libtool-2.4.2.inc => libtool-2.4.4.inc} (77%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.2.bb => libtool-cross_2.4.4.bb} (52%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.2.bb => libtool-native_2.4.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_general_utils.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/respect-fstack-protector.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.2.bb => libtool_2.4.4.bb} (91%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.2.bb => nativesdk-libtool_2.4.4.bb} (97%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.39.bb => mklibs-native_0.1.40.bb} (73%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch
 delete mode 100644 meta/recipes-extended/texi2html/texi2html-5.0/fix_gettext_version.patch

-- 
1.7.9.5



Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PuqO3-00072e-8P
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 19:03:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2011 10:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,254,1297065600"; d="scan'208";a="663113023"
Received: from unknown (HELO localhost) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2011 10:00:11 -0800
Message-Id: <cover.1299088353.git.sgw@linux.intel.com>
Old-Date: Wed, 2 Mar 2011 09:52:33 -0800
Date: Wed, 02 Mar 2011 10:00:10 -0800
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 02 Mar 2011 19:07:48 +0100
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Liping Ke <liping.ke@intel.com>, Dongxiao Xu <dongxiao.xu@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 00/26] Documentation and bug fixes
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
X-List-Received-Date: Wed, 02 Mar 2011 18:03:00 -0000

From: Saul Wold <sgw@linux.intel.com>

This is a batch of documentation updates and metadata bug fixes
addressing know bugs in the yoctoproject bugzilla.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Bruce Ashfield (2):
  u-boot: remove do_install from u-boot.inc
  kernel: remove explicit bash call in do_menuconfig

Dongxiao Xu (2):
  attr: Change SRC_URI to a correct location
  ncurses: Change ncurses patch SRC_URI location

Liping Ke (1):
  ADT: Fix several bugs for adt installer

Mark Hatle (1):
  insane.bbclass: Fix ELF bitsize comparison

Nitin A Kamble (1):
  gcc: take out libiberty files from gcc packages

Paul Eggleton (2):
  util-linux: split out uuidgen to a separate package
  zypper: add util-linux-uuidgen to RRECOMMENDS

Scott Garman (1):
  screenshot: change the order of LDADD arguments

Scott Rifenbark (15):
  documentation/poky-ref-manual/ref-images.xml:  Update to Images
    Appendix
  documentation/poky-ref-manual/introduction.xml: [BUGID# 553] - Fixed
    pokylinux.org link in Nightly Build section
  documentation/poky-ref-manual/introduction.xml: [BUGID# 553] - Fixed
    pokylinux URL
  [BUGID# 553] - documentation/poky-ref-manual/introduction.xml: Fixed
    pokylinux.org URL
  [BUGID# 553] - documentation/poky-ref-manual/introduction.xml: fixed
    pokylinux.org URL
  [BUGID# 553] - documentation/poky-ref-manual/development.xml: Fixed
    pokylinux URLs
  [BUGID# 553] - documentation/poky-ref-manual/development.xml: Fixed
    pokylinux.org URL
  [BUGID# 553] - documentation/poky-ref-manual/faq.xml: Fixed
    pokylinux.org reference
  [BUGID# 553] - documentation/poky-ref-manual/resources.xml: Fixed
    pokylinux URL
  documentation/poky-ref-manual/resources.xml: Text addtions in Links
    section in Appendix I
  [BUGID# 553] - documentation/poky-ref-manual/resources.xml:  Fixed
    pokylinux URL
  [BUGID# 553] - documentation/bsp-guide/bsp.xml: Re-write of
    click-through
  [BUGID# 695] - documentation/bsp-guide/figures/bsp-title.png: Updated
    title graphic
  documentation/bsp-guide/bsp-guide.xml: Updated RP email address
  documentation/bsp-guide/bsp-guide.xml: Updated revision history on
    title page.

Yu Ke (1):
  shadow: upgrade to 4.1.4.3 to fix security vulnerability

 documentation/bsp-guide/bsp-guide.xml              |    9 ++-
 documentation/bsp-guide/bsp.xml                    |   59 ++++++++------
 documentation/bsp-guide/figures/bsp-title.png      |  Bin 15226 -> 15029 bytes
 documentation/poky-ref-manual/development.xml      |   12 ++--
 documentation/poky-ref-manual/faq.xml              |    3 +-
 documentation/poky-ref-manual/introduction.xml     |    8 +-
 documentation/poky-ref-manual/ref-images.xml       |   59 ++++++++------
 documentation/poky-ref-manual/resources.xml        |   13 ++--
 meta/classes/insane.bbclass                        |   84 ++++++++++----------
 meta/classes/kernel.bbclass                        |    2 +-
 meta/lib/oe/qa.py                                  |   21 ++++-
 meta/recipes-bsp/uboot/u-boot.inc                  |    5 -
 meta/recipes-bsp/uboot/u-boot_git.bb               |    2 +-
 meta/recipes-core/ncurses/ncurses_5.7.bb           |    7 +-
 meta/recipes-core/util-linux/util-linux.inc        |    3 +-
 meta/recipes-core/util-linux/util-linux_2.17.2.bb  |    2 +-
 .../gcc/gcc-cross-initial_4.5.1.bb                 |    2 +-
 .../gcc/gcc-cross-intermediate.inc                 |    3 +-
 .../gcc/gcc-cross-intermediate_4.5.1.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb       |    2 +-
 .../gcc/gcc-crosssdk-initial_4.5.1.bb              |    2 +-
 .../gcc/gcc-crosssdk-intermediate_4.5.1.bb         |    2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |    4 +
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    4 +
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 .../installer/adt-installer/adt_installer          |    9 +-
 .../installer/adt-installer/adt_installer.conf     |    8 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 .../{shadow-4.1.4.2 => files}/login_defs_pam.sed   |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/chfn    |    0
 .../{shadow-4.1.4.2 => files}/pam.d/chpasswd       |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/chsh    |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/login   |    0
 .../{shadow-4.1.4.2 => files}/pam.d/newusers       |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/passwd  |    0
 .../shadow/{shadow-4.1.4.2 => files}/pam.d/su      |    0
 .../shadow/{shadow-4.1.4.2 => files}/securetty     |    0
 .../shadow-4.1.3-dots-in-usernames.patch           |    0
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    0
 .../shadow-4.1.4.2-groupmod-pam-check.patch        |    0
 .../shadow-4.1.4.2-su_no_sanitize_env.patch        |    0
 .../shadow.automake-1.11.patch                     |    0
 .../{shadow_4.1.4.2.bb => shadow_4.1.4.3.bb}       |    4 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    4 +-
 .../files/dso_linking_change_build_fix.patch       |   49 -----------
 .../screenshot/files/fix_ldadd_order.patch         |   12 +++
 meta/recipes-sato/screenshot/screenshot_svn.bb     |    6 +-
 meta/recipes-support/attr/attr.inc                 |    2 +-
 meta/recipes-support/attr/attr_2.4.44.bb           |    2 +-
 50 files changed, 212 insertions(+), 200 deletions(-)
 mode change 100755 => 100644 documentation/bsp-guide/figures/bsp-title.png
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/login_defs_pam.sed (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chfn (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chpasswd (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/chsh (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/login (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/newusers (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/passwd (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/pam.d/su (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/securetty (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.3-dots-in-usernames.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-env-reset-keep-locale.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-groupmod-pam-check.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow-4.1.4.2-su_no_sanitize_env.patch (100%)
 rename meta/recipes-extended/shadow/{shadow-4.1.4.2 => files}/shadow.automake-1.11.patch (100%)
 rename meta/recipes-extended/shadow/{shadow_4.1.4.2.bb => shadow_4.1.4.3.bb} (70%)
 delete mode 100644 meta/recipes-sato/screenshot/files/dso_linking_change_build_fix.patch
 create mode 100644 meta/recipes-sato/screenshot/files/fix_ldadd_order.patch




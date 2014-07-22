Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8EFA7026E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 10:14:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6MAES00008280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 03:14:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 22 Jul 2014 03:14:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 03:14:25 -0700
Message-ID: <cover.1406022752.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/40 V2] fix rdepends on bash perl and python
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
X-List-Received-Date: Tue, 22 Jul 2014 10:14:31 -0000
Content-Type: text/plain

Note:
I put PATCH 3 to PATCH 40 in one email to avoid flushing the mailing list, I'd
like to put them into one patch, but I have to write the reason one by one.
Please get the commits from the repo.

* V2: (Fixed comments from RP)
  - Add bash-native to ASSUME_PROVIDED
  - Use RDEPENDS_${PN} rather than RDEPENDS_${PN}_class-target

* V1:
  - Initial version

// Robert

The following changes since commit 6bc3696d8451a23d743daf03ee98c4ba54ce4551:

  wget: Remove unneeded DEPENDS line (2014-07-21 19:10:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/fixrdeps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/filedep

Robert Yang (40):
  bitbake.conf: add bash-native to ASSUME_PROVIDED
  kernel.bbclass: add perl python bash to RDEPENDS_kernel-dev
  groff: add perl to RDEPENDS_groff
  attr: add perl to RDEPENDS_attr-ptest
  git: add perl to RDEPENDS_gitweb
  syslinux: add perl to RDEPENDS_syslinux-misc
  texi2html: add perl to RDEPENDS_texi2html
  gst-plugins-package: add perl to RDEPENDS_gst-plugins-base-apps
  foomatic-filters: add perl to RDEPENDS_foomatic-filters
  icon-naming-utils: add perl to RDEPENDS_icon-naming-utils
  rpm: add perl to RDEPENDS_rpm-build
  opensp: add perl to RDEPENDS_opensp
  aspell: add perl to RDEPENDS_aspell-utils
  glib-2.0: add perl to RDEPENDS_glib-2.0-utils
  lttng-tools: add perl bash python to RDEPENDS_lttng-tools-ptest
  quilt: add bash and perl to RDEPENDS
  udev: add perl to RDEPENDS_udev-ptest
  apt: add bash to RDEPENDS_apt
  lsbtest: add bash to RDEPENDS_lsbtest
  oprofile: add bash to RDEPENDS_oprofile-ptest
  pax-utils: add bash to RDEPENDS_pax-utils
  gzip: add bash to RDEPENDS_gzip
  dtc: add bash to RDEPENDS_dtc
  pm-utils: add bash to RDEPENDS_pm-utils
  grep: add bash to RDEPENDS_grep
  kconfig-frontends: add bash to RDEPENDS_kconfig-frontends
  xz: add bash to RDEPENDS_xz
  libpam: add bash to RDEPENDS_libpam-xtests
  valgrind: add bash to RDEPENDS_valgrind-ptest
  ltp: add bash and python to RDEPENDS_ltp
  piglit: add bash to RDEPENDS_piglit
  usbutils: add python to RDEPENDS_usbutils
  libxml2: add python to RDEPENDS_libxml2-ptest
  builder: add python to RDEPENDS_builder
  lttng-ust: add python to RDEPENDS_lttng-ust-bin
  libevent: add python to RDEPENDS_libevent
  gconf: add python to RDEPENDS_gconf
  blktrace: add python to RDEPENDS_blktrace
  dpkg: add perl to RDEPENDS_perl
  gnu-config: add perl to RDEPENDS_gnu-config

 meta/classes/kernel.bbclass                        |    1 +
 meta/conf/bitbake.conf                             |    1 +
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    2 +-
 meta/recipes-bsp/usbutils/usbutils_007.bb          |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 ++
 meta/recipes-core/libxml/libxml2.inc               |    2 ++
 meta/recipes-core/udev/udev.inc                    |    2 +-
 meta/recipes-devtools/apt/apt_0.9.9.4.bb           |    2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/git/git.inc                  |    2 +-
 .../gnu-config/gnu-config_20120814.bb              |    2 ++
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 ++
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    2 ++
 .../kconfig-frontends_3.12.0.0.bb                  |    2 ++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    2 ++
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 ++
 meta/recipes-devtools/quilt/quilt-0.63.inc         |    5 +++--
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    4 +---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 +---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    1 +
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    2 +-
 .../foomatic/foomatic-filters_4.0.17.bb            |    2 ++
 meta/recipes-extended/grep/grep_2.19.bb            |    2 ++
 meta/recipes-extended/groff/groff_1.22.2.bb        |    2 ++
 meta/recipes-extended/gzip/gzip.inc                |    2 ++
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |    2 +-
 meta/recipes-extended/ltp/ltp_20140422.bb          |    2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   12 ++++++++++--
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |    2 ++
 meta/recipes-extended/xz/xz_5.1.3alpha.bb          |    2 ++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    2 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |    5 ++++-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 ++
 meta/recipes-kernel/dtc/dtc.inc                    |    1 +
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb       |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb       |    1 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    2 ++
 .../gstreamer/gst-plugins-package.inc              |    1 +
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 ++
 meta/recipes-support/attr/attr.inc                 |    2 +-
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 ++
 44 files changed, 76 insertions(+), 26 deletions(-)

-- 
1.7.9.5



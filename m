Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 81EFF65C75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 15:43:03 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id rd3so10750396pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 07:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=4hySVYhUunbMpKb9gASJDhYGycRbOhlSUJJpbopS47E=;
	b=oo44r+4BtxUyaSIUHKArhAMnYm39Siqn5hdCnWDneP5MuHHS/Cv0eotAYa1bQ3VTch
	Ve16fQ0dxa1TJ55TYKMtESclgRDeBBdabSXHiuZ5u/EooBP+JxUPwF/3uICGAiAkICAY
	Y9Q3YX7oBsezKo72LYFD4JBKbFQYT0AwayLwl9/zmvisu4bq9WeCE035WgWcytEBLH9Z
	fQcRCXzOzta5e3ATQHM4rgbJVoQbseceHacvGHOaBz09gX4fXYnGPDo7w7FW6qlhtNe3
	nKY/iMumpzUUUmiKHj85qIOIUT9uE/O1qcKUSLBpQDV8qfQTMXyu1GX7mUQdDryTneyZ
	femQ==
X-Received: by 10.66.245.225 with SMTP id xr1mr6489945pac.65.1423150985223;
	Thu, 05 Feb 2015 07:43:05 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id ms5sm5418330pbb.59.2015.02.05.07.43.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 07:43:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 07:42:54 -0800
Message-Id: <cover.1423150737.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Joe MacDonald <joe_macdonald@mentor.com>,
	=?UTF-8?q?Vincent=20G=C3=A9nieux?= <vincent2014@startigen.fr>,
	Armin Kuster <akuster@mvista.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Gary Thomas <gary@mlbassoc.com>,
	Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Dan McGregor <dan.mcgregor@usask.ca>, "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 00/61][Dizzy-next] Feb 2015
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
X-List-Received-Date: Thu, 05 Feb 2015 15:43:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for oe-core Dizzy

The following changes since commit 9fc095a439c36014c73b3a8f240afba09fe0e4d7:

  image.bbclass: avoid boot error on read-only systemd image (2015-01-15 16:01:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

André Draszik (1):
  openssl: fix hard paths in native openssl

Armin Kuster (5):
  glibc: CVE-2014-9402 endless loop in getaddr_r
  tzcode: update to 2015a leap second changes too
  tzdata: update to 2015a including leap second
  busybox: cve-2014-9645
  groff: fix QA issue with rdepends

Chong.Lu@windriver.com (1):
  file: CVE-2014-9620 and CVE-2014-9621

Dan McGregor (1):
  dpkg: fix host contamination

Dmitry Eremin-Solenikov (1):
  icecc.bbclass: properly handle disabling of icecc

Enrico Scholz (2):
  image_types.bbclass: fixed 'init' creation for cpio images
  image_types.bbclass: manage 'cpio_append' directory

Fabien Proriol (1):
  boost: Avoid to use local host configuration

Gary Thomas (1):
  perl: Backport fix for bug #123591

Hongxu Jia (1):
  distcc: fix initscript can not stop distcc daemon correctly

Joe MacDonald (1):
  libxml2: fix CVE-2014-3660

Kai Kang (1):
  openssh: deliver ssh-copy-id

Khem Raj (1):
  systemd: Backports fixes to 216

Li xin (1):
  elfutils_0.148.bb: CVE-2014-9447 fix

Mark Hatle (2):
  gcc/libgcc-common.inc: Add missing 'fakeroot' to two tasks
  python-smartpm: Fix attemptonly builds when file conflicts occur

Martin Jansa (2):
  package.bbclass: Fix support for private libs
  xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies

Maxin B. John (1):
  coreutils: Fix CVE-2014-9471

Mike Looijmans (1):
  package.bbclass: Let PR server update PKGV, not PV

Paul Eggleton (2):
  poky.conf: add file-rdeps to WARN_QA
  gcc: ensure target gcc headers can be included

Paul Gortmaker (1):
  packagegroup-self-hosted: package all of Python

Richard Purdie (13):
  libxml2: Backport fix for CVE introduced entity issues
  bitbake: cooker: Shut down the parser in error state
  bitbake: bitbake-worker: Use setsid() rather than setpgid()
  bitbake: cache/fetch2/siggen: Ensure we track include history for file
    checksums
  bitbake: wget: Add localpaths method which gives localpath with
    history
  bitbake: ast: Add error when trying to use dash in sh function names
  cross-canadian/meta-environment: Allow modification of TARGET_OS to be
    optional
  oeqa/utils/decorators: Try and improve ugly _ErrorHandler tracebacks
  lib/oe/package: Ensure strip breaks hardlinks
  bitbake: siggen: Ensure taskdata default functions exist in base class
  net-tools: Fix rerunning of do_patch task
  package/prserv: Merge two similar functions into one
  scripts/send-error-report: Set exit code if error occurs

Robert Yang (5):
  parted: parted-ptest RDEPENDS on python
  pax-utils: RDEPENDS on python
  guile: fixed installed-vs-shipped error
  neard: fix parallel issue
  perf: fix for rebuilding

Ross Burton (5):
  systemd: add missing RDEPENDS
  socat: forcibly disable use of libbsd
  python: ensure all of Python is installed in nativesdk
  python: remove spurious nativesdk dependency
  security_flags: disable PIE on expect

Saul Wold (2):
  glibc: Fix up minimal build with libc-libm
  security_flags: disable pie support for libaio, blktrace and ltp

Sona Sarmadi (1):
  python: Disables SSLv3

Ting Liu (4):
  libunwind: Fix test case link failure on PowerPC with Altivec
  bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
  valgrind: build with altivec only if it supported
  bind: fix typo chown->chmod

Tom Zanussi (3):
  perf: Add libdw unwind support to perf-libunwind feature
  perf: Disable perf-libunwind
  yocto-bsp: Add branch to SRC_URI for custom kernels

Vincent Génieux (1):
  fix '[[: not found' error message using dash

 bitbake/bin/bitbake-worker                         |    7 +-
 bitbake/lib/bb/cache.py                            |    9 +-
 bitbake/lib/bb/cooker.py                           |    2 +-
 bitbake/lib/bb/fetch2/__init__.py                  |   35 +-
 bitbake/lib/bb/fetch2/local.py                     |   54 +-
 bitbake/lib/bb/parse/ast.py                        |    2 +
 bitbake/lib/bb/siggen.py                           |   16 +-
 meta-yocto/conf/distro/poky.conf                   |    2 +-
 meta/classes/cross-canadian.bbclass                |    4 +
 meta/classes/icecc.bbclass                         |   15 +-
 meta/classes/image_types.bbclass                   |    6 +-
 meta/classes/kernel.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |   57 +-
 meta/classes/prserv.bbclass                        |   31 -
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/security_flags.inc        |    4 +
 meta/lib/oe/package.py                             |    3 +-
 meta/lib/oeqa/utils/decorators.py                  |   23 +-
 meta/recipes-connectivity/bind/bind/conf.patch     |    2 +-
 .../bind/bind/generate-rndc-key.sh                 |    2 +-
 .../neard/Makefile.am-fix-parallel-issue.patch     |   33 +
 meta/recipes-connectivity/neard/neard_0.14.bb      |    1 +
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |    1 +
 meta/recipes-connectivity/openssl/openssl.inc      |    9 +-
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb   |    1 +
 ..._busybox_reject_module_names_with_slashes.patch |   41 +
 meta/recipes-core/busybox/busybox_1.22.1.bb        |    1 +
 .../coreutils/coreutils-8.22/date-tz-crash.patch   |   43 +
 meta/recipes-core/coreutils/coreutils_8.22.bb      |    1 +
 .../CVE-2014-9402_endless-loop-in-getaddr_r.patch  |   65 +
 .../glibc/glibc/eglibc-use-option-groups.patch     |    3 +-
 meta/recipes-core/glibc/glibc_2.20.bb              |    4 +
 meta/recipes-core/libxml/libxml2.inc               |    1 +
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch |   30 +
 .../libxml/libxml2/libxml2-CVE-2014-3660.patch     |  147 ++
 meta/recipes-core/libxml/libxml2_2.9.1.bb          |    3 +-
 meta/recipes-core/meta/meta-environment.bb         |    5 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   28 +-
 ...onfigure-the-list-of-system-users-files-a.patch |  176 +++
 ...o-not-install-tmpfiles-and-sysusers-files.patch |   56 +
 ...ke-resolv.conf-entry-conditional-on-resol.patch |  142 ++
 ...es.d-etc.conf-disable-resolv.conf-symlink.patch |   35 -
 meta/recipes-core/systemd/systemd_216.bb           |   16 +-
 meta/recipes-devtools/distcc/files/distcc          |    5 +
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +
 .../elf_begin.c-CVE-2014-9447-fix.patch            |   36 +
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   23 +-
 .../file-CVE-2014-9620-and-CVE-2014-9621.patch     | 1414 ++++++++++++++++++++
 meta/recipes-devtools/file/file_5.18.bb            |    1 +
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../gcc/gcc-4.8/target-gcc-includedir.patch        |   81 ++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 .../gcc/gcc-4.9/target-gcc-includedir.patch        |   81 ++
 meta/recipes-devtools/gcc/libgcc-common.inc        |    4 +-
 .../guile/files/libguile-Makefile.am-depends.patch |   39 +
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 +-
 .../perl/perl-5.20.0/fix-FF_MORE-crash.patch       |   21 +
 meta/recipes-devtools/perl/perl_5.20.0.bb          |    1 +
 .../python/python-smartpm/smart-attempt.patch      |   97 +-
 .../python/python/python2.7.3-nossl3.patch         |   37 +
 meta/recipes-devtools/python/python_2.7.3.bb       |    3 +-
 .../pass-maltivec-only-if-it-supported.patch       |   68 +
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    1 +
 meta/recipes-extended/groff/groff_1.22.2.bb        |    2 +
 .../net-tools/net-tools_1.60-25.bb                 |    1 +
 meta/recipes-extended/parted/parted_3.1.bb         |    2 +-
 .../recipes-extended/tzcode/tzcode-native_2014j.bb |   10 -
 .../recipes-extended/tzcode/tzcode-native_2015a.bb |   10 +
 meta/recipes-extended/tzdata/tzdata_2014j.bb       |    6 -
 meta/recipes-extended/tzdata/tzdata_2015a.bb       |    6 +
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |    5 +-
 meta/recipes-graphics/xorg-app/xprop_1.2.2.bb      |    2 +-
 meta/recipes-kernel/perf/perf-features.inc         |    2 +-
 meta/recipes-kernel/perf/perf.bb                   |    6 +-
 meta/recipes-support/boost/boost.inc               |    3 +-
 ...k-failure-on-PowerPC-systems-with-Altivec.patch |   28 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    4 +
 ...choice == \"custom\": }} linux-yocto-custom.bb" |    4 +-
 scripts/send-error-report                          |    6 +-
 81 files changed, 2871 insertions(+), 267 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2014-9645_busybox_reject_module_names_with_slashes.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/date-tz-crash.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2014-9402_endless-loop-in-getaddr_r.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-3660.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/elf_begin.c-CVE-2014-9447-fix.patch
 create mode 100644 meta/recipes-devtools/file/file/file-CVE-2014-9620-and-CVE-2014-9621.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch
 create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/fix-FF_MORE-crash.patch
 create mode 100644 meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014j.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015a.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2014j.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015a.bb
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

-- 
1.9.1



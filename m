Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbZ-0001Lo-R9
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:10 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B23A32FF63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:14 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:01:53 -0800
Message-Id: <cover.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B23A32FF63.417E2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 00/16] denzil pull request 4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 05:36:10 -0000

Hello,

This is a pull request for denzil, it includes a number of security
fixes and a few important bugfixes. The poky-based tree has been run
through the autobuilder as follows:

nightly-x86: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/824

nightly-x86-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-lsb/builds/153

nightly-x86-64: Sanity test failure
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/747

Qemu apparently failed to shutdown cleanly. My impression is that this is
likely a sporadic error and does not appear to be reproducible. 

nightly-x86-64-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/148

nightly-arm: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/753

nightly-arm-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/146

nightly-mips: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/724

nightly-mips-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips-lsb/builds/151

nightly-ppc: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/704

nightly-ppc-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/153

nightly-non-gpl3: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/382

nightly-multilib: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/375

nightly-tiny: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/359

build-appliance: Failed
http://autobuilder.yoctoproject.org:8010/builders/build-appliance/builds/156

Failure was due to the fact that I didn't set up a special additional commit
for things to build on the autobuilder. 

eclipse-plugin: Green
http://autobuilder.yoctoproject.org:8010/builders/eclipse-plugin/builds/678

crownbay: Failed
http://autobuilder.yoctoproject.org:8010/builders/crownbay/builds/246

Failed configuring gst-plugins-good, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3536

crownbay-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/crownbay-noemgd/builds/247

emenlow: Green
http://autobuilder.yoctoproject.org:8010/builders/emenlow/builds/232

n450: Green
http://autobuilder.yoctoproject.org:8010/builders/n450/builds/236

jasperforest: Green
http://autobuilder.yoctoproject.org:8010/builders/jasperforest/builds/231

sugarbay: Failed
http://autobuilder.yoctoproject.org:8010/builders/sugarbay/builds/242

Failed configuring gst-plugins-good, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3536

fri2-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/fri2-noemgd/builds/244

fri2: Failed
http://autobuilder.yoctoproject.org:8010/builders/fri2/builds/259

Failed configuring gst-plugins-good, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3536

romley: Green
http://autobuilder.yoctoproject.org:8010/builders/romley/builds/206

cedartrail: Failed
http://autobuilder.yoctoproject.org:8010/builders/cedartrail/builds/211

Failed configuring gst-plugins-good, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3536

sys940x: Failed
http://autobuilder.yoctoproject.org:8010/builders/sys940x/builds/106

Failed configuring gst-plugins-good, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3536

sys940x-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/sys940x-noemgd/builds/105

p1022ds: Failed
http://autobuilder.yoctoproject.org:8010/builders/p1022ds/builds/156

Failed due to a bbappend version mismatch, bug tracked here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3535

The following changes since commit c15fae372cf75403facc28cf76f973b1279425dd:

  openssl: add deprecated and unmaintained find.pl from perl-5.14 to fix perlpath.pl (2012-10-04 09:08:16 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull4

Andrei Gherzan (1):
  opkg-utils: Add needed python modules as RDEPENDS

Joe Slater (1):
  gettext: install libgettextlib.a before removing it

Marcin Juszkiewicz (1):
  libxml: disable lzma

Martin Jansa (1):
  opkg-utils: bump SRCREV to latest

Nitin A Kamble (1):
  libxml2: fix build with automake 1.12

Paul Eggleton (1):
  classes/qmake_base: support linux-gnuspe/linux-uclibcspe TARGET_OS

Phil Blundell (1):
  openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION}

Richard Purdie (1):
  libxml2/libxslt: Don't depend on ansidecl.h header

Robert Yang (2):
  package_rpm.bbclass: Fix incremental rpm image generation
  rootfs_rpm.bbclass: save rpmlib rather than remove it

Ross Burton (1):
  gst-plugins-good: disable (uninstalled) examples

Roy.Li (1):
  bitbake: compile tar-replacement firstly

Saul Wold (1):
  libxml2: Update to 2.8.0

Scott Garman (1):
  openssl: upgrade to 1.0.0j

yanjun.zhu (2):
  libproxy: Fix for CVE-2012-4504
  squashfs: fix for CVE-2012-4024

 meta/classes/image.bbclass                         |    6 ++
 meta/classes/package_rpm.bbclass                   |   20 +++---
 meta/classes/qmake_base.bbclass                    |    2 +-
 meta/classes/rootfs_rpm.bbclass                    |    6 +-
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../{openssl-1.0.0i => openssl-1.0.0j}/find.pl     |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../{openssl_1.0.0i.bb => openssl_1.0.0j.bb}       |    4 +-
 .../gettext/gettext-0.18.1.1/parallel.patch        |   34 +++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 meta/recipes-core/libxml/libxml2.inc               |   15 ++--
 .../libxml/libxml2/fix_version_info.patch          |   23 -------
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    8 ---
 meta/recipes-core/libxml/libxml2_2.8.0.bb          |    6 ++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    5 +-
 .../patches/squashfs-4.2-fix-CVE-2012-4024.patch   |   72 ++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_4.2.bb           |    3 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    6 +-
 .../libproxy/libproxy-0.4.7-CVE-2012-4504.patch    |   29 ++++++++
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    1 +
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    7 +-
 scripts/bitbake                                    |    7 +-
 37 files changed, 197 insertions(+), 62 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0i.bb => openssl_1.0.0j.bb} (90%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.7.8.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.8.0.bb
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/libproxy-0.4.7-CVE-2012-4504.patch

-- 
1.7.9.5




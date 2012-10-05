Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKE9p-0000bh-Mf
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:01 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id D255B2FD12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:52:53 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:42 -0700
Message-Id: <cover.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: D255B2FD12.B7175
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/6] denzil pull request 3
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
X-List-Received-Date: Fri, 05 Oct 2012 20:06:01 -0000

Hello,

This is a pull request for denzil, it includes an important fix for the
kernel menuconfig sstate bug. The poky-based tree has been run through the
autobuilder as follows:

nightly-x86: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/755

nightly-x86-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-lsb/builds/83

nightly-x86-64: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/680

nightly-x86-64-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/81

nightly-arm: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/680

nightly-arm-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/79

nightly-mips: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/653

nightly-mips-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips-lsb/builds/80

nightly-ppc: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/634

nightly-ppc-lsb: kernel compile failure
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/82

kernel do_compile failure for mpc8315e_rdb-poky-linux:

|   BOOTCC  arch/powerpc/boot/cuboot-pq2.o
| In file included from /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/linux-yocto-3.0.32+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+83f422f718cf15633cb4c2d309aa041c3c354f65-r4/linux/arch/powerpc/boot/epapr.c:20:0:
| arch/powerpc/boot/libfdt.h:854:1: error: unterminated comment
| arch/powerpc/boot/libfdt.h:1:0: error: unterminated #ifndef
|   BOOTCC  arch/powerpc/boot/cuboot-sequoia.o
| make[3]: *** [arch/powerpc/boot/epapr.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[2]: *** [uImage] Error 2
| make[1]: *** [sub-make] Error 2
| make: *** [all] Error 2
| ERROR: oe_runmake failed
NOTE: package linux-yocto-3.0.32+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+83f422f718cf15633cb4c2d309aa041c3c354f65-r4: task do_compile: Failed

I heard from Matthew McClintock that a fix for this has been sent
upstream, sounds like we need to get this merged to our kernel tree.

nightly-non-gpl3: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/312

nightly-multilib: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/308

nightly-tiny: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/289

build-appliance: bootdirectdisk failure
http://autobuilder.yoctoproject.org:8010/builders/build-appliance/builds/83/steps/shell_43/logs/stdio

| ERROR: Function failed: build_boot_dd (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image-1.0-r16/temp/log.do_bootdirectdisk.25692 for further information)
| install: cannot stat `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/build-appliance/build/build/tmp/sysroots/qemux86-64/kernel/bzImage': No such file or directory
NOTE: package build-appliance-image-1.0-r16: task do_bootdirectdisk: Failed

eclipse-plugin: Green
http://autobuilder.yoctoproject.org:8010/builders/eclipse-plugin/builds/611

crownbay: Green
http://autobuilder.yoctoproject.org:8010/builders/crownbay/builds/222

crownbay-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/crownbay-noemgd/builds/223

emenlow: Green
http://autobuilder.yoctoproject.org:8010/builders/emenlow/builds/206

n450: Green
http://autobuilder.yoctoproject.org:8010/builders/n450/builds/209

jasperforest: Green
http://autobuilder.yoctoproject.org:8010/builders/jasperforest/builds/204

sugarbay: Green
http://autobuilder.yoctoproject.org:8010/builders/sugarbay/builds/216

fri2-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/fri2-noemgd/builds/218

fri2: Green
http://autobuilder.yoctoproject.org:8010/builders/fri2/builds/233

romley: Green
http://autobuilder.yoctoproject.org:8010/builders/romley/builds/180

cedartrail: Green
http://autobuilder.yoctoproject.org:8010/builders/cedartrail/builds/185

sys940x: do_rootfs failure
http://autobuilder.yoctoproject.org:8010/builders/sys940x/builds/80

| Processing rpm...
| error: Failed dependencies:
| 	libva.so.1 is needed by libegl1-1.10-r0.core2
| 	libva-tpi.so.1 is needed by libegl1-1.10-r0.core2
| 	libva-x11.so.1 is needed by libegl1-1.10-r0.core2
NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed

| Processing task-core-x11-base...
| error: Failed dependencies:
| 	libva.so.1 is needed by libegl1-1.10-r0.core2
| 	libva-tpi.so.1 is needed by libegl1-1.10-r0.core2
| 	libva-x11.so.1 is needed by libegl1-1.10-r0.core2
NOTE: package core-image-sato-sdk-1.0-r0: task do_rootfs: Failed

sys940x-noemgd: Green
http://autobuilder.yoctoproject.org:8010/builders/sys940x-noemgd/builds/79



The following changes since commit 032bd9a856f9ca0b43dff272bd4f95481aa46597:

  bootimg: Use STAGING_KERNEL_DIR (2012-09-28 16:51:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next-pull3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next-pull3

Darren Hart (1):
  gnutls: Update SRC_URI to use GNU_MIRROR

Dennis Lan (1):
  openjade-native: fix undefined Getopts error, use std namespace

Jesse Zhang (1):
  udev: don't mount with -o sync

Martin Jansa (1):
  openssl: add deprecated and unmaintained find.pl from perl-5.14 to
    fix perlpath.pl

Paul Eggleton (1):
  classes/cml1: ensure -c menuconfig forces a rebuild next time

Richard Purdie (1):
  siteconfig: Clear cache before rebuilding

 meta/classes/cml1.bbclass                          |   16 ++++++
 meta/classes/siteconfig.bbclass                    |    1 +
 .../openssl/openssl-1.0.0i/find.pl                 |   54 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    7 ++-
 meta/recipes-core/udev/udev/mount.sh               |    2 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 meta/recipes-support/gnutls/gnutls.inc             |    4 +-
 9 files changed, 127 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch

-- 
1.7.9.5




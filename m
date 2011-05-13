Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QKnUr-0005MQ-28
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 10:13:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 01:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,363,1301900400"; 
   d="scan'208";a="1713397"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 01:09:04 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QKnIy-0005vE-BF; Fri, 13 May 2011 16:01:00 +0800
Message-Id: <73ae94154701d329e8fa1cb1aa054a804da21fd6.1305273526.git.qing.he@intel.com>
In-Reply-To: <cover.1305273526.git.qing.he@intel.com>
References: <cover.1305273526.git.qing.he@intel.com>
Old-Date: Thu, 12 May 2011 11:13:55 +0800
Date: Fri, 13 May 2011 16:01:00 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 1/1] update patch upstream status
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
X-List-Received-Date: Fri, 13 May 2011 08:13:20 -0000

From: Qing He <qing.he@intel.com>

This patch includes the update of patch upstream status of the following
recipes (50 in all):

grub pciutils setserial dhcp iproute2 libnss-mdns nfs-utils openssl portmap
busybox coreutils dbus dropbear ncurses readline sysfsutils sysvinit tinylogin
udev update-rc.d util-linux elfutils file pkgconfig syslinux ubootchart
yaffs2 findutils gamin hdparm libaio libzypp parted procps sat-solver
screen sed sysklogd tcp-wrapper time zypper attr boost createrepo gnutls
hal js libgcrypt libnl libusb-compat

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-bsp/grub/grub-0.97/autohell.patch     |    2 ++
 .../pciutils/pciutils-3.1.7/configure.patch        |    1 +
 .../pciutils/pciutils-3.1.7/guess-fix.patch        |    2 ++
 .../pciutils/pciutils-3.1.7/lib-build-fix.patch    |    2 ++
 .../pciutils-3.1.7/pcimodules-pciutils.diff        |    2 ++
 .../setserial/setserial/add_stdlib.patch           |    2 ++
 .../dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch |    2 ++
 .../dhcp/dhcp-4.2.0/fix-client-path.patch          |    2 ++
 .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |    2 ++
 .../dhcp/dhcp-4.2.0/fixincludes.patch              |    2 ++
 .../dhcp/dhcp-4.2.0/noattrmode.patch               |    1 +
 .../iproute2/iproute2-2.6.35/configure-cross.patch |    2 ++
 .../libnss-mdns/files/alignment-fix.patch          |    2 ++
 .../nfs-utils/files/fix-ac-prereq.patch            |    2 ++
 .../nfs-utils/nfs-utils-1.0.6-uclibc.patch         |    2 ++
 .../openssl/openssl-0.9.8r/debian/ca.patch         |    2 ++
 .../openssl-0.9.8r/debian/config-hurd.patch        |    2 ++
 .../openssl-0.9.8r/debian/debian-targets.patch     |    2 ++
 .../openssl-0.9.8r/debian/engines-path.patch       |    2 ++
 .../openssl-0.9.8r/debian/kfreebsd-pipe.patch      |    2 ++
 .../openssl-0.9.8r/debian/make-targets.patch       |    2 ++
 .../openssl/openssl-0.9.8r/debian/man-dir.patch    |    2 ++
 .../openssl-0.9.8r/debian/man-section.patch        |    2 ++
 .../openssl/openssl-0.9.8r/debian/no-rpath.patch   |    2 ++
 .../openssl-0.9.8r/debian/no-symbolic.patch        |    2 ++
 .../openssl/openssl-0.9.8r/debian/perl-path.diff   |    2 ++
 .../openssl/openssl-0.9.8r/debian/pic.patch        |    2 ++
 .../openssl/openssl-0.9.8r/debian/pkg-config.patch |    2 ++
 .../openssl/openssl-0.9.8r/debian/rc4-amd64.patch  |    2 ++
 .../openssl/openssl-0.9.8r/debian/rehash-crt.patch |    2 ++
 .../openssl/openssl-0.9.8r/debian/rehash_pod.patch |    2 ++
 .../openssl-0.9.8r/debian/shared-lib-ext.patch     |    2 ++
 .../openssl/openssl-0.9.8r/debian/stddef.patch     |    2 ++
 .../openssl-0.9.8r/debian/version-script.patch     |    2 ++
 .../openssl/openssl-0.9.8r/parallel-make-fix.patch |    2 +-
 .../portmap/portmap-6.0/destdir-no-strip.patch     |    2 ++
 .../portmap/portmap-6.0/tcpd-config.patch          |    2 ++
 .../busybox/busybox-1.18.4/B921600.patch           |    2 ++
 .../busybox-appletlib-dependency.patch             |    2 ++
 .../busybox/busybox-1.18.4/get_header_tar.patch    |    2 ++
 .../busybox-1.18.4/run-parts.in.usr-bin.patch      |    2 ++
 .../busybox-1.18.4/udhcpc-fix-nfsroot.patch        |    2 ++
 .../busybox/busybox-1.18.4/udhcpscript.patch       |    2 ++
 .../coreutils-6.9/coreutils-6.9-cp-i-u.patch       |    2 ++
 .../coreutils-6.9/coreutils-fix-install.patch      |    2 ++
 .../coreutils/coreutils-6.9/coreutils-i18n.patch   |    2 ++
 .../coreutils/coreutils-6.9/coreutils-ls-x.patch   |    2 ++
 .../coreutils-6.9/coreutils-overflow.patch         |    2 ++
 .../coreutils-6.9/fix_for_manpage_building.patch   |    2 ++
 .../coreutils/coreutils-6.9/futimens.patch         |    2 ++
 .../coreutils/coreutils-6.9/gnulib_m4.patch        |    2 ++
 .../coreutils/coreutils-6.9/man-touch.patch        |    2 ++
 meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch     |    2 ++
 .../dropbear/dropbear-0.52/configure.patch         |    2 ++
 .../dropbear/dropbear/allow-nopw.patch             |    2 ++
 .../dropbear/dropbear/fix-2kb-keys.patch           |    2 ++
 .../urandom-xauth-changes-to-options.h.patch       |    2 ++
 .../ncurses/ncurses-5.9/tic-hang.patch             |    2 ++
 .../readline/files/configure-fix.patch             |    2 ++
 .../sysfsutils-2.0.0-class-dup.patch               |    2 ++
 .../sysvinit/sysvinit-2.88dsf/crypt-lib.patch      |    2 ++
 .../sysvinit/sysvinit-2.88dsf/install.patch        |    2 ++
 .../tinylogin/tinylogin-1.4/add-system.patch       |    2 ++
 .../tinylogin-1.4/adduser-empty_pwd.patch          |    2 ++
 .../tinylogin/tinylogin-1.4/cvs-20040608.patch     |    2 ++
 .../tinylogin-1.4/passwd_rotate_check.patch        |    2 ++
 .../tinylogin/tinylogin-1.4/remove-index.patch     |    2 ++
 .../tinylogin/tinylogin-1.4/use_O2_option.patch    |    2 ++
 meta/recipes-core/udev/files/fix-alignment.patch   |    2 ++
 meta/recipes-core/udev/files/noasmlinkage.patch    |    1 +
 meta/recipes-core/udev/files/tmpfs.patch           |    1 +
 meta/recipes-core/udev/files/udevsynthesize.patch  |    2 ++
 .../update-rc.d/update-rc.d/add-verbose.patch      |    2 ++
 .../util-linux-2.17.2/remove-lscpu.patch           |    2 ++
 .../util-linux-2.17.2/uclibc-compile.patch         |    2 ++
 .../util-linux-ng-2.16-mount_lock_path.patch       |    2 ++
 .../util-linux-ng-replace-siginterrupt.patch       |    2 ++
 .../elfutils/elfutils-0.148/arm_backend.diff       |    2 ++
 .../elfutils/elfutils-0.148/do-autoreconf.diff     |    2 ++
 .../elfutils/elfutils-0.148/elf_additions.diff     |    2 ++
 .../elfutils/elfutils-0.148/elfutils-fsize.patch   |    2 ++
 .../elfutils/elfutils-0.148/hppa_backend.diff      |    2 ++
 .../elfutils/elfutils-0.148/m68k_backend.diff      |    2 ++
 .../elfutils/elfutils-0.148/mempcpy.patch          |    2 ++
 .../elfutils/elfutils-0.148/mips_backend.diff      |    2 ++
 .../elfutils-0.148/redhat-portability.diff         |    2 ++
 .../elfutils/elfutils-0.148/redhat-robustify.diff  |    2 ++
 .../elfutils/elfutils-0.148/remove-unused.patch    |    2 ++
 .../elfutils-0.148/testsuite-ignore-elflint.diff   |    2 ++
 meta/recipes-devtools/file/file/ge-le.patch        |    2 ++
 .../file/file/stringb-compat.patch                 |    2 ++
 .../pkgconfig/pkgconfig-0.25/autofoo.patch         |    2 ++
 .../pkgconfig/pkgconfig/autofoo.patch              |    2 ++
 .../pkgconfig/pkgconfig/disable-legacy.patch       |    2 ++
 .../syslinux/files/cross-build.patch               |    2 ++
 .../ubootchart/files/sysvinit.patch                |    2 ++
 .../yaffs2/files/mkyaffs2image.patch               |    2 ++
 .../yaffs2/files/yaffs2-unioob.patch               |    2 ++
 .../findutils-4.2.31/gnulib-extension.patch        |    2 ++
 .../findutils/findutils-4.4.2/01-27017.patch       |    2 ++
 .../findutils/findutils-4.4.2/02-28824.patch       |    2 ++
 .../findutils/findutils-4.4.2/03-28872.patch       |    2 ++
 .../gamin/gamin/no-abstract-sockets.patch          |    2 ++
 .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |    1 +
 .../hdparm/hdparm-6.3/uclibc.patch                 |    2 ++
 .../recipes-extended/libaio/libaio/00_arches.patch |    2 ++
 meta/recipes-extended/libaio/libaio/destdir.patch  |    2 ++
 .../recipes-extended/libaio/libaio/toolchain.patch |    2 ++
 .../arm-workaround-global-constructor.patch        |    2 ++
 .../libzypp/libzypp/config-release.patch           |    2 ++
 .../libzypp/libzypp/libzypp-pokyarch.patch         |    2 ++
 .../mips-workaround-gcc-tribool-error.patch        |    2 ++
 meta/recipes-extended/libzypp/libzypp/no-doc.patch |    2 ++
 .../libzypp/libzypp/rpm5-no-rpmdbinit.patch        |    2 ++
 meta/recipes-extended/libzypp/libzypp/rpm5.patch   |    2 ++
 .../parted/parted-2.3/no_check.patch               |    2 ++
 .../parted/parted-2.3/syscalls.patch               |    2 ++
 .../procps/procps-3.2.8/install.patch              |    2 ++
 .../procps/procps-3.2.8/linux-limits.patch         |    2 ++
 .../procps/procps-3.2.8/pagesz-not-constant.patch  |    2 ++
 .../procps/procps-3.2.8/procmodule.patch           |    2 ++
 .../procps-3.2.8/procps-3.2.8+gmake-3.82.patch     |    2 ++
 .../procps/procps-3.2.8/psmodule.patch             |    2 ++
 .../sat-solver/sat-solver/cmake.patch              |    2 ++
 .../sat-solver/sat-solver/db5.patch                |    2 ++
 .../sat-solver/sat-solver_obsolete.patch           |    2 ++
 .../sat-solver/sat-solver/sat-solver_rpm5.patch    |    2 ++
 .../screen/screen-4.0.3/configure.patch            |    2 ++
 .../sed/sed-4.1.2/fix_return_type.patch            |    2 ++
 .../sysklogd/files/no-strip-install.patch          |    2 ++
 .../tcp-wrappers-7.6/00_man_quoting.diff           |    2 ++
 .../tcp-wrappers-7.6/01_man_portability.patch      |    2 ++
 .../tcp-wrappers-7.6/05_wildcard_matching.patch    |    2 ++
 .../tcp-wrappers-7.6/06_fix_gethostbyname.patch    |    2 ++
 .../tcp-wrappers-7.6/10_usagi-ipv6.patch           |    2 ++
 .../tcp-wrappers-7.6/11_tcpd_blacklist.patch       |    2 ++
 .../tcp-wrappers-7.6/11_usagi_fix.patch            |    2 ++
 .../tcp-wrappers-7.6/12_makefile_config.patch      |    2 ++
 .../tcp-wrappers-7.6/13_shlib_weaksym.patch        |    2 ++
 .../tcp-wrappers-7.6/14_cidr_support.patch         |    2 ++
 .../tcp-wrappers-7.6/15_match_clarify.patch        |    2 ++
 .../tcp-wrappers-7.6/expand_remote_port.patch      |    2 ++
 .../tcp-wrappers-7.6/have_strerror.patch           |    2 ++
 .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch    |    2 ++
 .../tcp-wrappers-7.6/man_fromhost.patch            |    2 ++
 .../tcp-wrappers-7.6/restore_sigalarm.patch        |    2 ++
 .../tcp-wrappers/tcp-wrappers-7.6/rfc931.diff      |    2 ++
 .../tcp-wrappers-7.6/safe_finger.patch             |    2 ++
 .../tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch    |    2 ++
 .../tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch |    2 ++
 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |    2 ++
 .../tcp-wrappers-7.6/tcpdchk_libwrapped.patch      |    2 ++
 meta/recipes-extended/time/files/debian.patch      |    2 ++
 meta/recipes-extended/zypper/zypper/cmake.patch    |    2 ++
 .../zypper/dso_linking_change_build_fix.patch      |    2 ++
 .../recipes-extended/zypper/zypper/rpm5-flag.patch |    2 ++
 .../attr/files/relative-libdir.patch               |    2 ++
 .../recipes-support/boost/files/1.34.1-gcc43.patch |    2 ++
 .../boost/files/arm-intrinsics.patch               |    2 ++
 .../boost/files/atomic_count_gcc_atomicity.patch   |    2 ++
 meta/recipes-support/boost/files/gcc41.patch       |    2 ++
 meta/recipes-support/boost/files/gcc43.patch       |    2 ++
 .../recipes-support/boost/files/linux-uclibc.patch |    2 ++
 .../boost/files/unit_test_log10f.patch             |    2 ++
 .../createrepo/createrepo/fix-native-install.patch |    2 ++
 .../gnutls/gnutls-2.10.4/configure-fix.patch       |    2 ++
 .../gnutls/gnutls-2.10.4/gnutls-openssl.patch      |    2 ++
 .../gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch |    2 ++
 meta/recipes-support/hal/files/autoconf.diff       |    2 ++
 .../hal/files/hal-right-input-h.patch              |    2 ++
 meta/recipes-support/hal/files/sg-inhibit.patch    |    2 ++
 meta/recipes-support/hal/hal/configure_fix.patch   |    2 ++
 meta/recipes-support/js/files/buildcc.patch        |    2 ++
 meta/recipes-support/js/files/link_with_gcc.patch  |    2 ++
 meta/recipes-support/js/files/usepic.patch         |    2 ++
 .../libgcrypt/files/add-pkgconfig-support.patch    |    2 ++
 .../libnl/libnl-2.0/fix-makefile.patch             |    2 ++
 .../0.1.0-beta1-gcc3.4-fix.patch                   |    2 ++
 178 files changed, 350 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-0.97/autohell.patch b/meta/recipes-bsp/grub/grub-0.97/autohell.patch
index 279c529..d66207a 100644
--- a/meta/recipes-bsp/grub/grub-0.97/autohell.patch
+++ b/meta/recipes-bsp/grub/grub-0.97/autohell.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
index 600af79..ff6f20c 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
index f1fcb33..540b4a0 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
@@ -5,6 +5,8 @@ for example, the following two would break:
 
 use a simpler scheme here and hope it works for all the cases
 
+Upstream-Status: Pending
+
 7/30/2010 - created by Qing He <qing.he@intel.com>
 
 diff --git a/lib/configure b/lib/configure
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch
index 1e81f84..7268d53 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch
@@ -3,6 +3,8 @@ string into lspci and other utilities, which is not desirable and
 won't work. In the other hand, linking to a symbolic link lib/libpci.so
 doesn't have this issue.
 
+Upstream-Status: Pending
+
 7/30/2010 - created by Qing He <qing.he@intel.com>
 
 diff --git a/Makefile b/Makefile
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff b/meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff
index 36ea3b7..0d4e0fb 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [packaging]
+
 7/30/2010 - rebased to 3.1.5 by Qing He <qing.he@intel.com>
 
 diff -uNr pciutils-3.1.5.orig/Makefile pciutils-3.1.5/Makefile
diff --git a/meta/recipes-bsp/setserial/setserial/add_stdlib.patch b/meta/recipes-bsp/setserial/setserial/add_stdlib.patch
index 6a9ebb7..e34f262 100644
--- a/meta/recipes-bsp/setserial/setserial/add_stdlib.patch
+++ b/meta/recipes-bsp/setserial/setserial/add_stdlib.patch
@@ -1,6 +1,8 @@
 # This patch addes stdlib.h to fix compiler warnings due to the exit
 # built-in not being defined and getting an incorrect implicit definition
 
+Upstream-Status: Pending
+
 Created-by: Saul Wold <saul.wold@intel.com>
 
 --- setserial-2.17/setserial.c	2010-09-02 14:11:27.569763088 -0700
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
index 579d72f..b4a666d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 --- client/scripts/bsdos
 +++ client/scripts/bsdos
 @@ -47,6 +47,11 @@
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
index f6a7be1..97ed0d9 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
@@ -2,6 +2,8 @@ CLIENT_PATH is the only environment when executing dhclient-script,
 without this patch, dhclient-script won't run properly because it
 invokes ifconfig and route
 
+Upstream-Status: Inappropriate [configuration]
+
 7/28/2010 - qhe
 
 diff -ru dhcp-4.1.1-P1.orig//client/Makefile.am dhcp-4.1.1-P1/client/Makefile.am
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
index 2206b71..f03936d 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 11/30/2010
 --with-libbind=PATH is available but not used by Makefile,
 this patch is to allow building with external bind
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
index 91d99cc..e33c9dd 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- dhcp-3.0.2/common/tr.c~compile	2005-10-13 14:23:37.000000000 +0200
 +++ dhcp-3.0.2/common/tr.c	2005-10-13 14:23:45.000000000 +0200
 @@ -39,6 +39,7 @@
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
index 5c766d6..5c635e8 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Backport
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch
index 67dc6f5..e26e8ef 100644
--- a/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2-2.6.35/configure-cross.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # borrow from OE, to handle cross compile mess
 #
 # ktian1, 06/28/2010 
diff --git a/meta/recipes-connectivity/libnss-mdns/files/alignment-fix.patch b/meta/recipes-connectivity/libnss-mdns/files/alignment-fix.patch
index 11d4655..70de305 100644
--- a/meta/recipes-connectivity/libnss-mdns/files/alignment-fix.patch
+++ b/meta/recipes-connectivity/libnss-mdns/files/alignment-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- nss-mdns-0.6/src/nss.c.orig	2005-09-25 17:27:51 +0200
 +++ nss-mdns-0.6/src/nss.c	2005-09-25 17:28:55 +0200
 @@ -456,6 +456,8 @@
diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch b/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
index 2131520..09c9061 100644
--- a/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
+++ b/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/configure.in b/configure.in
 index f5d54fb..c105988 100644
 --- a/configure.in
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
index 336dc0e..e82480a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.0.6-uclibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- ./support/nfs/svc_socket.c.orig	2004-12-12 06:43:52.000000000 +0000
 +++ ./support/nfs/svc_socket.c	2004-12-12 06:50:04.000000000 +0000
 @@ -66,6 +66,7 @@
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
index 761eebe..aba4d42 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8m/apps/CA.pl.in
 ===================================================================
 --- openssl-0.9.8m.orig/apps/CA.pl.in	2006-04-28 00:28:51.000000000 +0000
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
index 21b7935..2359d15 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/config
 ===================================================================
 --- openssl-0.9.8k.orig/config	2009-02-16 09:43:41.000000000 +0100
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
index fed4734..5720988 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Configure
 ===================================================================
 --- openssl-0.9.8k.orig/Configure	2009-12-09 16:09:41.000000000 +0000
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
index 49400ff..5b4c7d5 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8m/Makefile.org
 ===================================================================
 --- openssl-0.9.8m.orig/Makefile.org	2010-01-27 16:06:36.000000000 +0000
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
index da97186..b0312f3 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/crypto/perlasm/x86_64-xlate.pl
 ===================================================================
 --- openssl-0.9.8k.orig/crypto/perlasm/x86_64-xlate.pl	2008-02-13 21:01:48.000000000 +0100
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
index b123972..91207d8 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.org
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:32:41.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
index 29563ec..358f8cd 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.org
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:32:41.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
index fe20ab0..b74b12e 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.org
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:34:06.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
index 3ebc9ac..53b7614 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.shared
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.shared	2008-09-17 17:56:40.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
index 2504fa7..87eadac 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.shared
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.shared	2009-07-19 11:35:02.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
index a72f938..ced45a3 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 From: Kurt Roeckx <kurt@roeckx.be>
 Subject: Change the perl path's to /usr/bin/perl
 
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
index b534afa..5fc8f65 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8o/crypto/Makefile
 ===================================================================
 --- openssl-0.9.8o.orig/crypto/Makefile	2008-09-17 17:10:55.000000000 +0000
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
index 38923b0..46c6f03 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Makefile.org
 ===================================================================
 --- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:34:56.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
index 6f0421a..f57fbc9 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Configure
 ===================================================================
 --- openssl-0.9.8k.orig/Configure	2009-07-19 11:32:41.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
index a8ff28c..d9d6b70 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/tools/c_rehash.in
 ===================================================================
 --- openssl-0.9.8k.orig/tools/c_rehash.in	2002-10-11 22:31:27.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
index 94792c4..3426ba8 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/doc/apps/c_rehash.pod
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
index d27e9b2..79eb39f 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/Configure
 ===================================================================
 --- openssl-0.9.8k.orig/Configure	2009-07-19 11:36:24.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
index bb65b23..3436b29 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8k/crypto/sha/sha.h
 ===================================================================
 --- openssl-0.9.8k.orig/crypto/sha/sha.h	2008-09-16 12:47:28.000000000 +0200
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
index 64d8fc7..6fa3d75 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [debian]
+
 Index: openssl-0.9.8m/Configure
 ===================================================================
 --- openssl-0.9.8m.orig/Configure	2010-02-27 12:28:32.000000000 +0100
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
index bfddfc8..82857f5 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Submitted
 
 fix the parallel build regarding shared libraries.
 
diff --git a/meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch b/meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch
index a1563c7..2fbf784 100644
--- a/meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch
+++ b/meta/recipes-connectivity/portmap/portmap-6.0/destdir-no-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sun, 13 May 2007 21:15:12 +0000 (-0400)
 Subject: respect DESTDIR and dont use -s with install
diff --git a/meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch b/meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch
index da55f37..2f25058 100644
--- a/meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch
+++ b/meta/recipes-connectivity/portmap/portmap-6.0/tcpd-config.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 From: Mike Frysinger <vapier@gentoo.org>
 Date: Sun, 13 May 2007 21:17:32 +0000 (-0400)
 Subject: fix building with tcpd support disabled
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch b/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch
index 803dc41..c4d98e3 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # copy commit message from OE as the patch comment:
 #    commit 5b1ed09b1ab1a60a28a76e4658bc9957cd361b5d
 #    Author: Valentin Longchamp <valentin.longchamp@epfl.ch>
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch
index 041aa6c..de2dbcc 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # copy commit message from OE as the patch comment:
 #    commit 98c24291aa165f53423c27ae033831ce0b3bb676
 #    Author: Roman I Khimov <khimov@altell.ru>
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch
index c1f881f..0e528ff 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # copy commit message from OE as the patch comment:
 #    commit 5a0e1d473ca7aca5ffefffe9a2ec44ae7a1f35bc
 #    Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch
index e01fdc7..7d532e6 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # copy commit message from OE as the patch comment:
 #    commit f1b326c83be0d95571b991d8d2ee239982380b6b
 #    Author: Martin Jansa <Martin.Jansa@gmail.com>
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch
index 89eeb42..d2eab8b 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # copy commit message from OE as the patch comment:
 #    commit ec4da6df3ad5b8b03446d0dda9c50a2439ae325a
 #    Author: Denys Dmytriyenko <denis@denix.org>
diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch
index 81bca63..b82ea33 100644
--- a/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch
+++ b/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # copy commit message from OE as the patch comment
 #   commit c9bb6478a873d6de4c8a0e712435ac9a658a345d
 #   Author: Holger Schurig <schurig@mn-solutions.de>
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-6.9-cp-i-u.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-6.9-cp-i-u.patch
index 6fec683..5452b46 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-6.9-cp-i-u.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-6.9-cp-i-u.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 This patch was imported from the Fedora Core 8 coreutils-6.9-9 package.
 
 The package is stated as being Licensed as GPLv2+.
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-install.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-install.patch
index 1b989f5..88f61fa 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-install.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 The install command doesn't over write the dangling symlink, for
 example:
 
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-i18n.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-i18n.patch
index 3587186..6537223 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-i18n.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-i18n.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 This patch was imported from the Fedora Core 8 coreutils-6.9-9 package.
 
 The package is stated as being Licensed as GPLv2+.
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-ls-x.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-ls-x.patch
index 2d61438..aba8742 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-ls-x.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-ls-x.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 This patch was imported from the Fedora Core 8 coreutils-6.9-9 package.
 
 The package is stated as being Licensed as GPLv2+.
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-overflow.patch b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-overflow.patch
index d702757..58074c0 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/coreutils-overflow.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/coreutils-overflow.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 This patch was imported from the Fedora Core 8 coreutils-6.9-9 package.
 
 The package is stated as being Licensed as GPLv2+.
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch b/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
index 67e1279..e0d600a 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 Use native coreutils binaries to build manpages in cross environment.
 This avoids man page build issues like this:
 
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch b/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
index 953c2d1..5ca590b 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/futimens.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 # coreutils uses gnulib which conflicts with newer libc header on futimens
 # this patch simply renames coreutils futimes to avoid confliction
 #
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch b/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
index b42f5c9..8f35552 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/gnulib_m4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 # remove the line to cause recursive inclusion error from autoreconf, sicne
 # newer autoconf has included this definition. Simply rename it here.
 #
diff --git a/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch b/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
index 95a9638..c42cb9c 100644
--- a/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
+++ b/meta/recipes-core/coreutils/coreutils-6.9/man-touch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 # man page for 'touch' is generated differently from others. All other utilities
 # are provided static man source files, while for 'touch' it requires help2man
 # to invoke "touch --help" and then convert the output into the manual. Since touch
diff --git a/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
index f5c22af..de0766a 100644
--- a/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
+++ b/meta/recipes-core/dbus/dbus-1.4.1/tmpdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded]
+
 # avoid to check tmp dir at build time. instead uses hard coded /tmp here
 #
 # comment added by Kevin Tian <kevin.tian@intel.com>
diff --git a/meta/recipes-core/dropbear/dropbear-0.52/configure.patch b/meta/recipes-core/dropbear/dropbear-0.52/configure.patch
index 8d11b23..aeb7c0a 100644
--- a/meta/recipes-core/dropbear/dropbear-0.52/configure.patch
+++ b/meta/recipes-core/dropbear/dropbear-0.52/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: dropbear-0.49/configure.in
 ===================================================================
 --- dropbear-0.49.orig/configure.in
diff --git a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
index 2ae361c..add69cd 100644
--- a/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
+++ b/meta/recipes-core/dropbear/dropbear/allow-nopw.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 diff --git a/svr-auth.c b/svr-auth.c
 index 5da0aa7..4de4964 100644
 --- a/svr-auth.c
diff --git a/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
index ba2b19d..3b919f6 100644
--- a/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
+++ b/meta/recipes-core/dropbear/dropbear/fix-2kb-keys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -Nurd dropbear-0.45/kex.h dropbear-0.45.patched/kex.h
 --- dropbear-0.45/kex.h	2005-03-06 20:27:02.000000000 -0800
 +++ dropbear-0.45.patched/kex.h	2005-03-08 15:22:44.064583279 -0800
diff --git a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
index 75ba306..668824a 100644
--- a/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
+++ b/meta/recipes-core/dropbear/dropbear/urandom-xauth-changes-to-options.h.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -Nurd dropbear-0.45/options.h dropbear-0.45.patched/options.h
 --- dropbear-0.45/options.h	2005-03-06 20:27:02.000000000 -0800
 +++ dropbear-0.45.patched/options.h	2005-03-08 15:25:09.368742090 -0800
diff --git a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch b/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
index 1678b88..cba89d2 100644
--- a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
+++ b/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 'tic' of some linux distributions (e.g. fedora 11) hang in an infinite
 loop when processing the original file.
 
diff --git a/meta/recipes-core/readline/files/configure-fix.patch b/meta/recipes-core/readline/files/configure-fix.patch
index 4100fe4..be60a98 100644
--- a/meta/recipes-core/readline/files/configure-fix.patch
+++ b/meta/recipes-core/readline/files/configure-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Without this it fails to link against libtermcap causing various missing symbols 
 issues.
 
diff --git a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
index 76597fb..1a35b78 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
+++ b/meta/recipes-core/sysfsutils/sysfsutils-2.1.0/sysfsutils-2.0.0-class-dup.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [from fedora core 9]
+
 This patch is from the Fedora Core 9 sysfsutils-2.1.0-3.fc9 package.
 
 It fixes a problem in the upstream package where not all devices 
diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch
index b9511f0..7b34290 100644
--- a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/crypt-lib.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # The src Makefile was checking for libcrypt.a on the host, not in the
 # build environment.  This patch checks for $LCRYPT in the environment
 # and uses it if it's there.
diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch
index 5978cea..6c4225a 100644
--- a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch
+++ b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/src/Makefile b/src/Makefile
 index e2b8028..3e11e92 100644
 --- a/src/Makefile
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/add-system.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/add-system.patch
index 18b4e47..0a97974 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/add-system.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/add-system.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 ? add-system.patch
 ? cvs-20040608.patch
 ? familiar
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch
index 737ac42..3a4c6d7 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/adduser-empty_pwd.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- tinylogin-1.4/adduser.c.orig	2004-09-30 18:01:46.000000000 +0200
 +++ tinylogin-1.4/adduser.c	2004-09-30 18:07:01.000000000 +0200
 @@ -249,6 +249,7 @@
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/cvs-20040608.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/cvs-20040608.patch
index 1142329..33bc301 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/cvs-20040608.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/cvs-20040608.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: Config.h
 ===================================================================
 RCS file: /var/cvs/tinylogin/Config.h,v
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/passwd_rotate_check.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/passwd_rotate_check.patch
index c602493..513ee5e 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/passwd_rotate_check.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/passwd_rotate_check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 Fix rotate check logic
 
 Rotate passwd checking code has logic error, which writes data into
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/remove-index.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/remove-index.patch
index fc35002..9d3c324 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/remove-index.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/remove-index.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 --- /tmp/deluser.c	2007-05-13 10:38:19.000000000 +0200
 +++ tinylogin-1.4/deluser.c	2007-05-13 10:38:50.185251000 +0200
 @@ -60,7 +60,7 @@
diff --git a/meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch b/meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch
index dc5bc3f..5b88060 100644
--- a/meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch
+++ b/meta/recipes-core/tinylogin/tinylogin-1.4/use_O2_option.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 tinylogin will meet segment fault if compiled by gcc-4.5.0 when enable both
 frename-registers and Os options. Use O2 instead.
 
diff --git a/meta/recipes-core/udev/files/fix-alignment.patch b/meta/recipes-core/udev/files/fix-alignment.patch
index 8c7b8b5..dfe21b6 100644
--- a/meta/recipes-core/udev/files/fix-alignment.patch
+++ b/meta/recipes-core/udev/files/fix-alignment.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/udev_rules_parse.c b/udev_rules_parse.c
 --- a/udev_rules_parse.c
 +++ b/udev_rules_parse.c
diff --git a/meta/recipes-core/udev/files/noasmlinkage.patch b/meta/recipes-core/udev/files/noasmlinkage.patch
index 0d8e854..4173fc5 100644
--- a/meta/recipes-core/udev/files/noasmlinkage.patch
+++ b/meta/recipes-core/udev/files/noasmlinkage.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded]
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-core/udev/files/tmpfs.patch b/meta/recipes-core/udev/files/tmpfs.patch
index 9d0d8b4..aa4a4f6 100644
--- a/meta/recipes-core/udev/files/tmpfs.patch
+++ b/meta/recipes-core/udev/files/tmpfs.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded]
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta/recipes-core/udev/files/udevsynthesize.patch b/meta/recipes-core/udev/files/udevsynthesize.patch
index 7811188..5122ea2 100644
--- a/meta/recipes-core/udev/files/udevsynthesize.patch
+++ b/meta/recipes-core/udev/files/udevsynthesize.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 --- udev-081/udevsynthesize.c.orig	2006-01-29 12:22:45.000000000 +0100
 +++ udev-081/udevsynthesize.c	2006-01-29 12:22:40.000000000 +0100
 @@ -0,0 +1,763 @@
diff --git a/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch b/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
index 0f06830..fb443ff 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
+++ b/meta/recipes-core/update-rc.d/update-rc.d/add-verbose.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- update-rc.d/update-rc.d.org	2005-01-03 00:30:47.000000000 +0200
 +++ update-rc.d/update-rc.d	2007-12-01 19:41:08.000000000 +0200
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
index 200dc2c..c726cf1 100644
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.17.2/remove-lscpu.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Take out lscpu stuff from the code
 
 2011/03/17
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
index b2e8a8b..75774d8 100644
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.17.2/uclibc-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: util-linux-ng-2.16/misc-utils/cal.c
 ===================================================================
 --- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03 16:20:01.000000000 -0700
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
index 8e79d8b..5773d7e 100644
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-2.16-mount_lock_path.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 The FHS indicates that /etc must be capable of being mounted R/O.
 
 The FHS also indicates that lock files belong in /var/lock, and /var must
diff --git a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
index 4b5eb73..c5c0aff 100644
--- a/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
+++ b/meta/recipes-core/util-linux/util-linux-2.17.2/util-linux-ng-replace-siginterrupt.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: util-linux-ng-2.14/login-utils/login.c
 ===================================================================
 --- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28 16:01:02.000000000 -0700
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
index a309d1b..d4e4675 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.146/backends/arm_init.c
 ===================================================================
 --- elfutils-0.146.orig/backends/arm_init.c	2009-04-21 14:50:01.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff
index 41afa5e..dd35c57 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/do-autoreconf.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Generated by copying the whole dir, running `sh debian/autogen.sh` and diffing.
 
 Index: elfutils-0.148/backends/Makefile.in
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
index 59a082b..5baa709 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.146/libelf/elf.h
 ===================================================================
 --- elfutils-0.146.orig/libelf/elf.h	2010-04-24 10:13:50.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
index 9cf9cef..0ff353d 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 The ELF_T_LIB and ELF_T_GNUHASH sizes were missing from fsize table.
 
 This could cause a failure in the elf*_xlatetof function.
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
index 98353d5..a86b97c 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.146/backends/parisc_init.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
index 4eb70ba..5b621f9 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.146/backends/m68k_init.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
index e1e4ad0..2c1e823 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 uclibc does not export __mempcpy like glibc so we alias it here.
 This patch may make sense for upstream but elfutils uses more
 glibc specific features like obstack_printf which are missing in
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
index ffdff90..3f81a75 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.145/backends/mips_init.c
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
index d3a7246..4b3bd64 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.148/backends/ChangeLog
 ===================================================================
 --- elfutils-0.148.orig/backends/ChangeLog	2010-04-13 20:08:02.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
index a186308..cd39854 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: elfutils-0.148/libelf/ChangeLog
 ===================================================================
 --- elfutils-0.148.orig/libelf/ChangeLog	2010-07-03 13:07:10.000000000 +0000
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
index 064331a..6a19791 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Remove unused variables from the code to prevent -Werror causing a build
 failure on hosts with GCC 4.6.
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
index 20f03b8..d792d5f 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 On many architectures this test fails because binaries/libs produced by
 binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
 
diff --git a/meta/recipes-devtools/file/file/ge-le.patch b/meta/recipes-devtools/file/file/ge-le.patch
index 7b7d8b6..fb7d671 100644
--- a/meta/recipes-devtools/file/file/ge-le.patch
+++ b/meta/recipes-devtools/file/file/ge-le.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 `>=' and `<=' was silently ignored in previous version,
 but causes an warning in file 5.04. Add support for these
 two operators as a feature extension, however, users should
diff --git a/meta/recipes-devtools/file/file/stringb-compat.patch b/meta/recipes-devtools/file/file/stringb-compat.patch
index 055e43e..8aba31e 100644
--- a/meta/recipes-devtools/file/file/stringb-compat.patch
+++ b/meta/recipes-devtools/file/file/stringb-compat.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 `B' in file 4.x has the same meaning with `W' in file 5,
 let `B' be an alias of `W'.
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch
index 9789538..9853577 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig-0.25/autofoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  glib-1.2.10/acglib.m4    |   12 +-
  glib-1.2.10/configure.in |  212 ++++++++++++++++++++++++++++++------------------
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
index 9789538..9853577 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/autofoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  glib-1.2.10/acglib.m4    |   12 +-
  glib-1.2.10/configure.in |  212 ++++++++++++++++++++++++++++++------------------
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
index fea2d3d..1b3c12a 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/disable-legacy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 On an Fedora host with glib-config installed pkgconfig-native can get into a
 horrible state with recursive calls between pkg-config and glib-config.
 The patch adds a configure time option to disable legacy script support in
diff --git a/meta/recipes-devtools/syslinux/files/cross-build.patch b/meta/recipes-devtools/syslinux/files/cross-build.patch
index 8115629..7bb6bda 100644
--- a/meta/recipes-devtools/syslinux/files/cross-build.patch
+++ b/meta/recipes-devtools/syslinux/files/cross-build.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Use ?= for Makefile variables to use poky environment variables.
 Original method to sed s/CC =/CC ?=/ is not applicable anymore
 because of the Makefile changes.
diff --git a/meta/recipes-devtools/ubootchart/files/sysvinit.patch b/meta/recipes-devtools/ubootchart/files/sysvinit.patch
index de9fb0b..fc82ed8 100644
--- a/meta/recipes-devtools/ubootchart/files/sysvinit.patch
+++ b/meta/recipes-devtools/ubootchart/files/sysvinit.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Index: ubootchart.conf
 ===================================================================
 --- ubootchart.conf	(revision 9)
diff --git a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch b/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
index e55d58b..e78b350 100644
--- a/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
+++ b/meta/recipes-devtools/yaffs2/files/mkyaffs2image.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
  * 
  * mkyaffs2image hacks by NCB
  *
diff --git a/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch b/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
index c894528..8152dab 100644
--- a/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
+++ b/meta/recipes-devtools/yaffs2/files/yaffs2-unioob.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -urN yaffs2.orig/yaffs_mtdif2.c yaffs2/yaffs_mtdif2.c
 --- yaffs2.orig/yaffs_mtdif2.c	2005-12-07 14:00:38.000000000 -0800
 +++ yaffs2/yaffs_mtdif2.c	2006-02-10 17:13:58.000000000 -0800
diff --git a/meta/recipes-extended/findutils/findutils-4.2.31/gnulib-extension.patch b/meta/recipes-extended/findutils/findutils-4.2.31/gnulib-extension.patch
index 2bc54e9..65bd642 100644
--- a/meta/recipes-extended/findutils/findutils-4.2.31/gnulib-extension.patch
+++ b/meta/recipes-extended/findutils/findutils-4.2.31/gnulib-extension.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [legacy version]
+
 the old AC_USE_SYSTEM_EXTENSIONS won't work with AC_GNU_SOURCE
 
 against 4.2.31
diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/01-27017.patch b/meta/recipes-extended/findutils/findutils-4.4.2/01-27017.patch
index b61f67b..69c1486 100644
--- a/meta/recipes-extended/findutils/findutils-4.4.2/01-27017.patch
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/01-27017.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 commit af974034b68bf59337c7a384e488a518a77dfecd
 Author: James Youngman <jay@gnu.org>
 Date:   Sat Jul 11 19:55:27 2009 +0100
diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/02-28824.patch b/meta/recipes-extended/findutils/findutils-4.4.2/02-28824.patch
index 3469712..c0ff3ff 100644
--- a/meta/recipes-extended/findutils/findutils-4.4.2/02-28824.patch
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/02-28824.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 commit 76ed377d6d3e4a83a00cabd401f751b37ecd1e7b
 Author: James Youngman <jay@gnu.org>
 Date:   Sat Feb 20 13:11:45 2010 +0000
diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/03-28872.patch b/meta/recipes-extended/findutils/findutils-4.4.2/03-28872.patch
index 8bede38..940aaf6 100644
--- a/meta/recipes-extended/findutils/findutils-4.4.2/03-28872.patch
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/03-28872.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 commit 5f5eb921765794e8fc58c4bdffa2daa2ae34800f
 Author: James Youngman <jay@gnu.org>
 Date:   Sat Feb 20 19:53:13 2010 +0000
diff --git a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch b/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
index b8aacfb..cddf2dc 100644
--- a/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
+++ b/meta/recipes-extended/gamin/gamin/no-abstract-sockets.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- /tmp/configure.in	2007-04-30 13:08:49.000000000 +0200
 +++ gamin-0.1.8/configure.in	2007-04-30 13:10:53.285251000 +0200
 @@ -354,51 +354,6 @@
diff --git a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch b/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
index 37fbcb7..715886a 100644
--- a/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
+++ b/meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Backport
 
 #
 # Patch managed by http://www.holgerschurig.de/patcher.html
diff --git a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch b/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
index 495d749..d5f9298 100644
--- a/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
+++ b/meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- hdparm-5.8/hdparm.c.ark	2005-05-22 19:48:34.000000000 +0000
 +++ hdparm-5.8/hdparm.c	2005-05-22 19:52:18.000000000 +0000
 @@ -17,7 +17,9 @@
diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index 380dbac..77c2b3c 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 from openembedded, added by Qing He <qing.he@intel.com>
 
 --- libaio-0.3.106.orig/src/syscall-m68k.h
diff --git a/meta/recipes-extended/libaio/libaio/destdir.patch b/meta/recipes-extended/libaio/libaio/destdir.patch
index 66c7a43..dad9601 100644
--- a/meta/recipes-extended/libaio/libaio/destdir.patch
+++ b/meta/recipes-extended/libaio/libaio/destdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 from openembedded, added by Qing He <qing.he@intel.com>
 
 Index: libaio-0.3.106/Makefile
diff --git a/meta/recipes-extended/libaio/libaio/toolchain.patch b/meta/recipes-extended/libaio/libaio/toolchain.patch
index ae400cf..4d88ec1 100644
--- a/meta/recipes-extended/libaio/libaio/toolchain.patch
+++ b/meta/recipes-extended/libaio/libaio/toolchain.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 8/27/2010 - created by Qing He <qing.he@intel.com>
 
 diff --git a/src/Makefile b/src/Makefile
diff --git a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
index efcadc9..86458d7 100644
--- a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
+++ b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Workaround a problem with the C++ global constructors on ARM.
 
 As documented in the Yocto Bugzilla bug 938, the global constructors 
diff --git a/meta/recipes-extended/libzypp/libzypp/config-release.patch b/meta/recipes-extended/libzypp/libzypp/config-release.patch
index e5963df..b4e7ab0 100644
--- a/meta/recipes-extended/libzypp/libzypp/config-release.patch
+++ b/meta/recipes-extended/libzypp/libzypp/config-release.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Configure distro version package
 
 We need to configure a package that the system can use to determine the
diff --git a/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch b/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
index 2561a43..1eab1e8 100644
--- a/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
+++ b/meta/recipes-extended/libzypp/libzypp/libzypp-pokyarch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Disable all of the internal architectures
 
 We disable all of the internal architectures and replace them with ones
diff --git a/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch b/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
index 849ce3d..d01ef70 100644
--- a/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
+++ b/meta/recipes-extended/libzypp/libzypp/mips-workaround-gcc-tribool-error.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 # with gcc 4.3.3 and MIPS target, gcc "internal compiler error: segmentation fault" error
 # occurs when compiling Applydeltarpm.cc. I didn't find the exact reason leading to this
 # error, but it should be related to how boost tribool type is interpreted by g++. So provide
diff --git a/meta/recipes-extended/libzypp/libzypp/no-doc.patch b/meta/recipes-extended/libzypp/libzypp/no-doc.patch
index 3928980..c7e6e92 100644
--- a/meta/recipes-extended/libzypp/libzypp/no-doc.patch
+++ b/meta/recipes-extended/libzypp/libzypp/no-doc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 not building doc (doxygen based)
 
 8/19/2010 - created by Qing He <qing.he@intel.com>
diff --git a/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch b/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
index f15bb68..7006203 100644
--- a/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
+++ b/meta/recipes-extended/libzypp/libzypp/rpm5-no-rpmdbinit.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/zypp/target/rpm/librpmDb.cc b/zypp/target/rpm/librpmDb.cc
 index 1689fbb..4999cd9 100644
 --- a/zypp/target/rpm/librpmDb.cc
diff --git a/meta/recipes-extended/libzypp/libzypp/rpm5.patch b/meta/recipes-extended/libzypp/libzypp/rpm5.patch
index b86463d..bf3da24 100644
--- a/meta/recipes-extended/libzypp/libzypp/rpm5.patch
+++ b/meta/recipes-extended/libzypp/libzypp/rpm5.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 build fix for rpm5
 
 8/19/2010 - created by Qing He <qing.he@intel.com>
diff --git a/meta/recipes-extended/parted/parted-2.3/no_check.patch b/meta/recipes-extended/parted/parted-2.3/no_check.patch
index 24a328c..58d8db4 100644
--- a/meta/recipes-extended/parted/parted-2.3/no_check.patch
+++ b/meta/recipes-extended/parted/parted-2.3/no_check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 If check is detected, it makes the builds non-determinstic so just force
 it to be disabled.
 
diff --git a/meta/recipes-extended/parted/parted-2.3/syscalls.patch b/meta/recipes-extended/parted/parted-2.3/syscalls.patch
index 6be4996..e9bbe9a 100644
--- a/meta/recipes-extended/parted/parted-2.3/syscalls.patch
+++ b/meta/recipes-extended/parted/parted-2.3/syscalls.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 ---
  libparted/arch/linux.c |   13 +++++++++++++
  1 file changed, 13 insertions(+)
diff --git a/meta/recipes-extended/procps/procps-3.2.8/install.patch b/meta/recipes-extended/procps/procps-3.2.8/install.patch
index 9f1ef69..b52a2c9 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/install.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- procps-3.2.5.virgin/Makefile	2005-01-26 05:55:26.000000000 +0100
 +++ procps-3.2.5/Makefile	2005-08-03 04:55:26.346984488 +0200
 @@ -30,7 +30,10 @@
diff --git a/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch b/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
index dcd6616..2ca9724 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/linux-limits.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff --git a/pwdx.c b/pwdx.c
 index cb96a52..29ebce2 100644
 --- a/pwdx.c
diff --git a/meta/recipes-extended/procps/procps-3.2.8/pagesz-not-constant.patch b/meta/recipes-extended/procps/procps-3.2.8/pagesz-not-constant.patch
index 8e9e1eb..b141851 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/pagesz-not-constant.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/pagesz-not-constant.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: procps-3.2.1/proc/devname.c
 ===================================================================
 --- procps-3.2.1.orig/proc/devname.c	2004-03-18 05:43:50.000000000 +1100
diff --git a/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch b/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
index fabfaba..2a65c35 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/procmodule.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 *** procps-3.2.5/proc/module.mk.orig	Sun Jul 24 11:53:49 2005
 --- procps-3.2.5/proc/module.mk	Sun Jul 24 11:54:32 2005
 ***************
diff --git a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
index 23310e0..c8cee26 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8+gmake-3.82.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Fix for stricter Makefile parser in Make 3.82 take from Gentoo bugzilla:
 http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-process/procps/files/procps-3.2.8%2Bgmake-3.82.patch?revision=1.1
 
diff --git a/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch b/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
index f298c1c..0775eab 100644
--- a/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
+++ b/meta/recipes-extended/procps/procps-3.2.8/psmodule.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 *** procps-3.2.5/ps/module.mk.orig	Sun Jul 24 11:54:40 2005
 --- procps-3.2.5/ps/module.mk	Sun Jul 24 11:55:02 2005
 ***************
diff --git a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
index 52319f0..c1ec86a 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/cmake.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Enable debugging for all builds
 not building docs (need oxygen)
 
diff --git a/meta/recipes-extended/sat-solver/sat-solver/db5.patch b/meta/recipes-extended/sat-solver/sat-solver/db5.patch
index 98f322f..6b67912 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/db5.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/db5.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 RPM no longer includes an internal version of db, it now relies on the system
 version.  The system version in Poky is available at /usr/include/db51
 
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
index 7685057..60483e9 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_obsolete.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Fix obsolete settings with RPM5.
 
 The following patch is from Michael Schroeder <mls@suse.de>
diff --git a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
index 1776f6c..d59c513 100644
--- a/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
+++ b/meta/recipes-extended/sat-solver/sat-solver/sat-solver_rpm5.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Add RPM5 configuration support
 
 Update the cmake configuration to detect additional files needed by RPM5.
diff --git a/meta/recipes-extended/screen/screen-4.0.3/configure.patch b/meta/recipes-extended/screen/screen-4.0.3/configure.patch
index 1061a56..e29bcc6 100644
--- a/meta/recipes-extended/screen/screen-4.0.3/configure.patch
+++ b/meta/recipes-extended/screen/screen-4.0.3/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 # The patch is borrowed from OE:
 # http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4ee790cc6974bdfe1c9b06c0567b1c56f56d6615
 # and was rebased to screen-4.0.3's configure.in
diff --git a/meta/recipes-extended/sed/sed-4.1.2/fix_return_type.patch b/meta/recipes-extended/sed/sed-4.1.2/fix_return_type.patch
index d91960b..836551e 100644
--- a/meta/recipes-extended/sed/sed-4.1.2/fix_return_type.patch
+++ b/meta/recipes-extended/sed/sed-4.1.2/fix_return_type.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Change the getline return type to match its declaration.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
diff --git a/meta/recipes-extended/sysklogd/files/no-strip-install.patch b/meta/recipes-extended/sysklogd/files/no-strip-install.patch
index 5a78f01..00fba71 100644
--- a/meta/recipes-extended/sysklogd/files/no-strip-install.patch
+++ b/meta/recipes-extended/sysklogd/files/no-strip-install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: sysklogd-1.5/Makefile
 ===================================================================
 --- sysklogd-1.5.orig/Makefile	2009-06-09 13:02:41.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
index ff60a84..16d6719 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	1995-01-30 19:51:47.000000000 +0100
 +++ tcp_wrappers_7.6/hosts_access.5	2004-04-09 16:59:45.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
index 4963f82..9a735bf 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruNp tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2005-03-09 18:30:25.000000000 +0100
 +++ tcp_wrappers_7.6/hosts_access.3	2005-03-09 18:27:03.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
index a168f6d..9e18802 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 See https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=17847
 
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
index d06aaef..725f4b5 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 * Mon Feb  5 2001 Preston Brown <pbrown@redhat.com>
 - fix gethostbyname to work better with dot "." notation (#16949)
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
index 5c8be5c..96d47c3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
 --- tcp_wrappers_7.6.orig/fix_options.c	1997-04-08 02:29:19.000000000 +0200
 +++ tcp_wrappers_7.6/fix_options.c	2004-04-10 19:07:43.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
index 0238e35..226106f 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Path: news.porcupine.org!news.porcupine.org!not-for-mail
 From: Wietse Venema <wietse@((no)(spam)(please))wzv.win.tue.nl>
 Newsgroups: comp.mail.sendmail,comp.security.unix
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
index 88a2b5e..260e8d3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -uN tcp_wrappers_7.6/hosts_access.c tcp_wrappers_7.6.new/hosts_access.c
 --- tcp_wrappers_7.6/hosts_access.c	Mon May 20 14:00:56 2002
 +++ tcp_wrappers_7.6.new/hosts_access.c	Mon May 20 14:25:05 2002
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
index 60ca594..e8289e4 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
 --- tcp_wrappers_7.6.orig/Makefile	2003-08-21 01:43:39.000000000 +0200
 +++ tcp_wrappers_7.6/Makefile	2003-08-21 01:43:35.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
index c089b33..bd1396b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/Makefile tcp_wrappers_7.6/Makefile
 --- tcp_wrappers_7.6.orig/Makefile	2004-05-02 15:37:59.000000000 +0200
 +++ tcp_wrappers_7.6/Makefile	2004-05-02 15:31:09.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
index 0e1ecf5..eb5685c 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2003-08-21 03:15:36.000000000 +0200
 +++ tcp_wrappers_7.6/hosts_access.5	2003-08-21 03:15:31.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
index 913ed98..3ca6874 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.5 tcp_wrappers_7.6/hosts_access.5
 --- tcp_wrappers_7.6.orig/hosts_access.5	2004-04-25 12:17:59.000000000 +0200
 +++ tcp_wrappers_7.6/hosts_access.5	2004-04-25 12:17:53.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
index e35fc7e..3087377 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/eval.c tcp_wrappers_7.6/eval.c
 --- tcp_wrappers_7.6.orig/eval.c	1995-01-30 19:51:46.000000000 +0100
 +++ tcp_wrappers_7.6/eval.c	2004-11-04 13:59:01.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
index 31c2b92..4cc554f 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/percent_m.c tcp_wrappers_7.6/percent_m.c
 --- tcp_wrappers_7.6.orig/percent_m.c	1994-12-28 17:42:37.000000000 +0100
 +++ tcp_wrappers_7.6/percent_m.c	2003-08-21 02:45:31.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
index 2e89765..3ba214d 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: tcp_wrappers_7.6.orig/Makefile
 ===================================================================
 --- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0000
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
index afaa9c8..19bd7d3 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/hosts_access.3 tcp_wrappers_7.6/hosts_access.3
 --- tcp_wrappers_7.6.orig/hosts_access.3	2004-04-25 00:10:48.000000000 +0200
 +++ tcp_wrappers_7.6/hosts_access.3	2004-04-25 00:09:36.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
index ece7da3..5875b81 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:40:08.000000000 +0200
 +++ tcp_wrappers_7.6/rfc931.c	2004-08-29 18:40:02.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
index a926d0e..723f4f1 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruNp tcp_wrappers_7.6.orig/scaffold.c tcp_wrappers_7.6/scaffold.c
 --- tcp_wrappers_7.6.orig/scaffold.c	2005-03-09 18:22:04.000000000 +0100
 +++ tcp_wrappers_7.6/scaffold.c	2005-03-09 18:20:47.000000000 +0100
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
index 5c8c9a1..fc2afee 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 --- tcp-wrappers-7.6-ipv6.1.orig/safe_finger.c
 +++ tcp-wrappers-7.6-ipv6.1/safe_finger.c
 @@ -26,21 +26,24 @@
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
index f286605..9d7ea04 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 * Mon Feb 10 2003 Harald Hoyer <harald@redhat.de> 7.6-29
 - added security patch tcp_wrappers-7.6-sig.patch
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
index 71be340..76dd634 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruNp tcp_wrappers_7.6.orig/rfc931.c tcp_wrappers_7.6/rfc931.c
 --- tcp_wrappers_7.6.orig/rfc931.c	2004-08-29 18:42:25.000000000 +0200
 +++ tcp_wrappers_7.6/rfc931.c	2004-08-29 18:41:04.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
index 4db40f4..8373e8a 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/fix_options.c tcp_wrappers_7.6/fix_options.c
 --- tcp_wrappers_7.6.orig/fix_options.c	2003-08-21 03:41:33.000000000 +0200
 +++ tcp_wrappers_7.6/fix_options.c	2003-08-21 03:41:27.000000000 +0200
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
index 3beae39..be29bdc 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ruN tcp_wrappers_7.6.orig/tcpdchk.c tcp_wrappers_7.6/tcpdchk.c
 --- tcp_wrappers_7.6.orig/tcpdchk.c	2003-08-21 02:50:37.000000000 +0200
 +++ tcp_wrappers_7.6/tcpdchk.c	2003-08-21 02:50:33.000000000 +0200
diff --git a/meta/recipes-extended/time/files/debian.patch b/meta/recipes-extended/time/files/debian.patch
index 40df19d..23ea0e3 100644
--- a/meta/recipes-extended/time/files/debian.patch
+++ b/meta/recipes-extended/time/files/debian.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 --- time-1.7.orig/configure.in
 +++ time-1.7/configure.in
 @@ -1,11 +1,8 @@
diff --git a/meta/recipes-extended/zypper/zypper/cmake.patch b/meta/recipes-extended/zypper/zypper/cmake.patch
index 1b0a682..8312a97 100644
--- a/meta/recipes-extended/zypper/zypper/cmake.patch
+++ b/meta/recipes-extended/zypper/zypper/cmake.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 without the patch, /usr/include/rpm/ won't be added
 in cppflags
 
diff --git a/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch b/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
index a7d3fbe..085762d 100644
--- a/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
+++ b/meta/recipes-extended/zypper/zypper/dso_linking_change_build_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 after gcc linking has changed, all the libraries must be explicitely specified 
 This patch avoids these linking errors:
 
diff --git a/meta/recipes-extended/zypper/zypper/rpm5-flag.patch b/meta/recipes-extended/zypper/zypper/rpm5-flag.patch
index 4403869..89564a6 100644
--- a/meta/recipes-extended/zypper/zypper/rpm5-flag.patch
+++ b/meta/recipes-extended/zypper/zypper/rpm5-flag.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 It's required by libzypp headers
 
 Signed-off-by: Qing He <qing.he@intel.com>
diff --git a/meta/recipes-support/attr/files/relative-libdir.patch b/meta/recipes-support/attr/files/relative-libdir.patch
index f989dd0..b72bf18 100644
--- a/meta/recipes-support/attr/files/relative-libdir.patch
+++ b/meta/recipes-support/attr/files/relative-libdir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 use relative path in symbolic links, or it fails in staging
 sed expression from udev
 
diff --git a/meta/recipes-support/boost/files/1.34.1-gcc43.patch b/meta/recipes-support/boost/files/1.34.1-gcc43.patch
index 4670ac4..172e19a 100644
--- a/meta/recipes-support/boost/files/1.34.1-gcc43.patch
+++ b/meta/recipes-support/boost/files/1.34.1-gcc43.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: boost_1_34_1/boost/archive/polymorphic_iarchive.hpp
 ===================================================================
 --- boost_1_34_1.orig/boost/archive/polymorphic_iarchive.hpp	2005-12-11 07:12:51.000000000 +0100
diff --git a/meta/recipes-support/boost/files/arm-intrinsics.patch b/meta/recipes-support/boost/files/arm-intrinsics.patch
index 3f9c620..fe85c69 100644
--- a/meta/recipes-support/boost/files/arm-intrinsics.patch
+++ b/meta/recipes-support/boost/files/arm-intrinsics.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 8/17/2010 - rebased to 1.44 by Qing He <qing.he@intel.com>
 
 diff --git a/boost/smart_ptr/detail/atomic_count_sync.hpp b/boost/smart_ptr/detail/atomic_count_sync.hpp
diff --git a/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch b/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
index 7d08e73..64d5884 100644
--- a/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
+++ b/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
 ===================================================================
 --- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:45.000000000 +0200
diff --git a/meta/recipes-support/boost/files/gcc41.patch b/meta/recipes-support/boost/files/gcc41.patch
index f91d1ad..a1bd57e 100644
--- a/meta/recipes-support/boost/files/gcc41.patch
+++ b/meta/recipes-support/boost/files/gcc41.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -ur boost_1_33_1.orig/boost/bind.hpp boost_1_33_1/boost/bind.hpp
 --- boost_1_33_1.orig/boost/bind.hpp	2008-10-11 10:30:03.000000000 +0200
 +++ boost_1_33_1/boost/bind.hpp	2008-10-11 10:41:25.000000000 +0200
diff --git a/meta/recipes-support/boost/files/gcc43.patch b/meta/recipes-support/boost/files/gcc43.patch
index aefe080..dbf980d 100644
--- a/meta/recipes-support/boost/files/gcc43.patch
+++ b/meta/recipes-support/boost/files/gcc43.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 diff -aNru boost_1_34_1-ORIGINAL/boost/archive/polymorphic_iarchive.hpp boost_1_34_1/boost/archive/polymorphic_iarchive.hpp
 --- boost_1_34_1-ORIGINAL/boost/archive/polymorphic_iarchive.hpp	2005-12-11 00:12:51.000000000 -0600
 +++ boost_1_34_1/boost/archive/polymorphic_iarchive.hpp	2008-03-03 03:08:59.000000000 -0600
diff --git a/meta/recipes-support/boost/files/linux-uclibc.patch b/meta/recipes-support/boost/files/linux-uclibc.patch
index 79f14de..470e084 100644
--- a/meta/recipes-support/boost/files/linux-uclibc.patch
+++ b/meta/recipes-support/boost/files/linux-uclibc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- /dev/null	1969-12-31 16:00:00.000000000 -0800
 +++ boost_1_32_0/boost/config/platform/linux-uclibc.hpp	2005-07-05 14:51:56.237294460 -0700
 @@ -0,0 +1,7 @@
diff --git a/meta/recipes-support/boost/files/unit_test_log10f.patch b/meta/recipes-support/boost/files/unit_test_log10f.patch
index b235e12..8eec589 100644
--- a/meta/recipes-support/boost/files/unit_test_log10f.patch
+++ b/meta/recipes-support/boost/files/unit_test_log10f.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 --- boost_1_32_0/libs/test/src/unit_test_result.cpp.orig	2005-07-05 11:00:53.887594850 -0700
 +++ boost_1_32_0/libs/test/src/unit_test_result.cpp	2005-07-05 11:01:20.683533034 -0700
 @@ -144,7 +144,7 @@
diff --git a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
index 53266b5..ece205b 100644
--- a/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
+++ b/meta/recipes-support/createrepo/createrepo/fix-native-install.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Date: Jan 31, 2011
 
 There are two fixes:
diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
index 247e324..2ce3f55 100644
--- a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 rebased from original configure_madness.patch
 
 libtasn1 provides an .pc file in upstream,
diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch
index 413de06..ef70674 100644
--- a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: gnutls-1.6.0/libextra/gnutls_openssl.c
 ===================================================================
 --- gnutls-1.6.0.orig/libextra/gnutls_openssl.c	2006-08-13 22:34:09.000000000 +0200
diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch
index a2d2f03..10e3774 100644
--- a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch
+++ b/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 The version of texinfo in Debian Sarge does not understand the @euro{} command.
 This patch replaces the @euro{} command with the word "euro".
 
diff --git a/meta/recipes-support/hal/files/autoconf.diff b/meta/recipes-support/hal/files/autoconf.diff
index eb30ccc..451a252 100644
--- a/meta/recipes-support/hal/files/autoconf.diff
+++ b/meta/recipes-support/hal/files/autoconf.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- hal-0.5.9/configure.in~	2007-04-03 05:36:44.000000000 +0100
 +++ hal-0.5.9/configure.in	2007-04-03 10:29:39.000000000 +0100
 @@ -6,7 +6,7 @@
diff --git a/meta/recipes-support/hal/files/hal-right-input-h.patch b/meta/recipes-support/hal/files/hal-right-input-h.patch
index f820b77..06697ed 100644
--- a/meta/recipes-support/hal/files/hal-right-input-h.patch
+++ b/meta/recipes-support/hal/files/hal-right-input-h.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/configure.in b/configure.in
 index e76ff51..5e8cc21 100644
 --- a/configure.in
diff --git a/meta/recipes-support/hal/files/sg-inhibit.patch b/meta/recipes-support/hal/files/sg-inhibit.patch
index f0cc414..c655c29 100644
--- a/meta/recipes-support/hal/files/sg-inhibit.patch
+++ b/meta/recipes-support/hal/files/sg-inhibit.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- hal-0.5.9.1/hald/linux/probing/linux_dvd_rw_utils.c.old	2007-08-03 17:24:12.000000000 +0100
 +++ hal-0.5.9.1/hald/linux/probing/linux_dvd_rw_utils.c	2007-08-03 17:25:06.000000000 +0100
 @@ -58,6 +58,10 @@
diff --git a/meta/recipes-support/hal/hal/configure_fix.patch b/meta/recipes-support/hal/hal/configure_fix.patch
index e841704..076e784 100644
--- a/meta/recipes-support/hal/hal/configure_fix.patch
+++ b/meta/recipes-support/hal/hal/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 The AC_LANG sections upset libtool 2.2.2, as do .cpp files without a call
 to AC_PROG_CXX. Easiest solution is to patch this out for now.
 
diff --git a/meta/recipes-support/js/files/buildcc.patch b/meta/recipes-support/js/files/buildcc.patch
index 26eef21..19daf72 100644
--- a/meta/recipes-support/js/files/buildcc.patch
+++ b/meta/recipes-support/js/files/buildcc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 jskwgen should be built by BUILD_CC in cross environment
 
 7/23/2010 - created by Qing He <qing.he@intel.com>
diff --git a/meta/recipes-support/js/files/link_with_gcc.patch b/meta/recipes-support/js/files/link_with_gcc.patch
index d74b94f..988df61 100644
--- a/meta/recipes-support/js/files/link_with_gcc.patch
+++ b/meta/recipes-support/js/files/link_with_gcc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: src/config/Linux_All.mk
 ===================================================================
 --- src.orig/config/Linux_All.mk	2005-05-10 19:53:44.000000000 +0000
diff --git a/meta/recipes-support/js/files/usepic.patch b/meta/recipes-support/js/files/usepic.patch
index ddd31be..91b0923 100644
--- a/meta/recipes-support/js/files/usepic.patch
+++ b/meta/recipes-support/js/files/usepic.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Mips needs -fPIC to compile properly. These tests are broken anyway as they test 
 the build system architecture, not the target. This is a hack.
 
diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
index 24a5978..3e33679 100644
--- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
+++ b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [distribution]
+
 Index: libgcrypt-1.2.4/configure.ac
 ===================================================================
 --- libgcrypt-1.2.4.orig/configure.ac	2008-03-19 22:14:50.000000000 +0000
diff --git a/meta/recipes-support/libnl/libnl-2.0/fix-makefile.patch b/meta/recipes-support/libnl/libnl-2.0/fix-makefile.patch
index 214b0db..3e88fbd 100644
--- a/meta/recipes-support/libnl/libnl-2.0/fix-makefile.patch
+++ b/meta/recipes-support/libnl/libnl-2.0/fix-makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 12/03/2010
 
 add explicit rules for header files generated by lex and yacc,
diff --git a/meta/recipes-support/libusb/libusb-compat-0.1.3/0.1.0-beta1-gcc3.4-fix.patch b/meta/recipes-support/libusb/libusb-compat-0.1.3/0.1.0-beta1-gcc3.4-fix.patch
index 501ba3f..b255457 100644
--- a/meta/recipes-support/libusb/libusb-compat-0.1.3/0.1.0-beta1-gcc3.4-fix.patch
+++ b/meta/recipes-support/libusb/libusb-compat-0.1.3/0.1.0-beta1-gcc3.4-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport
+
 Index: libusb-compat-0.1.0-beta1/configure.ac
 ===================================================================
 --- libusb-compat-0.1.0-beta1.orig/configure.ac	2008-07-21 13:14:42.000000000 +0200
-- 
1.7.0




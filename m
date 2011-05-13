Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QKnTW-0005Kk-Ll
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 10:11:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2011 01:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,363,1301900400"; d="scan'208";a="642184923"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga002.jf.intel.com with ESMTP; 13 May 2011 01:09:04 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QKnIy-0005v4-9Q; Fri, 13 May 2011 16:01:00 +0800
Message-Id: <cover.1305273526.git.qing.he@intel.com>
Old-Date: Fri, 13 May 2011 15:58:46 +0800
Date: Fri, 13 May 2011 16:01:00 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 0/1] Added Upstream-Status to various patches
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
X-List-Received-Date: Fri, 13 May 2011 08:11:55 -0000

From: Qing He <qing.he@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: qhe/upstat
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=qhe/upstat

Thanks,
    Qing He <qing.he@intel.com>
---


Qing He (1):
  update patch upstream status

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




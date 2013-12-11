Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1485D6D64B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 03:04:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB34sS7016814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 19:04:54 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 10 Dec 2013 19:04:54 -0800
Message-ID: <52A7D654.10109@windriver.com>
Date: Wed, 11 Dec 2013 11:04:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <paul.eggleton@linux.intel.com>
References: <cover.1386687474.git.liezhi.yang@windriver.com>
	<52A7CDD5.8060505@linux.intel.com>
In-Reply-To: <52A7CDD5.8060505@linux.intel.com>
Subject: Re: [PATCH 000/124] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 03:04:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 12/11/2013 10:28 AM, Saul Wold wrote:
> On 12/10/2013 07:08 AM, Robert Yang wrote:
>> * Main changes:
>>    - Wic fixes
>>    - Update the kernel to 3.10.17
>>    - CVE fixes
>>    - Other Bug fixes
>>
>> Note:
>> The PULL is created based on poky, maybe oe-core is preferred ?
>>
>
> As Paul already pointed out this should be oe-core based if possible.
>

OK, I will send a new one based on oe-core.

> I started a build of robert/dora-next branch.
>
> While this list looks long nothing  jumps out atimmediately me as flagged.  I
> would as that you verify you have collected as many of the patches from the
> mailing list that wanted to be in dora that are either in master or you needed

Yes, I've verified that.

> to merge separately.
>
>
> Check below for an additional question about lttng-modules update
>
> Sau!
>
>
>> // Robert
>>
>> The following changes since commit 53d2563ff13fcec74d4250bef5419e36169e55cc:
>>
>> Otavio Salvador (1):
>>    lttng-modules: Update to 2.3.3 version
>>
> Why are you including this package update?  We do not normally do package updates
>

We had decided to update the kernel to 3.10.17, so we also need update the
lttng-modules.

// Robert

>
>> Paul Eggleton (3):
>>    classes/ptest: fix quoting
>>    zisofs-tools-native: add missing DEPENDS on zlib-native
>>    buildhistory_analysis: fix error when comparing image contents
>>
>> Phil Blundell (2):
>>    binutils: Add gnu-config-native to DEPENDS
>>    boost: Add patch to avoid undefined references to
>>      boost::atomic::lockpool::get_lock_for()
>>
>> Qiang Chen (6):
>>    nfs-utils: Stop rpc.statd correctly
>>    nfs-utils: nfsserver restart should kill and recreate nfsd kernel
>>      threads
>>    openssl: create package for openssl configuration file
>>    openssh: fix sshd status command error prompt
>>    nfs-utils: modify nfsserver init script indent
>>    irda-utils: restart irda daemon correctly
>>
>> Richard Purdie (4):
>>    nativesdk: Fix pn check
>>    cross-canadian: Fix SHLIBSDIR when using multilib
>>    cross-canadian: Handle powerpc linux verses linux-gnuspe
>>    ethtool: Fix ptest compile
>>
>> Ross Burton (6):
>>    xorg-lib-common: fix malloc0returnsnull usage
>>    pango: fix x11 DISTRO_FEATURE check
>>    cairo: add explicit dependency on zlib
>>    packagegroup-base: if zeroconf DISTRO_FEATURE enabled, add
>>      libnss-mdns
>>    weston-init: start weston on a new VT
>>    qt4-x11-free: depend on ICU
>>
>> Roy Li (2):
>>    pseudo: fix library path in FILES_${PN}
>>    libcap: fix CAP_LAST_CAP
>>
>> Saul Wold (5):
>>    busybox: Add depmod (adds 2240 bytes)
>>    kmod: Add patch to fix seperate build dir of ptest
>>    mdadm: Disable the RUN_DIR check
>>    sysvinit: unmount the psplash lazyily
>>    image_types: newer btrfs.mkfs needs an empty file to build the disk
>>      in
>>
>> Seth Bollinger (1):
>>    ncurses-terminfo: Remove bashism from basic terminfo installation
>>
>> Steffen Sledz (1):
>>    gdb-7.6: fix cygwin check in configure script
>>
>> Søren Holm (1):
>>    e2fsprogs: Escape filenames in populate-extfs.sh
>>
>> Ting Liu (2):
>>    kmod-native: use bswap to work on older Linux hosts
>>    perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
>>      powerpc64
>>
>> Tom Zanussi (16):
>>    wic: check for build artifacts
>>    wic: check passed-in build artifact directories
>>    wic: Check for the existence/correctness of build artifacts
>>    wic: Initialize return values in find_artifacts()
>>    wic: add pseudo to the populate-extfs step
>>    wic: Remove dependency on rt_util module
>>    wic: eliminate module checks
>>    wic: Remove dependency on rpmmisc
>>    wic: Remove dependency on myurlgrab module
>>    wic: remove rpm warning code from BackendPlugin
>>    wic: Remove rpm and grabber dependencies from BaseImageCreator
>>    wic: Remove rpmmisc call from livecd
>>    wic: Remove binary dependencies
>>    wic: Make find_binary_path() more user-friendly
>>    wic: Update and generalize pseudo setup for rootfs generation
>>    wic: Remove selinux_check()
>>
>> Wenzong Fan (2):
>>    perf: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for mips64
>>    udev: remove extra -dev/-dbg packages
>>
>> Xufeng Zhang (1):
>>    kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
>>
>>   meta/classes/base.bbclass                          |    8 +-
>>   meta/classes/cross-canadian.bbclass                |   36 +++
>>   meta/classes/distutils.bbclass                     |   24 +-
>>   meta/classes/extrausers.bbclass                    |    4 +
>>   meta/classes/grub-efi.bbclass                      |    3 +-
>>   meta/classes/image-mklibs.bbclass                  |    3 +-
>>   meta/classes/image_types.bbclass                   |    1 +
>>   meta/classes/kernel.bbclass                        |   13 +-
>>   meta/classes/license.bbclass                       |    4 +-
>>   meta/classes/nativesdk.bbclass                     |    2 +-
>>   meta/classes/package_rpm.bbclass                   |    6 +-
>>   meta/classes/pixbufcache.bbclass                   |    2 +-
>>   meta/classes/ptest.bbclass                         |    2 +-
>>   meta/classes/rootfs_deb.bbclass                    |    5 +-
>>   meta/classes/rootfs_ipk.bbclass                    |    5 +-
>>   meta/classes/rootfs_rpm.bbclass                    |    5 +-
>>   meta/classes/syslinux.bbclass                      |    2 +-
>>   meta/classes/vala.bbclass                          |    9 +-
>>   meta/files/device_table-minimal.txt                |    4 +-
>>   meta/lib/oe/buildhistory_analysis.py               |    2 +-
>>   meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +-
>>   .../irda-utils/irda-utils-0.9.18/init              |   38 +--
>>   .../nfs-utils/nfs-utils/nfsserver                  |   39 +--
>>   .../nfs-utils/nfs-utils_1.2.8.bb                   |    2 +-
>>   .../openssh/openssh-6.2p2/init                     |    2 +-
>>   meta/recipes-connectivity/openssl/openssl.inc      |   12 +-
>>   ...1-ppp-Add-two-structures-in-if_pppol2tp.h.patch |   60 +++++
>>   ...01-ppp-Fix-compilation-errors-in-Makefile.patch |   75 ++++++
>>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    5 +-
>>   ...sybox-sed-fix-sed-clusternewline-testcase.patch |  262 ++++++++++++++++++++
>>   meta/recipes-core/busybox/busybox-1.21.1/defconfig |    2 +-
>>   meta/recipes-core/busybox/busybox_1.21.1.bb        |    4 +-
>>   meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init     |    2 +-
>>   meta/recipes-core/eglibc/eglibc-2.17/make-4.patch  |   31 +++
>>   meta/recipes-core/eglibc/eglibc-2.18/make-4.patch  |   31 +++
>>   meta/recipes-core/eglibc/eglibc_2.17.bb            |    1 +
>>   meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>>   .../initrdscripts/initramfs-framework/init         |    2 +-
>>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
>>   meta/recipes-core/meta/buildtools-tarball.bb       |    1 +
>>   meta/recipes-core/ncurses/ncurses.inc              |    2 +-
>>   .../packagegroups/packagegroup-base.bb             |    1 +
>>   .../packagegroups/packagegroup-self-hosted.bb      |    6 +-
>>   meta/recipes-core/systemd/systemd-compat-units.bb  |    8 +-
>>   .../systemd-compat-units/run-postinsts.service     |    4 +-
>>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +-
>>   meta/recipes-core/sysvinit/sysvinit/bootlogd.init  |    4 +-
>>   meta/recipes-core/sysvinit/sysvinit/rc             |    2 +-
>>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    5 +-
>>   meta/recipes-core/udev/udev.inc                    |   16 +-
>>   meta/recipes-core/util-linux/util-linux.inc        |    3 +
>>   .../binutils/binutils-cross-canadian.inc           |    2 +
>>   meta/recipes-devtools/binutils/binutils.inc        |    2 +-
>>   .../dpkg/dpkg/glibc2.5-sync_file_range.patch       |   86 +++++++
>>   .../dpkg/dpkg/no-vla-warning.patch                 |   24 ++
>>   meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |    2 +
>>   .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   20 +-
>>   meta/recipes-devtools/flex/flex.inc                |    5 +
>>   meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    5 +-
>>   meta/recipes-devtools/gdb/gdb-7.6.inc              |    2 +
>>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    1 +
>>   .../gdb-fix-cygwin-check-in-configure-script.patch |   38 +++
>>   .../mklibs/mklibs-native_0.1.38.bb                 |    2 +-
>>   meta/recipes-devtools/opkg/opkg.inc                |    2 +
>>   meta/recipes-devtools/perl/perl-ptest.inc          |    5 +-
>>   meta/recipes-devtools/pseudo/pseudo.inc            |    7 +-
>>   ...debugedit-valid-file-to-fix-segment-fault.patch |   67 +++++
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>>   meta/recipes-devtools/syslinux/syslinux_6.01.bb    |    2 +-
>>   .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |    2 +
>>   meta/recipes-extended/cracklib/cracklib_2.9.0.bb   |    2 +-
>>   meta/recipes-extended/cronie/cronie/crond.init     |    8 -
>>   meta/recipes-extended/ethtool/ethtool_3.10.bb      |    2 +-
>>   meta/recipes-extended/images/core-image-basic.bb   |    1 +
>>   meta/recipes-extended/mdadm/mdadm_3.2.6.bb         |    7 +
>>   meta/recipes-extended/pigz/pigz_2.3.bb             |    2 +-
>>   meta/recipes-extended/procps/procps_3.2.8.bb       |    4 +
>>   meta/recipes-graphics/cairo/cairo.inc              |    2 +-
>>   meta/recipes-graphics/cogl/cogl-1.0.inc            |    2 +-
>>   meta/recipes-graphics/pango/pango.inc              |    5 +-
>>   meta/recipes-graphics/wayland/weston-init.bb       |    2 +
>>   meta/recipes-graphics/wayland/weston-init/init     |    2 +-
>>   meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    5 +-
>>   meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 +
>>   meta/recipes-kernel/kmod/kmod.inc                  |    1 +
>>   ...alling-bswap_-instead-of-htobe-and-be-toh.patch |   39 +++
>>   .../kmod/kmod/fix-seperatebuilddir.patch           |   34 +++
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    8 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    7 +-
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    2 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   18 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.8.bb       |    2 +-
>>   ...lttng-modules_git.bb => lttng-modules_2.3.3.bb} |    4 +-
>>   meta/recipes-kernel/perf/perf.bb                   |    7 +
>>   .../gst-ffmpeg-CVE-2013-3674.patch                 |   26 ++
>>   .../gstreamer/gst-ffmpeg_0.10.13.bb                |    3 +-
>>   .../libtiff/files/libtiff-CVE-2013-1960.patch      |  151 +++++++++++
>>   .../libtiff/files/libtiff-CVE-2013-4232.patch      |   15 ++
>>   .../libtiff/files/libtiff-CVE-2013-4243.patch      |   40 +++
>>   meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |    5 +-
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 +-
>>   meta/recipes-qt/meta/meta-toolchain-qt.inc         |    1 +
>>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |    6 +
>>   meta/recipes-qt/qt4/qt4-4.8.5.inc                  |    2 +
>>   ...Pixel.y-is-also-initalized-to-1-when-nece.patch |   48 ++++
>>   ...ned-selection-region-with-text-when-cente.patch |   75 ++++++
>>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>>   meta/recipes-qt/qt4/qt4.inc                        |    2 +-
>>   meta/recipes-support/boost/boost_1.54.0.bb         |    1 +
>>   .../files/boost-1.54.0-thread-link_atomic.patch    |   59 +++++
>>   meta/recipes-support/libcap/libcap.inc             |    3 +-
>>   .../libcap/libcap/fix-CAP_LAST_CAP.patch           |   39 +++
>>   ...free-caused-by-freeing-link-af_data-in-rt.patch |   41 +++
>>   meta/recipes-support/libnl/libnl_3.2.22.bb         |    4 +-
>>   scripts/lib/image/engine.py                        |    2 +
>>   scripts/lib/mic/conf.py                            |    4 -
>>   scripts/lib/mic/creator.py                         |    4 +-
>>   scripts/lib/mic/imager/baseimager.py               |    4 +-
>>   scripts/lib/mic/imager/livecd.py                   |    4 +-
>>   .../lib/mic/kickstart/custom_commands/partition.py |   21 +-
>>   scripts/lib/mic/pluginbase.py                      |    5 -
>>   scripts/lib/mic/plugins/imager/direct_plugin.py    |    2 +-
>>   scripts/lib/mic/plugins/imager/fs_plugin.py        |    2 +-
>>   scripts/lib/mic/plugins/imager/livecd_plugin.py    |    2 +-
>>   scripts/lib/mic/plugins/imager/liveusb_plugin.py   |    2 +-
>>   scripts/lib/mic/plugins/imager/loop_plugin.py      |    2 +-
>>   scripts/lib/mic/plugins/imager/raw_plugin.py       |    2 +-
>>   scripts/lib/mic/utils/fs_related.py                |    5 +-
>>   scripts/lib/mic/utils/misc.py                      |    2 -
>>   scripts/lib/mic/utils/partitionedfs.py             |   14 +-
>>   scripts/relocate_sdk.py                            |   42 ++--
>>   scripts/runqemu-extract-sdk                        |    6 +-
>>   scripts/wic                                        |   42 ++++
>>   134 files changed, 1684 insertions(+), 224 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch
>>
>>   create mode 100644
>> meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch
>>
>>   create mode 100644
>> meta/recipes-core/busybox/busybox-1.21.1/busybox-sed-fix-sed-clusternewline-testcase.patch
>>
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>>   create mode 100644
>> meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
>>   create mode 100644 meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch
>>   create mode 100644
>> meta/recipes-devtools/gdb/gdb/gdb-fix-cygwin-check-in-configure-script.patch
>>   create mode 100644
>> meta/recipes-devtools/rpm/rpm/debugedit-valid-file-to-fix-segment-fault.patch
>>   create mode 100644
>> meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
>>
>>   create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
>>   rename meta/recipes-kernel/lttng/{lttng-modules_git.bb =>
>> lttng-modules_2.3.3.bb} (93%)
>>   create mode 100644
>> meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
>>
>>   create mode 100644
>> meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch
>>   create mode 100644
>> meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch
>>   create mode 100644
>> meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch
>>   create mode 100644
>> meta/recipes-qt/qt4/qt4-4.8.5/0024-Ensure-lastPixel.y-is-also-initalized-to-1-when-nece.patch
>>
>>   create mode 100644
>> meta/recipes-qt/qt4/qt4-4.8.5/0025-Fix-misaligned-selection-region-with-text-when-cente.patch
>>
>>   create mode 100644
>> meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
>>   create mode 100644 meta/recipes-support/libcap/libcap/fix-CAP_LAST_CAP.patch
>>   create mode 100644
>> meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
>>
>>
>
>


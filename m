Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtRO-0002gv-Di
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 09:57:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 May 2011 00:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="918292191"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2011 00:55:00 -0700
Message-Id: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 00:49:29 -0700
Date: Thu, 05 May 2011  0:55:00 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 00/26] Consolidated Pull for 05-May-2011
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
X-List-Received-Date: Thu, 05 May 2011 07:57:44 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This has some major updates for cleaning up machine and distro
usage in oe-core, it also includes the SRC_REV removal.

In addition, a updated set of kernel recipes and GCC4.6 fixes.
There are also fixes that will be targeted for Bernard and general
build and lsb fixes.

Community Folks, if you are up for testing GCC 4.6, please take
this opportinuty to check out what Khem as provide, if need please
file bugs in bugzilla.

This has been build for x86 and ARM (world builds, minus target qemu).


Thanks

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Bruce Ashfield (3):
  linux-yocto: apply meta data to external repos
  linux-yocto: safely process unbranched repositories
  linux-yocto: update SRCREVs

Dexuan Cui (2):
  task-core-tools.bb: properly enable lttng-ust for ARM
  lttng-viewer: explicitly add linkage to lttvwindow

Gary Thomas (1):
  setuptools: Make options for setup.py more flexible

Kang Kai (2):
  foomatic-filters: added to pass LSB commands check
  ghostscript: added to pass LSB commands check

Khem Raj (6):
  util-linux.inc: remove virtual/libintl from DEPENDS
  gcc-4.6.0: Add missing recipes for gcc-cross-canadian and
    gcc-crosssdk
  gcc-4.6.0: Backport FSF 4.6 branch patches
  eglibc-2.13: Add recipes for eglibc 2.13
  gypsy_0.8.bb: Fix build with gcc 4.6
  linux-yocto_git.bb: Backport upstream fix for gcc 4.6 compilation

Paul Eggleton (5):
  Remove machine-specific metadata for machines no longer in oe-core
  Remove distro-specific metadata for distros not in oe-core
  initscripts: remove -i from halt/reboot arguments and allow override
  Remove machine-specific metadata for machines no longer in oe-core
  meta-yocto: add pieces removed from oe-core for beagleboard & atom-pc

Saul Wold (4):
  clutter-gst-1.4: Rebase patches and update checksum
  clutter-gtk-1.4: Rebase patches
  yaffs2: Update patch and checksums
  web: fix SRCREV

Scott Garman (1):
  gnome-doc-utils: Add -nonet option to xsltproc

Tom Zanussi (1):
  boot-directdisk: fix bzImage source location

Yu Ke (1):
  yaffs2-utils_cvs: fix the SRCDATE typo

 .../openswan/openswan_2.4.7.bb                     |    3 +-
 .../formfactor/formfactor}/atom-pc/machconfig      |    0
 .../formfactor/formfactor}/beagleboard/machconfig  |    0
 .../recipes-bsp/formfactor/formfactor_0.0.bbappend |    3 +
 .../recipes-core/tasks/task-core-tools.bbappend    |    2 +
 .../uclibc/uclibc}/atom-pc/uClibc.machine          |    0
 .../recipes-core/uclibc/uclibc_0.9.30.1.bbappend   |    3 +
 .../tasks/task-poky-sdk-gmae.bbappend              |    1 +
 .../task-poky-standalone-gmae-sdk-target.bbappend  |    1 +
 .../clutter/clutter-1.4_1.4.2.bbappend             |    4 +
 .../clutter/clutter-1.6_1.6.14.bbappend            |    4 +
 .../recipes-graphics/clutter/clutter_git.bbappend  |    4 +
 .../recipes-graphics/mesa/mesa-dri_7.10.2.bbappend |    3 +
 .../recipes-graphics/mesa/mesa-dri_git.bbappend    |    3 +
 .../xserver-xf86-config/atom-pc/xorg.conf          |    0
 .../xorg-xserver/xserver-xf86-config_0.1.bbappend  |    3 +
 .../recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend     |    2 +
 .../recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend     |    2 +
 meta/classes/boot-directdisk.bbclass               |    2 +-
 meta/classes/kernel-yocto.bbclass                  |   34 +-
 meta/classes/setuptools.bbclass                    |    3 +-
 meta/recipes-bsp/formfactor/files/akita/machconfig |   15 -
 .../formfactor/files/bootcdx86/machconfig          |    5 -
 meta/recipes-bsp/formfactor/files/c7x0/machconfig  |   15 -
 .../formfactor/files/cm-x270/machconfig            |    9 -
 .../formfactor/files/em-x270/machconfig            |   15 -
 .../formfactor/files/htcuniversal/machconfig       |   15 -
 .../formfactor/files/igep0020/machconfig           |    3 -
 .../formfactor/files/nokia800/machconfig           |   13 -
 .../formfactor/files/om-gta01/machconfig           |   14 -
 .../formfactor/files/omap-3430ldp/machconfig       |   15 -
 .../formfactor/files/omap-3430sdp/machconfig       |   15 -
 meta/recipes-bsp/formfactor/files/spitz/machconfig |   15 -
 .../formfactor/files/zylonite/machconfig           |   12 -
 .../recipes-bsp/keymaps/files/akita/keymap-2.4.map |  128 -
 .../recipes-bsp/keymaps/files/akita/keymap-2.6.map |  228 -
 meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map |  213 -
 .../keymaps/files/collie/keymap-2.4.map            |  114 -
 .../keymaps/files/collie/keymap-2.6.map            |  262 -
 .../recipes-bsp/keymaps/files/h2200/keymap-2.6.map |   17 -
 .../keymaps/files/htcuniversal/keymap-2.6.map      |   20 -
 .../keymaps/files/jornada6xx/keymap-de.map         |  597 -
 .../keymaps/files/jornada6xx/keymap-sp.map         |  222 -
 .../keymaps/files/jornada6xx/keymap-uk.map         |  278 -
 .../keymaps/files/poodle/keymap-2.6.map            |  152 -
 .../recipes-bsp/keymaps/files/spitz/keymap-2.4.map |  128 -
 .../recipes-bsp/keymaps/files/spitz/keymap-2.6.map |  228 -
 meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map |  133 -
 meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map |  210 -
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |   20 +-
 meta/recipes-bsp/pointercal/files/akita/pointercal |    1 -
 meta/recipes-bsp/pointercal/files/c7x0/pointercal  |    1 -
 .../pointercal/files/htcuniversal/pointercal       |    1 -
 .../pointercal/files/om-gta01/pointercal           |    1 -
 .../pointercal/files/omap-3430ldp/pointercal       |    1 -
 meta/recipes-bsp/pointercal/files/spitz/pointercal |    1 -
 meta/recipes-connectivity/dhcp/dhcp3.inc           |    4 -
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    4 -
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
 .../fix-unused-but-set-variable-warning.patch      |   16 +
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb       |    7 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    5 +-
 .../recipes-core/base-files/base-files/akita/fstab |   16 -
 .../base-files/base-files/akita/rotation           |    1 -
 meta/recipes-core/base-files/base-files/c7x0/fstab |   12 -
 meta/recipes-core/base-files/base-files/c7x0/usbd  |    1 -
 .../base-files/base-files/collie/fstab             |    8 -
 .../recipes-core/base-files/base-files/collie/usbd |    1 -
 .../base-files/base-files/htcuniversal/rotation    |    1 -
 .../base-files/base-files/hx2000/fstab             |    9 -
 .../recipes-core/base-files/base-files/mtx-1/fstab |    8 -
 .../base-files/base-files/mtx-1/profile            |   25 -
 .../base-files/base-files/nokia770/fstab           |    6 -
 .../base-files/base-files/poodle/fstab             |   13 -
 .../recipes-core/base-files/base-files/poodle/usbd |    1 -
 .../recipes-core/base-files/base-files/spitz/fstab |   28 -
 .../base-files/base-files/spitz/rotation           |    1 -
 meta/recipes-core/base-files/base-files/tosa/fstab |   12 -
 meta/recipes-core/base-files/base-files/tosa/usbd  |    5 -
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   33 +-
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    7 +-
 meta/recipes-core/busybox/busybox.inc              |    3 -
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/dropbear/dropbear.inc            |    2 +-
 meta/recipes-core/dropbear/dropbear_0.52.bb        |    2 +-
 .../eglibc/cross-localedef-native_2.13.bb          |   44 +
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc/eglibc-2.13/armv4t-interworking.patch   |   82 +
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc/eglibc-2.13/etc/ld.so.conf}             |    0
 .../eglibc/eglibc-2.13/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.13/ld-search-order.patch       |   54 +
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |   24 +
 .../eglibc-2.13/shorten-build-commands.patch       |   81 +
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |   35 +
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    6 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |  115 +
 meta/recipes-core/initscripts/initscripts-1.0/halt |    2 +-
 .../initscripts/initscripts-1.0/reboot             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 +-
 .../netbase/netbase-4.45/colinux/interfaces        |    8 -
 .../netbase/netbase-4.45/epia/interfaces           |   10 -
 .../netbase/netbase-4.45/mtx-1/interfaces          |   29 -
 .../netbase/netbase-4.45/nokia800/interfaces       |    5 -
 .../recipes-core/netbase/netbase-4.45/openmn/hosts |    2 -
 .../netbase/netbase-4.45/openmn/interfaces         |   10 -
 .../netbase/netbase-4.45/tosa/interfaces           |   24 -
 .../netbase/netbase-4.45/wrt54/interfaces          |   23 -
 .../netbase/netbase-4.45/xxs1500/interfaces        |   15 -
 meta/recipes-core/netbase/netbase_4.45.bb          |   10 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    5 +-
 .../uclibc/uclibc-0.9.30.1/akita/uClibc.machine    |   70 -
 .../uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine     |   70 -
 .../uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine  |   70 -
 .../uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine |   69 -
 .../uclibc/uclibc-0.9.30.1/spitz/uClibc.machine    |   70 -
 meta/recipes-core/udev/files/50-hostap_cs.rules    |    4 -
 meta/recipes-core/udev/files/akita/mount.blacklist |    3 -
 meta/recipes-core/udev/files/c7x0/mount.blacklist  |    3 -
 .../recipes-core/udev/files/slugos/mount.blacklist |    4 -
 meta/recipes-core/udev/files/spitz/mount.blacklist |    4 -
 meta/recipes-core/udev/files/tosa/mount.blacklist  |    3 -
 meta/recipes-core/udev/udev-new.inc                |    7 -
 meta/recipes-core/udev/udev_145.bb                 |    9 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    1 -
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |   10 +
 .../0002-Backport-from-mainline.patch              |   70 +
 .../0003-Backport-from-mainline.patch              |  164 +
 .../0004-Backport-from-mainline.patch              |   93 +
 .../0005-Backport-from-mainline.patch              |   94 +
 .../0006-Backport-from-mainline.patch              |   58 +
 .../0007-Backport-from-mainline.patch              |   27 +
 ...26-Paolo-Carlini-paolo.carlini-oracle.com.patch |   61 +
 .../0009-Backport-from-mainline.patch              |  226 +
 ...-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  312 +
 ...-03-28-Richard-Guenther-rguenther-suse.de.patch |  246 +
 .../gcc-4_6-branch-backports/0015-gcc.patch        |   47 +
 .../0016-Backport-from-mainline.patch              |   28 +
 .../0017-libgfortran.patch                         |  837 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   62 +
 ...-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch |  405 +
 .../0021-c.opt-Add-std-c-03.patch                  |   26 +
 .../gcc-4_6-branch-backports/0022-PR-c-47570.patch |   68 +
 .../gcc-4_6-branch-backports/0023-PR-c-47504.patch |   50 +
 ...ild_noexcept_spec-Call-cxx_constant_value.patch |   46 +
 .../gcc-4_6-branch-backports/0025-c-family.patch   |  181 +
 ...026-decl2.c-cp_check_const_attributes-New.patch |  117 +
 .../gcc-4_6-branch-backports/0027-Core-1148.patch  |   59 +
 .../gcc-4_6-branch-backports/0028-PR-c-48313.patch |   50 +
 .../gcc-4_6-branch-backports/0029-PR-c-47999.patch |   57 +
 ...non_dependent_expr-Keep-dereferences-outs.patch |   67 +
 ...rence_binding-Allow-direct-binding-to-an-.patch |   35 +
 .../gcc-4_6-branch-backports/0032-Core-1232.patch  |   95 +
 ...-is_valid_constexpr_fn-Specify-input-loca.patch |   71 +
 .../gcc-4_6-branch-backports/0034-PR-c-48296.patch |  102 +
 .../gcc-4_6-branch-backports/0035-PR-c-48166.patch |   43 +
 ...a-alpha.c-alpha_sr_alias_set-Don-t-define.patch |  178 +
 .../gcc-4_6-branch-backports/0038-PR-c-48319.patch |   56 +
 .../0039-PR-preprocessor-48248.patch               |   53 +
 .../0040-PR-debug-48253.patch                      |  803 +
 .../gcc-4_6-branch-backports/0042-PR-c-48265.patch |   40 +
 .../0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch        |   32 +
 .../gcc-4_6-branch-backports/0044-PR-c-48281.patch |   70 +
 .../gcc-4_6-branch-backports/0045-PR-c-48369.patch |   38 +
 .../gcc-4_6-branch-backports/0046-PR-c-48212.patch |   39 +
 ...-03-31-Richard-Guenther-rguenther-suse.de.patch |   29 +
 .../0049-PR-target-48142.patch                     |   92 +
 .../0050-PR-target-16292.patch                     |   22 +
 .../gcc-4_6-branch-backports/0051-PR-c-48280.patch |   38 +
 ...07-from-trunk-to-the-4.6-release-branch-t.patch |   48 +
 .../0054-Backport-from-mainline.patch              |   61 +
 ...fig-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch |   29 +
 ...11-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch |  111 +
 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |683525 ++++++++++++++++++++
 ...-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch | 5800 +
 ...n.dg-bessel_6.f90-Use-dg-add-options-ieee.patch |   30 +
 ...4-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch |   57 +
 .../0065-es.po-Update.patch                        |  952 +
 ...ers-for-functions-from-the-frexp-family-w.patch |   27 +
 ...-04-05-Richard-Guenther-rguenther-suse.de.patch |   32 +
 ....c-self_referential_size-Fix-2010-07-13-c.patch |   22 +
 .../0070-de.po-Update.patch                        |  690 +
 ...ov-io.c-Use-GCC-Runtime-Library-Exception.patch |   29 +
 .../0073-Backported-from-mainline.patch            |  658 +
 .../0074-PR-debug-48466.patch                      |  113 +
 ...73-from-trunk-to-the-4.6-release-branch-t.patch |  140 +
 .../0077-Backport-from-mainline.patch              |  154 +
 .../0078-de.po-Update.patch                        |  960 +
 .../0079-PR-debug-48343.patch                      |  281 +
 .../0080-PR-fortran-48117.patch                    |   27 +
 ...-config-i386-sse.md-Update-copyright-year.patch |  224 +
 ...ure-stackalign-non-local-goto-5.c-Fix-for.patch |   24 +
 .../0084-PR-tree-optimization-48377.patch          |   68 +
 .../0085-de.po-Update.patch                        |  774 +
 .../gcc-4_6-branch-backports/0086-PR-c-48450.patch |   80 +
 ....c-finish_decltype_type-Add-complain-parm.patch |  132 +
 .../gcc-4_6-branch-backports/0088-PR-c-48452.patch |   47 +
 .../gcc-4_6-branch-backports/0089-PR-c-48468.patch |  110 +
 .../gcc-4_6-branch-backports/0090-PR-c-48500.patch |  145 +
 ...1-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |   26 +
 .../0092-PR-testsuite-48506.patch                  |   24 +
 ...ther-than-crashing-in-array_type_nelts-if.patch |   24 +
 .../gcc-4_6-branch-backports/0095-PR-c-48528.patch |   24 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   74 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   75 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  106 +
 .../0101-Backport-from-mainline.patch              |   37 +
 ...2-common.opt-Tbss-Tdata-Ttext-New-options.patch |   35 +
 .../gcc-4_6-branch-backports/0104-PR-c-48523.patch |   42 +
 .../gcc-4_6-branch-backports/0105-PR-c-48534.patch |   38 +
 .../gcc-4_6-branch-backports/0106-PR-c-48517.patch |   51 +
 ...011-04-12-Allan-McRae-allan-archlinux.org.patch |  255 +
 ...-v850.c-expand_prologue-Do-not-use-the-CA.patch |   43 +
 .../0109-PR-rtl-optimization-48549.patch           |  128 +
 ...-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch |  110 +
 .../0112-Fix-PR-target-48090.patch                 |   22 +
 .../0113-Fix-PR-c-48574.patch                      |   57 +
 .../gcc-4_6-branch-backports/0114-PR-c-48570.patch |  116 +
 .../0115-PR-middle-end-48591.patch                 |   93 +
 ...-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch |  182 +
 .../gcc-4_6-branch-backports/0117-PR-c-48594.patch |   75 +
 .../0118-sv.po-Update.patch                        | 1036 +
 .../0119-Backport-from-mainline.patch              |  138 +
 .../0122-PR-target-48605.patch                     |  194 +
 .../0123-PR-target-48614.patch                     |   24 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   46 +
 ...04-15-Takaya-Saito-gintensubaru-gmail.com.patch |  277 +
 ...15-Paolo-Carlini-paolo.carlini-oracle.com.patch |   82 +
 ...ibjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch |   26 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |  143 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |   80 +
 .../0132-PR-lto-48538.patch                        |   36 +
 ...c-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch |   54 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |  115 +
 .../0135-doc-passes.texi-Fill-crossref-nodes.patch |   54 +
 ...ce-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch |   23 +
 .../0138-PR-tree-optimization-48616.patch          |  242 +
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |   39 +
 ...x-weakref-trickery-breakage-on-alpha-dec-.patch |  172 +
 ...-is_redundant_typedef-Add-inline-to-proto.patch |   22 +
 .../gcc-4_6-branch-backports/0142-PR-c-48632.patch |   55 +
 .../0143-PR-middle-end-48661.patch                 |  166 +
 .../gcc-4_6-branch-backports/0144-PR-c-48537.patch |   45 +
 .../0146-PR-testsuite-48675.patch                  |   34 +
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |   26 +
 .../0149-PR-target-48678.patch                     |   49 +
 .../gcc-4_6-branch-backports/0151-PR-c-46304.patch |   38 +
 ...tstrap-lto.mk-Remove-obsolete-requirement.patch |   22 +
 ...-04-20-Richard-Guenther-rguenther-suse.de.patch |  117 +
 .../0154-Backport-from-mainline.patch              |   47 +
 .../0155-PR-tree-optimization-48611.patch          |   24 +
 .../gcc-4_6-branch-backports/0156-PR-c-48657.patch |   58 +
 .../0157-PR-target-48288.patch                     |  105 +
 .../gcc-4_6-branch-backports/0159-PR-c-48594.patch |   26 +
 ...-finish_compound_literal-Don-t-put-an-arr.patch |   36 +
 ...lk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch |   72 +
 ...-04-21-Richard-Guenther-rguenther-suse.de.patch |  147 +
 .../0163-de.po-Update.patch                        | 2596 +
 .../0164-PR-target-48708.patch                     |   63 +
 .../gcc-4_6-branch-backports/0166-PR-c-48716.patch |   87 +
 .../0167-PR-target-48723.patch                     |   48 +
 .../0168-PR-tree-optimization-48717.patch          |   69 +
 .../gcc-4_6-branch-backports/0170-Revert.patch     |   27 +
 .../gcc-4_6-branch-backports/0171-PR-c-48685.patch |   43 +
 ...616.c-dg-options-Add-fno-common-to-option.patch |   22 +
 ...-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  776 +
 .../0174-PR-preprocessor-48740.patch               |   48 +
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |  142 +
 .../gcc-4_6-branch-backports/0178-PR-c-48707.patch |   46 +
 ...-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch |  192 +
 ...-04-26-Richard-Guenther-rguenther-suse.de.patch |   58 +
 .../0182-PR-tree-optimization-48734.patch          |   66 +
 .../0183-PR-debug-48768.patch                      |   81 +
 .../0184-de.po-Update.patch                        | 1411 +
 .../gcc-4_6-branch-backports/0185-PR-c-48726.patch |   53 +
 .../gcc-4_6-branch-backports/0187-PR-c-42687.patch |   49 +
 .../gcc-4_6-branch-backports/0188-PR-c-48742.patch |   47 +
 ...gcc.dg-20020312-2.c-Add-definition-for-RX.patch |   62 +
 .../gcc-4_6-branch-backports/0190-PR-c-48046.patch |   48 +
 .../0192-PR-middle-end-48597.patch                 |   27 +
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |   51 +
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |  305 +
 .../0195-Fix-PR-c-48656.patch                      |   58 +
 .../0196-Backport-4.7-patchtes-to-4.6.patch        |  231 +
 ...-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch |  162 +
 ...29-Paolo-Carlini-paolo.carlini-oracle.com.patch |  137 +
 .../gcc/gcc-4_6-branch-backports.inc               |  160 +
 .../gcc/gcc-cross-canadian_4.6.0.bb                |   23 +
 .../gcc/gcc-crosssdk-initial_4.6.0.bb              |    2 -
 .../gcc/gcc-crosssdk-intermediate_4.6.0.bb         |    2 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb    |    2 +
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    8 +-
 .../yaffs2/files/mkyaffs2image.patch               |  116 +-
 meta/recipes-devtools/yaffs2/yaffs2-utils.inc      |    2 +-
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb   |    2 +-
 .../foomatic/foomatic-filters_4.0.7.bb             |   23 +
 .../ghostscript-9.02-prevent_recompiling.patch     |   95 +
 .../ghostscript/ghostscript_9.02.bb                |   67 +
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   34 +
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb |    4 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 -
 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb |    2 +-
 .../recipes-graphics/clutter/clutter-1.6_1.6.14.bb |    2 +-
 .../clutter/clutter-gst-1.4/enable_tests.patch     |   15 +
 .../clutter/clutter-gst-1.4_git.bb                 |    4 +-
 .../clutter/clutter-gtk/disable_deprecated.patch   |   22 +-
 .../clutter/clutter-gtk/enable_tests.patch         |   11 +-
 meta/recipes-graphics/clutter/clutter.inc          |   35 -
 meta/recipes-graphics/clutter/clutter_git.bb       |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |    3 -
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    3 -
 meta/recipes-graphics/mutter/mutter.inc            |    3 -
 meta/recipes-graphics/tslib/tslib/a780/tslib.sh    |    6 -
 meta/recipes-graphics/tslib/tslib/collie/ts.conf   |    5 -
 meta/recipes-graphics/tslib/tslib/collie/tslib.sh  |   13 -
 meta/recipes-graphics/tslib/tslib/devfs.patch      |   18 -
 meta/recipes-graphics/tslib/tslib/e680/tslib.sh    |    6 -
 meta/recipes-graphics/tslib/tslib/event1.patch     |   80 -
 .../tslib/tslib/jornada56x/ts.conf                 |    5 -
 .../tslib/tslib/jornada56x/tslib.sh                |    5 -
 .../tslib/tslib/jornada6xx/ts.conf                 |    5 -
 .../tslib/tslib/jornada6xx/tslib.sh                |    5 -
 .../tslib/tslib/jornada7xx/ts.conf                 |    5 -
 .../tslib/tslib/jornada7xx/tslib.sh                |    5 -
 meta/recipes-graphics/tslib/tslib/mnci/ts.conf     |    5 -
 meta/recipes-graphics/tslib/tslib/mnci/tslib.sh    |    1 -
 .../tslib/tslib/netbook-pro/ts.conf                |    5 -
 .../tslib/tslib/netbook-pro/tslib.sh               |    5 -
 .../tslib/tslib/omap1610h2/tslib.sh                |    5 -
 .../tslib/tslib/omap5912osk/tslib.sh               |    4 -
 meta/recipes-graphics/tslib/tslib/simpad/tslib.sh  |   14 -
 .../tslib/tslib/ts.conf-collie-2.4                 |    5 -
 .../tslib/tslib/ts.conf-simpad-2.4                 |    5 -
 meta/recipes-graphics/tslib/tslib_1.0.bb           |   32 +-
 .../xserver-xf86-config/igep0020/xorg.conf         |   47 -
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../perf-tool-Fix-gcc-4.6.0-issues.patch           |  266 +
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   28 +-
 .../lttng-viewer/add_linkage_to_lttvwindow.patch   |   42 +
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |   10 +-
 .../modutils/files/ipaq-pxa-2.6/modules            |   18 -
 .../modutils/files/ipaq-pxa-2.6/modules.conf       |    1 -
 meta/recipes-kernel/modutils/files/mnci/modules    |    1 -
 .../modutils/files/mnci/modules-ramses             |    1 -
 .../modutils/files/mnci/modules.conf               |   20 -
 .../recipes-kernel/modutils/files/mnci/modutils.sh |   10 -
 meta/recipes-kernel/modutils/files/mtx-1/modules   |    3 -
 meta/recipes-kernel/modutils/files/poodle/modules  |    3 -
 .../modutils/files/poodle/modules.conf             |    4 -
 meta/recipes-kernel/modutils/files/tosa/modules    |    4 -
 .../modutils/files/tosa/modules.conf               |    4 -
 meta/recipes-kernel/modutils/files/wrt54/modules   |    4 -
 .../update-modules-1.0/openmn/update-modules       |    3 -
 .../update-modules/update-modules_1.0.bb           |   11 +-
 .../pulseaudio/pulseaudio_0.9.22.bb                |    4 -
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    8 +-
 meta/recipes-sato/web/web_svn.bb                   |    2 +-
 meta/recipes-support/hal/hal.inc                   |    1 -
 meta/recipes-support/hal/hal_0.5.14.bb             |    2 +-
 meta/recipes-support/hal/hal_git.bb                |    2 +-
 366 files changed, 714609 insertions(+), 4412 deletions(-)
 rename {meta/recipes-bsp/formfactor/files => meta-yocto/recipes-bsp/formfactor/formfactor}/atom-pc/machconfig (100%)
 rename {meta/recipes-bsp/formfactor/files => meta-yocto/recipes-bsp/formfactor/formfactor}/beagleboard/machconfig (100%)
 create mode 100644 meta-yocto/recipes-bsp/formfactor/formfactor_0.0.bbappend
 create mode 100644 meta-yocto/recipes-core/tasks/task-core-tools.bbappend
 rename {meta/recipes-core/uclibc/uclibc-0.9.30.1 => meta-yocto/recipes-core/uclibc/uclibc}/atom-pc/uClibc.machine (100%)
 create mode 100644 meta-yocto/recipes-core/uclibc/uclibc_0.9.30.1.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-sdk-gmae.bbappend
 create mode 100644 meta-yocto/recipes-gnome/tasks/task-poky-standalone-gmae-sdk-target.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.4_1.4.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter-1.6_1.6.14.bbappend
 create mode 100644 meta-yocto/recipes-graphics/clutter/clutter_git.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_7.10.2.bbappend
 create mode 100644 meta-yocto/recipes-graphics/mesa/mesa-dri_git.bbappend
 rename {meta => meta-yocto}/recipes-graphics/xorg-xserver/xserver-xf86-config/atom-pc/xorg.conf (100%)
 create mode 100644 meta-yocto/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.6.3.bbappend
 create mode 100644 meta-yocto/recipes-qt/qt4/qt4-x11-free_4.7.2.bbappend
 delete mode 100755 meta/recipes-bsp/formfactor/files/akita/machconfig
 delete mode 100644 meta/recipes-bsp/formfactor/files/bootcdx86/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/c7x0/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/cm-x270/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/em-x270/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/htcuniversal/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/igep0020/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/nokia800/machconfig
 delete mode 100644 meta/recipes-bsp/formfactor/files/om-gta01/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/omap-3430ldp/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/omap-3430sdp/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/spitz/machconfig
 delete mode 100755 meta/recipes-bsp/formfactor/files/zylonite/machconfig
 delete mode 100644 meta/recipes-bsp/keymaps/files/akita/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/akita/keymap-2.6.map
 delete mode 100755 meta/recipes-bsp/keymaps/files/c7x0/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/collie/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/collie/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/h2200/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/htcuniversal/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-de.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-sp.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/jornada6xx/keymap-uk.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/poodle/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/spitz/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/spitz/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/tosa/keymap-2.4.map
 delete mode 100644 meta/recipes-bsp/keymaps/files/tosa/keymap-2.6.map
 delete mode 100644 meta/recipes-bsp/pointercal/files/akita/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/c7x0/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/htcuniversal/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/om-gta01/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/omap-3430ldp/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/files/spitz/pointercal
 create mode 100644 meta/recipes-connectivity/gypsy/files/fix-unused-but-set-variable-warning.patch
 delete mode 100644 meta/recipes-core/base-files/base-files/akita/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/akita/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/c7x0/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/c7x0/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/collie/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/collie/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/htcuniversal/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/hx2000/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/mtx-1/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/mtx-1/profile
 delete mode 100644 meta/recipes-core/base-files/base-files/nokia770/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/poodle/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/poodle/usbd
 delete mode 100644 meta/recipes-core/base-files/base-files/spitz/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/spitz/rotation
 delete mode 100644 meta/recipes-core/base-files/base-files/tosa/fstab
 delete mode 100644 meta/recipes-core/base-files/base-files/tosa/usbd
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4t-interworking.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
 rename meta/{recipes-kernel/modutils/files/omap1610h2/modules => recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf} (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.13.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.13.bb
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/colinux/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/epia/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/mtx-1/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/nokia800/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/hosts
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/openmn/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/tosa/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/wrt54/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.45/xxs1500/interfaces
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/akita/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/c7x0/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/cm-x270/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/om-gta01/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/spitz/uClibc.machine
 delete mode 100644 meta/recipes-core/udev/files/50-hostap_cs.rules
 delete mode 100644 meta/recipes-core/udev/files/akita/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/c7x0/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/slugos/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/spitz/mount.blacklist
 delete mode 100644 meta/recipes-core/udev/files/tosa/mount.blacklist
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-backports.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.0.bb
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript_9.02.bb
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/a780/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/collie/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/collie/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/devfs.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/e680/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/event1.patch
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada56x/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada56x/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada6xx/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada6xx/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada7xx/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/jornada7xx/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/mnci/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/mnci/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/netbook-pro/ts.conf
 delete mode 100644 meta/recipes-graphics/tslib/tslib/netbook-pro/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/omap1610h2/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/omap5912osk/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/simpad/tslib.sh
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf-collie-2.4
 delete mode 100644 meta/recipes-graphics/tslib/tslib/ts.conf-simpad-2.4
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/igep0020/xorg.conf
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-viewer/add_linkage_to_lttvwindow.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/ipaq-pxa-2.6/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules-ramses
 delete mode 100644 meta/recipes-kernel/modutils/files/mnci/modules.conf
 delete mode 100755 meta/recipes-kernel/modutils/files/mnci/modutils.sh
 delete mode 100644 meta/recipes-kernel/modutils/files/mtx-1/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/omap1610h2/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/poodle/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/poodle/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/tosa/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/tosa/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/wrt54/modules
 delete mode 100755 meta/recipes-kernel/update-modules/update-modules-1.0/openmn/update-modules




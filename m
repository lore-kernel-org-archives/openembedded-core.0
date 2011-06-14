Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOct-0001K5-06
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283826"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:09 -0700
Message-Id: <cover.1308037752.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/51] 14-June-2011
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:32 -0000

Richard,

This has number fixes for various issues along with recipe updates.
While the autobuidler does not look so great, these have built on local 
machines in a cleaner environment.

I removed the large patchset for GCC, it can be reviewed at the browse
URL below

Thanks
	Sau!


The following changes since commit 6a3e57fcd3a172c9b2707510d65741734c98a143:

  Revert "gcc: rebase the patch to avoid patch rejection" (2011-06-10 12:56:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Anders Darander (2):
  perl-native: fix download url
  runqemu: take TMPDIR from bitbake

Bruce Ashfield (1):
  linux-yocto: rename recipes to explicitly indicate version

Dexuan Cui (14):
  git: restore the dependency on perl-native
  tcmode-default: fix PREFERRED_VERSION_gcc-cross-canadian
  recipes: update Upstream-Status for multiple recipes' patches
  gnome-doc-utils: upgrade from 0.20.5 to the latest version 0.20.6
  startup-notification: upgrade from 0.10 to the latest version 0.12
  util-macros: upgrade from 1.13.0 to the latest version 0.14.0
  resourceproto: upgrade from 1.1.1 to the latest version 1.2.0
  dri2proto: upgrade from 2.3 to the latest version 2.4
  glproto: upgrade from 1.4.12 to the latest version 1.4.13
  inputproto: upgrade from 2.0.1 to the latest version 2.0.2
  pixman: upgrade from 0.20.2 to the latest stable 0.22.0
  libxext: upgrade from 1.2.0 to the latest version 1.3.0
  libxi: upgrade from 1.4.2 to the latest version 1.4.3
  distro_tracking_fields.inc: update the info for the following recipes

Kang Kai (2):
  ghostscript: update SRC_URI
  eglibc: migrate configurability from oe

Khem Raj (6):
  util-macros_1.13.0.bb: Depend on virtual/gettext instead of gettext
  uclibc.inc: libsegfault is only RPROVIDED by uclibc
  gettext_0.18.1.1.bb: Fix build on uclibc
  uclibc: Cleanup the machine dependent config files
  eglibc 2.12/2.13: Upgrade SRCREV
  gcc-4.6.0: Bring in patches from FSF 4.6 branch

Koen Kooi (2):
  qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
  connman-gnome 0.5: build from git

Phil Blundell (5):
  busybox: backport distro-features handling from oe master
  uclibc: fix compile error on i586
  import recipe_sanity.bbclass from oe master
  uclibc: remove redundant python code
  uclibc: remove PACKAGE_ARCH

Richard Purdie (11):
  pointercal: Inhibit toolchain dependencies as its just config files
  formfactor: Inhibit toolchain dependencies as its just config files
  keymaps: Inhibit toolchain dependencies as its just configuration
    files
  usbinit: Inherit allarch as its a generic script
  base-files: Inherit toolchain dependencies as a compiler isn't used
  poky-feed-opkg: Disable default toolchain dependencies as these are
    just configuration files
  initscripts: makedevs is no longer used anywhere so drop dependency.
    Also inhibit compiler/libc dependencies as they're unused
  sysvinit-inittab: Inhibit compiler/libc dependencies as this is just
    a configuration file
  initrdscripts: Inhibit compiler/libc dependencies as this is just a
    configuration file
  task-sdk-host: Add nativesdk to the task name so its clearer what the
    contents of the task represent
  nativesdk.bbclass: Correct ordering of manipulations

Saul Wold (8):
  json-glib: Fix up SRC_URI Checksums
  clutter-box2d_git: Switch SRC_URI to git.gnome.org
  update-alternatives-dpkg: Fix SRC_URI Checksum
  jsib-glib: Fix SRC_URI Checksum
  rxvt-unicode: Fix SRC_URI & LIC_FILES Checksum
  alsa-tools: fix Checksums
  libx11-diet: Fixed checksum and rebase patch
  autoconf/automake: Bump PR to resolve perl-native issue

 meta/classes/nativesdk.bbclass                     |   53 +-
 meta/classes/populate_sdk.bbclass                  |    2 +-
 meta/classes/recipe_sanity.bbclass                 |  179 +
 meta/conf/distro/include/default-distrovars.inc    |    9 +-
 .../conf/distro/include/distro_tracking_fields.inc |  113 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/include/qemu.inc                 |    2 +-
 meta/recipes-bsp/formfactor/formfactor_0.0.bb      |    1 +
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    2 +
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |    1 +
 meta/recipes-bsp/usbinit/usbinit.bb                |    4 +-
 .../connman-gnome/applet_menu_popup_fix.patch      |   19 -
 .../connman/connman-gnome/connman-gnome.patch      | 4162 --------------
 .../remove-connman-property-desktop-file.patch     |   42 -
 .../connman-gnome/service_name_update.patch        |   36 -
 .../connman/connman-gnome_0.5.bb                   |   13 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +
 meta/recipes-core/busybox/busybox.inc              |   80 +-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/eglibc/eglibc-options.inc        |   62 +
 meta/recipes-core/eglibc/eglibc.inc                |    6 +
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 .../feed-config/poky-feed-config-opkg_1.0.bb       |    1 +
 .../gnulib-uclibc-sched_param-def.patch            |   21 +
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    7 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +
 ...task-sdk-host.bb => task-sdk-host-nativesdk.bb} |    0
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    4 +-
 .../{nslu2be => armv5teb}/uClibc.machine           |    0
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 -
 .../uclibc/uclibc-git/epoll-asm-fix.patch          |   25 +
 .../uclibc-git/{qemumips => mips}/uClibc.machine   |    0
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   77 -
 .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 -
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   14 +-
 meta/recipes-core/uclibc/uclibc.inc                |   19 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    6 +-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    2 +-
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 .../0002-Backport-from-mainline.patch              |    3 +-
 .../0003-Backport-from-mainline.patch              |    3 +-
 .../0004-Backport-from-mainline.patch              |    3 +-
 .../0005-Backport-from-mainline.patch              |    3 +-
 .../0006-Backport-from-mainline.patch              |    3 +-
 .../0007-Backport-from-mainline.patch              |    3 +-
 ...26-Paolo-Carlini-paolo.carlini-oracle.com.patch |    3 +-
 .../0009-Backport-from-mainline.patch              |    3 +-
 ...-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    3 +-
 ...-03-28-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../gcc-4_6-branch-backports/0015-gcc.patch        |    3 +-
 .../0016-Backport-from-mainline.patch              |    3 +-
 .../0017-libgfortran.patch                         |    3 +-
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    3 +-
 ...-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch |    3 +-
 .../0021-c.opt-Add-std-c-03.patch                  |    3 +-
 .../gcc-4_6-branch-backports/0022-PR-c-47570.patch |    3 +-
 .../gcc-4_6-branch-backports/0023-PR-c-47504.patch |    3 +-
 ...ild_noexcept_spec-Call-cxx_constant_value.patch |    3 +-
 .../gcc-4_6-branch-backports/0025-c-family.patch   |    3 +-
 ...026-decl2.c-cp_check_const_attributes-New.patch |    3 +-
 .../gcc-4_6-branch-backports/0027-Core-1148.patch  |    3 +-
 .../gcc-4_6-branch-backports/0028-PR-c-48313.patch |    3 +-
 .../gcc-4_6-branch-backports/0029-PR-c-47999.patch |    3 +-
 ...non_dependent_expr-Keep-dereferences-outs.patch |    3 +-
 ...rence_binding-Allow-direct-binding-to-an-.patch |    3 +-
 .../gcc-4_6-branch-backports/0032-Core-1232.patch  |    3 +-
 ...-is_valid_constexpr_fn-Specify-input-loca.patch |    3 +-
 .../gcc-4_6-branch-backports/0034-PR-c-48296.patch |    3 +-
 .../gcc-4_6-branch-backports/0035-PR-c-48166.patch |    3 +-
 ...a-alpha.c-alpha_sr_alias_set-Don-t-define.patch |    3 +-
 .../gcc-4_6-branch-backports/0038-PR-c-48319.patch |    3 +-
 .../0039-PR-preprocessor-48248.patch               |    3 +-
 .../0040-PR-debug-48253.patch                      |    3 +-
 .../gcc-4_6-branch-backports/0042-PR-c-48265.patch |    3 +-
 .../0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch        |    3 +-
 .../gcc-4_6-branch-backports/0044-PR-c-48281.patch |    3 +-
 .../gcc-4_6-branch-backports/0045-PR-c-48369.patch |    3 +-
 .../gcc-4_6-branch-backports/0046-PR-c-48212.patch |    3 +-
 ...-03-31-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../0049-PR-target-48142.patch                     |    3 +-
 .../0050-PR-target-16292.patch                     |    3 +-
 .../gcc-4_6-branch-backports/0051-PR-c-48280.patch |    3 +-
 ...07-from-trunk-to-the-4.6-release-branch-t.patch |    3 +-
 .../0054-Backport-from-mainline.patch              |    3 +-
 ...fig-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch |    3 +-
 ...11-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch |    3 +-
 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |    3 +-
 ...-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch |    3 +-
 ...n.dg-bessel_6.f90-Use-dg-add-options-ieee.patch |    3 +-
 ...4-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch |    3 +-
 .../0065-es.po-Update.patch                        |    3 +-
 ...ers-for-functions-from-the-frexp-family-w.patch |    3 +-
 ...-04-05-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 ....c-self_referential_size-Fix-2010-07-13-c.patch |    3 +-
 .../0070-de.po-Update.patch                        |    3 +-
 ...ov-io.c-Use-GCC-Runtime-Library-Exception.patch |    3 +-
 .../0073-Backported-from-mainline.patch            |    3 +-
 .../0074-PR-debug-48466.patch                      |    3 +-
 ...73-from-trunk-to-the-4.6-release-branch-t.patch |    3 +-
 .../0077-Backport-from-mainline.patch              |    3 +-
 .../0078-de.po-Update.patch                        |    3 +-
 .../0079-PR-debug-48343.patch                      |    3 +-
 .../0080-PR-fortran-48117.patch                    |    3 +-
 ...-config-i386-sse.md-Update-copyright-year.patch |    3 +-
 ...ure-stackalign-non-local-goto-5.c-Fix-for.patch |    3 +-
 .../0084-PR-tree-optimization-48377.patch          |    3 +-
 .../0085-de.po-Update.patch                        |    3 +-
 .../gcc-4_6-branch-backports/0086-PR-c-48450.patch |    3 +-
 ....c-finish_decltype_type-Add-complain-parm.patch |    3 +-
 .../gcc-4_6-branch-backports/0088-PR-c-48452.patch |    3 +-
 .../gcc-4_6-branch-backports/0089-PR-c-48468.patch |    3 +-
 .../gcc-4_6-branch-backports/0090-PR-c-48500.patch |    3 +-
 ...1-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |    3 +-
 .../0092-PR-testsuite-48506.patch                  |    3 +-
 ...ther-than-crashing-in-array_type_nelts-if.patch |    3 +-
 .../gcc-4_6-branch-backports/0095-PR-c-48528.patch |    3 +-
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    3 +-
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    3 +-
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    3 +-
 .../0101-Backport-from-mainline.patch              |    3 +-
 ...2-common.opt-Tbss-Tdata-Ttext-New-options.patch |    3 +-
 .../gcc-4_6-branch-backports/0104-PR-c-48523.patch |    3 +-
 .../gcc-4_6-branch-backports/0105-PR-c-48534.patch |    3 +-
 .../gcc-4_6-branch-backports/0106-PR-c-48517.patch |    3 +-
 ...011-04-12-Allan-McRae-allan-archlinux.org.patch |    3 +-
 ...-v850.c-expand_prologue-Do-not-use-the-CA.patch |    3 +-
 .../0109-PR-rtl-optimization-48549.patch           |    3 +-
 ...-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch |    3 +-
 .../0112-Fix-PR-target-48090.patch                 |    3 +-
 .../0113-Fix-PR-c-48574.patch                      |    3 +-
 .../gcc-4_6-branch-backports/0114-PR-c-48570.patch |    3 +-
 .../0115-PR-middle-end-48591.patch                 |    3 +-
 ...-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch |    3 +-
 .../gcc-4_6-branch-backports/0117-PR-c-48594.patch |    3 +-
 .../0118-sv.po-Update.patch                        |    3 +-
 .../0119-Backport-from-mainline.patch              |    3 +-
 .../0122-PR-target-48605.patch                     |    3 +-
 .../0123-PR-target-48614.patch                     |    3 +-
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    3 +-
 ...04-15-Takaya-Saito-gintensubaru-gmail.com.patch |    3 +-
 ...15-Paolo-Carlini-paolo.carlini-oracle.com.patch |    3 +-
 ...ibjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch |    3 +-
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    3 +-
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    3 +-
 .../0132-PR-lto-48538.patch                        |    3 +-
 ...c-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch |    3 +-
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    3 +-
 .../0135-doc-passes.texi-Fill-crossref-nodes.patch |    3 +-
 ...ce-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch |    3 +-
 .../0138-PR-tree-optimization-48616.patch          |    3 +-
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 ...x-weakref-trickery-breakage-on-alpha-dec-.patch |    3 +-
 ...-is_redundant_typedef-Add-inline-to-proto.patch |    3 +-
 .../gcc-4_6-branch-backports/0142-PR-c-48632.patch |    3 +-
 .../0143-PR-middle-end-48661.patch                 |    3 +-
 .../gcc-4_6-branch-backports/0144-PR-c-48537.patch |    3 +-
 .../0146-PR-testsuite-48675.patch                  |    3 +-
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../0149-PR-target-48678.patch                     |    3 +-
 .../gcc-4_6-branch-backports/0151-PR-c-46304.patch |    3 +-
 ...tstrap-lto.mk-Remove-obsolete-requirement.patch |    3 +-
 ...-04-20-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../0154-Backport-from-mainline.patch              |    3 +-
 .../0155-PR-tree-optimization-48611.patch          |    3 +-
 .../gcc-4_6-branch-backports/0156-PR-c-48657.patch |    3 +-
 .../0157-PR-target-48288.patch                     |    3 +-
 .../gcc-4_6-branch-backports/0159-PR-c-48594.patch |    3 +-
 ...-finish_compound_literal-Don-t-put-an-arr.patch |    3 +-
 ...lk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch |    3 +-
 ...-04-21-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../0163-de.po-Update.patch                        |    3 +-
 .../0164-PR-target-48708.patch                     |    3 +-
 .../gcc-4_6-branch-backports/0166-PR-c-48716.patch |    3 +-
 .../0167-PR-target-48723.patch                     |    3 +-
 .../0168-PR-tree-optimization-48717.patch          |    3 +-
 .../gcc-4_6-branch-backports/0170-Revert.patch     |    3 +-
 .../gcc-4_6-branch-backports/0171-PR-c-48685.patch |    3 +-
 ...616.c-dg-options-Add-fno-common-to-option.patch |    3 +-
 ...-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    3 +-
 .../0174-PR-preprocessor-48740.patch               |    3 +-
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |    3 +-
 .../gcc-4_6-branch-backports/0178-PR-c-48707.patch |    3 +-
 ...-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch |    3 +-
 ...-04-26-Richard-Guenther-rguenther-suse.de.patch |    3 +-
 .../0182-PR-tree-optimization-48734.patch          |    3 +-
 .../0183-PR-debug-48768.patch                      |    3 +-
 .../0184-de.po-Update.patch                        |    3 +-
 .../gcc-4_6-branch-backports/0185-PR-c-48726.patch |    3 +-
 .../gcc-4_6-branch-backports/0187-PR-c-42687.patch |    3 +-
 .../gcc-4_6-branch-backports/0188-PR-c-48742.patch |    3 +-
 ...gcc.dg-20020312-2.c-Add-definition-for-RX.patch |    3 +-
 .../gcc-4_6-branch-backports/0190-PR-c-48046.patch |    3 +-
 .../0192-PR-middle-end-48597.patch                 |    3 +-
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    3 +-
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    3 +-
 .../0195-Fix-PR-c-48656.patch                      |    3 +-
 .../0196-Backport-4.7-patchtes-to-4.6.patch        |    3 +-
 ...-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch |    3 +-
 ...29-Paolo-Carlini-paolo.carlini-oracle.com.patch |    3 +-
 .../0201-PR-tree-optimization-48809.patch          |  199 +
 ...-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch |  198 +
 ...04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch |  108 +
 ...-2011-04-30-Doug-Kwan-dougkwan-google.com.patch |   38 +
 .../0207-Backport-from-mainline.patch              |  132 +
 .../0209-PR-target-48723.patch                     |   26 +
 ...-05-03-Richard-Guenther-rguenther-suse.de.patch |   45 +
 .../0211-PR-target-48774.patch                     |   78 +
 ...03-Paolo-Carlini-paolo.carlini-oracle.com.patch |  462 ++
 ...-sso_string_base.h-__sso_string_base-_M_c.patch |  178 +
 ...-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch |  244 +
 ...1-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |  189 +
 .../gcc-4_6-branch-backports/0218-PR-c-48749.patch |   59 +
 .../0219-Backport-from-mainline.patch              |  145 +
 .../gcc-4_6-branch-backports/0220-gcc.patch        |   55 +
 .../0221-PR-ada-48844.patch                        |  182 +
 .../gcc-4_6-branch-backports/0222-PR-c-40975.patch |   55 +
 ...0223-Add-missing-break-for-OPT_mfpu_-case.patch |   21 +
 ...-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch | 5993 ++++++++++++++++++++
 .../0226-Fix-PR-c-48838.patch                      |  112 +
 .../0227-PR-fortran-48894.patch                    |  136 +
 ...Ramana-Radhakrishnan-ramana.radhakrishnan.patch |   28 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   58 +
 .../0230-PR-target-48900.patch                     |   44 +
 ...86-i386.md-movdf_internal_nointeger-Apply.patch |   23 +
 .../gcc-4_6-branch-backports/0232-PR-c-48089.patch |   77 +
 .../gcc-4_6-branch-backports/0233-PR-c-48446.patch |  183 +
 .../gcc-4_6-branch-backports/0234-PR-c-48911.patch |   96 +
 .../gcc-4_6-branch-backports/0235-PR-c-48909.patch |   73 +
 ...acking.c-find_mem_expr_in_1pdv-Fix-thinko.patch |   49 +
 .../0240-Fix-PR-c-48574.patch                      |   63 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   26 +
 ...09-Paolo-Carlini-paolo.carlini-oracle.com.patch |   44 +
 .../0244-PR-tree-optimization-48611.patch          |   77 +
 .../0245-Backported-from-mainline.patch            |   73 +
 ...x.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch |   76 +
 ...x.c-rx_memory_move_cost-Reduce-the-cost-f.patch |   23 +
 .../0249-Fix-PRs-48857-48495.patch                 |  216 +
 .../0251-gcc-cp-ChangeLog.patch                    |   55 +
 .../0252-PR-debug-48159.patch                      |  198 +
 ...-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch |  159 +
 ...non_dependent_expr-Don-t-check-null_ptr_c.patch |   24 +
 ...onfig-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch |   59 +
 .../0257-zh_CN.po-Update.patch                     |   37 +
 .../0258-PR-debug-48967.patch                      |  134 +
 ...-05-12-Richard-Guenther-rguenther-suse.de.patch |  100 +
 .../0260-PR-tree-optimization-48975.patch          |   61 +
 .../0263-zh_CN.po-Update.patch                     | 5328 +++++++++++++++++
 ...-i386.md-movxf_internal-Disable-CONST_DOU.patch |  127 +
 .../0267-PR-preprocessor-48677.patch               |   31 +
 .../0269-PR-target-48986.patch                     |   40 +
 ...x.md-Add-peephole-to-remove-redundant-ext.patch |  126 +
 ...x.c-rx_memory_move_cost-Include-cost-of-r.patch |   28 +
 .../0273-PR-tree-optimization-49000.patch          |   39 +
 .../0274-PR-tree-optimization-49000.patch          |   52 +
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  138 +
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |  111 +
 ...-05-18-Richard-Guenther-rguenther-suse.de.patch |   81 +
 .../0278-PR-tree-optimization-49039.patch          |  217 +
 .../0279-Properly-handle-256bit-load-cast.patch    |   95 +
 .../gcc-4_6-branch-backports/0281-PR-c-48869.patch |  460 ++
 ...2-gcc.c-torture-execute-960321-1.x-Remove.patch |   30 +
 .../0283-zh_CN.po-Update.patch                     | 1529 +++++
 .../gcc-4_6-branch-backports/0284-PR-c-49043.patch |   50 +
 ...-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch |   67 +
 .../0287-PR-tree-optimization-49073.patch          |  121 +
 ...-05-20-Richard-Guenther-rguenther-suse.de.patch |  117 +
 .../0289-PR-bootstrap-49086.patch                  |   35 +
 .../gcc-4_6-branch-backports/0290-PR-c-48873.patch |   45 +
 .../gcc-4_6-branch-backports/0291-PR-c-48736.patch |   40 +
 .../gcc-4_6-branch-backports/0292-PR-c-48745.patch |   59 +
 ...-register_constexpr_fundef-Add-to-hash-ta.patch |   81 +
 ...-validate_constexpr_fundecl-Check-DECL_TE.patch |   42 +
 .../gcc-4_6-branch-backports/0295-PR-c-48948.patch |  188 +
 .../gcc-4_6-branch-backports/0296-DR-1073.patch    |  156 +
 .../0298-In-gcc-objc.patch                         |   31 +
 .../gcc-4_6-branch-backports/0299-PR-c-49066.patch |   34 +
 ...c-sparc.c-eligible_for_return_delay-Do-no.patch |   65 +
 ...c-sparc.md-setjmp-Handle-PIC-mode-and-use.patch |   56 +
 .../gcc-4_6-branch-backports/0303-PR-c-48780.patch |   49 +
 .../gcc-4_6-branch-backports/0304-PR-c-48945.patch |   45 +
 .../0305-PR-middle-end-49029.patch                 |   52 +
 .../0306-PR-target-49104.patch                     |   63 +
 ...07-config.gcc-sparc-elf-Add-sparc-t-crtin.patch |  150 +
 .../gcc-4_6-branch-backports/0308-PR-c-48647.patch |   97 +
 ...-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |  185 +
 .../0311-PR-middle-end-48973.patch                 |  101 +
 .../gcc-4_6-branch-backports/0312-PR-c-49120.patch |   50 +
 .../0313-PR-debug-49032.patch                      |   90 +
 .../0314-PR-lto-49123.patch                        |   49 +
 .../0316-Always-add-mno-XXX-for-march-native.patch |   98 +
 .../0317-PR-target-49133.patch                     |   93 +
 ...c-sparc.c-sparc_option_override-If-not-se.patch |   27 +
 .../gcc-4_6-branch-backports/0320-PR-c-48617.patch |   37 +
 .../gcc-4_6-branch-backports/0321-PR-c-47544.patch |   57 +
 .../gcc-4_6-branch-backports/0322-PR-c-47336.patch |   53 +
 .../gcc-4_6-branch-backports/0323-PR-c-47263.patch |   45 +
 .../gcc-4_6-branch-backports/0324-PR-c-49105.patch |   75 +
 .../gcc-4_6-branch-backports/0325-PR-c-48884.patch |   86 +
 .../gcc-4_6-branch-backports/0326-PR-c-49042.patch |   63 +
 .../gcc-4_6-branch-backports/0327-PR-c-49136.patch |  142 +
 .../gcc-4_6-branch-backports/0328-In-libobjc.patch |   81 +
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |   62 +
 .../0330-PR-tree-optimization-44897.patch          |   24 +
 .../0331-PR-target-49128.patch                     |   23 +
 .../gcc-4_6-branch-backports/0332-PR-c-48292.patch |   71 +
 .../gcc-4_6-branch-backports/0333-PR-c-45080.patch |   59 +
 .../gcc-4_6-branch-backports/0334-PR-c-45418.patch |   50 +
 .../gcc-4_6-branch-backports/0335-PR-c-48935.patch |   76 +
 ...arm-fp16-compile-none-1.c-Update-expected.patch |   74 +
 .../gcc-4_6-branch-backports/0337-PR-c-47184.patch |   64 +
 .../gcc-4_6-branch-backports/0338-PR-c-46696.patch |   48 +
 .../gcc-4_6-branch-backports/0339-PR-c-46245.patch |   88 +
 .../gcc-4_6-branch-backports/0340-PR-c-46145.patch |   37 +
 .../gcc-4_6-branch-backports/0341-PR-c-45698.patch |   44 +
 .../gcc-4_6-branch-backports/0342-PR-c-44311.patch |  125 +
 .../0343-gcc-cp-ChangeLog.patch                    |  207 +
 ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   76 +
 ...25-Paolo-Carlini-paolo.carlini-oracle.com.patch |   78 +
 .../gcc-4_6-branch-backports/0347-PR-c-45401.patch |   51 +
 .../gcc-4_6-branch-backports/0348-PR-c-49156.patch |   62 +
 .../0349-PR-tree-optimization-49161.patch          |  200 +
 .../gcc-4_6-branch-backports/0350-PR-c-49165.patch |   89 +
 .../0351-PR-target-44643.patch                     |   44 +
 .../gcc-4_6-branch-backports/0352-PR-c-48424.patch |  105 +
 ...00-rs6000.c-rs6000_register_move_cost-Mak.patch |   28 +
 ...-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch |  168 +
 .../gcc-4_6-branch-backports/0357-PR-c-48657.patch |  149 +
 .../gcc-4_6-branch-backports/0358-PR-c-49165.patch |   89 +
 .../gcc-4_6-branch-backports/0359-PR-c-48284.patch |   40 +
 .../gcc-4_6-branch-backports/0360-PR-c-47277.patch |   38 +
 .../gcc-4_6-branch-backports/0362-PR-c-47049.patch |   62 +
 ...-05-29-Richard-Guenther-rguenther-suse.de.patch |   68 +
 .../gcc-4_6-branch-backports/0365-gcc.patch        |  125 +
 .../gcc-4_6-branch-backports/0366-gcc.patch        |   52 +
 ...d-PR-target-43700-to-last-changelog-entry.patch |    7 +
 .../0369-PR-target-45263.patch                     |   71 +
 ...-05-30-Richard-Guenther-rguenther-suse.de.patch |   69 +
 .../gcc-4_6-branch-backports/0371-PR-c-49223.patch |   99 +
 ...-05-31-Richard-Guenther-rguenther-suse.de.patch |   72 +
 ...-05-31-Richard-Guenther-rguenther-suse.de.patch |   64 +
 ..._fmsubadd-and-fma4_fmaddsub-mode-suffixes.patch |   36 +
 ...1-05-31-Thomas-Koenig-tkoenig-gcc.gnu.org.patch |  237 +
 .../0379-PR-tree-optimization-49093.patch          |   61 +
 ...1-06-02-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |  139 +
 .../gcc-4_6-branch-backports/0382-PR-c-49276.patch |   62 +
 .../0384-PR-tree-optimization-49038.patch          |  367 ++
 .../0385-PR-debug-47590.patch                      |  490 ++
 ...-04-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |   29 +
 .../0388-PR-target-49186.patch                     |   48 +
 ...c-sparc.c-output_return-Fix-thinko-in-the.patch |   45 +
 .../gcc-4_6-branch-backports/0391-PR-c-49134.patch |   24 +
 ...-06-06-Richard-Guenther-rguenther-suse.de.patch |  267 +
 ...11-06-06-Mikael-Pettersson-mikpe-it.uu.se.patch |   59 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |   27 +
 .../gcc-4_6-branch-backports/0395-PR-c-49264.patch |  134 +
 .../0396-PR-fortran-49268.patch                    |   88 +
 ...00-rs6000.h-REG_CLASS_CONTENTS-Remove-vr0.patch |   23 +
 .../gcc-4_6-branch-backports/0398-PR-c-49298.patch |   37 +
 .../0400-PR-gcov-profile-49299.patch               |  158 +
 .../gcc-4_6-branch-backports/0401-PR-c-48780.patch |   63 +
 .../0403-PR-target-49238.patch                     |   53 +
 ...404-Support-unknown-Intel-family-0x6-CPUs.patch |   48 +
 ...c-sparc.md-return_internal-Adjust-length-.patch |   24 +
 ...-potential_constant_expression_1-Handle-d.patch |   35 +
 ...-finish_compound_literal-Set-TREE_HAS_CON.patch |   22 +
 .../0410-lib-target-supports.exp.patch             |   34 +
 ...te-gcc.target-arm-20090811-1.c-Skip-for-i.patch |   79 +
 ...-sse.md-vec_dupv4sf-Correct-mode-of-force.patch |   50 +
 .../gcc/gcc-4_6-branch-backports.inc               |  170 +-
 meta/recipes-devtools/git/git.inc                  |    6 +-
 meta/recipes-devtools/git/git_1.7.5.1.bb           |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    2 +-
 .../update-alternatives-dpkg_1.16.0.3.bb           |    4 +-
 .../ghostscript/ghostscript_9.02.bb                |   19 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |    2 +-
 ...c-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} |    6 +-
 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb   |    4 +-
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 ...cation_0.10.bb => startup-notification_0.12.bb} |    4 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |   14 +-
 .../xorg-lib/libx11/X18NCMSstubs.diff              |   62 +-
 .../{libxext_1.2.0.bb => libxext_1.3.0.bb}         |    6 +-
 .../xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb}    |    6 +-
 .../{pixman_0.20.2.bb => pixman_0.22.0.bb}         |    8 +-
 .../{dri2proto_2.3.bb => dri2proto_2.4.bb}         |    4 +-
 .../{glproto_1.4.12.bb => glproto_1.4.13.bb}       |    4 +-
 .../{inputproto_2.0.1.bb => inputproto_2.0.2.bb}   |    4 +-
 ...sourceproto_1.1.1.bb => resourceproto_1.2.0.bb} |    6 +-
 ...util-macros_1.13.0.bb => util-macros_1.14.0.bb} |    8 +-
 ...x-yocto-stable_git.bb => linux-yocto_2.6.34.bb} |    0
 .../{linux-yocto_git.bb => linux-yocto_2.6.37.bb}  |    0
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    2 +-
 ...ost.bb => task-qte-toolchain-host-nativesdk.bb} |    2 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.11.bb |    8 +-
 scripts/runqemu                                    |   22 +-
 400 files changed, 28781 insertions(+), 4987 deletions(-)
 create mode 100644 meta/classes/recipe_sanity.bbclass
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/applet_menu_popup_fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/remove-connman-property-desktop-file.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/service_name_update.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/gnulib-uclibc-sched_param-def.patch
 rename meta/recipes-core/tasks/{task-sdk-host.bb => task-sdk-host-nativesdk.bb} (100%)
 rename meta/recipes-core/uclibc/uclibc-git/{nslu2be => armv5teb}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/epoll-asm-fix.patch
 rename meta/recipes-core/uclibc/uclibc-git/{qemumips => mips}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.config
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0201-PR-tree-optimization-48809.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0202-2011-04-30-Paul-Thomas-pault-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0203-2011-04-30-Jerry-DeLisle-jvdelisle-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0205-2011-04-30-Doug-Kwan-dougkwan-google.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0207-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0209-PR-target-48723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0210-2011-05-03-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0211-PR-target-48774.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0212-2011-05-03-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0214-include-ext-sso_string_base.h-__sso_string_base-_M_c.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0215-config-i386-i386.md-movdi_internal_rex64-TYPE_SSEMOV.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0216-2011-05-04-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0218-PR-c-48749.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0219-Backport-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0220-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0221-PR-ada-48844.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0222-PR-c-40975.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0223-Add-missing-break-for-OPT_mfpu_-case.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0224-2011-05-06-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0226-Fix-PR-c-48838.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0227-PR-fortran-48894.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0228-2011-05-06-Ramana-Radhakrishnan-ramana.radhakrishnan.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0229-2011-05-06-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0230-PR-target-48900.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0231-config-i386-i386.md-movdf_internal_nointeger-Apply.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0232-PR-c-48089.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0233-PR-c-48446.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0234-PR-c-48911.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0235-PR-c-48909.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0239-var-tracking.c-find_mem_expr_in_1pdv-Fix-thinko.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0240-Fix-PR-c-48574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0241-2011-05-09-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0242-2011-05-09-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0244-PR-tree-optimization-48611.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0245-Backported-from-mainline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0246-config-rx-rx.h-JUMP_ALIGN-LABEL_ALIGN-LOOP_ALIGN-Def.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0248-config-rx-rx.c-rx_memory_move_cost-Reduce-the-cost-f.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0249-Fix-PRs-48857-48495.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0251-gcc-cp-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0252-PR-debug-48159.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0253-2011-05-11-Tobias-Burnus-burnus-net-b.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0255-pt.c-build_non_dependent_expr-Don-t-check-null_ptr_c.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0256-config-rx-rx.h-HAVE_PRE_DECREMENT-Fix-typo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0257-zh_CN.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0258-PR-debug-48967.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0259-2011-05-12-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0260-PR-tree-optimization-48975.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0263-zh_CN.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0266-config-i386-i386.md-movxf_internal-Disable-CONST_DOU.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0267-PR-preprocessor-48677.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0269-PR-target-48986.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0270-config-rx-rx.md-Add-peephole-to-remove-redundant-ext.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0271-config-rx-rx.c-rx_memory_move_cost-Include-cost-of-r.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0273-PR-tree-optimization-49000.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0274-PR-tree-optimization-49000.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0275-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0276-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0277-2011-05-18-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0278-PR-tree-optimization-49039.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0279-Properly-handle-256bit-load-cast.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0281-PR-c-48869.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0282-gcc.c-torture-execute-960321-1.x-Remove.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0283-zh_CN.po-Update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0284-PR-c-49043.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0285-2011-05-19-Uros-Bizjak-ubizjak-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0287-PR-tree-optimization-49073.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0288-2011-05-20-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0289-PR-bootstrap-49086.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0290-PR-c-48873.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0291-PR-c-48736.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0292-PR-c-48745.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0293-semantics.c-register_constexpr_fundef-Add-to-hash-ta.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0294-semantics.c-validate_constexpr_fundecl-Check-DECL_TE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0295-PR-c-48948.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0296-DR-1073.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0298-In-gcc-objc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0299-PR-c-49066.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0300-config-sparc-sparc.c-eligible_for_return_delay-Do-no.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0301-config-sparc-sparc.md-setjmp-Handle-PIC-mode-and-use.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0303-PR-c-48780.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0304-PR-c-48945.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0305-PR-middle-end-49029.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0306-PR-target-49104.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0307-config.gcc-sparc-elf-Add-sparc-t-crtin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0308-PR-c-48647.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0309-2011-05-22-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0311-PR-middle-end-48973.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0312-PR-c-49120.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0313-PR-debug-49032.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0314-PR-lto-49123.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0316-Always-add-mno-XXX-for-march-native.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0317-PR-target-49133.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0318-config-sparc-sparc.c-sparc_option_override-If-not-se.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0320-PR-c-48617.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0321-PR-c-47544.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0322-PR-c-47336.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0323-PR-c-47263.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0324-PR-c-49105.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0325-PR-c-48884.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0326-PR-c-49042.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0327-PR-c-49136.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0328-In-libobjc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0329-2011-05-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0330-PR-tree-optimization-44897.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0331-PR-target-49128.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0332-PR-c-48292.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0333-PR-c-45080.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0334-PR-c-45418.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0335-PR-c-48935.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0336-gcc.target-arm-fp16-compile-none-1.c-Update-expected.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0337-PR-c-47184.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0338-PR-c-46696.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0339-PR-c-46245.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0340-PR-c-46145.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0341-PR-c-45698.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0342-PR-c-44311.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0343-gcc-cp-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0344-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0345-2011-05-25-Paolo-Carlini-paolo.carlini-oracle.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0347-PR-c-45401.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0348-PR-c-49156.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0349-PR-tree-optimization-49161.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0350-PR-c-49165.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0351-PR-target-44643.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0352-PR-c-48424.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0354-config-rs6000-rs6000.c-rs6000_register_move_cost-Mak.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0355-2011-05-26-Paul-Thomas-pault-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0357-PR-c-48657.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0358-PR-c-49165.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0359-PR-c-48284.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0360-PR-c-47277.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0362-PR-c-47049.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0364-2011-05-29-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0365-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0366-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0367-Add-PR-target-43700-to-last-changelog-entry.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0369-PR-target-45263.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0370-2011-05-30-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0371-PR-c-49223.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0373-2011-05-31-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0374-2011-05-31-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0375-Fix-fma4_fmsubadd-and-fma4_fmaddsub-mode-suffixes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0376-2011-05-31-Thomas-Koenig-tkoenig-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0379-PR-tree-optimization-49093.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0380-2011-06-02-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0382-PR-c-49276.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0384-PR-tree-optimization-49038.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0385-PR-debug-47590.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0386-2011-06-04-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0388-PR-target-49186.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0389-config-sparc-sparc.c-output_return-Fix-thinko-in-the.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0391-PR-c-49134.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0392-2011-06-06-Richard-Guenther-rguenther-suse.de.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0393-2011-06-06-Mikael-Pettersson-mikpe-it.uu.se.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0394-2011-06-06-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0395-PR-c-49264.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0396-PR-fortran-49268.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0397-config-rs6000-rs6000.h-REG_CLASS_CONTENTS-Remove-vr0.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0398-PR-c-49298.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0400-PR-gcov-profile-49299.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0401-PR-c-48780.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0403-PR-target-49238.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0404-Support-unknown-Intel-family-0x6-CPUs.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0406-config-sparc-sparc.md-return_internal-Adjust-length-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0408-semantics.c-potential_constant_expression_1-Handle-d.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0409-semantics.c-finish_compound_literal-Set-TREE_HAS_CON.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0410-lib-target-supports.exp.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0411-gcc-testsuite-gcc.target-arm-20090811-1.c-Skip-for-i.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0413-config-i386-sse.md-vec_dupv4sf-Correct-mode-of-force.patch
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} (56%)
 rename meta/recipes-graphics/startup-notification/{startup-notification_0.10.bb => startup-notification_0.12.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.2.0.bb => libxext_1.3.0.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.20.2.bb => pixman_0.22.0.bb} (66%)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.3.bb => dri2proto_2.4.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.12.bb => glproto_1.4.13.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.1.bb => inputproto_2.0.2.bb} (78%)
 rename meta/recipes-graphics/xorg-proto/{resourceproto_1.1.1.bb => resourceproto_1.2.0.bb} (61%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.13.0.bb => util-macros_1.14.0.bb} (66%)
 rename meta/recipes-kernel/linux/{linux-yocto-stable_git.bb => linux-yocto_2.6.34.bb} (100%)
 rename meta/recipes-kernel/linux/{linux-yocto_git.bb => linux-yocto_2.6.37.bb} (100%)
 rename meta/recipes-qt/tasks/{task-qte-toolchain-host.bb => task-qte-toolchain-host-nativesdk.bb} (70%)

-- 
1.7.3.4




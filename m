Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCh05-0008QQ-R3 for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 01:40:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3KNbcT3027511;
	Thu, 21 Apr 2011 00:37:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26901-09; Thu, 21 Apr 2011 00:37:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3KNbWUJ027505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 21 Apr 2011 00:37:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 00:37:18 +0100
Message-ID: <1303342638.5518.325.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@lists.yoctoproject.org>
Subject: OE-Core Rebranding Phase 1
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
X-List-Received-Date: Wed, 20 Apr 2011 23:40:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

At the face to face OE TSC meeting we talked over the "branding" issues
on OE-Core and what we were going to do about removing many of the poky
references.

This email represents a turning point for OE-Core as it marks the first
pass of rebranding and is based on decisions the TSC made at that
meeting. I'm not going to claim its 100% complete yet but it does give
us a good start at it. From this point on, I'll be taking patches from
people to assist with this. The key changes I've made so far are:

* poky-init-build-env -> oe-init-build-env
* poky-image-* -> core-image-*
* task-poky-* -> task-core-*
* git.pokylinux.org -> git.yoctoproject.org
* POKYBASE -> COREBASE
* poky-qemu -> runqemu
* Sanitised local.conf.sample from Poky references
* POKY_NATIVE_SYSROOT -> OECORE_NATIVE_SYSROOT
* Renamed scrips/poky-* to scripts/oe-*
* Renamed the poky-sb override to linuxstdbase
* POKY_CONF_VERSION -> LOCALCONF_VERSION
* Made sanity versions weak assignment

The intention is to make OECore distro-less, i.e. the defaults should
produce a working configuration without setting a DISTRO. This isn't
possible yet and work remains to be done on this. As such I've not
focused on the distro configuration files for this round of the cleanup
and many of those remain.

I have intentionally ignored "poky" references in patches (such as in
the comments). These will filter out in time and are harmless, patches
changing this just constitute noise and I'm going to ignore them. I have
also ignored the POKY override used in the rpm tools. This will change
over time but I'd like the rpm backend developers + maintainer to handle
that transition separately.

Documentation is now in the yocto-docs repository.

I've included the list of remaining references I'm still working through
at the end of this email (there are about 275 of them left).

Let me know if there are any problems and patches further working on
this are welcome but I am going to spend further time on it tomorrow. I
thought this point was complete enough to get some feedback on though.

Cheers,

Richard


Remaining "poky" file names:

./meta/recipes-core/meta/external-poky-toolchain.bb
./meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
./meta/conf/distro/poky-lsb.conf
./meta/conf/distro/poky-bleeding.conf
./meta/conf/distro/include/poky-external-default.inc
./meta/conf/distro/include/poky-external-oabi.inc
./meta/conf/distro/include/poky-glibc.inc
./meta/conf/distro/include/poky-external.inc
./meta/conf/distro/include/poky-fixed-revisions.inc
./meta/conf/distro/include/poky-eglibc.inc
./meta/conf/distro/include/poky-floating-revisions.inc
./meta/conf/distro/include/poky-uclibc.inc
./meta/conf/distro/include/poky-external-csl2006q3.inc
./meta/conf/distro/include/poky-external-csl2007q3.inc
./meta/conf/distro/include/poky-oabi.inc
./meta/conf/distro/include/poky-default.inc
./meta/conf/distro/include/poky-external-csl2008q3.inc
./meta/conf/distro/include/poky-default-revisions.inc
./meta/conf/distro/include/poky-eabi-csl2005q3-2.inc
./meta/conf/distro/poky.conf

Remaining "Poky" references:

./README.hardware:or over the network. Writing poky generated images to physical media is
./README.hardware:     b. Copy the contents of the poky image to the USB-ZIP mode device:
./meta/classes/insane.bbclass:            fo = tempfile.NamedTemporaryFile(mode='wb', prefix='poky.', suffix='.tmp', delete=False)
./meta/classes/license.bbclass:# Populates LICENSE_DIRECTORY as set in poky.conf with the license files as set by
./meta/classes/license.bbclass:    # Directory we store the generic licenses as set in poky.conf
./meta/classes/cmake.bbclass:set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "poky CFLAGS" )
./meta/classes/cmake.bbclass:set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "poky CXXFLAGS" )
./meta/classes/package_rpm.bbclass:	echo "${platform}-poky-linux-gnu" > ${target_rootfs}/etc/rpm/platform
./meta/classes/package_rpm.bbclass:	cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + "-poky-linux-gnu --buildroot " + pkgd
./meta/recipes-devtools/rpm/rpm_5.4.0.bb:rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
./meta/recipes-devtools/rpm/rpm_5.4.0.bb:rpm_macros_virtclass-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
./meta/recipes-devtools/rpm/rpm_5.4.0.bb:		--with-bugreport=http://bugzilla.pokylinux.org"
./meta/recipes-devtools/mtools/mtools_3.9.9.bb:SRC_URI="http://folks.o-hand.com/richard/poky/sources/mtools-${PV}.tar.gz \
./meta/recipes-devtools/prelink/prelink_git.bb:	--with-bugurl=http://bugzilla.pokylinux.org/"
./meta/recipes-devtools/installer/adt-installer/adt_installer:  #echo_info "# Install poky metadata:\t$YOCTOADT_METADATA"
./meta/recipes-devtools/installer/adt-installer/scripts/data_define:INSTALL_FOLDER=/opt/poky/$YOCTOADT_VERSION
./meta/recipes-core/tasks/task-core-tools.bb:# MIPS and qemu ARMv5te that poky uses now.
./meta/recipes-core/initrdscripts/files/init-install.sh:	      echo "Found drive at /dev/${device}. Do you want to install poky there ? [y/n]"
./meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb:	#        echo "src/gz ${FEEDNAMEPREFIX}-$arch http://pokylinux.org/${FEEDURIPREFIX}$arch" >> $basefeedconf
./meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb:DESCRIPTION = "Custom MB session files for poky"
./meta/recipes-graphics/matchbox-wm/matchbox-wm/kbdconfig:### poky additions
./meta/recipes-gnome/gtk+/gtk+.inc:BASE_RRECOMMENDS_poky = "gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-gif gdk-pixbuf-loader-xpm shared-mime-info"
./meta/recipes-sato/pimlico/contacts.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/contacts.inc:OWL_poky = "--enable-owl"
./meta/recipes-sato/pimlico/contacts.inc:SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
./meta/recipes-sato/pimlico/tasks.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/tasks.inc:OWL_poky ?= "--enable-owl"
./meta/recipes-sato/pimlico/dates.inc:OWL_poky = "--enable-owl --disable-dnd"
./meta/recipes-sato/pimlico/dates.inc:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pimlico/dates.inc:SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
./meta/recipes-sato/pimlico/tasks_0.18.bb:OWL_poky = "--with-owl"
./meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb:SRC_URI = "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:DESCRIPTION = "Custom MB session files for poky"
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/theme Sato
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/icon_theme Sato
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /desktop/poky/interface/touchscreen true
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:    gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 6"
./meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb:    gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type string --set /desktop/poky/interface/font_name "Sans 9"
./meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb:SRC_URI = "http://pokylinux.org/releases/sato/matchbox-theme-sato-0.1.tar.gz"
./meta/recipes-sato/puzzles/oh-puzzles_svn.bb:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/puzzles/oh-puzzles_svn.bb:SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;patch=1;pnum=0 "
./meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb:DEPENDS_append_poky = " libowl"
./meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb:SRC_URI_append_poky = " file://owl-window-menu.patch;patch=1"
./meta/conf/bitbake.conf:SDK_VENDOR = "-pokysdk"
./meta/conf/bitbake.conf:MAINTAINER = "Yocto Project Team <poky@yoctoproject.org>"
./meta/conf/distro/poky-bleeding.conf:require conf/distro/include/poky-floating-revisions.inc
./meta/conf/distro/poky-bleeding.conf:require conf/distro/poky.conf
./meta/conf/distro/include/poky-external-default.inc:require conf/distro/include/poky-external.inc
./meta/conf/distro/include/poky-external-oabi.inc:require conf/distro/include/poky-external.inc
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-libxml2+install = "use poky environment variables"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_STATUS_pn-poky-feed-config-opkg = "green"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_DEPENDENCY_CHECK_pn-poky-feed-config-opkg = "not done"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LATEST_VERSION_pn-poky-feed-config-opkg = "1.0"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_INTEL_SECTION_pn-poky-feed-config-opkg = "base utils"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-poky-feed-config-opkg = "n/a"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LATEST_RELEASE_DATE_pn-poky-feed-config-opkg = "n/a"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_COMMENTS_pn-poky-feed-config-opkg = "local scripts follow Poky's MIT license"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LAST_UPDATE_pn-poky-feed-config-opkg = "Sep 20, 2010"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_MAINTAINER_pn-poky-feed-config-opkg = "Qing He <qing.he@intel.com>"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-base-passwd+nobash = "change /bin/bash to /bin/sh in passwd.master; another specific poky tweak"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-base-passwd+root-home = "change home for root user in passwd.master; perhaps a poky specific tweak; oe even has other root-home patch for different configurations"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-syslinux+cross-build = "use poky toolchain instead of host"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_PATCH_pn-sysvinit+install = "use poky environment variables"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_STATUS_pn-poky-sato-image-sdk = "green"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_STATUS_pn-task-poky = "green"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LATEST_VERSION_pn-task-poky = "1.0"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_MAINTAINER_pn-task-poky = "Dongxiao Xu <dongxiao.xu@intel.com>"
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_STATUS_pn-unifdef="green" # poky local source files
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LATEST_RELEASE_DATE_pn-x11-common="2008/09/22" # per poky git log
./meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_NO_UPDATE_REASON_pn-libunique = "Do not upgrade to version: 2.91.4 because it requires gtk+ >= 2.90.0 and the stable version of gtk+ used by poky is 2.20.1"
./meta/conf/distro/include/poky-external.inc:TARGET_VENDOR = "-poky"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_linux-libc-headers = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/arm-poky-linux-gnueabi-gcc = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/arm-poky-linux-gnueabi-gcc-initial = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/arm-poky-linux-binutils = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/arm-poky-linux-libc-for-gcc = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/i586-poky-linux-gcc = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/i586-poky-linux-gcc-initial = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/i586-poky-linux-binutils = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/i586-poky-linux-libc-for-gcc = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/libc = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/libintl = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/libiconv = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_glibc-thread-db = "external-poky-toolchain"
./meta/conf/distro/include/poky-external.inc:PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-poky-toolchain"
./meta/conf/distro/include/poky-oabi.inc:TARGET_VENDOR = "-poky"
./meta/conf/distro/include/poky-default.inc:TARGET_VENDOR = "-poky"
./meta/conf/distro/poky.conf:DISTRO = "poky"
./meta/conf/distro/poky.conf:MAINTAINER = "Poky <poky@yoctoproject.org>"
./meta/conf/distro/poky.conf:# TARGET_VENDOR ?= "-poky"
./meta/conf/distro/poky.conf:require conf/distro/include/poky-${POKYMODE}.inc
./meta/conf/distro/poky.conf:require conf/distro/include/poky-${POKYLIBC}.inc
./meta/conf/distro/poky.conf:require conf/distro/include/poky-fixed-revisions.inc
./meta/conf/distro/poky.conf:EXTRAOPKGCONFIG = "poky-feed-config-opkg"
./meta/conf/distro/poky.conf:# This is a list of packages that are used by poky to build the distribution, they are not
./meta/conf/layer.conf:require conf/distro/include/poky-default-revisions.inc
./meta/lib/oe/distro_check.py:    tmpfile = tempfile.NamedTemporaryFile(mode='wb', prefix='poky.', suffix='.tmp', delete=False)
./README:see the Poky website http://pokylinux.org.
./scripts/poky-setup-rpmrepo:	# either in an in-tree poky scenario or the environment
./scripts/runqemu:	# either in an in-tree poky scenario or the environment
./scripts/runqemu.README:There are two scripts, runqemu and runqemu, one for use within poky, 
./scripts/runqemu.README:image built by poky.
./scripts/runqemu-internal:NOSUDO_FLAG="/etc/poky-nosudo"
./scripts/runqemu-internal:    PSEUDO_LOCALSTATEDIR=~/.poky-sdk/pseudo
./scripts/poky-gen-tapdevs:touch /etc/poky-nosudo
./scripts/README:This directory contains Various useful scripts for working with poky
./scripts/oe-buildenv-internal:    echo >&2 "Error: The bitbake directory ($BITBAKEDIR) does not exist!  Did you source the script in the poky directory?"
./scripts/poky-export-rootfs:if [ ! -d ~/.poky-sdk ]; then
./scripts/poky-export-rootfs:	mkdir -p ~/.poky-sdk
./scripts/poky-export-rootfs:EXPORTS=~/.poky-sdk/exports$NFS_INSTANCE
./scripts/poky-export-rootfs:RMTAB=~/.poky-sdk/rmtab$NFS_INSTANCE
./scripts/poky-export-rootfs:NFSPID=~/.poky-sdk/nfs$NFS_INSTANCE.pid
./scripts/poky-export-rootfs:MOUNTPID=~/.poky-sdk/mount$NFS_INSTANCE.pid
./scripts/poky-extract-sdk:	echo "Usage: $0 <poky-sdk-tarball> <extract-dir>"
./meta-demoapps/recipes-gnome/abiword/abiword.inc:EXTRA_OECONF = " --enable-embedded=poky    \
./README.hardware:                          Poky Hardware README
./README.hardware:This file gives details about using Poky with different hardware reference
./README.hardware:looking in the meta/conf/machine/ directory. If in doubt about using Poky with
./README.hardware:To simplify development Poky supports building images to work with the QEMU
./README.hardware:Use of the QEMU images is covered in the Poky Reference Manual. The Poky
./README.hardware:The following boards are supported by Poky's core layer:
./README.hardware:For more information see the board's section below. The Poky MACHINE setting
./README.hardware:The following consumer devices are supported by Poky's core layer:
./README.hardware:For more information see the device's section below. The Poky MACHINE setting
./README.hardware:     # mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "Poky Minimal" -d ./serial-boot.cmd ./boot.scr
./README.hardware:    the Poky build tmp/deploy directory, and make them available on your tftp
./meta/classes/toolchain-scripts.bbclass:# a Poky IDE to integrate with the build tree
./meta/classes/imagetest-qemu.bbclass:    Test Controller for Poky Testing.
./meta/classes/sanity.bbclass:    bb.fatal(""" Poky's config sanity checker detected a potential misconfiguration.
./meta/classes/sanity.bbclass:        messages = messages + 'Poky requires at least Python 2.6 to run. Please update your Python interpreter.\n'
./meta/classes/sanity.bbclass:            messages = messages + "Poky has noticed your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
./meta/classes/sanity.bbclass:            messages = messages + "Poky has noticed your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
./meta/classes/sanity.bbclass:                messages = messages + "Poky has noticed your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
./meta/classes/sanity.bbclass:        messages = messages + "Error, you have an invalid character (+) in your COREBASE directory path. Please move Poky to a directory which doesn't include a +."
./meta/classes/sanity.bbclass:        messages = messages + "Error, you have a space in your COREBASE directory path. Please move Poky to a directory which doesn't include a space."
./meta/classes/staging.bbclass:        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with Poky" % bb.data.getVar("FILE", d, True))
./meta/classes/poky-image.bbclass:# Common for Poky images
./meta/classes/poky-image.bbclass:# IMAGE_FEATURES control content of images built with Poky.
./meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch:Due to Poky packages owning all of the directories they use, a large
./meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch:number of self-referencing dependencies within Poky.  100 seem reasonable.
./meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb:DESCRIPTION = "Qemu helper utilities from Poky"
./meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb:DESCRIPTION = "Qemu helper scripts from Poky"
./meta/recipes-devtools/autoconf/autoconf-2.65/config_site.patch:Poky provides a list of site files in CONFIG_SITE whereas autoconf 
./meta/recipes-core/busybox/busybox-1.17.3/run-parts.in.usr-bin.patch:# Poky doesn't have debianutils, but let's keep it for safety
./meta/recipes-core/meta/external-poky-toolchain.bb:		echo "The Poky toolchain could not be found in ${prefix}!"
./meta/recipes-core/tasks/task-core-sdk.bb:DESCRIPTION = "Software Development Tasks for OpenedHand Poky"
./meta/recipes-core/tasks/task-core-nfs.bb:DESCRIPTION = "NFS tasks for Poky"
./meta/recipes-core/tasks/task-core-tools.bb:DESCRIPTION = "Tools tasks for Poky"
./meta/recipes-core/tasks/task-core-ssh-dropbear.bb:DESCRIPTION = "Dropbear SSH task for Poky"
./meta/recipes-core/tasks/task-core-ssh-openssh.bb:DESCRIPTION = "OpenSSH SSH task for Poky"
./meta/recipes-core/tasks/task-core-boot.bb:DESCRIPTION = "Task for OpenedHand Poky - minimal bootable image"
./meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig.patch:+  fprintf (stream, "ldconfig (Hacked Poky Version)\n");
./meta/recipes-core/initrdscripts/files/init-install.sh:echo "title Poky-Netbook" >> /ssd/boot/grub/menu.lst
./meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch:# Poky renames libtool to $host_alias-libtool.
./meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb:DESCRIPTION = "Poky example feed configuration"
./meta/recipes-graphics/mesa/qemugl/remove-x11r6-lib-dir.patch:"-L/usr/X11R6/lib" is obsolate in poky. Poky currently use Xserver from X.org (X11R7.x), which puts lib in standard /usr/lib, so no need to specify the extra -L/usr/X11R6/lib. Meanwhile, the -L/usr/X11R6/lib will cause warning: library search path "/usr/X11R6/lib" is unsafe for cross-compilation. so better to remove it.
./meta/recipes-graphics/tasks/task-core-clutter.bb:DESCRIPTION = "Clutter Tasks for OpenedHand Poky"
./meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb:DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand Poky"
./meta/recipes-gnome/tasks/task-core-sdk-gmae.bb:DESCRIPTION = "Gnome Mobile And Embedded Software Development Kit for OpenedHand Poky"
./meta/recipes-qt/tasks/task-core-qt.bb:DESCRIPTION = "Qt Tasks for Poky"
./meta/recipes-sato/pimlico/dates.inc:# Poky/Sato specific enhancements
./meta/recipes-sato/tasks/task-core-x11-sato.bb:DESCRIPTION = "Sato Tasks for Poky"
./meta/recipes-sato/tasks/task-core.bb:DESCRIPTION = "Tasks for OpenedHand Poky"
./meta/conf/bitbake.conf:# default is fakeroot but in Poky we use pseudo
./meta/conf/local.conf.sample:# Uncomment and change to cache the files Poky downloads in an alternative
./meta/conf/local.conf.sample:# Uncomment and change to cache Poky's built staging output in an alternative
./meta/conf/distro/include/poky-external-csl2006q3.inc:# Poky configuration to use external CSL 2006q3-27 toolchain (ARM EABI)
./meta/conf/distro/include/poky-external-csl2007q3.inc:# Poky configuration to use external CSL 2007q3-51 toolchain (ARM EABI)
./meta/conf/distro/include/poky-oabi.inc:# Poky configuration to use its Original (Old) Softfloat ABI
./meta/conf/distro/include/poky-default.inc:# Poky's default configuration
./meta/conf/distro/include/poky-external-csl2008q3.inc:# Poky configuration to use external CSL 2008q3-72 toolchain (ARM EABI)
./meta/conf/distro/include/poky-eabi-csl2005q3-2.inc:# Poky configuration to use CSL 2005q3-2 derived toolchain (ARM EABI)
./meta/conf/distro/poky.conf:#@TYPE: Distribution#@NAME: Poky
./meta/conf/distro/poky.conf:#@DESCRIPTION: Distribution configuration for the Yocto Project build by Poky
./meta/conf/distro/poky.conf:DISTRO_NAME = "Yocto (Built by Poky 4.0)"
./meta/conf/distro/poky.conf:MAINTAINER = "Poky <poky@yoctoproject.org>"
./meta/recipes-kernel/powertop/powertop-1.13/stub_out_the_ncurses_calls_in_dump_mode.patch:Running PowerTop in Poky in dump mode (with --dump) always ends with a
./meta/lib/oe/distro_check.py:    distro_exceptions = dict({"Poky":'Poky', "OpenedHand":'OpenedHand', "Intel":'Intel', "Upstream":'Upstream', "WindRiver":'Windriver', "OSPDT":'OSPDT Approved'})
./meta/recipes-support/apr/apr/buildconf_fix.patch:Remove the new libtool detection method to avoid config failure. Poky's libtool
./meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch:Fix "arch" integration with Poky.
./meta/recipes-extended/sat-solver/sat-solver/db5.patch:version.  The system version in Poky is available at /usr/include/db51
./meta/recipes-extended/lsb/lsb_1.4.bb:DESCRIPTION = "LSB support for Poky Linux"
./README:Poky
./README:Poky platform builder is a combined cross build system and development 
./README:Poky has an extensive handbook, the source of which is contained in
./README:see the Poky website http://pokylinux.org.
./README:Additional information on the specifics of hardware that Poky supports
./oe-init-build-env:# Poky Build Enviroment Setup Script
./scripts/runqemu:# Handle running Poky images standalone with QEMU
./scripts/runqemu.README:Poky images with QEMU
./scripts/runqemu.README:Poky can generate qemu bootable kernels and images with can be used 
./scripts/runqemu.README:QEMU outside Poky (runqemu)
./scripts/runqemu.README:QEMU within Poky (runqemu)
./scripts/runqemu-internal:# Handle running Poky images under qemu
./scripts/runqemu-ifup:# be run as root, and will use the tunctl binary from a Poky sysroot.
./scripts/runqemu-ifup:# the need to use Poky's version.
./scripts/poky-gen-tapdevs:# use the tunctl binary from a Poky sysroot. Note: many Linux distros
./scripts/poky-gen-tapdevs:# support the group permissions option, hence the need to use Poky's
./scripts/poky-gen-tapdevs:	echo "<native-sysroot-basedir> is the path to Poky's native sysroot"
./scripts/oe-buildenv-internal:# Poky Build Enviroment Setup Script
./scripts/poky-setup-builddir:# Poky Build Enviroment Setup Script
./scripts/poky-setup-builddir:You had no conf/local.conf file. Poky has created this configuration file for
./scripts/poky-setup-builddir:Also, for more information see the Poky Reference Manual:
./scripts/poky-setup-builddir:You had no conf/bblayers.conf file. Poky has created this configuration file for
./scripts/poky-setup-builddir:For more information see the Poky Reference Manual:
./scripts/poky-setup-builddir:### Shell environment set up for Poky builds. ###
./scripts/runqemu-ifdown:# from a Poky sysroot. 
./scripts/poky-export-rootfs:    echo "Did you forget to source your Poky environment script?"
./scripts/poky-extract-sdk:    echo "Did you forget to source your Poky environment script?"
./scripts/poky-find-native-sysroot:# Find a native sysroot to use - either from an in-tree Poky build or
./scripts/poky-find-native-sysroot:	echo "Did you forget to source the Poky environment script?"
./LICENSE:Different components of Poky are under different licenses (a mix of 
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
./meta/classes/toolchain-scripts.bbclass:	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
./meta/classes/poky-image.bbclass:POKY_BASE_INSTALL = '\
./meta/classes/poky-image.bbclass:    ${POKY_EXTRA_INSTALL} \
./meta/classes/poky-image.bbclass:POKY_EXTRA_INSTALL ?= ""
./meta/classes/poky-image.bbclass:IMAGE_INSTALL ?= "${POKY_BASE_INSTALL}"
./meta/recipes-graphics/images/core-image-clutter.bb:    ${POKY_BASE_INSTALL} \
./meta/conf/distro/include/poky-external-default.inc:POKYMODE="default"
./meta/conf/distro/include/poky-external-oabi.inc:POKYMODE="oabi"
./meta/conf/distro/include/poky-default.inc:PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${POKYLIBC}"
./meta/conf/distro/include/poky-default.inc:PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${POKYLIBC}-initial"
./meta/conf/distro/include/poky-default.inc:PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?= "${POKYLIBC}-nativesdk"
./meta/conf/distro/include/poky-eabi-csl2005q3-2.inc:PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${POKYLIBC}-intermediate"
./meta/conf/distro/poky.conf:# Set by POKYMODE instead
./meta/conf/distro/poky.conf:POKYMODE ?= "default"
./meta/conf/distro/poky.conf:require conf/distro/include/poky-${POKYMODE}.inc
./meta/conf/distro/poky.conf:POKYLIBC ?= "eglibc"
./meta/conf/distro/poky.conf:require conf/distro/include/poky-${POKYLIBC}.inc
./meta/conf/distro/poky.conf:SDK_NAME = "${DISTRO}-${POKYLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
./meta/conf/distro/poky.conf:CACHE = "${TMPDIR}/cache/${POKYMODE}-${POKYLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS = "task-core-boot"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS_qemuarm = "qemu-config"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS_qemuarmv6 = "qemu-config"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS_qemuarmv7 = "qemu-config"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS_qemux86 = "qemu-config"
./meta/conf/distro/poky.conf:POKY_EXTRA_RDEPENDS_qemux86-64 = "qemu-config"
./meta/conf/distro/poky.conf:DISTRO_EXTRA_RDEPENDS += "${POKY_EXTRA_RDEPENDS}"
./meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch:+#ifdef POKY_SEMANTICS
./meta/recipes-extended/sat-solver/sat-solver/sat-solver_poky.patch:+#if defined(DEBIAN_SEMANTICS) || defined(POKY_SEMANTICS)
./meta/recipes-extended/images/core-image-basic.bb:#    ${POKY_BASE_INSTALL} 
./meta/recipes-extended/images/core-image-lsb-sdk.bb:    ${POKY_BASE_INSTALL} \
./meta/recipes-extended/images/core-image-lsb-dev.bb:    ${POKY_BASE_INSTALL} \
./meta/recipes-extended/images/core-image-lsb.bb:    ${POKY_BASE_INSTALL} \
./scripts/oe-buildenv-internal:export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND"
./scripts/poky-export-rootfs:	if [ "x$POKY_DISTRO_VERSION" = "x" ]; then
./scripts/poky-find-native-sysroot:    if [ "x$POKY_DISTRO_VERSION" = "x" ]; then







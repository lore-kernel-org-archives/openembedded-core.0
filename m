Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8418E60F50
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 19:02:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v25so2075633qto.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 11:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PQ5v74XU720970td42pRvXx3gLJcxdmKQ1AfDjETCHs=;
	b=DIg5IuIO7ckL6VjR5QL903SJsb+z5GuX00RjgTIpktZaWWUSFy2eezgzMWqucGWwTw
	fv4S8UZLzacvsMfweUHsSynDdFHxkO5v6g6ryql8D9JkN9oXg2dkZRA8yX8JO99o4F7S
	RUK1LWrHGpyMvJozpcI2wUS4HDNCpKlXMyAP5Y7UJ7+DKIqYDwiHV9UVB4d4T06ft0Qz
	63bjAm4l9T2rNmVvdJrWo4QphTByzalskqdYUBn4uOgorw+pqzaP1IiskRaNZWSh4h+9
	teHSa1GbCWsxBWp+rspAvja1eSYglY75VAanuLt6p5cNmMP+t/iSUlgDJPw4sJoHzesg
	kXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PQ5v74XU720970td42pRvXx3gLJcxdmKQ1AfDjETCHs=;
	b=ZNLiHS364Z9i2W3wrvzaqG0uIogMp2WZflL8L7POiRZKa8FVpWsiYVXfKoUxkf1nT2
	7xhqW5sf9wXlg2jrCbpzfycabHeH8s9PDV20qdabYm2FedPKGbsQZjxAmCDSDRNzVi2M
	q1xKY0BrktPtLaU9fNtkgL7c1/07z6tYmLFORsMx8/4XnlRLrY48mfy4tIn5Q24GEXLa
	7hi/NtMZH/8FAU+LtfnW7EXO3UHCPzVBt7nwAcZV0SpeWnMKrGV/2Ai5vgGh9uL8vmlU
	79AeHl83M2Ni7fpa80/N84aVY7MqFzyGGV6NTC0u3IGfuIAulTscaoA8EfVebEYDE6Hx
	AxJA==
X-Gm-Message-State: APjAAAVOc084yF4IDZWRXof0K0QzfJxd3731I8PDseKjyMd0ianvpehE
	1XTQWGN//MITMxscpIcpsPlLJi+deK3cR3fQJU2j8ol0Bvo=
X-Google-Smtp-Source: APXvYqxokbvJFK0wT/VBGi2f+DVkEZTGqczGFMOO8Ke2nZxW//AU7xzPHXD4caAFJviryKrHEBgKMfNiB052upghE9s=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr3871816qtn.378.1581188531832; 
	Sat, 08 Feb 2020 11:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20200207194559.527-1-alex.kanavin@gmail.com>
	<20200207194559.527-3-alex.kanavin@gmail.com>
In-Reply-To: <20200207194559.527-3-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2020 11:01:45 -0800
Message-ID: <CAMKF1srQWT2o-B-Rs3_8KWCDnRCNQXJyaTR7XYm3PLMNU+4VUw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] chkconfig: remove the recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 19:02:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 11:47 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> chkconfig is one of the options for virtual/update-alternatives,
> however opkg-utils have been used as the default for a very long time,
> while chkconfig isn't anymore tested in any way, and is stuck
> at a very old version due to newer versions requiring selinux.
>

there are recipes in other layers depending on it. e.g. see

09:40:46 ERROR: Nothing RPROVIDES 'chkconfig' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
RDEPENDS on or otherwise requires it)
09:40:48 ERROR: Nothing RPROVIDES 'tigervnc-dev' (but
/mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
RDEPENDS on or otherwise requires it)
09:40:48 No eligible RPROVIDERs exist for 'tigervnc-dev'



> [YOCTO #11264]
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 -
>  .../packagegroups/packagegroup-self-hosted.bb |  1 -
>  .../chkconfig-alternatives-native_1.3.59.bb   | 44 ------------
>  .../chkconfig/chkconfig/replace_caddr_t.patch | 33 ---------
>  .../chkconfig/chkconfig_1.3.58.bb             | 71 -------------------
>  5 files changed, 151 deletions(-)
>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index a80e85a2f6..c68e9edf63 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -94,8 +94,6 @@ RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER_pn-chkconfig = "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@intel.com>"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index ea6d567301..9a70b189a4 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -108,7 +108,6 @@ RDEPENDS_packagegroup-self-hosted-debug = " \
>
>  RDEPENDS_packagegroup-self-hosted-extended = "\
>      bzip2 \
> -    chkconfig \
>      chrpath \
>      cpio \
>      curl \
> diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
> deleted file mode 100644
> index 87fa8eb605..0000000000
> --- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -require recipes-extended/chkconfig/chkconfig_1.3.58.bb
> -
> -SUMMARY = "${SUMMARY_chkconfig-alternatives}"
> -DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
> -DEPENDS = ""
> -PROVIDES += "virtual/update-alternatives-native"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -
> -# The sysroot branch is 1.3.59 + some git commits from master + --sysroot
> -# support for alternatives.
> -SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
> -S = "${WORKDIR}/git"
> -UPSTREAM_CHECK_GITTAGREGEX = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
> -
> -SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
> -PV = "1.3.59+${SRCPV}"
> -
> -inherit native
> -
> -# We want our native recipes to build using the target paths rather than paths
> -# into the sysroot, as we may use them to construct the rootfs. As such, we
> -# only adjust the paths to match the metadata for the target, not native.
> -obey_variables () {
> -       sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,' ${S}/alternatives.c
> -}
> -
> -do_compile () {
> -       oe_runmake alternatives
> -}
> -
> -do_install () {
> -       install -d ${D}${sysconfdir}/alternatives \
> -                  ${D}${localstatedir}/lib/alternatives
> -
> -       install -D -m 0755 alternatives ${D}${bindir}/alternatives
> -       install -D -m 0644 alternatives.8 ${D}${mandir}/man8/alternatives.8
> -
> -       ln -s alternatives ${D}${bindir}/update-alternatives
> -       ln -s alternatives.8 ${D}${mandir}/man8/update-alternatives.8
> -}
> -
> -do_install_append_linuxstdbase() {
> -       rm -rf ${D}${libdir}/lsb
> -}
> diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> deleted file mode 100644
> index 96d1938791..0000000000
> --- a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -caddr_t is a legacy BSD type which was rejected by the POSIX standard.
> -Use void * instead.
> -
> -sys/unitstd.h is not needed and moreover its not available on all C library
> -implementations e.g. musl
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: chkconfig-1.3.58/alternatives.c
> -===================================================================
> ---- chkconfig-1.3.58.orig/alternatives.c
> -+++ chkconfig-1.3.58/alternatives.c
> -@@ -22,7 +22,6 @@
> - #include <stdio.h>
> - #include <string.h>
> - #include <sys/stat.h>
> --#include <sys/unistd.h>
> - #include <unistd.h>
> -
> - #define       FLAGS_TEST      (1 << 0)
> -Index: chkconfig-1.3.58/leveldb.c
> -===================================================================
> ---- chkconfig-1.3.58.orig/leveldb.c
> -+++ chkconfig-1.3.58/leveldb.c
> -@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
> -     fstat(fd, &sb);
> -
> -     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
> --    if (bufstart == ((caddr_t) -1)) {
> -+    if (bufstart == ((void*) -1)) {
> -       close(fd);
> -       return -1;
> -     }
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> deleted file mode 100644
> index d21dd69704..0000000000
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
> -DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
> -information for system services.  Chkconfig manipulates the numerous \
> -symbolic links in /etc/rc.d, to relieve system administrators of some \
> -of the drudgery of manually editing the symbolic links."
> -
> -RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
> -
> -HOMEPAGE = "https://github.com/fedora-sysv"
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> -
> -DEPENDS = "libnewt popt"
> -PROVIDES += "virtual/update-alternatives"
> -
> -PR = "r7"
> -
> -S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
> -
> -SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
> -           file://replace_caddr_t.patch \
> -          "
> -
> -SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit gettext
> -
> -# Makefile uses RPM_OPT_FLAGS to construct CFLAGS
> -#
> -EXTRA_OEMAKE = "\
> -    'RPM_OPT_FLAGS=${CFLAGS}' \
> -    'LDFLAGS=${LDFLAGS}' \
> -    'BINDIR=${base_sbindir}' \
> -    'SBINDIR=${sbindir}' \
> -    'MANDIR=${mandir}' \
> -    'ALTDIR=${localstatedir}/lib/alternatives' \
> -    'ALTDATADIR=${sysconfdir}/alternatives' \
> -"
> -
> -do_unpack[postfuncs] += "obey_variables"
> -do_unpack[vardeps] += "obey_variables"
> -obey_variables () {
> -       sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' ${S}/leveldb.h
> -       sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
> -              -e 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
> -              -e 's,/usr/share/locale,${datadir}/locale,' ${S}/alternatives.c
> -}
> -
> -do_install() {
> -       oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' \
> -               'BINDIR=${sbindir}' install
> -       install -d ${D}${sysconfdir}/chkconfig.d
> -}
> -
> -PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
> -SUMMARY_${PN}-alternatives = "Maintain symbolic links determining default commands"
> -DESCRIPTION_${PN}-alternatives = "alternatives creates, removes, maintains and displays \
> -information about the symbolic links comprising the alternatives system."
> -SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} - Documentation files"
> -DESCRIPTION_${PN}-alternatives-doc = "${DESCRIPTION_${PN}-alternatives}  \
> -This package contains documentation."
> -RPROVIDES_${PN}-alternatives += "update-alternatives"
> -RCONFLICTS_${PN}-alternatives = "update-alternatives-opkg update-alternatives-dpkg"
> -FILES_${PN}-alternatives = "${sbindir}/alternatives ${sbindir}/update-alternatives \
> -                           ${sysconfdir}/alternatives ${localstatedir}/lib/alternatives"
> -FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
> -                                ${mandir}/man8/update-alternatives.8"
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC4536110F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 23:01:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d18so2327717qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 15:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OkgTmRTjvYoGatyINjFebK2SiPyCSxLJUcL1A0Woy6U=;
	b=fm+IjrsKhaEhm3CVeG5n10bNGfHHnwj+c012sRbjeAeqGyPqzMLHJk8WOSBYXFchZL
	OdroFE2+kgDOwBEBecfe5FzPKlP3VJb+opyrYshzzKPLjP3qWjdibHrt8H497fUuHgah
	eGxJbcGJEmbXmKta96TyFaksmfpm+zGYtdK1eoSzgmcVv52I47u15o3+2DxH2z+ca6Mf
	Snk6J0v11vhgjFfkRCdm0jGUrERPcW4hhoTs6Q7lUF/4YV9Y4fy+6BfzROQElCqRjhOw
	IVxSSHw3H6et/I5dD/efaMkmBkQVe6Rx9VGk1hen/PGtqWbCh8vMlpGKLEzU6iZqJUj0
	8vAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OkgTmRTjvYoGatyINjFebK2SiPyCSxLJUcL1A0Woy6U=;
	b=f9wQrXM38HsEDomh76lvwF0vVDWAom0PJwa751ZtpKmQysjSkU6rzaeEp1kypeeTgg
	LbdXO1Bi/Ru8vYqGCPvM3IzJ4xeAReS+msZu5ziD3mP0cOhgQcf//6fEQ/1afpPILCqQ
	n4uQBLcN3mUlntvBIEcyDEzFRACjhTD5ibzeUALv4J8wOR5QD/XGxJ7OUFIoLKnY2xfB
	tEmi3bqpbh9A6HdB+/3ro2CdvZm4yjmD2e5X/IkBHGlfY0vzWFqghoDkkXF85zK1NSvT
	Pn3EFJW1FM0VF/O2xwbkg3KPDbqKADV9s6UP3LzLwb2ve5+9ixsyB8GQD8IV/ET8hi5F
	acHw==
X-Gm-Message-State: APjAAAU1QUVVgVCynwVZ1k3pD1qes4iOgN6OEdHSTziUfezcHvFjqLK6
	tJhiPbgy2c21pKYiBLN3IoqVVDAaWmlEj2MnnUGJ0LWO
X-Google-Smtp-Source: APXvYqxOsZ0EHpfrrQpym3e0f9+bqJfbOgaPCr2l79HAbFmqe6TZ0Vd53EbbuTAMvPFSO9R5kNshyPylPYk/WB3nK+g=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr4418883qtn.378.1581202867149; 
	Sat, 08 Feb 2020 15:01:07 -0800 (PST)
MIME-Version: 1.0
References: <20200207194559.527-1-alex.kanavin@gmail.com>
	<20200207194559.527-3-alex.kanavin@gmail.com>
	<CAMKF1srQWT2o-B-Rs3_8KWCDnRCNQXJyaTR7XYm3PLMNU+4VUw@mail.gmail.com>
	<5a26efc5-f0a7-1d1b-0cff-d1c6d81d7dd5@gmail.com>
In-Reply-To: <5a26efc5-f0a7-1d1b-0cff-d1c6d81d7dd5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2020 15:00:56 -0800
Message-ID: <CAMKF1sqwhhrgTipODiXMtb_-tQD8XuHLijesEXLy=Fuj0=9nSQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Sat, 08 Feb 2020 23:01:07 -0000
Content-Type: multipart/alternative; boundary="00000000000036dede059e187b66"

--00000000000036dede059e187b66
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 8, 2020 at 12:41 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/8/20 11:01 AM, Khem Raj wrote:
> > On Fri, Feb 7, 2020 at 11:47 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >> chkconfig is one of the options for virtual/update-alternatives,
> >> however opkg-utils have been used as the default for a very long time,
> >> while chkconfig isn't anymore tested in any way, and is stuck
> >> at a very old version due to newer versions requiring selinux.
> >>
> > there are recipes in other layers depending on it. e.g. see
> >
> > 09:40:46 ERROR: Nothing RPROVIDES 'chkconfig' (but
> >
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/
> tigervnc_1.10.1.bb
> > RDEPENDS on or otherwise requires it)
> > 09:40:48 ERROR: Nothing RPROVIDES 'tigervnc-dev' (but
> >
> /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/meta-oe/recipes-graphics/tigervnc/
> tigervnc_1.10.1.bb
> > RDEPENDS on or otherwise requires it)
> > 09:40:48 No eligible RPROVIDERs exist for 'tigervnc-dev'
>
> Should it move to meta-oe then?


I would prefer to remove the dep instead

>
> >
> >
> >> [YOCTO #11264]
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ---
> >>  meta/conf/distro/include/maintainers.inc      |  2 -
> >>  .../packagegroups/packagegroup-self-hosted.bb |  1 -
> >>  .../chkconfig-alternatives-native_1.3.59.bb   | 44 ------------
> >>  .../chkconfig/chkconfig/replace_caddr_t.patch | 33 ---------
> >>  .../chkconfig/chkconfig_1.3.58.bb             | 71 -------------------
> >>  5 files changed, 151 deletions(-)
> >>  delete mode 100644 meta/recipes-extended/chkconfig/
> chkconfig-alternatives-native_1.3.59.bb
> >>  delete mode 100644
> meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> >>  delete mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> >>
> >> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> >> index a80e85a2f6..c68e9edf63 100644
> >> --- a/meta/conf/distro/include/maintainers.inc
> >> +++ b/meta/conf/distro/include/maintainers.inc
> >> @@ -94,8 +94,6 @@ RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <
> anuj.mittal@intel.com>"
> >>  RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >>  RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com
> >"
> >>  RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com
> >"
> >> -RECIPE_MAINTAINER_pn-chkconfig = "Yi Zhao <yi.zhao@windriver.com>"
> >> -RECIPE_MAINTAINER_pn-chkconfig-alternatives-native = "Yi Zhao <
> yi.zhao@windriver.com>"
> >>  RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
> >>  RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com
> >"
> >>  RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <
> ross.burton@intel.com>"
> >> diff --git a/meta/recipes-core/packagegroups/
> packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/
> packagegroup-self-hosted.bb
> >> index ea6d567301..9a70b189a4 100644
> >> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> >> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> >> @@ -108,7 +108,6 @@ RDEPENDS_packagegroup-self-hosted-debug = " \
> >>
> >>  RDEPENDS_packagegroup-self-hosted-extended = "\
> >>      bzip2 \
> >> -    chkconfig \
> >>      chrpath \
> >>      cpio \
> >>      curl \
> >> diff --git a/meta/recipes-extended/chkconfig/
> chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/
> chkconfig-alternatives-native_1.3.59.bb
> >> deleted file mode 100644
> >> index 87fa8eb605..0000000000
> >> --- a/meta/recipes-extended/chkconfig/
> chkconfig-alternatives-native_1.3.59.bb
> >> +++ /dev/null
> >> @@ -1,44 +0,0 @@
> >> -require recipes-extended/chkconfig/chkconfig_1.3.58.bb
> >> -
> >> -SUMMARY = "${SUMMARY_chkconfig-alternatives}"
> >> -DESCRIPTION = "${DESCRIPTION_chkconfig-alternatives}"
> >> -DEPENDS = ""
> >> -PROVIDES += "virtual/update-alternatives-native"
> >> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> -
> >> -# The sysroot branch is 1.3.59 + some git commits from master +
> --sysroot
> >> -# support for alternatives.
> >> -SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
> >> -S = "${WORKDIR}/git"
> >> -UPSTREAM_CHECK_GITTAGREGEX = "chkconfig-(?P<pver>(\d+(\.\d+)+))"
> >> -
> >> -SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
> >> -PV = "1.3.59+${SRCPV}"
> >> -
> >> -inherit native
> >> -
> >> -# We want our native recipes to build using the target paths rather
> than paths
> >> -# into the sysroot, as we may use them to construct the rootfs. As
> such, we
> >> -# only adjust the paths to match the metadata for the target, not
> native.
> >> -obey_variables () {
> >> -       sed -i 's,ALTERNATIVES_ROOT,OPKG_OFFLINE_ROOT,'
> ${S}/alternatives.c
> >> -}
> >> -
> >> -do_compile () {
> >> -       oe_runmake alternatives
> >> -}
> >> -
> >> -do_install () {
> >> -       install -d ${D}${sysconfdir}/alternatives \
> >> -                  ${D}${localstatedir}/lib/alternatives
> >> -
> >> -       install -D -m 0755 alternatives ${D}${bindir}/alternatives
> >> -       install -D -m 0644 alternatives.8
> ${D}${mandir}/man8/alternatives.8
> >> -
> >> -       ln -s alternatives ${D}${bindir}/update-alternatives
> >> -       ln -s alternatives.8 ${D}${mandir}/man8/update-alternatives.8
> >> -}
> >> -
> >> -do_install_append_linuxstdbase() {
> >> -       rm -rf ${D}${libdir}/lsb
> >> -}
> >> diff --git
> a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> >> deleted file mode 100644
> >> index 96d1938791..0000000000
> >> --- a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patch
> >> +++ /dev/null
> >> @@ -1,33 +0,0 @@
> >> -caddr_t is a legacy BSD type which was rejected by the POSIX standard.
> >> -Use void * instead.
> >> -
> >> -sys/unitstd.h is not needed and moreover its not available on all C
> library
> >> -implementations e.g. musl
> >> -
> >> -Upstream-Status: Pending
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -Index: chkconfig-1.3.58/alternatives.c
> >> -===================================================================
> >> ---- chkconfig-1.3.58.orig/alternatives.c
> >> -+++ chkconfig-1.3.58/alternatives.c
> >> -@@ -22,7 +22,6 @@
> >> - #include <stdio.h>
> >> - #include <string.h>
> >> - #include <sys/stat.h>
> >> --#include <sys/unistd.h>
> >> - #include <unistd.h>
> >> -
> >> - #define       FLAGS_TEST      (1 << 0)
> >> -Index: chkconfig-1.3.58/leveldb.c
> >> -===================================================================
> >> ---- chkconfig-1.3.58.orig/leveldb.c
> >> -+++ chkconfig-1.3.58/leveldb.c
> >> -@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name
> >> -     fstat(fd, &sb);
> >> -
> >> -     bufstart = mmap(NULL, sb.st_size, PROT_READ, MAP_SHARED, fd, 0);
> >> --    if (bufstart == ((caddr_t) -1)) {
> >> -+    if (bufstart == ((void*) -1)) {
> >> -       close(fd);
> >> -       return -1;
> >> -     }
> >> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> >> deleted file mode 100644
> >> index d21dd69704..0000000000
> >> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> >> +++ /dev/null
> >> @@ -1,71 +0,0 @@
> >> -SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
> >> -DESCRIPTION = "Chkconfig is a basic system utility.  It updates and
> queries runlevel \
> >> -information for system services.  Chkconfig manipulates the numerous \
> >> -symbolic links in /etc/rc.d, to relieve system administrators of some \
> >> -of the drudgery of manually editing the symbolic links."
> >> -
> >> -RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
> >> -
> >> -HOMEPAGE = "https://github.com/fedora-sysv"
> >> -
> >> -LICENSE = "GPLv2"
> >> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> >> -
> >> -DEPENDS = "libnewt popt"
> >> -PROVIDES += "virtual/update-alternatives"
> >> -
> >> -PR = "r7"
> >> -
> >> -S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
> >> -
> >> -SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
> >> -           file://replace_caddr_t.patch \
> >> -          "
> >> -
> >> -SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
> >> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> >> -
> >> -S = "${WORKDIR}/git"
> >> -
> >> -inherit gettext
> >> -
> >> -# Makefile uses RPM_OPT_FLAGS to construct CFLAGS
> >> -#
> >> -EXTRA_OEMAKE = "\
> >> -    'RPM_OPT_FLAGS=${CFLAGS}' \
> >> -    'LDFLAGS=${LDFLAGS}' \
> >> -    'BINDIR=${base_sbindir}' \
> >> -    'SBINDIR=${sbindir}' \
> >> -    'MANDIR=${mandir}' \
> >> -    'ALTDIR=${localstatedir}/lib/alternatives' \
> >> -    'ALTDATADIR=${sysconfdir}/alternatives' \
> >> -"
> >> -
> >> -do_unpack[postfuncs] += "obey_variables"
> >> -do_unpack[vardeps] += "obey_variables"
> >> -obey_variables () {
> >> -       sed -i -e 's,/etc,${sysconfdir},;
> s,/lib/systemd,${base_libdir}/systemd,' ${S}/leveldb.h
> >> -       sed -i -e 's,/etc/alternatives,${sysconfdir}/alternatives,' \
> >> -              -e
> 's,/var/lib/alternatives,${localstatedir}/lib/alternatives,' \
> >> -              -e 's,/usr/share/locale,${datadir}/locale,'
> ${S}/alternatives.c
> >> -}
> >> -
> >> -do_install() {
> >> -       oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale'
> \
> >> -               'BINDIR=${sbindir}' install
> >> -       install -d ${D}${sysconfdir}/chkconfig.d
> >> -}
> >> -
> >> -PACKAGES =+ "${PN}-alternatives ${PN}-alternatives-doc"
> >> -SUMMARY_${PN}-alternatives = "Maintain symbolic links determining
> default commands"
> >> -DESCRIPTION_${PN}-alternatives = "alternatives creates, removes,
> maintains and displays \
> >> -information about the symbolic links comprising the alternatives
> system."
> >> -SUMMARY_${PN}-alternatives-doc = "${SUMMARY_${PN}-alternatives} -
> Documentation files"
> >> -DESCRIPTION_${PN}-alternatives-doc =
> "${DESCRIPTION_${PN}-alternatives}  \
> >> -This package contains documentation."
> >> -RPROVIDES_${PN}-alternatives += "update-alternatives"
> >> -RCONFLICTS_${PN}-alternatives = "update-alternatives-opkg
> update-alternatives-dpkg"
> >> -FILES_${PN}-alternatives = "${sbindir}/alternatives
> ${sbindir}/update-alternatives \
> >> -                           ${sysconfdir}/alternatives
> ${localstatedir}/lib/alternatives"
> >> -FILES_${PN}-alternatives-doc = "${mandir}/man8/alternatives.8 \
> >> -                                ${mandir}/man8/update-alternatives.8"
> >> --
> >> 2.25.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--00000000000036dede059e187b66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Feb 8, 2020 at 12:41 PM akuster808 &lt;<a href=3D"m=
ailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
On 2/8/20 11:01 AM, Khem Raj wrote:<br>
&gt; On Fri, Feb 7, 2020 at 11:47 AM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; chkconfig is one of the options for virtual/update-alternatives,<b=
r>
&gt;&gt; however opkg-utils have been used as the default for a very long t=
ime,<br>
&gt;&gt; while chkconfig isn&#39;t anymore tested in any way, and is stuck<=
br>
&gt;&gt; at a very old version due to newer versions requiring selinux.<br>
&gt;&gt;<br>
&gt; there are recipes in other layers depending on it. e.g. see<br>
&gt;<br>
&gt; 09:40:46 ERROR: Nothing RPROVIDES &#39;chkconfig&#39; (but<br>
&gt; /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/met=
a-oe/recipes-graphics/tigervnc/<a href=3D"http://tigervnc_1.10.1.bb" rel=3D=
"noreferrer" target=3D"_blank">tigervnc_1.10.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 09:40:48 ERROR: Nothing RPROVIDES &#39;tigervnc-dev&#39; (but<br>
&gt; /mnt/jenkins/workspace/Yocto-world-clang/sources/meta-openembedded/met=
a-oe/recipes-graphics/tigervnc/<a href=3D"http://tigervnc_1.10.1.bb" rel=3D=
"noreferrer" target=3D"_blank">tigervnc_1.10.1.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 09:40:48 No eligible RPROVIDERs exist for &#39;tigervnc-dev&#39;<br>
<br>
Should it move to meta-oe then?</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I would prefer to remove the dep instead</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
&gt;<br>
&gt;<br>
&gt;&gt; [YOCTO #11264]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 -<br>
&gt;&gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-self-hosted=
.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-hosted.bb</a> |=
=C2=A0 1 -<br>
&gt;&gt;=C2=A0 .../<a href=3D"http://chkconfig-alternatives-native_1.3.59.b=
b" rel=3D"noreferrer" target=3D"_blank">chkconfig-alternatives-native_1.3.5=
9.bb</a>=C2=A0 =C2=A0| 44 ------------<br>
&gt;&gt;=C2=A0 .../chkconfig/chkconfig/replace_caddr_t.patch | 33 ---------=
<br>
&gt;&gt;=C2=A0 .../chkconfig/<a href=3D"http://chkconfig_1.3.58.bb" rel=3D"=
noreferrer" target=3D"_blank">chkconfig_1.3.58.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 71 -------------------<br>
&gt;&gt;=C2=A0 5 files changed, 151 deletions(-)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-extended/chkconfig/<a href=
=3D"http://chkconfig-alternatives-native_1.3.59.bb" rel=3D"noreferrer" targ=
et=3D"_blank">chkconfig-alternatives-native_1.3.59.bb</a><br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-extended/chkconfig/chkconfig=
/replace_caddr_t.patch<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-extended/chkconfig/<a href=
=3D"http://chkconfig_1.3.58.bb" rel=3D"noreferrer" target=3D"_blank">chkcon=
fig_1.3.58.bb</a><br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/=
distro/include/maintainers.inc<br>
&gt;&gt; index a80e85a2f6..c68e9edf63 100644<br>
&gt;&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; @@ -94,8 +94,6 @@ RECIPE_MAINTAINER_pn-cairo =3D &quot;Anuj Mittal=
 &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-cantarell-fonts =3D &quot;Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-ccache =3D &quot;Robert Yang &lt;<a hre=
f=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windri=
ver.com</a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-cdrtools-native =3D &quot;Yi Zhao &lt;<=
a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver=
.com</a>&gt;&quot;<br>
&gt;&gt; -RECIPE_MAINTAINER_pn-chkconfig =3D &quot;Yi Zhao &lt;<a href=3D"m=
ailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt=
;&quot;<br>
&gt;&gt; -RECIPE_MAINTAINER_pn-chkconfig-alternatives-native =3D &quot;Yi Z=
hao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@=
windriver.com</a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-chrpath =3D &quot;Yi Zhao &lt;<a href=
=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</=
a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-clutter-1.0 =3D &quot;Ross Burton &lt;<=
a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel=
.com</a>&gt;&quot;<br>
&gt;&gt;=C2=A0 RECIPE_MAINTAINER_pn-clutter-gst-3.0 =3D &quot;Ross Burton &=
lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@i=
ntel.com</a>&gt;&quot;<br>
&gt;&gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-self-hosted.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-self-hosted.bb</a><br>
&gt;&gt; index ea6d567301..9a70b189a4 100644<br>
&gt;&gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-h=
osted.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-self-hosted.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-self-h=
osted.bb</a><br>
&gt;&gt; @@ -108,7 +108,6 @@ RDEPENDS_packagegroup-self-hosted-debug =3D &q=
uot; \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 RDEPENDS_packagegroup-self-hosted-extended =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bzip2 \<br>
&gt;&gt; -=C2=A0 =C2=A0 chkconfig \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 chrpath \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpio \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 curl \<br>
&gt;&gt; diff --git a/meta/recipes-extended/chkconfig/<a href=3D"http://chk=
config-alternatives-native_1.3.59.bb" rel=3D"noreferrer" target=3D"_blank">=
chkconfig-alternatives-native_1.3.59.bb</a> b/meta/recipes-extended/chkconf=
ig/<a href=3D"http://chkconfig-alternatives-native_1.3.59.bb" rel=3D"norefe=
rrer" target=3D"_blank">chkconfig-alternatives-native_1.3.59.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 87fa8eb605..0000000000<br>
&gt;&gt; --- a/meta/recipes-extended/chkconfig/<a href=3D"http://chkconfig-=
alternatives-native_1.3.59.bb" rel=3D"noreferrer" target=3D"_blank">chkconf=
ig-alternatives-native_1.3.59.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,44 +0,0 @@<br>
&gt;&gt; -require recipes-extended/chkconfig/<a href=3D"http://chkconfig_1.=
3.58.bb" rel=3D"noreferrer" target=3D"_blank">chkconfig_1.3.58.bb</a><br>
&gt;&gt; -<br>
&gt;&gt; -SUMMARY =3D &quot;${SUMMARY_chkconfig-alternatives}&quot;<br>
&gt;&gt; -DESCRIPTION =3D &quot;${DESCRIPTION_chkconfig-alternatives}&quot;=
<br>
&gt;&gt; -DEPENDS =3D &quot;&quot;<br>
&gt;&gt; -PROVIDES +=3D &quot;virtual/update-alternatives-native&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce44=
86a80fdaf4a4263&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -# The sysroot branch is 1.3.59 + some git commits from master + -=
-sysroot<br>
&gt;&gt; -# support for alternatives.<br>
&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/kergoth/chkc=
onfig;branch=3Dsysroot" rel=3D"noreferrer" target=3D"_blank">github.com/ker=
goth/chkconfig;branch=3Dsysroot</a>&quot;<br>
&gt;&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; -UPSTREAM_CHECK_GITTAGREGEX =3D &quot;chkconfig-(?P&lt;pver&gt;(\d=
+(\.\d+)+))&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRCREV =3D &quot;cd437ecbd8986c894442f8fce1e0061e20f04dee&quot;<b=
r>
&gt;&gt; -PV =3D &quot;1.3.59+${SRCPV}&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -inherit native<br>
&gt;&gt; -<br>
&gt;&gt; -# We want our native recipes to build using the target paths rath=
er than paths<br>
&gt;&gt; -# into the sysroot, as we may use them to construct the rootfs. A=
s such, we<br>
&gt;&gt; -# only adjust the paths to match the metadata for the target, not=
 native.<br>
&gt;&gt; -obey_variables () {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,ALTERNATIVES_ROOT,OPKG_O=
FFLINE_ROOT,&#39; ${S}/alternatives.c<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; -do_compile () {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake alternatives<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; -do_install () {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/alternati=
ves \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
D}${localstatedir}/lib/alternatives<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755 alternatives ${D}${=
bindir}/alternatives<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0644 alternatives.8 ${D}=
${mandir}/man8/alternatives.8<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s alternatives ${D}${bindir}/updat=
e-alternatives<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s alternatives.8 ${D}${mandir}/man=
8/update-alternatives.8<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; -do_install_append_linuxstdbase() {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/lsb<br>
&gt;&gt; -}<br>
&gt;&gt; diff --git a/meta/recipes-extended/chkconfig/chkconfig/replace_cad=
dr_t.patch b/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.patc=
h<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 96d1938791..0000000000<br>
&gt;&gt; --- a/meta/recipes-extended/chkconfig/chkconfig/replace_caddr_t.pa=
tch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,33 +0,0 @@<br>
&gt;&gt; -caddr_t is a legacy BSD type which was rejected by the POSIX stan=
dard.<br>
&gt;&gt; -Use void * instead.<br>
&gt;&gt; -<br>
&gt;&gt; -sys/unitstd.h is not needed and moreover its not available on all=
 C library<br>
&gt;&gt; -implementations e.g. musl<br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; -Index: chkconfig-1.3.58/alternatives.c<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- chkconfig-1.3.58.orig/alternatives.c<br>
&gt;&gt; -+++ chkconfig-1.3.58/alternatives.c<br>
&gt;&gt; -@@ -22,7 +22,6 @@<br>
&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt; - #include &lt;sys/stat.h&gt;<br>
&gt;&gt; --#include &lt;sys/unistd.h&gt;<br>
&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt; -<br>
&gt;&gt; - #define=C2=A0 =C2=A0 =C2=A0 =C2=A0FLAGS_TEST=C2=A0 =C2=A0 =C2=A0=
 (1 &lt;&lt; 0)<br>
&gt;&gt; -Index: chkconfig-1.3.58/leveldb.c<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- chkconfig-1.3.58.orig/leveldb.c<br>
&gt;&gt; -+++ chkconfig-1.3.58/leveldb.c<br>
&gt;&gt; -@@ -442,7 +442,7 @@ int parseServiceInfo(int fd, char * name<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0fstat(fd, &amp;sb);<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0bufstart =3D mmap(NULL, sb.st_size, PROT_READ=
, MAP_SHARED, fd, 0);<br>
&gt;&gt; --=C2=A0 =C2=A0 if (bufstart =3D=3D ((caddr_t) -1)) {<br>
&gt;&gt; -+=C2=A0 =C2=A0 if (bufstart =3D=3D ((void*) -1)) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; diff --git a/meta/recipes-extended/chkconfig/<a href=3D"http://chk=
config_1.3.58.bb" rel=3D"noreferrer" target=3D"_blank">chkconfig_1.3.58.bb<=
/a> b/meta/recipes-extended/chkconfig/<a href=3D"http://chkconfig_1.3.58.bb=
" rel=3D"noreferrer" target=3D"_blank">chkconfig_1.3.58.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index d21dd69704..0000000000<br>
&gt;&gt; --- a/meta/recipes-extended/chkconfig/<a href=3D"http://chkconfig_=
1.3.58.bb" rel=3D"noreferrer" target=3D"_blank">chkconfig_1.3.58.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,71 +0,0 @@<br>
&gt;&gt; -SUMMARY =3D &quot;A system tool for maintaining the /etc/rc*.d hi=
erarchy&quot;<br>
&gt;&gt; -DESCRIPTION =3D &quot;Chkconfig is a basic system utility.=C2=A0 =
It updates and queries runlevel \<br>
&gt;&gt; -information for system services.=C2=A0 Chkconfig manipulates the =
numerous \<br>
&gt;&gt; -symbolic links in /etc/rc.d, to relieve system administrators of =
some \<br>
&gt;&gt; -of the drudgery of manually editing the symbolic links.&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -RECIPE_NO_UPDATE_REASON =3D &quot;Version 1.5 requires selinux&qu=
ot;<br>
&gt;&gt; -<br>
&gt;&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/fedora-sysv" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/fedora-sysv</a>&quot;<=
br>
&gt;&gt; -<br>
&gt;&gt; -LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5574c6965ae5f583e=
55880e397fbb018&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -DEPENDS =3D &quot;libnewt popt&quot;<br>
&gt;&gt; -PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -PR =3D &quot;r7&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -S =3D &quot;${WORKDIR}/${BPN}-${BPN}-${PV}&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/fedora-sysv/=
chkconfig.git" rel=3D"noreferrer" target=3D"_blank">github.com/fedora-sysv/=
chkconfig.git</a> \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://replace_caddr_t.p=
atch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; -<br>
&gt;&gt; -SRCREV =3D &quot;3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4&quot;<b=
r>
&gt;&gt; -UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&=
quot;<br>
&gt;&gt; -<br>
&gt;&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -inherit gettext<br>
&gt;&gt; -<br>
&gt;&gt; -# Makefile uses RPM_OPT_FLAGS to construct CFLAGS<br>
&gt;&gt; -#<br>
&gt;&gt; -EXTRA_OEMAKE =3D &quot;\<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;RPM_OPT_FLAGS=3D${CFLAGS}&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;LDFLAGS=3D${LDFLAGS}&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;BINDIR=3D${base_sbindir}&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;SBINDIR=3D${sbindir}&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;MANDIR=3D${mandir}&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;ALTDIR=3D${localstatedir}/lib/alternatives&#39=
; \<br>
&gt;&gt; -=C2=A0 =C2=A0 &#39;ALTDATADIR=3D${sysconfdir}/alternatives&#39; \=
<br>
&gt;&gt; -&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -do_unpack[postfuncs] +=3D &quot;obey_variables&quot;<br>
&gt;&gt; -do_unpack[vardeps] +=3D &quot;obey_variables&quot;<br>
&gt;&gt; -obey_variables () {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,/etc,${sysconfdir},; =
s,/lib/systemd,${base_libdir}/systemd,&#39; ${S}/leveldb.h<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,/etc/alternatives,${s=
ysconfdir}/alternatives,&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,/var/l=
ib/alternatives,${localstatedir}/lib/alternatives,&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,/usr/s=
hare/locale,${datadir}/locale,&#39; ${S}/alternatives.c<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; -do_install() {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; &#=
39;INSTALLNLSDIR=3D${D}${datadir}/locale&#39; \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;BINDI=
R=3D${sbindir}&#39; install<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/chkconfig=
.d<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; -PACKAGES =3D+ &quot;${PN}-alternatives ${PN}-alternatives-doc&quo=
t;<br>
&gt;&gt; -SUMMARY_${PN}-alternatives =3D &quot;Maintain symbolic links dete=
rmining default commands&quot;<br>
&gt;&gt; -DESCRIPTION_${PN}-alternatives =3D &quot;alternatives creates, re=
moves, maintains and displays \<br>
&gt;&gt; -information about the symbolic links comprising the alternatives =
system.&quot;<br>
&gt;&gt; -SUMMARY_${PN}-alternatives-doc =3D &quot;${SUMMARY_${PN}-alternat=
ives} - Documentation files&quot;<br>
&gt;&gt; -DESCRIPTION_${PN}-alternatives-doc =3D &quot;${DESCRIPTION_${PN}-=
alternatives}=C2=A0 \<br>
&gt;&gt; -This package contains documentation.&quot;<br>
&gt;&gt; -RPROVIDES_${PN}-alternatives +=3D &quot;update-alternatives&quot;=
<br>
&gt;&gt; -RCONFLICTS_${PN}-alternatives =3D &quot;update-alternatives-opkg =
update-alternatives-dpkg&quot;<br>
&gt;&gt; -FILES_${PN}-alternatives =3D &quot;${sbindir}/alternatives ${sbin=
dir}/update-alternatives \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/alternatives ${localstatedi=
r}/lib/alternatives&quot;<br>
&gt;&gt; -FILES_${PN}-alternatives-doc =3D &quot;${mandir}/man8/alternative=
s.8 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${mandir}/man8/update-alte=
rnatives.8&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
</blockquote></div></div>

--00000000000036dede059e187b66--

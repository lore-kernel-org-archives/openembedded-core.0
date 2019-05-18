Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id CAE707C4F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:35:57 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id 186so3822931ywo.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=C0Wz/ChqMuH3JIwXanIIFAJHxW6cVhjTbqmX70cTQJg=;
	b=jKnwM4hXjHmSZB0hVjDUD36nTkQo3qFTWrQQLZVysZyxsAcDy56x0Pbi7ISHD9KWGO
	+F+YwTcDxeHnXlXnTtwUCZ26VHBdpWeav9I3wJEXFEuNrvx691AwHYmpztBANI9NB8bZ
	VB9zP/VIYUOD0V7bbfNvq7W97R1YemII+KYs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=C0Wz/ChqMuH3JIwXanIIFAJHxW6cVhjTbqmX70cTQJg=;
	b=eXmi9tXxTWM3Jfg3pASPK8m3xhZ4y+7mJakTp2yMS5KcpuaJKbRlvCYE4TeNji22mL
	J1Yd3XseFRR140EJnhri2clSJlpiJSrhNJyU7wkS/kV89BgcyD5yS+CKGaIawpozNryZ
	IzMqVW0tpxl4cYQm75fln5Z2RirsYHsZ0r4QdDWCdRIb6m93S5BgOH64q+zhXBn5NY3X
	44KT8KQJWM7RzBc9O4fp8euYUsncfZHV8MglDfGVnlr0sUkAf2CjPLi1WlvYfQoRuZc9
	V877pAuG3jhvOPQ3dU/YzcPFLmp9i9gh+SQlWYr5jyYH/XRsFOYd6kAw3hvv8mWv0ikJ
	nOvQ==
X-Gm-Message-State: APjAAAVXFe2seawEgae/RBka4D5uJk+hdIFnL+ZjbiwklhaiKgxiHnai
	EB6EYqVtdjj3zmCx8XgWizv9aA==
X-Google-Smtp-Source: APXvYqwW4Z+4JZw92PeOfXtDWkp7n30J7PhYP33q4VB0tHRQY7WWoxuq7CDvBGRsb+TaFagROPTrbQ==
X-Received: by 2002:a81:489:: with SMTP id 131mr26898833ywe.298.1558179358427; 
	Sat, 18 May 2019 04:35:58 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	d187sm1903127ywd.86.2019.05.18.04.35.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 04:35:56 -0700 (PDT)
Date: Sat, 18 May 2019 07:35:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190518113554.GJ22232@bill-the-cat>
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<CA+chaQd2qTqLDpNsvHY1q8MBnnXduMZhapj0S_njo73rHgOBUA@mail.gmail.com>
	<CA+chaQcOHXLusqEgMc78w4Hd3jB=ykt2wd8mxiMF3LZXSgEfLg@mail.gmail.com>
	<CANNYZj-8GjgDdbczLDhXajzuAiYYNpAbSZg-_xPxcMPd=nVjSw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-8GjgDdbczLDhXajzuAiYYNpAbSZg-_xPxcMPd=nVjSw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: split the common part into vim.inc
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
X-List-Received-Date: Sat, 18 May 2019 11:35:58 -0000
X-Groupsio-MsgNum: 124616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ydr+kCxCcP3yQKPN"
Content-Disposition: inline

--ydr+kCxCcP3yQKPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 04:34:14PM +0200, Alexander Kanavin wrote:

> This is up to the recipe maintainer (Tom) to do; I only want to ensure
> AUH does not choke on the recipe.

What's proper etiquette here?  Shall I grab, v2 and include Martin's
suggestions, or follow-up and Suggested-by them?  Thanks!

>=20
> Alex
>=20
> On Fri, 17 May 2019 at 16:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Actually the BBCLASSEXTEND =3D "native" as well, as we don't need both =
vim recipes to provide xxd-native.
> >
> > On Fri, May 17, 2019 at 4:27 PM Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >>
> >> To simplify meta/recipes-support/vim/vim-tiny_8.1.1240.bb which curren=
tly has:
> >>
> >> PROVIDES_remove =3D "xxd"
> >> ALTERNATIVE_${PN}_remove =3D "xxd"
> >>
> >> Can you move xxd from the .inc file and put it only in vim_8.1.1240.bb?
> >>
> >>
> >> On Fri, May 17, 2019 at 3:53 PM Alexander Kanavin <alex.kanavin@gmail.=
com> wrote:
> >>>
> >>> Previously vim-tiny would include the vim recipe wholesale;
> >>> this meant that they had to be upgraded in a single transaction
> >>> which devtool cannot cope with. This thwarted the latest AUH
> >>> run in particular.
> >>>
> >>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >>> ---
> >>>  meta/recipes-support/vim/vim-tiny_8.1.1240.bb |   2 +-
> >>>  meta/recipes-support/vim/vim.inc              | 141 +++++++++++++++++
> >>>  meta/recipes-support/vim/vim_8.1.1240.bb      | 142 +---------------=
--
> >>>  3 files changed, 143 insertions(+), 142 deletions(-)
> >>>  create mode 100644 meta/recipes-support/vim/vim.inc
> >>>
> >>> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/rec=
ipes-support/vim/vim-tiny_8.1.1240.bb
> >>> index 74464833adb..139e626e444 100644
> >>> --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> >>> +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> >>> @@ -1,4 +1,4 @@
> >>> -require vim_${PV}.bb
> >>> +require vim.inc
> >>>
> >>>  SUMMARY +=3D " (with tiny features)"
> >>>
> >>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/=
vim/vim.inc
> >>> new file mode 100644
> >>> index 00000000000..f5c74684bfa
> >>> --- /dev/null
> >>> +++ b/meta/recipes-support/vim/vim.inc
> >>> @@ -0,0 +1,141 @@
> >>> +SUMMARY =3D "Vi IMproved - enhanced vi editor"
> >>> +SECTION =3D "console/utils"
> >>> +
> >>> +PROVIDES =3D "xxd"
> >>> +DEPENDS =3D "ncurses gettext-native"
> >>> +# vimdiff doesn't like busybox diff
> >>> +RSUGGESTS_${PN} =3D "diffutils"
> >>> +LICENSE =3D "vim"
> >>> +LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md=
5=3Df1f82b42360005c70b8c19b0ef493f72"
> >>> +
> >>> +SRC_URI =3D "git://github.com/vim/vim.git \
> >>> +           file://disable_acl_header_check.patch \
> >>> +           file://vim-add-knob-whether-elf.h-are-checked.patch \
> >>> +           file://0001-src-Makefile-improve-reproducibility.patch \
> >>> +"
> >>> +SRCREV =3D "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
> >>> +
> >>> +S =3D "${WORKDIR}/git"
> >>> +
> >>> +VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').spl=
it('.')[1]}"
> >>> +
> >>> +inherit autotools-brokensep update-alternatives
> >>> +
> >>> +CLEANBROKEN =3D "1"
> >>> +
> >>> +# vim configure.in contains functions which got 'dropped' by autotoo=
ls.bbclass
> >>> +do_configure () {
> >>> +    cd src
> >>> +    rm -f auto/*
> >>> +    touch auto/config.mk
> >>> +    aclocal
> >>> +    autoconf
> >>> +    cd ..
> >>> +    oe_runconf
> >>> +    touch src/auto/configure
> >>> +    touch src/auto/config.mk src/auto/config.h
> >>> +}
> >>> +
> >>> +do_compile() {
> >>> +    # We do not support fully / correctly the following locales.  At=
tempting
> >>> +    # to use these with msgfmt in order to update the ".desktop" fil=
es exposes
> >>> +    # this problem and leads to the compile failing.
> >>> +    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
> >>> +        echo -n > src/po/${LOCALE}.po
> >>> +    done
> >>> +    autotools_do_compile
> >>> +}
> >>> +
> >>> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> >>> +PACKAGECONFIG ??=3D ""
> >>> +PACKAGECONFIG +=3D " \
> >>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> >>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '',=
 d)} \
> >>> +"
> >>> +PACKAGECONFIG_class-native =3D ""
> >>> +
> >>> +PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk=
+,"
> >>> +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> >>> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
> >>> +PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbi=
g,,"
> >>> +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libse=
linux,"
> >>> +PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
> >>> +
> >>> +EXTRA_OECONF =3D " \
> >>> +    --disable-gpm \
> >>> +    --disable-gtktest \
> >>> +    --disable-xim \
> >>> +    --disable-netbeans \
> >>> +    --with-tlib=3Dncurses \
> >>> +    ac_cv_small_wchar_t=3Dno \
> >>> +    vim_cv_getcwd_broken=3Dno \
> >>> +    vim_cv_memmove_handles_overlap=3Dyes \
> >>> +    vim_cv_stat_ignores_slash=3Dno \
> >>> +    vim_cv_terminfo=3Dyes \
> >>> +    vim_cv_tgetent=3Dnon-zero \
> >>> +    vim_cv_toupper_broken=3Dno \
> >>> +    vim_cv_tty_group=3Dworld \
> >>> +    STRIP=3D/bin/true \
> >>> +"
> >>> +
> >>> +do_install() {
> >>> +    autotools_do_install
> >>> +
> >>> +    # Work around file-rdeps picking up csh, awk, perl or python as =
a dep
> >>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> >>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> >>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> >>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> >>> +
> >>> +    # Install example vimrc from runtime files
> >>> +    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}=
/vimrc
> >>> +
> >>> +    # we use --with-features=3Dbig as default
> >>> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> >>> +
> >>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false=
', d)}; then
> >>> +       # The mouse being autoenabled is just annoying in xfce4-termi=
nal (mouse
> >>> +       # drag make vim go into visual mode and there is no right cli=
ck menu),
> >>> +       # delete the block.
> >>> +       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BP=
N}/vimrc
> >>> +    fi
> >>> +}
> >>> +
> >>> +PARALLEL_MAKEINST =3D ""
> >>> +
> >>> +PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN=
}-vimrc ${PN}-tools"
> >>> +FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
> >>> +FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
> >>> +FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/$=
{BPN}tutor"
> >>> +FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
> >>> +FILES_${PN}-data =3D "${datadir}/${BPN}"
> >>> +FILES_${PN}-tools =3D "${datadir}/${BPN}/${VIMDIR}/tools"
> >>> +FILES_${PN}-common =3D " \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/colors \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/indent \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/lang \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/macros \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/print \
> >>> +    ${datadir}/${BPN}/${VIMDIR}/spell \
> >>> +    ${datadir}/icons \
> >>> +"
> >>> +
> >>> +RDEPENDS_${BPN} =3D "ncurses-terminfo-base"
> >>> +# Recommend that runtime data is installed along with vim
> >>> +RRECOMMENDS_${BPN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vi=
mrc ${PN}-common"
> >>> +
> >>> +ALTERNATIVE_${PN} =3D "vi vim xxd"
> >>> +ALTERNATIVE_PRIORITY =3D "100"
> >>> +ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
> >>> +ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> >>> +ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
> >>> +ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> >>> +ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> >>> +
> >>> +BBCLASSEXTEND =3D "native"
> >>> diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-=
support/vim/vim_8.1.1240.bb
> >>> index f5c74684bfa..baaaacc0b77 100644
> >>> --- a/meta/recipes-support/vim/vim_8.1.1240.bb
> >>> +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
> >>> @@ -1,141 +1 @@
> >>> -SUMMARY =3D "Vi IMproved - enhanced vi editor"
> >>> -SECTION =3D "console/utils"
> >>> -
> >>> -PROVIDES =3D "xxd"
> >>> -DEPENDS =3D "ncurses gettext-native"
> >>> -# vimdiff doesn't like busybox diff
> >>> -RSUGGESTS_${PN} =3D "diffutils"
> >>> -LICENSE =3D "vim"
> >>> -LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md=
5=3Df1f82b42360005c70b8c19b0ef493f72"
> >>> -
> >>> -SRC_URI =3D "git://github.com/vim/vim.git \
> >>> -           file://disable_acl_header_check.patch \
> >>> -           file://vim-add-knob-whether-elf.h-are-checked.patch \
> >>> -           file://0001-src-Makefile-improve-reproducibility.patch \
> >>> -"
> >>> -SRCREV =3D "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
> >>> -
> >>> -S =3D "${WORKDIR}/git"
> >>> -
> >>> -VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').spl=
it('.')[1]}"
> >>> -
> >>> -inherit autotools-brokensep update-alternatives
> >>> -
> >>> -CLEANBROKEN =3D "1"
> >>> -
> >>> -# vim configure.in contains functions which got 'dropped' by autotoo=
ls.bbclass
> >>> -do_configure () {
> >>> -    cd src
> >>> -    rm -f auto/*
> >>> -    touch auto/config.mk
> >>> -    aclocal
> >>> -    autoconf
> >>> -    cd ..
> >>> -    oe_runconf
> >>> -    touch src/auto/configure
> >>> -    touch src/auto/config.mk src/auto/config.h
> >>> -}
> >>> -
> >>> -do_compile() {
> >>> -    # We do not support fully / correctly the following locales.  At=
tempting
> >>> -    # to use these with msgfmt in order to update the ".desktop" fil=
es exposes
> >>> -    # this problem and leads to the compile failing.
> >>> -    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
> >>> -        echo -n > src/po/${LOCALE}.po
> >>> -    done
> >>> -    autotools_do_compile
> >>> -}
> >>> -
> >>> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> >>> -PACKAGECONFIG ??=3D ""
> >>> -PACKAGECONFIG +=3D " \
> >>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> >>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '',=
 d)} \
> >>> -"
> >>> -PACKAGECONFIG_class-native =3D ""
> >>> -
> >>> -PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk=
+,"
> >>> -PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
> >>> -PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
> >>> -PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbi=
g,,"
> >>> -PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libse=
linux,"
> >>> -PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
> >>> -
> >>> -EXTRA_OECONF =3D " \
> >>> -    --disable-gpm \
> >>> -    --disable-gtktest \
> >>> -    --disable-xim \
> >>> -    --disable-netbeans \
> >>> -    --with-tlib=3Dncurses \
> >>> -    ac_cv_small_wchar_t=3Dno \
> >>> -    vim_cv_getcwd_broken=3Dno \
> >>> -    vim_cv_memmove_handles_overlap=3Dyes \
> >>> -    vim_cv_stat_ignores_slash=3Dno \
> >>> -    vim_cv_terminfo=3Dyes \
> >>> -    vim_cv_tgetent=3Dnon-zero \
> >>> -    vim_cv_toupper_broken=3Dno \
> >>> -    vim_cv_tty_group=3Dworld \
> >>> -    STRIP=3D/bin/true \
> >>> -"
> >>> -
> >>> -do_install() {
> >>> -    autotools_do_install
> >>> -
> >>> -    # Work around file-rdeps picking up csh, awk, perl or python as =
a dep
> >>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> >>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> >>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> >>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> >>> -
> >>> -    # Install example vimrc from runtime files
> >>> -    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}=
/vimrc
> >>> -
> >>> -    # we use --with-features=3Dbig as default
> >>> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> >>> -
> >>> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false=
', d)}; then
> >>> -       # The mouse being autoenabled is just annoying in xfce4-termi=
nal (mouse
> >>> -       # drag make vim go into visual mode and there is no right cli=
ck menu),
> >>> -       # delete the block.
> >>> -       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BP=
N}/vimrc
> >>> -    fi
> >>> -}
> >>> -
> >>> -PARALLEL_MAKEINST =3D ""
> >>> -
> >>> -PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN=
}-vimrc ${PN}-tools"
> >>> -FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
> >>> -FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
> >>> -FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/$=
{BPN}tutor"
> >>> -FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
> >>> -FILES_${PN}-data =3D "${datadir}/${BPN}"
> >>> -FILES_${PN}-tools =3D "${datadir}/${BPN}/${VIMDIR}/tools"
> >>> -FILES_${PN}-common =3D " \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/colors \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/indent \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/lang \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/macros \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/print \
> >>> -    ${datadir}/${BPN}/${VIMDIR}/spell \
> >>> -    ${datadir}/icons \
> >>> -"
> >>> -
> >>> -RDEPENDS_${BPN} =3D "ncurses-terminfo-base"
> >>> -# Recommend that runtime data is installed along with vim
> >>> -RRECOMMENDS_${BPN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vi=
mrc ${PN}-common"
> >>> -
> >>> -ALTERNATIVE_${PN} =3D "vi vim xxd"
> >>> -ALTERNATIVE_PRIORITY =3D "100"
> >>> -ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
> >>> -ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
> >>> -ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
> >>> -ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
> >>> -ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> >>> -
> >>> -BBCLASSEXTEND =3D "native"
> >>> +require vim.inc
> >>> --
> >>> 2.17.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Tom

--ydr+kCxCcP3yQKPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3+4aAAoJEIf59jXTHXZSFXgQAILSjAfTYN9RgtuLxR1vtUov
Wo4oovili+z8+n5+SaV5T3YlfP3EsttAu0RrkbL6uHtYovA5tWcdpACFt1PUWWnR
7OSkQA/hO/HVA6O/ekV4aBhyf7C3deqSClnXI2Gbet7NEb1orf7zAilfbwwRxKm6
EuZ5KzUKvtzSx1tk+ppNNU0vGteCPT3cfmZZu/G2spBX+dyOjHO+k+/xNMSitGN5
tHYohPPT39KG65hE/EvhRamYnebY8wtcpP5BxSFEcAY96xjCTFqUcjW2s6IF9flD
eOPNfqQcvknSevoxMamcrXf4TyvrnTvDfU9zWU2eKbwsaIXZ8NIpaSsTgSWR2dLb
gnqPVTiXr+yr7p8tH324MGPJiICOWmjqm71p9UAKIpWpe1wUOVmDQALawabhELzQ
KE8Fe7/CTkoHv9Y50kXBvTBFBoqcdxPhm6zd9ZOrKyPS7HQScw9V3SvH+ZgjpJ6G
SBjj1fGYE+y47dos4wRwLfCFyNBEGPfMKNpf4ZI+HebuJIouSquOpryvCgNd0i1V
GaUJAL78CHqxYd++YXceqCyCSeeldHI/f5ijF6xWep0IX6Rf6gIyhSgR0UqA9/39
7fqGvIGJdV6+Vq50W84WkTGk2zcud9NL6ngJ06XhQRalitl1cxgoW80tFgCnlSlI
L/xnCo8807lcQFo0ZEKV
=IYnG
-----END PGP SIGNATURE-----

--ydr+kCxCcP3yQKPN--

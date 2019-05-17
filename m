Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6F7B7DE90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 14:27:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b8so10824713edm.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nB16KMm+7uHSqvUYqbSzCn1Mc1tUwbkmnGP64gus8TM=;
	b=iCjDQV0Js1Jwecw9NS4f9H0lzSTcfNqGQLz3xycTvJuFyvjNPq5njeE3nNTod/cMyT
	uMWkU1vcuTCkOy3bkTdsHb2FgIPn348hjd8Z8HAX8TmpsewpybIPhcSSfFqlAd11jkNM
	VNCkBgrbyco5WX+EJ2kT4X4YcCfb4GNi+wAPPETEl3E/nC8xdhFPbTAg5QG/fpNfdjEV
	5D5TsvIa06Q/wHFXQl9wnLC2u0H+rka+quI5tt4RSKNu6ToYCj40pTY4s4BWur0gYFRg
	cebVB5Z+NcSILZbfcpOELw9fNEEXUl2SJxL4F8rKZ4bq7N5FdFn39Wv225FM8TrupYzK
	dVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nB16KMm+7uHSqvUYqbSzCn1Mc1tUwbkmnGP64gus8TM=;
	b=srtI7iodXK/VO0lbL1OgAvlJ3PUaSoQfs/3wU93x8YWDiWajwutsKvLujsVfF37iNx
	GOpxqzERES4ph/6rtqZbDyKZhzmnbPddiciX53yiT6L9cMdZBj6pvYll93zIl9bqiGjc
	nOFB/S4V7XaN1dousFj1DNurV3kq9+VDLG5IR95uZaTri/19MpMRUC1jAhs/6ZbRZr6F
	JjovAk/Dj49HEsCApg7W+arrCmdL9kJklNtvfPXIKcQVlP7PVWCNYIR25VxoGYDmODZV
	kGOnt5I7nbjmI3chNKSNHfymHRavH99MQDkyGtgh4NN1qHLVODu08DAV+Eukd/+cKMHH
	VvxA==
X-Gm-Message-State: APjAAAUxHnWdxymscgq3gq/WttNhDv6EXifS3skB/ND7IHE63qQ6VkQU
	a5P9y4ss+cJlSTOhn1uHLIi3jLr3hQDWST2pP64QVBeS
X-Google-Smtp-Source: APXvYqy/ZDN90nwmdPb76ZHJWmr2dufN6eNSviEsBKvDrG5t/leJrtlevDsl7wevt7Ajp6CCz3xLuk3xEkALHmHuERo=
X-Received: by 2002:a50:abe5:: with SMTP id u92mr52686603edc.164.1558103280329;
	Fri, 17 May 2019 07:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
In-Reply-To: <20190517135309.116495-1-alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2019 16:27:50 +0200
Message-ID: <CA+chaQd2qTqLDpNsvHY1q8MBnnXduMZhapj0S_njo73rHgOBUA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 17 May 2019 14:28:00 -0000
Content-Type: multipart/alternative; boundary="0000000000008c281905891630bf"

--0000000000008c281905891630bf
Content-Type: text/plain; charset="UTF-8"

To simplify meta/recipes-support/vim/vim-tiny_8.1.1240.bb which currently
has:

PROVIDES_remove = "xxd"
ALTERNATIVE_${PN}_remove = "xxd"

Can you move xxd from the .inc file and put it only in vim_8.1.1240.bb?


On Fri, May 17, 2019 at 3:53 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Previously vim-tiny would include the vim recipe wholesale;
> this meant that they had to be upgraded in a single transaction
> which devtool cannot cope with. This thwarted the latest AUH
> run in particular.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-support/vim/vim-tiny_8.1.1240.bb |   2 +-
>  meta/recipes-support/vim/vim.inc              | 141 +++++++++++++++++
>  meta/recipes-support/vim/vim_8.1.1240.bb      | 142 +-----------------
>  3 files changed, 143 insertions(+), 142 deletions(-)
>  create mode 100644 meta/recipes-support/vim/vim.inc
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> index 74464833adb..139e626e444 100644
> --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> @@ -1,4 +1,4 @@
> -require vim_${PV}.bb
> +require vim.inc
>
>  SUMMARY += " (with tiny features)"
>
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> new file mode 100644
> index 00000000000..f5c74684bfa
> --- /dev/null
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -0,0 +1,141 @@
> +SUMMARY = "Vi IMproved - enhanced vi editor"
> +SECTION = "console/utils"
> +
> +PROVIDES = "xxd"
> +DEPENDS = "ncurses gettext-native"
> +# vimdiff doesn't like busybox diff
> +RSUGGESTS_${PN} = "diffutils"
> +LICENSE = "vim"
> +LIC_FILES_CHKSUM =
> "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
> +
> +SRC_URI = "git://github.com/vim/vim.git \
> +           file://disable_acl_header_check.patch \
> +           file://vim-add-knob-whether-elf.h-are-checked.patch \
> +           file://0001-src-Makefile-improve-reproducibility.patch \
> +"
> +SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
> +
> +S = "${WORKDIR}/git"
> +
> +VIMDIR =
> "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
> +
> +inherit autotools-brokensep update-alternatives
> +
> +CLEANBROKEN = "1"
> +
> +# vim configure.in contains functions which got 'dropped' by
> autotools.bbclass
> +do_configure () {
> +    cd src
> +    rm -f auto/*
> +    touch auto/config.mk
> +    aclocal
> +    autoconf
> +    cd ..
> +    oe_runconf
> +    touch src/auto/configure
> +    touch src/auto/config.mk src/auto/config.h
> +}
> +
> +do_compile() {
> +    # We do not support fully / correctly the following locales.
> Attempting
> +    # to use these with msgfmt in order to update the ".desktop" files
> exposes
> +    # this problem and leads to the compile failing.
> +    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
> +        echo -n > src/po/${LOCALE}.po
> +    done
> +    autotools_do_compile
> +}
> +
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG += " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
> +"
> +PACKAGECONFIG_class-native = ""
> +
> +PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> +PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> +PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> +
> +EXTRA_OECONF = " \
> +    --disable-gpm \
> +    --disable-gtktest \
> +    --disable-xim \
> +    --disable-netbeans \
> +    --with-tlib=ncurses \
> +    ac_cv_small_wchar_t=no \
> +    vim_cv_getcwd_broken=no \
> +    vim_cv_memmove_handles_overlap=yes \
> +    vim_cv_stat_ignores_slash=no \
> +    vim_cv_terminfo=yes \
> +    vim_cv_tgetent=non-zero \
> +    vim_cv_toupper_broken=no \
> +    vim_cv_tty_group=world \
> +    STRIP=/bin/true \
> +"
> +
> +do_install() {
> +    autotools_do_install
> +
> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> +
> +    # Install example vimrc from runtime files
> +    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
> +
> +    # we use --with-features=big as default
> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false',
> d)}; then
> +       # The mouse being autoenabled is just annoying in xfce4-terminal
> (mouse
> +       # drag make vim go into visual mode and there is no right click
> menu),
> +       # delete the block.
> +       sed -i '/the mouse works just fine/,+4d'
> ${D}/${datadir}/${BPN}/vimrc
> +    fi
> +}
> +
> +PARALLEL_MAKEINST = ""
> +
> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-tools"
> +FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
> +FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
> +FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor
> ${bindir}/${BPN}tutor"
> +FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
> +FILES_${PN}-data = "${datadir}/${BPN}"
> +FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> +FILES_${PN}-common = " \
> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
> +    ${datadir}/${BPN}/${VIMDIR}/colors \
> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> +    ${datadir}/${BPN}/${VIMDIR}/indent \
> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
> +    ${datadir}/${BPN}/${VIMDIR}/lang \
> +    ${datadir}/${BPN}/${VIMDIR}/macros \
> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
> +    ${datadir}/${BPN}/${VIMDIR}/print \
> +    ${datadir}/${BPN}/${VIMDIR}/spell \
> +    ${datadir}/icons \
> +"
> +
> +RDEPENDS_${BPN} = "ncurses-terminfo-base"
> +# Recommend that runtime data is installed along with vim
> +RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-common"
> +
> +ALTERNATIVE_${PN} = "vi vim xxd"
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> +ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> +ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> +ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb
> b/meta/recipes-support/vim/vim_8.1.1240.bb
> index f5c74684bfa..baaaacc0b77 100644
> --- a/meta/recipes-support/vim/vim_8.1.1240.bb
> +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
> @@ -1,141 +1 @@
> -SUMMARY = "Vi IMproved - enhanced vi editor"
> -SECTION = "console/utils"
> -
> -PROVIDES = "xxd"
> -DEPENDS = "ncurses gettext-native"
> -# vimdiff doesn't like busybox diff
> -RSUGGESTS_${PN} = "diffutils"
> -LICENSE = "vim"
> -LIC_FILES_CHKSUM =
> "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
> -
> -SRC_URI = "git://github.com/vim/vim.git \
> -           file://disable_acl_header_check.patch \
> -           file://vim-add-knob-whether-elf.h-are-checked.patch \
> -           file://0001-src-Makefile-improve-reproducibility.patch \
> -"
> -SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
> -
> -S = "${WORKDIR}/git"
> -
> -VIMDIR =
> "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
> -
> -inherit autotools-brokensep update-alternatives
> -
> -CLEANBROKEN = "1"
> -
> -# vim configure.in contains functions which got 'dropped' by
> autotools.bbclass
> -do_configure () {
> -    cd src
> -    rm -f auto/*
> -    touch auto/config.mk
> -    aclocal
> -    autoconf
> -    cd ..
> -    oe_runconf
> -    touch src/auto/configure
> -    touch src/auto/config.mk src/auto/config.h
> -}
> -
> -do_compile() {
> -    # We do not support fully / correctly the following locales.
> Attempting
> -    # to use these with msgfmt in order to update the ".desktop" files
> exposes
> -    # this problem and leads to the compile failing.
> -    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
> -        echo -n > src/po/${LOCALE}.po
> -    done
> -    autotools_do_compile
> -}
> -
> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG += " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
> -"
> -PACKAGECONFIG_class-native = ""
> -
> -PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> -PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> -PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> -PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> -
> -EXTRA_OECONF = " \
> -    --disable-gpm \
> -    --disable-gtktest \
> -    --disable-xim \
> -    --disable-netbeans \
> -    --with-tlib=ncurses \
> -    ac_cv_small_wchar_t=no \
> -    vim_cv_getcwd_broken=no \
> -    vim_cv_memmove_handles_overlap=yes \
> -    vim_cv_stat_ignores_slash=no \
> -    vim_cv_terminfo=yes \
> -    vim_cv_tgetent=non-zero \
> -    vim_cv_toupper_broken=no \
> -    vim_cv_tty_group=world \
> -    STRIP=/bin/true \
> -"
> -
> -do_install() {
> -    autotools_do_install
> -
> -    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> -
> -    # Install example vimrc from runtime files
> -    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
> -
> -    # we use --with-features=big as default
> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> -
> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false',
> d)}; then
> -       # The mouse being autoenabled is just annoying in xfce4-terminal
> (mouse
> -       # drag make vim go into visual mode and there is no right click
> menu),
> -       # delete the block.
> -       sed -i '/the mouse works just fine/,+4d'
> ${D}/${datadir}/${BPN}/vimrc
> -    fi
> -}
> -
> -PARALLEL_MAKEINST = ""
> -
> -PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-tools"
> -FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
> -FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
> -FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor
> ${bindir}/${BPN}tutor"
> -FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
> -FILES_${PN}-data = "${datadir}/${BPN}"
> -FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> -FILES_${PN}-common = " \
> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
> -    ${datadir}/${BPN}/${VIMDIR}/colors \
> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> -    ${datadir}/${BPN}/${VIMDIR}/indent \
> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
> -    ${datadir}/${BPN}/${VIMDIR}/lang \
> -    ${datadir}/${BPN}/${VIMDIR}/macros \
> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
> -    ${datadir}/${BPN}/${VIMDIR}/print \
> -    ${datadir}/${BPN}/${VIMDIR}/spell \
> -    ${datadir}/icons \
> -"
> -
> -RDEPENDS_${BPN} = "ncurses-terminfo-base"
> -# Recommend that runtime data is installed along with vim
> -RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-common"
> -
> -ALTERNATIVE_${PN} = "vi vim xxd"
> -ALTERNATIVE_PRIORITY = "100"
> -ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> -ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> -ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> -ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> -ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> -
> -BBCLASSEXTEND = "native"
> +require vim.inc
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008c281905891630bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>To simplify meta/re=
cipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb">vim-tiny_8.1.1240=
.bb</a>=C2=A0which currently has:</div><div><br></div><div>PROVIDES_remove =
=3D &quot;xxd&quot;</div><div>ALTERNATIVE_${PN}_remove =3D &quot;xxd&quot;<=
/div><div><br></div><div>Can you move xxd from the .inc file and put it onl=
y in <a href=3D"http://vim_8.1.1240.bb">vim_8.1.1240.bb</a>?</div><div><br>=
</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, May 17, 2019 at 3:53 PM Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Previously vim=
-tiny would include the vim recipe wholesale;<br>
this meant that they had to be upgraded in a single transaction<br>
which devtool cannot cope with. This thwarted the latest AUH<br>
run in particular.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a> |=C2=A0 =C2=A02 =
+-<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 141 +++++++++++++++++<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a>=C2=A0 =C2=A0 =C2=A0 | 142 +=
-----------------<br>
=C2=A03 files changed, 143 insertions(+), 142 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/vim/vim.inc<br>
<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.b=
b" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a> b/meta/rec=
ipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=3D"noreferrer"=
 target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
index 74464833adb..139e626e444 100644<br>
--- a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
@@ -1,4 +1,4 @@<br>
-require vim_${PV}.bb<br>
+require vim.inc<br>
<br>
=C2=A0SUMMARY +=3D &quot; (with tiny features)&quot;<br>
<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
new file mode 100644<br>
index 00000000000..f5c74684bfa<br>
--- /dev/null<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -0,0 +1,141 @@<br>
+SUMMARY =3D &quot;Vi IMproved - enhanced vi editor&quot;<br>
+SECTION =3D &quot;console/utils&quot;<br>
+<br>
+PROVIDES =3D &quot;xxd&quot;<br>
+DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
+# vimdiff doesn&#39;t like busybox diff<br>
+RSUGGESTS_${PN} =3D &quot;diffutils&quot;<br>
+LICENSE =3D &quot;vim&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Df1f82b42360005c70b8c19b0ef493f72&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/vim/vim.git</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_acl_header_check.p=
atch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vim-add-knob-whether-elf.h=
-are-checked.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-Makefile-improve-=
reproducibility.patch \<br>
+&quot;<br>
+SRCREV =3D &quot;d96dbd6f95ea22f609042cc9c6272f14a21ff1a5&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+VIMDIR =3D &quot;vim${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}${@d.g=
etVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br>
+<br>
+inherit autotools-brokensep update-alternatives<br>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
+<br>
+# vim <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a> contains functions which got &#39;dropped&#39; by autotoo=
ls.bbclass<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 cd src<br>
+=C2=A0 =C2=A0 rm -f auto/*<br>
+=C2=A0 =C2=A0 touch auto/<a href=3D"http://config.mk" rel=3D"noreferrer" t=
arget=3D"_blank">config.mk</a><br>
+=C2=A0 =C2=A0 aclocal<br>
+=C2=A0 =C2=A0 autoconf<br>
+=C2=A0 =C2=A0 cd ..<br>
+=C2=A0 =C2=A0 oe_runconf<br>
+=C2=A0 =C2=A0 touch src/auto/configure<br>
+=C2=A0 =C2=A0 touch src/auto/<a href=3D"http://config.mk" rel=3D"noreferre=
r" target=3D"_blank">config.mk</a> src/auto/config.h<br>
+}<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 # We do not support fully / correctly the following locales.=
=C2=A0 Attempting<br>
+=C2=A0 =C2=A0 # to use these with msgfmt in order to update the &quot;.des=
ktop&quot; files exposes<br>
+=C2=A0 =C2=A0 # this problem and leads to the compile failing.<br>
+=C2=A0 =C2=A0 for LOCALE in cs fr ko pl sk zh_CN zh_TW;do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &gt; src/po/${LOCALE}.po<br>
+=C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 autotools_do_compile<br>
+}<br>
+<br>
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;acl selin=
ux&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;x11 gtkgui&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[gtkgui] =3D &quot;--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+=
,&quot;<br>
+PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl,acl,&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;--with-x,--without-x,xt,&quot;<br>
+PACKAGECONFIG[tiny] =3D &quot;--with-features=3Dtiny,--with-features=3Dbig=
,,&quot;<br>
+PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,libsel=
inux,&quot;<br>
+PACKAGECONFIG[elfutils] =3D &quot;--enable-elf-check,,elfutils,&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 --disable-gpm \<br>
+=C2=A0 =C2=A0 --disable-gtktest \<br>
+=C2=A0 =C2=A0 --disable-xim \<br>
+=C2=A0 =C2=A0 --disable-netbeans \<br>
+=C2=A0 =C2=A0 --with-tlib=3Dncurses \<br>
+=C2=A0 =C2=A0 ac_cv_small_wchar_t=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_getcwd_broken=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_memmove_handles_overlap=3Dyes \<br>
+=C2=A0 =C2=A0 vim_cv_stat_ignores_slash=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_terminfo=3Dyes \<br>
+=C2=A0 =C2=A0 vim_cv_tgetent=3Dnon-zero \<br>
+=C2=A0 =C2=A0 vim_cv_toupper_broken=3Dno \<br>
+=C2=A0 =C2=A0 vim_cv_tty_group=3Dworld \<br>
+=C2=A0 =C2=A0 STRIP=3D/bin/true \<br>
+&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 autotools_do_install<br>
+<br>
+=C2=A0 =C2=A0 # Work around file-rdeps picking up csh, awk, perl or python=
 as a dep<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl<br>
+=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py<br>
+<br>
+=C2=A0 =C2=A0 # Install example vimrc from runtime files<br>
+=C2=A0 =C2=A0 install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${=
BPN}/vimrc<br>
+<br>
+=C2=A0 =C2=A0 # we use --with-features=3Dbig as default<br>
+=C2=A0 =C2=A0 mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}<br>
+<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&=
#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# The mouse being autoenabled is just annoying =
in xfce4-terminal (mouse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# drag make vim go into visual mode and there i=
s no right click menu),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# delete the block.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/the mouse works just fine/,+4d&#39=
; ${D}/${datadir}/${BPN}/vimrc<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+PARALLEL_MAKEINST =3D &quot;&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}=
-vimrc ${PN}-tools&quot;<br>
+FILES_${PN}-syntax =3D &quot;${datadir}/${BPN}/${VIMDIR}/syntax&quot;<br>
+FILES_${PN}-help =3D &quot;${datadir}/${BPN}/${VIMDIR}/doc&quot;<br>
+FILES_${PN}-tutor =3D &quot;${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${=
BPN}tutor&quot;<br>
+FILES_${PN}-vimrc =3D &quot;${datadir}/${BPN}/vimrc&quot;<br>
+FILES_${PN}-data =3D &quot;${datadir}/${BPN}&quot;<br>
+FILES_${PN}-tools =3D &quot;${datadir}/${BPN}/${VIMDIR}/tools&quot;<br>
+FILES_${PN}-common =3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/*.vim \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/autoload \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/colors \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/compiler \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/ftplugin \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/indent \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/keymap \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/lang \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/macros \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/plugin \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/print \<br>
+=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/spell \<br>
+=C2=A0 =C2=A0 ${datadir}/icons \<br>
+&quot;<br>
+<br>
+RDEPENDS_${BPN} =3D &quot;ncurses-terminfo-base&quot;<br>
+# Recommend that runtime data is installed along with vim<br>
+RRECOMMENDS_${BPN} =3D &quot;${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vim=
rc ${PN}-common&quot;<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;vi vim xxd&quot;<br>
+ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
+ALTERNATIVE_TARGET =3D &quot;${bindir}/${BPN}.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[vi] =3D &quot;${base_bindir}/vi&quot;<br>
+ALTERNATIVE_LINK_NAME[vim] =3D &quot;${bindir}/vim&quot;<br>
+ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br>
+ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" re=
l=3D"noreferrer" target=3D"_blank">vim_8.1.1240.bb</a> b/meta/recipes-suppo=
rt/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"noreferrer" target=3D"_bla=
nk">vim_8.1.1240.bb</a><br>
index f5c74684bfa..baaaacc0b77 100644<br>
--- a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a><br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a><br>
@@ -1,141 +1 @@<br>
-SUMMARY =3D &quot;Vi IMproved - enhanced vi editor&quot;<br>
-SECTION =3D &quot;console/utils&quot;<br>
-<br>
-PROVIDES =3D &quot;xxd&quot;<br>
-DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
-# vimdiff doesn&#39;t like busybox diff<br>
-RSUGGESTS_${PN} =3D &quot;diffutils&quot;<br>
-LICENSE =3D &quot;vim&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Df1f82b42360005c70b8c19b0ef493f72&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/vim/vim.git" rel=3D"n=
oreferrer" target=3D"_blank">github.com/vim/vim.git</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable_acl_header_check.p=
atch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://vim-add-knob-whether-elf.h=
-are-checked.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-Makefile-improve-=
reproducibility.patch \<br>
-&quot;<br>
-SRCREV =3D &quot;d96dbd6f95ea22f609042cc9c6272f14a21ff1a5&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-VIMDIR =3D &quot;vim${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}${@d.g=
etVar(&#39;PV&#39;).split(&#39;.&#39;)[1]}&quot;<br>
-<br>
-inherit autotools-brokensep update-alternatives<br>
-<br>
-CLEANBROKEN =3D &quot;1&quot;<br>
-<br>
-# vim <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a> contains functions which got &#39;dropped&#39; by autotoo=
ls.bbclass<br>
-do_configure () {<br>
-=C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 rm -f auto/*<br>
-=C2=A0 =C2=A0 touch auto/<a href=3D"http://config.mk" rel=3D"noreferrer" t=
arget=3D"_blank">config.mk</a><br>
-=C2=A0 =C2=A0 aclocal<br>
-=C2=A0 =C2=A0 autoconf<br>
-=C2=A0 =C2=A0 cd ..<br>
-=C2=A0 =C2=A0 oe_runconf<br>
-=C2=A0 =C2=A0 touch src/auto/configure<br>
-=C2=A0 =C2=A0 touch src/auto/<a href=3D"http://config.mk" rel=3D"noreferre=
r" target=3D"_blank">config.mk</a> src/auto/config.h<br>
-}<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 # We do not support fully / correctly the following locales.=
=C2=A0 Attempting<br>
-=C2=A0 =C2=A0 # to use these with msgfmt in order to update the &quot;.des=
ktop&quot; files exposes<br>
-=C2=A0 =C2=A0 # this problem and leads to the compile failing.<br>
-=C2=A0 =C2=A0 for LOCALE in cs fr ko pl sk zh_CN zh_TW;do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo -n &gt; src/po/${LOCALE}.po<br>
-=C2=A0 =C2=A0 done<br>
-=C2=A0 =C2=A0 autotools_do_compile<br>
-}<br>
-<br>
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;acl selin=
ux&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;x11 gtkgui&#39;, &#39;&#39;, d)} \<br>
-&quot;<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[gtkgui] =3D &quot;--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+=
,&quot;<br>
-PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl,acl,&quot;<br>
-PACKAGECONFIG[x11] =3D &quot;--with-x,--without-x,xt,&quot;<br>
-PACKAGECONFIG[tiny] =3D &quot;--with-features=3Dtiny,--with-features=3Dbig=
,,&quot;<br>
-PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-selinux,libsel=
inux,&quot;<br>
-PACKAGECONFIG[elfutils] =3D &quot;--enable-elf-check,,elfutils,&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot; \<br>
-=C2=A0 =C2=A0 --disable-gpm \<br>
-=C2=A0 =C2=A0 --disable-gtktest \<br>
-=C2=A0 =C2=A0 --disable-xim \<br>
-=C2=A0 =C2=A0 --disable-netbeans \<br>
-=C2=A0 =C2=A0 --with-tlib=3Dncurses \<br>
-=C2=A0 =C2=A0 ac_cv_small_wchar_t=3Dno \<br>
-=C2=A0 =C2=A0 vim_cv_getcwd_broken=3Dno \<br>
-=C2=A0 =C2=A0 vim_cv_memmove_handles_overlap=3Dyes \<br>
-=C2=A0 =C2=A0 vim_cv_stat_ignores_slash=3Dno \<br>
-=C2=A0 =C2=A0 vim_cv_terminfo=3Dyes \<br>
-=C2=A0 =C2=A0 vim_cv_tgetent=3Dnon-zero \<br>
-=C2=A0 =C2=A0 vim_cv_toupper_broken=3Dno \<br>
-=C2=A0 =C2=A0 vim_cv_tty_group=3Dworld \<br>
-=C2=A0 =C2=A0 STRIP=3D/bin/true \<br>
-&quot;<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 autotools_do_install<br>
-<br>
-=C2=A0 =C2=A0 # Work around file-rdeps picking up csh, awk, perl or python=
 as a dep<br>
-=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132<br>
-=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk<br>
-=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl<br>
-=C2=A0 =C2=A0 chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py<br>
-<br>
-=C2=A0 =C2=A0 # Install example vimrc from runtime files<br>
-=C2=A0 =C2=A0 install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${=
BPN}/vimrc<br>
-<br>
-=C2=A0 =C2=A0 # we use --with-features=3Dbig as default<br>
-=C2=A0 =C2=A0 mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}<br>
-<br>
-=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&=
#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# The mouse being autoenabled is just annoying =
in xfce4-terminal (mouse<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# drag make vim go into visual mode and there i=
s no right click menu),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# delete the block.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/the mouse works just fine/,+4d&#39=
; ${D}/${datadir}/${BPN}/vimrc<br>
-=C2=A0 =C2=A0 fi<br>
-}<br>
-<br>
-PARALLEL_MAKEINST =3D &quot;&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}=
-vimrc ${PN}-tools&quot;<br>
-FILES_${PN}-syntax =3D &quot;${datadir}/${BPN}/${VIMDIR}/syntax&quot;<br>
-FILES_${PN}-help =3D &quot;${datadir}/${BPN}/${VIMDIR}/doc&quot;<br>
-FILES_${PN}-tutor =3D &quot;${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${=
BPN}tutor&quot;<br>
-FILES_${PN}-vimrc =3D &quot;${datadir}/${BPN}/vimrc&quot;<br>
-FILES_${PN}-data =3D &quot;${datadir}/${BPN}&quot;<br>
-FILES_${PN}-tools =3D &quot;${datadir}/${BPN}/${VIMDIR}/tools&quot;<br>
-FILES_${PN}-common =3D &quot; \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/*.vim \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/autoload \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/colors \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/compiler \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/ftplugin \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/indent \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/keymap \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/lang \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/macros \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/plugin \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/print \<br>
-=C2=A0 =C2=A0 ${datadir}/${BPN}/${VIMDIR}/spell \<br>
-=C2=A0 =C2=A0 ${datadir}/icons \<br>
-&quot;<br>
-<br>
-RDEPENDS_${BPN} =3D &quot;ncurses-terminfo-base&quot;<br>
-# Recommend that runtime data is installed along with vim<br>
-RRECOMMENDS_${BPN} =3D &quot;${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vim=
rc ${PN}-common&quot;<br>
-<br>
-ALTERNATIVE_${PN} =3D &quot;vi vim xxd&quot;<br>
-ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
-ALTERNATIVE_TARGET =3D &quot;${bindir}/${BPN}.${BPN}&quot;<br>
-ALTERNATIVE_LINK_NAME[vi] =3D &quot;${base_bindir}/vi&quot;<br>
-ALTERNATIVE_LINK_NAME[vim] =3D &quot;${bindir}/vim&quot;<br>
-ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br>
-ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
+require vim.inc<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000008c281905891630bf--

Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42A197D69D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 14:46:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 198so9360605wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dS+5aYLt1aMaFk1qAtg0uGS/msGysy5aDJIhnmJ1xcg=;
	b=ElglESNK6DvjTeHMr7XTVWstVHXJpJbOsw18tDms7fqV3GlD201sV2FROynBKS2TFG
	qSCEoujcuLvRqX3pRre8MYwxcegpPvHqEksKOKT7eqjIC+QLquBe3hvFyq4y3dzhnydx
	TGFpd6naV3wsfA7M6AklBY35p/Vgd/RHltIByqSXrhuenZXVNjraFJ5i2HzV0h9yWel8
	U7DGEqhnx0Q3XFv6tUdL7Rk/dvcRhGNVetEbnXqORhcIku4c68lh74+6DPWFmDYPav65
	pvAT4Hlq0YDKKshEU3CuGt8NElfLxwqYmR8+B+bcolQCRD+WNvYnUnh01A5Q72ufI9UN
	hb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dS+5aYLt1aMaFk1qAtg0uGS/msGysy5aDJIhnmJ1xcg=;
	b=BnMrCwYubMHvaWYIC9bS2Wwgi/aEifyNNtQ8krtJXZ/7A2+VSQabSp3H5qpnpa3d0q
	JPyXx4XT0OJ42gctarJ3PEJV2mQCH7JK1EnLfrNdqWjir7dYaNPXaYcbPpNSaPnKi//1
	YMiU9JL0e0dLuHQdo8qKurVIbeB+MawzgWipsbDZWOcRLs3lTF+GCwpkkP/p4vjRLN7y
	LZQeV7qY0xrhohpq4K+D1CKnI02ShwPMJlWVwsoyIGEWKedh2RN3YwAYZ9V1fzAk1i3F
	ABW4lfBO2BDFCtS6T2IvN8dV4Fger+biwVPE6oYoF3X44vYmLVYB/YeENpsbHy1WpPWQ
	McSw==
X-Gm-Message-State: APjAAAXc+ubROt2MefHPmutMq3XZHgVYuctjg7ombWN/5F+oLHhuMQC5
	hTZ9CCpp+NcC0xW+/B1PSNk=
X-Google-Smtp-Source: APXvYqyGxZetJM8boZTKdpscpALRsOhJOtB1hy5QX3fxHYvBroJt8lma7ltkusK/Qa9Y1z5nYl+cLQ==
X-Received: by 2002:a7b:cc12:: with SMTP id f18mr4449415wmh.40.1558190764100; 
	Sat, 18 May 2019 07:46:04 -0700 (PDT)
Received: from ?IPv6:2a01:598:b009:c60f:a50e:7a8a:3325:b3b6?
	([2a01:598:b009:c60f:a50e:7a8a:3325:b3b6])
	by smtp.gmail.com with ESMTPSA id
	91sm16418830wrs.43.2019.05.18.07.46.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 07:46:03 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <20190518113554.GJ22232@bill-the-cat>
Date: Sat, 18 May 2019 16:46:02 +0200
Message-Id: <4E84754A-85CA-499E-94E8-129487164F15@gmail.com>
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<CA+chaQd2qTqLDpNsvHY1q8MBnnXduMZhapj0S_njo73rHgOBUA@mail.gmail.com>
	<CA+chaQcOHXLusqEgMc78w4Hd3jB=ykt2wd8mxiMF3LZXSgEfLg@mail.gmail.com>
	<CANNYZj-8GjgDdbczLDhXajzuAiYYNpAbSZg-_xPxcMPd=nVjSw@mail.gmail.com>
	<20190518113554.GJ22232@bill-the-cat>
To: Tom Rini <trini@konsulko.com>
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
X-List-Received-Date: Sat, 18 May 2019 14:46:04 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

There is no hard rule here, maybe a follow up is simpler.

Alex

> On 18 May 2019, at 13.35, Tom Rini <trini@konsulko.com> wrote:
>=20
>> On Fri, May 17, 2019 at 04:34:14PM +0200, Alexander Kanavin wrote:
>>=20
>> This is up to the recipe maintainer (Tom) to do; I only want to ensure
>> AUH does not choke on the recipe.
>=20
> What's proper etiquette here?  Shall I grab, v2 and include Martin's
> suggestions, or follow-up and Suggested-by them?  Thanks!
>=20
>>=20
>> Alex
>>=20
>>> On Fri, 17 May 2019 at 16:29, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>>>=20
>>> Actually the BBCLASSEXTEND =3D "native" as well, as we don't need both v=
im recipes to provide xxd-native.
>>>=20
>>>> On Fri, May 17, 2019 at 4:27 PM Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>>>=20
>>>> To simplify meta/recipes-support/vim/vim-tiny_8.1.1240.bb which current=
ly has:
>>>>=20
>>>> PROVIDES_remove =3D "xxd"
>>>> ALTERNATIVE_${PN}_remove =3D "xxd"
>>>>=20
>>>> Can you move xxd from the .inc file and put it only in vim_8.1.1240.bb?=

>>>>=20
>>>>=20
>>>>> On Fri, May 17, 2019 at 3:53 PM Alexander Kanavin <alex.kanavin@gmail.=
com> wrote:
>>>>>=20
>>>>> Previously vim-tiny would include the vim recipe wholesale;
>>>>> this meant that they had to be upgraded in a single transaction
>>>>> which devtool cannot cope with. This thwarted the latest AUH
>>>>> run in particular.
>>>>>=20
>>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>> ---
>>>>> meta/recipes-support/vim/vim-tiny_8.1.1240.bb |   2 +-
>>>>> meta/recipes-support/vim/vim.inc              | 141 +++++++++++++++++
>>>>> meta/recipes-support/vim/vim_8.1.1240.bb      | 142 +-----------------=

>>>>> 3 files changed, 143 insertions(+), 142 deletions(-)
>>>>> create mode 100644 meta/recipes-support/vim/vim.inc
>>>>>=20
>>>>> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/reci=
pes-support/vim/vim-tiny_8.1.1240.bb
>>>>> index 74464833adb..139e626e444 100644
>>>>> --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>>>>> +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>>>>> @@ -1,4 +1,4 @@
>>>>> -require vim_${PV}.bb
>>>>> +require vim.inc
>>>>>=20
>>>>> SUMMARY +=3D " (with tiny features)"
>>>>>=20
>>>>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/v=
im/vim.inc
>>>>> new file mode 100644
>>>>> index 00000000000..f5c74684bfa
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-support/vim/vim.inc
>>>>> @@ -0,0 +1,141 @@
>>>>> +SUMMARY =3D "Vi IMproved - enhanced vi editor"
>>>>> +SECTION =3D "console/utils"
>>>>> +
>>>>> +PROVIDES =3D "xxd"
>>>>> +DEPENDS =3D "ncurses gettext-native"
>>>>> +# vimdiff doesn't like busybox diff
>>>>> +RSUGGESTS_${PN} =3D "diffutils"
>>>>> +LICENSE =3D "vim"
>>>>> +LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Df1f82b42360005c70b8c19b0ef493f72"
>>>>> +
>>>>> +SRC_URI =3D "git://github.com/vim/vim.git \
>>>>> +           file://disable_acl_header_check.patch \
>>>>> +           file://vim-add-knob-whether-elf.h-are-checked.patch \
>>>>> +           file://0001-src-Makefile-improve-reproducibility.patch \
>>>>> +"
>>>>> +SRCREV =3D "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
>>>>> +
>>>>> +S =3D "${WORKDIR}/git"
>>>>> +
>>>>> +VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').spli=
t('.')[1]}"
>>>>> +
>>>>> +inherit autotools-brokensep update-alternatives
>>>>> +
>>>>> +CLEANBROKEN =3D "1"
>>>>> +
>>>>> +# vim configure.in contains functions which got 'dropped' by autotool=
s.bbclass
>>>>> +do_configure () {
>>>>> +    cd src
>>>>> +    rm -f auto/*
>>>>> +    touch auto/config.mk
>>>>> +    aclocal
>>>>> +    autoconf
>>>>> +    cd ..
>>>>> +    oe_runconf
>>>>> +    touch src/auto/configure
>>>>> +    touch src/auto/config.mk src/auto/config.h
>>>>> +}
>>>>> +
>>>>> +do_compile() {
>>>>> +    # We do not support fully / correctly the following locales.  Att=
empting
>>>>> +    # to use these with msgfmt in order to update the ".desktop" file=
s exposes
>>>>> +    # this problem and leads to the compile failing.
>>>>> +    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
>>>>> +        echo -n > src/po/${LOCALE}.po
>>>>> +    done
>>>>> +    autotools_do_compile
>>>>> +}
>>>>> +
>>>>> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>>>>> +PACKAGECONFIG ??=3D ""
>>>>> +PACKAGECONFIG +=3D " \
>>>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>>>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d=
)} \
>>>>> +"
>>>>> +PACKAGECONFIG_class-native =3D ""
>>>>> +
>>>>> +PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+=
,"
>>>>> +PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
>>>>> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
>>>>> +PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig=
,,"
>>>>> +PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libsel=
inux,"
>>>>> +PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
>>>>> +
>>>>> +EXTRA_OECONF =3D " \
>>>>> +    --disable-gpm \
>>>>> +    --disable-gtktest \
>>>>> +    --disable-xim \
>>>>> +    --disable-netbeans \
>>>>> +    --with-tlib=3Dncurses \
>>>>> +    ac_cv_small_wchar_t=3Dno \
>>>>> +    vim_cv_getcwd_broken=3Dno \
>>>>> +    vim_cv_memmove_handles_overlap=3Dyes \
>>>>> +    vim_cv_stat_ignores_slash=3Dno \
>>>>> +    vim_cv_terminfo=3Dyes \
>>>>> +    vim_cv_tgetent=3Dnon-zero \
>>>>> +    vim_cv_toupper_broken=3Dno \
>>>>> +    vim_cv_tty_group=3Dworld \
>>>>> +    STRIP=3D/bin/true \
>>>>> +"
>>>>> +
>>>>> +do_install() {
>>>>> +    autotools_do_install
>>>>> +
>>>>> +    # Work around file-rdeps picking up csh, awk, perl or python as a=
 dep
>>>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>>>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>>>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>>>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>>>>> +
>>>>> +    # Install example vimrc from runtime files
>>>>> +    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/=
vimrc
>>>>> +
>>>>> +    # we use --with-features=3Dbig as default
>>>>> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>>>>> +
>>>>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false'=
, d)}; then
>>>>> +       # The mouse being autoenabled is just annoying in xfce4-termin=
al (mouse
>>>>> +       # drag make vim go into visual mode and there is no right clic=
k menu),
>>>>> +       # delete the block.
>>>>> +       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN=
}/vimrc
>>>>> +    fi
>>>>> +}
>>>>> +
>>>>> +PARALLEL_MAKEINST =3D ""
>>>>> +
>>>>> +PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}=
-vimrc ${PN}-tools"
>>>>> +FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
>>>>> +FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
>>>>> +FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${=
BPN}tutor"
>>>>> +FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
>>>>> +FILES_${PN}-data =3D "${datadir}/${BPN}"
>>>>> +FILES_${PN}-tools =3D "${datadir}/${BPN}/${VIMDIR}/tools"
>>>>> +FILES_${PN}-common =3D " \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/colors \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/indent \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/lang \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/macros \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/print \
>>>>> +    ${datadir}/${BPN}/${VIMDIR}/spell \
>>>>> +    ${datadir}/icons \
>>>>> +"
>>>>> +
>>>>> +RDEPENDS_${BPN} =3D "ncurses-terminfo-base"
>>>>> +# Recommend that runtime data is installed along with vim
>>>>> +RRECOMMENDS_${BPN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vim=
rc ${PN}-common"
>>>>> +
>>>>> +ALTERNATIVE_${PN} =3D "vi vim xxd"
>>>>> +ALTERNATIVE_PRIORITY =3D "100"
>>>>> +ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
>>>>> +ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
>>>>> +ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
>>>>> +ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
>>>>> +ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>>>>> +
>>>>> +BBCLASSEXTEND =3D "native"
>>>>> diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-s=
upport/vim/vim_8.1.1240.bb
>>>>> index f5c74684bfa..baaaacc0b77 100644
>>>>> --- a/meta/recipes-support/vim/vim_8.1.1240.bb
>>>>> +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
>>>>> @@ -1,141 +1 @@
>>>>> -SUMMARY =3D "Vi IMproved - enhanced vi editor"
>>>>> -SECTION =3D "console/utils"
>>>>> -
>>>>> -PROVIDES =3D "xxd"
>>>>> -DEPENDS =3D "ncurses gettext-native"
>>>>> -# vimdiff doesn't like busybox diff
>>>>> -RSUGGESTS_${PN} =3D "diffutils"
>>>>> -LICENSE =3D "vim"
>>>>> -LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=
=3Df1f82b42360005c70b8c19b0ef493f72"
>>>>> -
>>>>> -SRC_URI =3D "git://github.com/vim/vim.git \
>>>>> -           file://disable_acl_header_check.patch \
>>>>> -           file://vim-add-knob-whether-elf.h-are-checked.patch \
>>>>> -           file://0001-src-Makefile-improve-reproducibility.patch \
>>>>> -"
>>>>> -SRCREV =3D "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
>>>>> -
>>>>> -S =3D "${WORKDIR}/git"
>>>>> -
>>>>> -VIMDIR =3D "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').spli=
t('.')[1]}"
>>>>> -
>>>>> -inherit autotools-brokensep update-alternatives
>>>>> -
>>>>> -CLEANBROKEN =3D "1"
>>>>> -
>>>>> -# vim configure.in contains functions which got 'dropped' by autotool=
s.bbclass
>>>>> -do_configure () {
>>>>> -    cd src
>>>>> -    rm -f auto/*
>>>>> -    touch auto/config.mk
>>>>> -    aclocal
>>>>> -    autoconf
>>>>> -    cd ..
>>>>> -    oe_runconf
>>>>> -    touch src/auto/configure
>>>>> -    touch src/auto/config.mk src/auto/config.h
>>>>> -}
>>>>> -
>>>>> -do_compile() {
>>>>> -    # We do not support fully / correctly the following locales.  Att=
empting
>>>>> -    # to use these with msgfmt in order to update the ".desktop" file=
s exposes
>>>>> -    # this problem and leads to the compile failing.
>>>>> -    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
>>>>> -        echo -n > src/po/${LOCALE}.po
>>>>> -    done
>>>>> -    autotools_do_compile
>>>>> -}
>>>>> -
>>>>> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>>>>> -PACKAGECONFIG ??=3D ""
>>>>> -PACKAGECONFIG +=3D " \
>>>>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>>>>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d=
)} \
>>>>> -"
>>>>> -PACKAGECONFIG_class-native =3D ""
>>>>> -
>>>>> -PACKAGECONFIG[gtkgui] =3D "--enable-gui=3Dgtk2,--enable-gui=3Dno,gtk+=
,"
>>>>> -PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"
>>>>> -PACKAGECONFIG[x11] =3D "--with-x,--without-x,xt,"
>>>>> -PACKAGECONFIG[tiny] =3D "--with-features=3Dtiny,--with-features=3Dbig=
,,"
>>>>> -PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libsel=
inux,"
>>>>> -PACKAGECONFIG[elfutils] =3D "--enable-elf-check,,elfutils,"
>>>>> -
>>>>> -EXTRA_OECONF =3D " \
>>>>> -    --disable-gpm \
>>>>> -    --disable-gtktest \
>>>>> -    --disable-xim \
>>>>> -    --disable-netbeans \
>>>>> -    --with-tlib=3Dncurses \
>>>>> -    ac_cv_small_wchar_t=3Dno \
>>>>> -    vim_cv_getcwd_broken=3Dno \
>>>>> -    vim_cv_memmove_handles_overlap=3Dyes \
>>>>> -    vim_cv_stat_ignores_slash=3Dno \
>>>>> -    vim_cv_terminfo=3Dyes \
>>>>> -    vim_cv_tgetent=3Dnon-zero \
>>>>> -    vim_cv_toupper_broken=3Dno \
>>>>> -    vim_cv_tty_group=3Dworld \
>>>>> -    STRIP=3D/bin/true \
>>>>> -"
>>>>> -
>>>>> -do_install() {
>>>>> -    autotools_do_install
>>>>> -
>>>>> -    # Work around file-rdeps picking up csh, awk, perl or python as a=
 dep
>>>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>>>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>>>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>>>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>>>>> -
>>>>> -    # Install example vimrc from runtime files
>>>>> -    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/=
vimrc
>>>>> -
>>>>> -    # we use --with-features=3Dbig as default
>>>>> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>>>>> -
>>>>> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false'=
, d)}; then
>>>>> -       # The mouse being autoenabled is just annoying in xfce4-termin=
al (mouse
>>>>> -       # drag make vim go into visual mode and there is no right clic=
k menu),
>>>>> -       # delete the block.
>>>>> -       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN=
}/vimrc
>>>>> -    fi
>>>>> -}
>>>>> -
>>>>> -PARALLEL_MAKEINST =3D ""
>>>>> -
>>>>> -PACKAGES =3D+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}=
-vimrc ${PN}-tools"
>>>>> -FILES_${PN}-syntax =3D "${datadir}/${BPN}/${VIMDIR}/syntax"
>>>>> -FILES_${PN}-help =3D "${datadir}/${BPN}/${VIMDIR}/doc"
>>>>> -FILES_${PN}-tutor =3D "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${=
BPN}tutor"
>>>>> -FILES_${PN}-vimrc =3D "${datadir}/${BPN}/vimrc"
>>>>> -FILES_${PN}-data =3D "${datadir}/${BPN}"
>>>>> -FILES_${PN}-tools =3D "${datadir}/${BPN}/${VIMDIR}/tools"
>>>>> -FILES_${PN}-common =3D " \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/colors \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/indent \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/lang \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/macros \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/print \
>>>>> -    ${datadir}/${BPN}/${VIMDIR}/spell \
>>>>> -    ${datadir}/icons \
>>>>> -"
>>>>> -
>>>>> -RDEPENDS_${BPN} =3D "ncurses-terminfo-base"
>>>>> -# Recommend that runtime data is installed along with vim
>>>>> -RRECOMMENDS_${BPN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vim=
rc ${PN}-common"
>>>>> -
>>>>> -ALTERNATIVE_${PN} =3D "vi vim xxd"
>>>>> -ALTERNATIVE_PRIORITY =3D "100"
>>>>> -ALTERNATIVE_TARGET =3D "${bindir}/${BPN}.${BPN}"
>>>>> -ALTERNATIVE_LINK_NAME[vi] =3D "${base_bindir}/vi"
>>>>> -ALTERNATIVE_LINK_NAME[vim] =3D "${bindir}/vim"
>>>>> -ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
>>>>> -ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
>>>>> -
>>>>> -BBCLASSEXTEND =3D "native"
>>>>> +require vim.inc
>>>>> --
>>>>> 2.17.1
>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Tom


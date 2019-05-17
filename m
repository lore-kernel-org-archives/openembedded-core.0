Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 34D897D2FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 14:34:24 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c3so6927459otr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2ZDDbdUD6YymrngP8LJLLSgvhN9f+NntRccwNdBEtoI=;
	b=q6ZyUN3AbxQo4xMtOUAVAoR5kLPjz/jdgx+mvSkHbc1Hi6AyYpWiAwK59ci/DlzxzB
	dzp03zecVH/qND4zMQRkTZszZMolHeUpf+ZWruMi2FaI9UeoFNx5V/evk7f+huwagBpj
	ACG3BaJkKxV8Jegr+maqqZ1uC88byx4AW0ZD9/lVfNgMu1UMoBljjAU7/juRVfjf5692
	6td5xPc1v0hvVBL7cOO7UooSVn87G00DN731McC0NcVu+4kXofmmvmGntLTBHHm9gupC
	pnpotExgyC/mp1d+ZFs/MvYPtJG7MZga9YKSi5Od4HmTUoeA8IxyQCt21F4Re4Ywlwa8
	9Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2ZDDbdUD6YymrngP8LJLLSgvhN9f+NntRccwNdBEtoI=;
	b=K/Qmdwh4Q02//UuxFipIy7oRBcV2he0H8DPrKwXBIMIxQ5JsHL55KkDB39mcbSrG2y
	9uZuyzyBcMoBkgjnR7z/Tkm8+aaU9qHBvRyKuMusWnKBmTeP67qXjrpBSi31BPjkg6SJ
	CsemC/nlatQU2ANg4A3ykgk7zrT0Av2BxHMa023Vxl0gLJEcpruM7nv06MIUiTw4T1HM
	QYEQwe0UG306FUxh5eLBUftA/DCXmpoQDQ2P1l/YoXoEjAOo+257R8OQy2GvHxq+FdRo
	FrL2TP6Y/4r/Dgp12OD24pff59JvuwlkM8hO3KYNVEBHenLHz00QzqafqnNsXa9wm7Jy
	46uQ==
X-Gm-Message-State: APjAAAUEMu8xxYa/l4DL89aEYu3xMktWxmZruVJp0gKAOvhe348M+Qqx
	l28mZusvuGRh/shDd4p0/OQylA1scedTWIoXak4R1Q==
X-Google-Smtp-Source: APXvYqwI+MvQjAR8Q3pUKVxLf8erquWmZSaxALPM3ZwubrDGXov0ktZi5a+FYV0WoppO+mqRvsnBxnKKVB1i+en6EA0=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr8642764otn.167.1558103664992; 
	Fri, 17 May 2019 07:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<CA+chaQd2qTqLDpNsvHY1q8MBnnXduMZhapj0S_njo73rHgOBUA@mail.gmail.com>
	<CA+chaQcOHXLusqEgMc78w4Hd3jB=ykt2wd8mxiMF3LZXSgEfLg@mail.gmail.com>
In-Reply-To: <CA+chaQcOHXLusqEgMc78w4Hd3jB=ykt2wd8mxiMF3LZXSgEfLg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 16:34:14 +0200
Message-ID: <CANNYZj-8GjgDdbczLDhXajzuAiYYNpAbSZg-_xPxcMPd=nVjSw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Tom Rini <trini@konsulko.com>
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
X-List-Received-Date: Fri, 17 May 2019 14:34:24 -0000
Content-Type: text/plain; charset="UTF-8"

This is up to the recipe maintainer (Tom) to do; I only want to ensure
AUH does not choke on the recipe.

Alex

On Fri, 17 May 2019 at 16:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Actually the BBCLASSEXTEND = "native" as well, as we don't need both vim recipes to provide xxd-native.
>
> On Fri, May 17, 2019 at 4:27 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> To simplify meta/recipes-support/vim/vim-tiny_8.1.1240.bb which currently has:
>>
>> PROVIDES_remove = "xxd"
>> ALTERNATIVE_${PN}_remove = "xxd"
>>
>> Can you move xxd from the .inc file and put it only in vim_8.1.1240.bb?
>>
>>
>> On Fri, May 17, 2019 at 3:53 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> Previously vim-tiny would include the vim recipe wholesale;
>>> this meant that they had to be upgraded in a single transaction
>>> which devtool cannot cope with. This thwarted the latest AUH
>>> run in particular.
>>>
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>  meta/recipes-support/vim/vim-tiny_8.1.1240.bb |   2 +-
>>>  meta/recipes-support/vim/vim.inc              | 141 +++++++++++++++++
>>>  meta/recipes-support/vim/vim_8.1.1240.bb      | 142 +-----------------
>>>  3 files changed, 143 insertions(+), 142 deletions(-)
>>>  create mode 100644 meta/recipes-support/vim/vim.inc
>>>
>>> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>>> index 74464833adb..139e626e444 100644
>>> --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>>> +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
>>> @@ -1,4 +1,4 @@
>>> -require vim_${PV}.bb
>>> +require vim.inc
>>>
>>>  SUMMARY += " (with tiny features)"
>>>
>>> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
>>> new file mode 100644
>>> index 00000000000..f5c74684bfa
>>> --- /dev/null
>>> +++ b/meta/recipes-support/vim/vim.inc
>>> @@ -0,0 +1,141 @@
>>> +SUMMARY = "Vi IMproved - enhanced vi editor"
>>> +SECTION = "console/utils"
>>> +
>>> +PROVIDES = "xxd"
>>> +DEPENDS = "ncurses gettext-native"
>>> +# vimdiff doesn't like busybox diff
>>> +RSUGGESTS_${PN} = "diffutils"
>>> +LICENSE = "vim"
>>> +LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
>>> +
>>> +SRC_URI = "git://github.com/vim/vim.git \
>>> +           file://disable_acl_header_check.patch \
>>> +           file://vim-add-knob-whether-elf.h-are-checked.patch \
>>> +           file://0001-src-Makefile-improve-reproducibility.patch \
>>> +"
>>> +SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
>>> +
>>> +inherit autotools-brokensep update-alternatives
>>> +
>>> +CLEANBROKEN = "1"
>>> +
>>> +# vim configure.in contains functions which got 'dropped' by autotools.bbclass
>>> +do_configure () {
>>> +    cd src
>>> +    rm -f auto/*
>>> +    touch auto/config.mk
>>> +    aclocal
>>> +    autoconf
>>> +    cd ..
>>> +    oe_runconf
>>> +    touch src/auto/configure
>>> +    touch src/auto/config.mk src/auto/config.h
>>> +}
>>> +
>>> +do_compile() {
>>> +    # We do not support fully / correctly the following locales.  Attempting
>>> +    # to use these with msgfmt in order to update the ".desktop" files exposes
>>> +    # this problem and leads to the compile failing.
>>> +    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
>>> +        echo -n > src/po/${LOCALE}.po
>>> +    done
>>> +    autotools_do_compile
>>> +}
>>> +
>>> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>>> +PACKAGECONFIG ??= ""
>>> +PACKAGECONFIG += " \
>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
>>> +"
>>> +PACKAGECONFIG_class-native = ""
>>> +
>>> +PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
>>> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>>> +PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
>>> +PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
>>> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
>>> +PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
>>> +
>>> +EXTRA_OECONF = " \
>>> +    --disable-gpm \
>>> +    --disable-gtktest \
>>> +    --disable-xim \
>>> +    --disable-netbeans \
>>> +    --with-tlib=ncurses \
>>> +    ac_cv_small_wchar_t=no \
>>> +    vim_cv_getcwd_broken=no \
>>> +    vim_cv_memmove_handles_overlap=yes \
>>> +    vim_cv_stat_ignores_slash=no \
>>> +    vim_cv_terminfo=yes \
>>> +    vim_cv_tgetent=non-zero \
>>> +    vim_cv_toupper_broken=no \
>>> +    vim_cv_tty_group=world \
>>> +    STRIP=/bin/true \
>>> +"
>>> +
>>> +do_install() {
>>> +    autotools_do_install
>>> +
>>> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>>> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>>> +
>>> +    # Install example vimrc from runtime files
>>> +    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>>> +
>>> +    # we use --with-features=big as default
>>> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>>> +
>>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
>>> +       # The mouse being autoenabled is just annoying in xfce4-terminal (mouse
>>> +       # drag make vim go into visual mode and there is no right click menu),
>>> +       # delete the block.
>>> +       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
>>> +    fi
>>> +}
>>> +
>>> +PARALLEL_MAKEINST = ""
>>> +
>>> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
>>> +FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
>>> +FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>>> +FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>>> +FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>>> +FILES_${PN}-data = "${datadir}/${BPN}"
>>> +FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
>>> +FILES_${PN}-common = " \
>>> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>>> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
>>> +    ${datadir}/${BPN}/${VIMDIR}/colors \
>>> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
>>> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>>> +    ${datadir}/${BPN}/${VIMDIR}/indent \
>>> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
>>> +    ${datadir}/${BPN}/${VIMDIR}/lang \
>>> +    ${datadir}/${BPN}/${VIMDIR}/macros \
>>> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
>>> +    ${datadir}/${BPN}/${VIMDIR}/print \
>>> +    ${datadir}/${BPN}/${VIMDIR}/spell \
>>> +    ${datadir}/icons \
>>> +"
>>> +
>>> +RDEPENDS_${BPN} = "ncurses-terminfo-base"
>>> +# Recommend that runtime data is installed along with vim
>>> +RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
>>> +
>>> +ALTERNATIVE_${PN} = "vi vim xxd"
>>> +ALTERNATIVE_PRIORITY = "100"
>>> +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
>>> +ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
>>> +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
>>> +ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
>>> +ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
>>> +
>>> +BBCLASSEXTEND = "native"
>>> diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-support/vim/vim_8.1.1240.bb
>>> index f5c74684bfa..baaaacc0b77 100644
>>> --- a/meta/recipes-support/vim/vim_8.1.1240.bb
>>> +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
>>> @@ -1,141 +1 @@
>>> -SUMMARY = "Vi IMproved - enhanced vi editor"
>>> -SECTION = "console/utils"
>>> -
>>> -PROVIDES = "xxd"
>>> -DEPENDS = "ncurses gettext-native"
>>> -# vimdiff doesn't like busybox diff
>>> -RSUGGESTS_${PN} = "diffutils"
>>> -LICENSE = "vim"
>>> -LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
>>> -
>>> -SRC_URI = "git://github.com/vim/vim.git \
>>> -           file://disable_acl_header_check.patch \
>>> -           file://vim-add-knob-whether-elf.h-are-checked.patch \
>>> -           file://0001-src-Makefile-improve-reproducibility.patch \
>>> -"
>>> -SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
>>> -
>>> -S = "${WORKDIR}/git"
>>> -
>>> -VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
>>> -
>>> -inherit autotools-brokensep update-alternatives
>>> -
>>> -CLEANBROKEN = "1"
>>> -
>>> -# vim configure.in contains functions which got 'dropped' by autotools.bbclass
>>> -do_configure () {
>>> -    cd src
>>> -    rm -f auto/*
>>> -    touch auto/config.mk
>>> -    aclocal
>>> -    autoconf
>>> -    cd ..
>>> -    oe_runconf
>>> -    touch src/auto/configure
>>> -    touch src/auto/config.mk src/auto/config.h
>>> -}
>>> -
>>> -do_compile() {
>>> -    # We do not support fully / correctly the following locales.  Attempting
>>> -    # to use these with msgfmt in order to update the ".desktop" files exposes
>>> -    # this problem and leads to the compile failing.
>>> -    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
>>> -        echo -n > src/po/${LOCALE}.po
>>> -    done
>>> -    autotools_do_compile
>>> -}
>>> -
>>> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
>>> -PACKAGECONFIG ??= ""
>>> -PACKAGECONFIG += " \
>>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
>>> -"
>>> -PACKAGECONFIG_class-native = ""
>>> -
>>> -PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
>>> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>>> -PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
>>> -PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
>>> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
>>> -PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
>>> -
>>> -EXTRA_OECONF = " \
>>> -    --disable-gpm \
>>> -    --disable-gtktest \
>>> -    --disable-xim \
>>> -    --disable-netbeans \
>>> -    --with-tlib=ncurses \
>>> -    ac_cv_small_wchar_t=no \
>>> -    vim_cv_getcwd_broken=no \
>>> -    vim_cv_memmove_handles_overlap=yes \
>>> -    vim_cv_stat_ignores_slash=no \
>>> -    vim_cv_terminfo=yes \
>>> -    vim_cv_tgetent=non-zero \
>>> -    vim_cv_toupper_broken=no \
>>> -    vim_cv_tty_group=world \
>>> -    STRIP=/bin/true \
>>> -"
>>> -
>>> -do_install() {
>>> -    autotools_do_install
>>> -
>>> -    # Work around file-rdeps picking up csh, awk, perl or python as a dep
>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
>>> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
>>> -
>>> -    # Install example vimrc from runtime files
>>> -    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
>>> -
>>> -    # we use --with-features=big as default
>>> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
>>> -
>>> -    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
>>> -       # The mouse being autoenabled is just annoying in xfce4-terminal (mouse
>>> -       # drag make vim go into visual mode and there is no right click menu),
>>> -       # delete the block.
>>> -       sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
>>> -    fi
>>> -}
>>> -
>>> -PARALLEL_MAKEINST = ""
>>> -
>>> -PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
>>> -FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
>>> -FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
>>> -FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
>>> -FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
>>> -FILES_${PN}-data = "${datadir}/${BPN}"
>>> -FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
>>> -FILES_${PN}-common = " \
>>> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
>>> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
>>> -    ${datadir}/${BPN}/${VIMDIR}/colors \
>>> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
>>> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
>>> -    ${datadir}/${BPN}/${VIMDIR}/indent \
>>> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
>>> -    ${datadir}/${BPN}/${VIMDIR}/lang \
>>> -    ${datadir}/${BPN}/${VIMDIR}/macros \
>>> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
>>> -    ${datadir}/${BPN}/${VIMDIR}/print \
>>> -    ${datadir}/${BPN}/${VIMDIR}/spell \
>>> -    ${datadir}/icons \
>>> -"
>>> -
>>> -RDEPENDS_${BPN} = "ncurses-terminfo-base"
>>> -# Recommend that runtime data is installed along with vim
>>> -RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
>>> -
>>> -ALTERNATIVE_${PN} = "vi vim xxd"
>>> -ALTERNATIVE_PRIORITY = "100"
>>> -ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
>>> -ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
>>> -ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
>>> -ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
>>> -ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
>>> -
>>> -BBCLASSEXTEND = "native"
>>> +require vim.inc
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


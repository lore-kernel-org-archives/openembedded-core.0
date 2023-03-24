Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB18DC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 08:43:25 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.96647.1679647402554564500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 01:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iB91zqOQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id ew6so4862664edb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 01:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679647401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdOt/IVg86nhFMsqq7RF3fYF7DFLEndpzkq9QO3Rd3w=;
        b=iB91zqOQoRXc0k880sLvIRO7nLNldP4u1XQ2BYA8MTHk2b+ciSVUJhBJ7d0oHNRY2H
         P48tjCwMSMz9dD5oXbkkWiDbTVM9CxJe+AvObAHibbTwUrtr7IVY5nsJXEwwTmr4h8S6
         46gdFopGIsPVIv91tGAUy9cpqX4iND5MKXIyecU+pbPllNslkEKG+gEcCkhwgOk6SNwI
         QG2GEmWWfYCRCBV2KGJuQfticQODs3+nwrFb41+0JEjQucrATpFao4T2+vMZMl4HW12c
         8kOnlrtkm/X0tE8ql9mRYdClPwFhCG6t8qNNN8ueLFvJY0IwuwiLTS1pYcEepHasNaw7
         GIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdOt/IVg86nhFMsqq7RF3fYF7DFLEndpzkq9QO3Rd3w=;
        b=ri/K22F9lhoP8ggXACCGHKGTp4Gi5zb7odX+SA3GvCSBzYETR/f+7Fo2yGK60r5ygg
         Jtl+F/GvPTuuVtRJe5drgBgv3cAKfb+1Hdyxn5XWUNQV6bFop0ngcuPFeG0o5STnPVbi
         blEgVNKbKXoEmdomcjoBR5hFGofIh4zTfB6XaifvG1e6MeVlwxC4NZQXCfqh9/JGajU1
         3qWdC/fLU2+/XGHkppdDnaB3WJqufNjSEjqitfmP0ZDqEFkJajKPql1WtsYRohJ6gwfJ
         SdQL+sskM+JnQmotot9F8BIA+sG/hRHdvNmvI9G8h2AI+rSa3jQ1ETMy1/b9jKEzzfRt
         h5/A==
X-Gm-Message-State: AAQBX9edO4QLGjQ9DnhEu7tpg3FoZZWWJhvOxi1Vvxdm3mlNxCQJkkGg
	KUD22gYTFs6DuBGWzppOg1w=
X-Google-Smtp-Source: AKy350aL6GwRDBEp0fh9ABOwkS8nc5uatrnGiu9voCQe9ql6FduYU3ME0LZlBjCMAGCiN5L97aTZMw==
X-Received: by 2002:a17:907:3e1a:b0:932:853c:c958 with SMTP id hp26-20020a1709073e1a00b00932853cc958mr2175580ejc.25.1679647400906;
        Fri, 24 Mar 2023 01:43:20 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090630c400b0092b5384d6desm9900272ejb.153.2023.03.24.01.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:43:20 -0700 (PDT)
Message-ID: <58aab6f6-c036-6ba5-3735-23ff77aff90e@gmail.com>
Date: Fri, 24 Mar 2023 09:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH v2] meson.bbclass: Split into meson-env and
 meson classes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>
References: <174CE003EF809BC1.11516@lists.openembedded.org>
 <20230324031319.4172410-1-zboszor@gmail.com>
 <CANNYZj-qCPb2Jtmq_PC9vD+z9my1XH4HT-UG_R58sWbDa3V2Vw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-qCPb2Jtmq_PC9vD+z9my1XH4HT-UG_R58sWbDa3V2Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179020

2023. 03. 24. 8:47 keltezéssel, Alexander Kanavin írta:
> It would help if you explain why existing meson class can't be used
> directly, and what the meson class adds compared to meson-env that
> gets in the way of that.

The email thread for the mesonpy bbclass in
openembedded-devel lists all the problems.

Summary:
* Both meson and python_pep517 classes declare
    EXPORT_FUNCTION. For some reason, meson always wins
    regardless of the inheritance order. The mesonpy class
    needs the meson cross compiler environment using the
    pep517 configure/compile/install functions.
* The meson class adds do_qa_configure which fails because
    the mesonpy build moves the meson setup phase from
    do_configure to do_compile. Removing items from
    do_configure[postfuncs] is impossible because this results
    in a parse error:
    do_configure[postfuncs]:remove = "meson_do_qa_configure"

The only option left is to split the environment setup part
out of meson.bbclass.

> Alex
>
> On Fri, 24 Mar 2023 at 04:13, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> The new meson-env class will be used by a new PEP517 python
>> build class using meson-python a.k.a. mesonpy.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>> v2: The split-off part is called meson-env.bbclass
>>      because "common" is not liked.
>>
>>   meta/classes-recipe/meson-env.bbclass | 141 ++++++++++++++++++++++++++
>>   meta/classes-recipe/meson.bbclass     | 136 +------------------------
>>   2 files changed, 142 insertions(+), 135 deletions(-)
>>   create mode 100644 meta/classes-recipe/meson-env.bbclass
>>
>> diff --git a/meta/classes-recipe/meson-env.bbclass b/meta/classes-recipe/meson-env.bbclass
>> new file mode 100644
>> index 0000000000..e02b3e5ab6
>> --- /dev/null
>> +++ b/meta/classes-recipe/meson-env.bbclass
>> @@ -0,0 +1,141 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +inherit python3native meson-routines qemu
>> +
>> +DEPENDS:append = " meson-native ninja-native"
>> +
>> +EXEWRAPPER_ENABLED:class-native = "False"
>> +EXEWRAPPER_ENABLED:class-nativesdk = "False"
>> +EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
>> +DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
>> +
>> +# As Meson enforces out-of-tree builds we can just use cleandirs
>> +B = "${WORKDIR}/build"
>> +do_configure[cleandirs] = "${B}"
>> +
>> +# Where the meson.build build configuration is
>> +MESON_SOURCEPATH = "${S}"
>> +
>> +def noprefix(var, d):
>> +    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
>> +
>> +MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
>> +MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
>> +MESONOPTS = " --prefix ${prefix} \
>> +              --buildtype ${MESON_BUILDTYPE} \
>> +              --bindir ${@noprefix('bindir', d)} \
>> +              --sbindir ${@noprefix('sbindir', d)} \
>> +              --datadir ${@noprefix('datadir', d)} \
>> +              --libdir ${@noprefix('libdir', d)} \
>> +              --libexecdir ${@noprefix('libexecdir', d)} \
>> +              --includedir ${@noprefix('includedir', d)} \
>> +              --mandir ${@noprefix('mandir', d)} \
>> +              --infodir ${@noprefix('infodir', d)} \
>> +              --sysconfdir ${sysconfdir} \
>> +              --localstatedir ${localstatedir} \
>> +              --sharedstatedir ${sharedstatedir} \
>> +              --wrap-mode nodownload \
>> +              --native-file ${WORKDIR}/meson.native"
>> +
>> +EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
>> +
>> +MESON_CROSS_FILE = ""
>> +MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
>> +MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>> +
>> +# Needed to set up qemu wrapper below
>> +export STAGING_DIR_HOST
>> +
>> +def rust_tool(d, target_var):
>> +    rustc = d.getVar('RUSTC')
>> +    if not rustc:
>> +        return ""
>> +    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
>> +    return "rust = %s" % repr(cmd)
>> +
>> +addtask write_config before do_configure
>> +do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
>> +do_write_config() {
>> +    # This needs to be Py to split the args into single-element lists
>> +    cat >${WORKDIR}/meson.cross <<EOF
>> +[binaries]
>> +c = ${@meson_array('CC', d)}
>> +cpp = ${@meson_array('CXX', d)}
>> +cython = 'cython3'
>> +ar = ${@meson_array('AR', d)}
>> +nm = ${@meson_array('NM', d)}
>> +strip = ${@meson_array('STRIP', d)}
>> +readelf = ${@meson_array('READELF', d)}
>> +objcopy = ${@meson_array('OBJCOPY', d)}
>> +pkgconfig = 'pkg-config'
>> +llvm-config = 'llvm-config'
>> +cups-config = 'cups-config'
>> +g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
>> +g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
>> +${@rust_tool(d, "HOST_SYS")}
>> +${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
>> +
>> +[built-in options]
>> +c_args = ${@meson_array('CFLAGS', d)}
>> +c_link_args = ${@meson_array('LDFLAGS', d)}
>> +cpp_args = ${@meson_array('CXXFLAGS', d)}
>> +cpp_link_args = ${@meson_array('LDFLAGS', d)}
>> +
>> +[properties]
>> +needs_exe_wrapper = true
>> +
>> +[host_machine]
>> +system = '${@meson_operating_system('HOST_OS', d)}'
>> +cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
>> +cpu = '${HOST_ARCH}'
>> +endian = '${@meson_endian('HOST', d)}'
>> +
>> +[target_machine]
>> +system = '${@meson_operating_system('TARGET_OS', d)}'
>> +cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
>> +cpu = '${TARGET_ARCH}'
>> +endian = '${@meson_endian('TARGET', d)}'
>> +EOF
>> +
>> +    cat >${WORKDIR}/meson.native <<EOF
>> +[binaries]
>> +c = ${@meson_array('BUILD_CC', d)}
>> +cpp = ${@meson_array('BUILD_CXX', d)}
>> +cython = 'cython3'
>> +ar = ${@meson_array('BUILD_AR', d)}
>> +nm = ${@meson_array('BUILD_NM', d)}
>> +strip = ${@meson_array('BUILD_STRIP', d)}
>> +readelf = ${@meson_array('BUILD_READELF', d)}
>> +objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
>> +pkgconfig = 'pkg-config-native'
>> +${@rust_tool(d, "BUILD_SYS")}
>> +
>> +[built-in options]
>> +c_args = ${@meson_array('BUILD_CFLAGS', d)}
>> +c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>> +cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
>> +cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>> +EOF
>> +}
>> +
>> +do_write_config:append:class-target() {
>> +    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
>> +    # can run target helper binaries through that.
>> +    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
>> +    cat > ${WORKDIR}/meson-qemuwrapper << EOF
>> +#!/bin/sh
>> +# Use a modules directory which doesn't exist so we don't load random things
>> +# which may then get deleted (or their dependencies) and potentially segfault
>> +export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
>> +
>> +# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
>> +unset LD_LIBRARY_PATH
>> +
>> +$qemu_binary "\$@"
>> +EOF
>> +    chmod +x ${WORKDIR}/meson-qemuwrapper
>> +}
>> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
>> index 48688bed75..697cf6ecc8 100644
>> --- a/meta/classes-recipe/meson.bbclass
>> +++ b/meta/classes-recipe/meson.bbclass
>> @@ -4,141 +4,7 @@
>>   # SPDX-License-Identifier: MIT
>>   #
>>
>> -inherit python3native meson-routines qemu
>> -
>> -DEPENDS:append = " meson-native ninja-native"
>> -
>> -EXEWRAPPER_ENABLED:class-native = "False"
>> -EXEWRAPPER_ENABLED:class-nativesdk = "False"
>> -EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
>> -DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
>> -
>> -# As Meson enforces out-of-tree builds we can just use cleandirs
>> -B = "${WORKDIR}/build"
>> -do_configure[cleandirs] = "${B}"
>> -
>> -# Where the meson.build build configuration is
>> -MESON_SOURCEPATH = "${S}"
>> -
>> -def noprefix(var, d):
>> -    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
>> -
>> -MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
>> -MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
>> -MESONOPTS = " --prefix ${prefix} \
>> -              --buildtype ${MESON_BUILDTYPE} \
>> -              --bindir ${@noprefix('bindir', d)} \
>> -              --sbindir ${@noprefix('sbindir', d)} \
>> -              --datadir ${@noprefix('datadir', d)} \
>> -              --libdir ${@noprefix('libdir', d)} \
>> -              --libexecdir ${@noprefix('libexecdir', d)} \
>> -              --includedir ${@noprefix('includedir', d)} \
>> -              --mandir ${@noprefix('mandir', d)} \
>> -              --infodir ${@noprefix('infodir', d)} \
>> -              --sysconfdir ${sysconfdir} \
>> -              --localstatedir ${localstatedir} \
>> -              --sharedstatedir ${sharedstatedir} \
>> -              --wrap-mode nodownload \
>> -              --native-file ${WORKDIR}/meson.native"
>> -
>> -EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
>> -
>> -MESON_CROSS_FILE = ""
>> -MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
>> -MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>> -
>> -# Needed to set up qemu wrapper below
>> -export STAGING_DIR_HOST
>> -
>> -def rust_tool(d, target_var):
>> -    rustc = d.getVar('RUSTC')
>> -    if not rustc:
>> -        return ""
>> -    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
>> -    return "rust = %s" % repr(cmd)
>> -
>> -addtask write_config before do_configure
>> -do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
>> -do_write_config() {
>> -    # This needs to be Py to split the args into single-element lists
>> -    cat >${WORKDIR}/meson.cross <<EOF
>> -[binaries]
>> -c = ${@meson_array('CC', d)}
>> -cpp = ${@meson_array('CXX', d)}
>> -cython = 'cython3'
>> -ar = ${@meson_array('AR', d)}
>> -nm = ${@meson_array('NM', d)}
>> -strip = ${@meson_array('STRIP', d)}
>> -readelf = ${@meson_array('READELF', d)}
>> -objcopy = ${@meson_array('OBJCOPY', d)}
>> -pkgconfig = 'pkg-config'
>> -llvm-config = 'llvm-config'
>> -cups-config = 'cups-config'
>> -g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
>> -g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
>> -${@rust_tool(d, "HOST_SYS")}
>> -${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
>> -
>> -[built-in options]
>> -c_args = ${@meson_array('CFLAGS', d)}
>> -c_link_args = ${@meson_array('LDFLAGS', d)}
>> -cpp_args = ${@meson_array('CXXFLAGS', d)}
>> -cpp_link_args = ${@meson_array('LDFLAGS', d)}
>> -
>> -[properties]
>> -needs_exe_wrapper = true
>> -
>> -[host_machine]
>> -system = '${@meson_operating_system('HOST_OS', d)}'
>> -cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
>> -cpu = '${HOST_ARCH}'
>> -endian = '${@meson_endian('HOST', d)}'
>> -
>> -[target_machine]
>> -system = '${@meson_operating_system('TARGET_OS', d)}'
>> -cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
>> -cpu = '${TARGET_ARCH}'
>> -endian = '${@meson_endian('TARGET', d)}'
>> -EOF
>> -
>> -    cat >${WORKDIR}/meson.native <<EOF
>> -[binaries]
>> -c = ${@meson_array('BUILD_CC', d)}
>> -cpp = ${@meson_array('BUILD_CXX', d)}
>> -cython = 'cython3'
>> -ar = ${@meson_array('BUILD_AR', d)}
>> -nm = ${@meson_array('BUILD_NM', d)}
>> -strip = ${@meson_array('BUILD_STRIP', d)}
>> -readelf = ${@meson_array('BUILD_READELF', d)}
>> -objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
>> -pkgconfig = 'pkg-config-native'
>> -${@rust_tool(d, "BUILD_SYS")}
>> -
>> -[built-in options]
>> -c_args = ${@meson_array('BUILD_CFLAGS', d)}
>> -c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>> -cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
>> -cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>> -EOF
>> -}
>> -
>> -do_write_config:append:class-target() {
>> -    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
>> -    # can run target helper binaries through that.
>> -    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
>> -    cat > ${WORKDIR}/meson-qemuwrapper << EOF
>> -#!/bin/sh
>> -# Use a modules directory which doesn't exist so we don't load random things
>> -# which may then get deleted (or their dependencies) and potentially segfault
>> -export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
>> -
>> -# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
>> -unset LD_LIBRARY_PATH
>> -
>> -$qemu_binary "\$@"
>> -EOF
>> -    chmod +x ${WORKDIR}/meson-qemuwrapper
>> -}
>> +inherit meson-env
>>
>>   # Tell externalsrc that changes to this file require a reconfigure
>>   CONFIGURE_FILES = "meson.build"
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179011): https://lists.openembedded.org/g/openembedded-core/message/179011
>> Mute This Topic: https://lists.openembedded.org/mt/97816812/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>



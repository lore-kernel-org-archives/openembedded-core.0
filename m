Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811F3C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 17:20:24 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2331.1678900820478905321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 10:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJi4sD2e;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r11so26733291edd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678900819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QaL2+Dt67nyeqtv0Za8p5Y6LwRGV6u5tJsLBm8fOAsw=;
        b=TJi4sD2eNWrzjcNl8fzHVyQ5d5nnXkpsUu5139ox/Qfmg9YudPAkAVllROhrkV5kNz
         7GDp65VpUu28NSTy2g6t0xz0rSKJeeYtcHjxhOc5EUtln5+HZGwUI4+WYuwDC/To1bTn
         mT8LpzfyXWwnHeeYtt4KlCvBxge/vy5c42p0PPt/bYZH4ehBq7Hyin8UoROFu8BttS9T
         tQ7vIDiU7KC2lKZnTnXbP/zcbjjPkLfvfsVwGqhM61ULRfb1oxzAJ1b0PfBYkAG1Thrq
         LMWgfsF01zvPAaQEczwEQEFBUL8CRQCZAwwjeiJCiXHJqZuEM6N1JwlFXTyzPVxXn4E0
         O5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900819;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaL2+Dt67nyeqtv0Za8p5Y6LwRGV6u5tJsLBm8fOAsw=;
        b=NPj7DKrU/551KD9Bi7Dqj7h2hUF0dIZflp1zIPHCc2/tjWuATeJTZgqeSVPQZNrs0C
         IwSupQb1lFARg7DbUJ+39aHAGd0KJVA+6yEEdW9f6lqP7aRf4Ni06vzYIyxJm+i4QYRo
         3SrFAlN6dgnpmGajyW5v1+9LXguEOlBHDN9gL8YVmSiE7GbqbHF20vy33i0lMv76Ue1L
         Kjz4GL1Vgwq87gG/gXKshPl2hWJ/kI4r39lWQyZeiMqEFf1QwL7RgmaMCqNfHUfNpS7Z
         m7tq9pnLK2IwW+wLqHWMfarH+ozgQaQ3ryFoA1j3mq18+nsRcmgUxKvwl7SWOYYT1srr
         7zOA==
X-Gm-Message-State: AO0yUKW1VWWFSLhCqCbvg/TQ+VCdF/OMFRzSdenoCzhZSWWylvPsbFQu
	14mtP8GpkMZY1gnaT3rwadI=
X-Google-Smtp-Source: AK7set/PX67N77TmaodU+IYmZifK1N2qYiV3VTn2XJjpXmo/FC9+kmGW3BGGdjxtQjJclNHbs7rmfQ==
X-Received: by 2002:a17:906:dff5:b0:8b1:3193:4874 with SMTP id lc21-20020a170906dff500b008b131934874mr6385137ejc.46.1678900818577;
        Wed, 15 Mar 2023 10:20:18 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id f7-20020a17090660c700b008d0dbf15b8bsm2763443ejk.212.2023.03.15.10.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 10:20:18 -0700 (PDT)
Message-ID: <efae316a-c655-ab08-13cb-214be93b59f2@gmail.com>
Date: Wed, 15 Mar 2023 18:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230315080020.2648416-1-zboszor@gmail.com>
 <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 17:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178652

2023. 03. 15. 17:52 keltezéssel, Ross Burton írta:
> On 15 Mar 2023, at 08:00, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
>> index 48688bed75..f1273aa1c0 100644
>> --- a/meta/classes-recipe/meson.bbclass
>> +++ b/meta/classes-recipe/meson.bbclass
>> @@ -4,141 +4,7 @@
>> # SPDX-License-Identifier: MIT
>> #
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
>> +inherit meson-common
>>
>> # Tell externalsrc that changes to this file require a reconfigure
>> CONFIGURE_FILES = “meson.build”
> This patch appears to move every line from meson.bbclass to meson-common.bbclass,

It's the other way around but git is stupid. What was done is:

git mv meson.bbclass meson-common.bbclass

then moved a few lined from the end of it to the new meson.bbclass file.

Should I do this in two commits to make it reflect what is actually done?

>   apart from the CONFIGURE_FILES line which would still be needed in the python-meson case anyway.
>
> I can’t see what is gained here, just inherit meson.

The problem is that "inherit meson python_pep517" ends up with

do_configure () {
     meson_do_configure
}

do_compile () {
     meson_do_compile
}

when the python_pep517_ prefixed ones are needed.
It has something to do with the fact that both has the line

EXPORT_FUNCTIONS do_configure do_compile do_install

Which one wins may depend on inheritance order but
who's to say for sure and why can't this be order agnostic?

I need most of meson.bbclass for the settings in the new
meta_mesonpy class to pass to meson but using the pep517
machinery.



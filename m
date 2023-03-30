Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B2C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:04:32 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.26197.1680185069301472711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cLMTvn4D;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id ek18so76967867edb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm15+iZqqbPrsU2OMC4PtG+8jUm9roEGRbxsySxUT+k=;
        b=cLMTvn4DmaOn7Jd6HhgLf+TM4qjVMRWs1P5h3QXOW4DxKxUjDZhyVEzZ79B3xTx87x
         ivthO9qUWxSFHUzOfK3+feHJNMw+Mx4dCxm5UV6RKige9PekeeHkqcrFxY+HnIynFm5z
         dw231g7GwyPuHWrMbliRvoTf+6GN35QECDKONGpR6jR8ZpR5ZCtNQ2TAtz8Zgn1X2g26
         HeEEGPkMbMSJpXHQXBaLdY2Sq5KueYS1DrPWvC1twPIrUbI2US+gAVENbHk+WViBn2Dj
         hCsbLIBJNfLBpZYCSJi4rr0Qga+Nk2uEnsHzJbcUmq7ny5pYpqZT+cdjFMYoWaGc1mWc
         3IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dm15+iZqqbPrsU2OMC4PtG+8jUm9roEGRbxsySxUT+k=;
        b=J78ztxcubUAA2pfGqEHhXCFUjA9Gcz4+3+UhIObNwitFI47zMP8RHHfWz2ST6p8B3U
         yKzM08jbLm+Qd1STbHqX0LwsU8lqWqZBUq9hwaOv6baFjm+TkT3q4LhJ+DSvNQYMS5Mm
         6gGml5Nd31j61m2QWhg4K+CSIulAytCuLRVRGTE+/Q5htqEwjS+7tWkfJur0rrfdhHRV
         IRUxz2Qewe1Aoa3g0j2t2UZCfl7OoZTk0dXhoxtlQLLcun8P8m4t4wgYnd0xsDEoP6yw
         bm/CueTM6kpNV1wBtu8llLQttPkVFcR6R+dTlDp8zgNsimQwXbEXxcenyLP0CQNEnWjV
         Usrw==
X-Gm-Message-State: AAQBX9c8RGArdE68aKOiGd43brpvT5w0BA4TvjqD/nNBdWH+WpTjpotO
	KCNgGCdW7TjdjXaIbmyYtKM=
X-Google-Smtp-Source: AKy350YkUso3+ehbkIP7ulLZ07xGYi5Avt0DAt6TCPZH75nF1sGUDHm60WUNBA/dQEKO7v+vHknpyA==
X-Received: by 2002:a17:906:2759:b0:930:8fd7:789f with SMTP id a25-20020a170906275900b009308fd7789fmr21490605ejd.38.1680185067750;
        Thu, 30 Mar 2023 07:04:27 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906250600b009306be6bed7sm17676870ejb.190.2023.03.30.07.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:04:27 -0700 (PDT)
Message-ID: <ae018d33-b71a-8ce0-17d3-17d2a4e1f314@gmail.com>
Date: Thu, 30 Mar 2023 16:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <CANNYZj-n-mCj+3_3YR9KKGP7g7teGknWKhGOFSQEnn+3EkdDKg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-n-mCj+3_3YR9KKGP7g7teGknWKhGOFSQEnn+3EkdDKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179327

2023. 03. 30. 15:46 keltezéssel, Alexander Kanavin írta:
> Can you please point to what piece of libgudev actually requires systemd?

It's this line:

DEPENDS = "glib-2.0 udev"

udev is in systemd:

PROVIDES = "udev"

>
> Alex
>
> On Thu, 30 Mar 2023 at 15:42, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> systemd-native is a dependency for libgudev-native, which
>> in turn is a dependency for libfprint-native, which is needed
>> to build libfprint.
>>
>> The native systemctl binary is removed so it doesn't conflict
>> with the script from systemd-systemctl-native.
>>
>> TODO? The new natively built systemctl binary may replace
>> the script in systemd-systemctl-native, as it supports
>> more options and works better than the script. For example,
>> the current script does not create the symlinks in
>> /etc/systemd/system for WantedBy= and RequiredBy= settings
>> and does not support systemctl set-default some.target.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-core/systemd/systemd_253.1.bb | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
>> index 9c2b96d3c1..c73b5e05b3 100644
>> --- a/meta/recipes-core/systemd/systemd_253.1.bb
>> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
>> @@ -6,6 +6,8 @@ PE = "1"
>>
>>   DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
>>
>> +BBCLASSEXTEND = "native"
>> +
>>   SECTION = "base/shell"
>>
>>   inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
>> @@ -60,7 +62,7 @@ PAM_PLUGINS = " \
>>       pam-plugin-namespace \
>>   "
>>
>> -PACKAGECONFIG ??= " \
>> +PACKAGECONFIG:class-target ??= " \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack usrmerge polkit seccomp', d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>> @@ -197,7 +199,7 @@ PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-
>>   PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
>>   PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
>>   PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
>> -PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
>> +PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,${@'systemd-compat-units update-rc.d' if d.getVar('PN') == d.getVar('BPN') else ''}"
>>   # When enabled use reproducble build timestamp if set as time epoch,
>>   # or build time if not. When disabled, time epoch is unset.
>>   def build_epoch(d):
>> @@ -211,7 +213,7 @@ PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
>>   PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
>>   PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
>>   PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
>> -PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
>> +PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${BPN}-vconsole-setup"
>>   PACKAGECONFIG[wheel-group] = "-Dwheel-group=true, -Dwheel-group=false"
>>   PACKAGECONFIG[xdg-autostart] = "-Dxdg-autostart=true,-Dxdg-autostart=false"
>>   # Verify keymaps on locale change
>> @@ -364,6 +366,12 @@ do_install() {
>>       fi
>>   }
>>
>> +do_install:append:class-native () {
>> +    rm -f ${D}${bindir}/systemctl
>> +       ln -sf ..${base_bindir_native}/udevadm ${D}${base_sbindir}/udevadm
>> +       ln -sf ..${systemd_unitdir#${rootprefix}}/systemd-udevd ${D}${base_sbindir}/udevd
>> +}
>> +
>>   python populate_packages:prepend (){
>>       systemdlibdir = d.getVar("rootlibdir")
>>       do_split_packages(d, systemdlibdir, r'^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
>> @@ -670,10 +678,10 @@ FILES:${PN} = " ${base_bindir}/* \
>>   FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>
>>   RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
>> -RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>> -RDEPENDS:${PN} += "volatile-binds"
>> +RDEPENDS:${PN}:class-target += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>> +RDEPENDS:${PN}:class-target += "volatile-binds"
>>
>> -RRECOMMENDS:${PN} += "systemd-extra-utils \
>> +RRECOMMENDS:${PN}:class-target += "systemd-extra-utils \
>>                         udev-hwdb \
>>                         e2fsprogs-e2fsck \
>>                         kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179321): https://lists.openembedded.org/g/openembedded-core/message/179321
>> Mute This Topic: https://lists.openembedded.org/mt/97950749/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>



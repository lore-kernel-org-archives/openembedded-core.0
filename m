Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC31C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 14:49:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.25050.1677854983992636492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 06:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1X6z33uY;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id a25so11560299edb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 06:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677854982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jWttJNfiQDNYqwqCaIH0TeyflpF+LQIcrs/wci8eEo=;
        b=1X6z33uYBacWVegcnhHFHCiVOWXUj70ENSsCxJ9RqyOwabAHcZ2HKyTpFhXSzffJ40
         04qv2pTSZBec+D6PAmwWOnPKmwFnfJXjFVOcJOXUjWyVIlrfTjkomOE696otFBnNMMuM
         sYdpNvHWw4kO0MLQIuJODKsVIuwGbMYPVzUTUxCdEat0sbCvk2ql05ZjMp6VEQwoM7rt
         r1pCjbQhJaHV1NF6kFM/i0ni/DDA/PxPm7hWFSy8ymF6/eQMk2lxV45hJhgFCPOhfnF5
         P4dIC07veJ8FMaHVplsHw7onWy2uFghvETojjbl6IxHCYBbXbCOHi4n3WDF+xkVEsPTi
         oUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677854982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jWttJNfiQDNYqwqCaIH0TeyflpF+LQIcrs/wci8eEo=;
        b=Fo5KmVtTju1E2rNUio9EuBiOYrV8ugx74mVaplxcT/00o/57J+zyxXIbHxi58n+SUM
         0Ci/eDvndyrYRZv3ruT48EsGn6PVapLLgKdW6muY/4/7nCAcdXCcw2edezfToenXUueg
         X0V9YsQeZECo+hh95RN8PSjwSGHLzSd8O1tErwl+y/ss3sI2QOqMEkgvl4HPeP7PbeU4
         60a764WQC7Qd9ejF4Eig/D3RBfRyjsGXb7HSC7ANog2SF3+yEdZ8gYbtlNp8aLpdHwrs
         b05GkByRr9CnidWX6inPlMR72eng8Ap4te6WcOx0mp+keq8I3X0pTohWrUJPDKND4nXK
         Z+pw==
X-Gm-Message-State: AO0yUKXrJLNpfjV9XNBipGOEstnn40juSF94hLPAZBvHwOxSaJK8dEs2
	cm/cEsCmemN+6t7F8MLoqhv2dXH/OCcx4q0MlplPVw==
X-Google-Smtp-Source: AK7set9gXZOZkIGx93PJygj/l+qaSXWEt5CqBAL/mVwNkyjWQfuQo9LZrR49W91XvvbYPo0cZ/NPWKR7+0IAIbZBN7I=
X-Received: by 2002:a17:906:60c7:b0:907:3615:326c with SMTP id
 f7-20020a17090660c700b009073615326cmr987937ejk.7.1677854982102; Fri, 03 Mar
 2023 06:49:42 -0800 (PST)
MIME-Version: 1.0
References: <174856BF265CB3B6.13840@lists.openembedded.org>
In-Reply-To: <174856BF265CB3B6.13840@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 Mar 2023 04:49:31 -1000
Message-ID: <CAOSpxdYp7PcpuuY6tr0jOQyC57FDf6_E=0mn0_A4f-roxgKL8w@mail.gmail.com>
Subject: Re: [OE-core][langdale 00/28] Pull request (cover letter only)
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 14:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177986

This is the final pull request for the 4.1.3 release build.

Steve

On Wed, Mar 1, 2023 at 5:57=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> The following changes since commit ab1e3000cee9f5f3496a7e67cc59b2e08a681a=
89:
>
>   oeqa qemurunner.py: try to avoid reading one character at a time (2023-=
02-18 06:41:49 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/langdale-=
next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
langdale-next
>
> Adrian Freihofer (1):
>   bblayers/setupwriters/oe-setup-layers: create dir if not exists
>
> Alexander Kanavin (5):
>   vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
>   dbus: upgrade 1.14.4 -> 1.14.6
>   linux-firmware: upgrade 20230117 -> 20230210
>   wireless-regdb: upgrade 2022.08.12 -> 2023.02.13
>   bblayers/makesetup: skip git repos that are submodules
>
> Alexis Lothor=C3=A9 (1):
>   oeqa/selftest/resulttooltests: fix minor typo
>
> Bruce Ashfield (1):
>   lttng-modules: fix for kernel 6.2+
>
> Dmitry Baryshkov (2):
>   linux-firmware: properly set license for all Qualcomm firmware
>   linux-firmware: add yamato fw files to qcom-adreno-a2xx package
>
> Federico Pellegrin (1):
>   curl: fix dependencies when building with ldap/ldaps
>
> Joshua Watt (1):
>   classes/populate_sdk_base: Append cleandirs
>
> Kai Kang (1):
>   xserver-xorg: 21.1.6 -> 21.1.7
>
> Mateusz Marciniec (1):
>   sstatesig: Improve output hash calculation
>
> Mikko Rapeli (2):
>   oeqa ssh.py: fix hangs in run()
>   runqemu: kill qemu if it hangs
>
> Narpat Mali (1):
>   libseccomp: fix for the ptest result format
>
> Pavel Zhukov (1):
>   wic: Fix usage of fstype=3Dnone in wic
>
> Richard Purdie (1):
>   libssh2: Clean up ptest patch/coverage
>
> Ross Burton (3):
>   less: backport the fix for CVE-2022-46663
>   lib/buildstats: handle tasks that never finished
>   cml1: remove redundant addtask
>
> Saul Wold (1):
>   busybox: Fix depmod patch
>
> Siddharth Doshi (1):
>   openssl: Upgrade 3.0.7 -> 3.0.8
>
> Ulrich =C3=96lmann (1):
>   kernel-yocto: fix kernel-meta data detection
>
> Wang Mingyu (2):
>   libjpeg-turbo: upgrade 2.1.5 -> 2.1.5.1
>   xwayland: upgrade 22.1.7 -> 22.1.8
>
> Xiangyu Chen (1):
>   dhcpcd: fix dhcpcd start failure on qemuppc64
>
>  meta/classes-recipe/cml1.bbclass              |  1 -
>  meta/classes-recipe/kernel-yocto.bbclass      |  2 +-
>  meta/classes-recipe/populate_sdk_base.bbclass |  2 +-
>  meta/lib/bblayers/makesetup.py                | 10 +++++
>  .../bblayers/setupwriters/oe-setup-layers.py  |  2 +
>  meta/lib/oe/sstatesig.py                      |  4 ++
>  meta/lib/oeqa/core/target/ssh.py              | 39 ++++++++++++----
>  .../oeqa/selftest/cases/resulttooltests.py    |  2 +-
>  .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
>  ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 ++++++++++++++
>  .../openssl/openssl/CVE-2022-3996.patch       | 43 ------------------
>  .../{openssl_3.0.7.bb =3D> openssl_3.0.8.bb}    |  3 +-
>  ...001-depmod-Ignore-.debug-directories.patch |  2 +-
>  .../dbus/{dbus_1.14.4.bb =3D> dbus_1.14.6.bb}   |  4 +-
>  .../less/files/CVE-2022-46663.patch           | 28 ++++++++++++
>  meta/recipes-extended/less/less_608.bb        |  1 +
>  ...urbo_2.1.5.bb =3D> libjpeg-turbo_2.1.5.1.bb} |  2 +-
>  ...-xorg_21.1.6.bb =3D> xserver-xorg_21.1.7.bb} |  2 +-
>  ...{xwayland_22.1.7.bb =3D> xwayland_22.1.8.bb} |  2 +-
>  ...20230117.bb =3D> linux-firmware_20230210.bb} | 41 ++++++++++++++---
>  ...ccessor-helpers-into-accessors.h-v6..patch | 45 +++++++++++++++++++
>  .../lttng/lttng-modules_2.13.8.bb             |  1 +
>  ....08.12.bb =3D> wireless-regdb_2023.02.13.bb} |  2 +-
>  meta/recipes-support/curl/curl_7.85.0.bb      |  4 +-
>  .../libseccomp/files/run-ptest                |  3 ++
>  ...nviroment-to-decide-if-a-test-is-bui.patch | 44 ------------------
>  .../libssh2/libssh2/fix-ssh2-test.patch       | 23 ++++++++++
>  .../libssh2/{files =3D> libssh2}/run-ptest      |  3 +-
>  .../recipes-support/libssh2/libssh2_1.10.0.bb |  3 +-
>  meta/recipes-support/vim/vim.inc              |  4 +-
>  scripts/lib/buildstats.py                     | 33 +++++++++++---
>  scripts/lib/wic/partition.py                  |  5 +++
>  scripts/runqemu                               | 24 ++++++----
>  33 files changed, 282 insertions(+), 137 deletions(-)
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-l=
inux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-39=
96.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.7.bb =3D> openssl_=
3.0.8.bb} (98%)
>  rename meta/recipes-core/dbus/{dbus_1.14.4.bb =3D> dbus_1.14.6.bb} (98%)
>  create mode 100644 meta/recipes-extended/less/files/CVE-2022-46663.patch
>  rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb =3D> libjpeg-t=
urbo_2.1.5.1.bb} (97%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.6.bb =3D> x=
server-xorg_21.1.7.bb} (92%)
>  rename meta/recipes-graphics/xwayland/{xwayland_22.1.7.bb =3D> xwayland_=
22.1.8.bb} (95%)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb =
=3D> linux-firmware_20230210.bb} (96%)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrf=
s-move-accessor-helpers-into-accessors.h-v6..patch
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.08.12.bb =
=3D> wireless-regdb_2023.02.13.bb} (94%)
>  delete mode 100644 meta/recipes-support/libssh2/files/0001-Don-t-let-hos=
t-enviroment-to-decide-if-a-test-is-bui.patch
>  create mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.pa=
tch
>  rename meta/recipes-support/libssh2/{files =3D> libssh2}/run-ptest (67%)
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177944): https://lists.openembedded.org/g/openembedde=
d-core/message/177944
> Mute This Topic: https://lists.openembedded.org/mt/97317995/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


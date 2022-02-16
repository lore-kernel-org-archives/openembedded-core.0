Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83982C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 07:34:32 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.9173.1644996854385033011
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z8E3qN9H;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t21so2398979edd.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SyMXsvE4vn5korzyajZzbPNWIjhrFLQ8BaDIH2bI4Es=;
        b=Z8E3qN9HlsZgD5S4CPj37m7CdH95GXJJ2WL9fjaxMp5i1xkKsiNo0aQoAgWB1LbYoy
         +tL+N/GySctraTiSVOG90/bqdHIkdxKzBCfsH7nmYG9QFdwu8voimhmqruZjTvVe8R03
         Hk2tnYIyTxxP6uNcsnC1xrChKycbnk4jzjlfB3ITsOQSxcd2WpDzSefLH1n86DP5ahZX
         nfcD1QjcIuS/CY5Z7q3LVn8I80Gcv7wdoNxIHIIXjSSxQfqIoaKDvDmhaRloTBMbgVuW
         h9nyUdO5HznWEzCGXfIRyD+tGkZCN7ahmWZSza7bKMls+lRAcPbKoi64t+Cl5i69RgPZ
         LReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyMXsvE4vn5korzyajZzbPNWIjhrFLQ8BaDIH2bI4Es=;
        b=h8hGK4pa8ScFaCSRgCSOW2t/IuiE4UGrsPTveBrUmZfvRL2z5x7d9xzQcu1H1ATp5q
         pXOQhoes5jAUGSWzWVlmIOB+UPXBnDma0PJT8d+N8piiVAkmtkOsY1NgMcwIkMJ6pCUU
         daW+XaRPU938wDRY21QzNlpVupQuDzgRcmpWimRtl7xTYMmU4RH1hb9tc8BObzIEev+i
         +gYk3UpultZRW5YTTsfmZn0hQBf2HC9rZza/Rm5i/+We2HHhak4JszOgnZAnTGIIEJ1b
         HFe0NupoCNZCP4eu76Y1FveTLHz+NjjaUdbmOZMBWScoaqfcx/jE0LOpnMHQb1hUdO1C
         cyxA==
X-Gm-Message-State: AOAM532rHqGJxSx+rEAZrG/80ksr8m7nBWm0t4qN6DtnwHumBG0yBKjF
	PT3Rf5HOP8arkKj+/4O6fPtxojeVaZJ8Mh8Gc2o=
X-Google-Smtp-Source: 
 ABdhPJznvlProD075N0ObWqOcUHjklidXrh6UXOsh9qRGcCI2ezCFd+2oE4Omhu/ZctINGpUDUhux4PK/7l+95gQ6g8=
X-Received: by 2002:aa7:c982:0:b0:406:3862:a717 with SMTP id
 c2-20020aa7c982000000b004063862a717mr1591079edt.358.1644996852412; Tue, 15
 Feb 2022 23:34:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644946036.git.steve@sakoman.com>
In-Reply-To: <cover.1644946036.git.steve@sakoman.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Wed, 16 Feb 2022 13:04:00 +0530
Message-ID: 
 <CACpMEhN3+9xDYLdyNfoBEnS6kEt+AvOr1ovb3iq9GD8uzu__NA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/20] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000b776a05d81dad61"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 07:34:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161769

--0000000000000b776a05d81dad61
Content-Type: text/plain; charset="UTF-8"

May I know by when this will be available on dunfell branch?

Thanks,
Ranjitsinh

On Tue, 15 Feb, 2022, 10:59 pm Steve Sakoman, <steve@sakoman.com> wrote:

> The following changes since commit
> f3be01483b01c88f8c4ba24ca73ccf1bcc33665c:
>
>   build-appliance-image: Update to dunfell head revision (2022-01-27
> 16:16:08 +0000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Alexander Kanavin (1):
>   libusb1: correct SRC_URI
>
> Joshua Watt (5):
>   tzdata: Remove BSD License specifier
>   e2fsprogs: Use specific BSD license variant
>   glib-2.0: Use specific BSD license variant
>   shadow: Use specific BSD license variant
>   libcap: Use specific BSD license variant
>
> Marek Vasut (1):
>   binutils: Backport Include members in the variable table used when
>     resolving DW_AT_specification tags.
>
> Marta Rybczynska (2):
>   grub: add a fix for CVE-2020-25632
>   grub: add a fix for CVE-2020-25647
>
> Minjae Kim (1):
>   ghostscript: fix CVE-2021-45949
>
> Peter Kjellerstedt (1):
>   sstate: A third fix for for touching files inside pseudo
>
> Purushottam Choudhary (1):
>   systemd: Fix CVE-2021-3997
>
> Ranjitsinh Rathod (1):
>   util-linux: Fix for CVE-2021-3995 and CVE-2021-3996
>
> Ross Burton (2):
>   lsof: correct LICENSE
>   shadow-sysroot: sync license with shadow
>
> Rudolf J Streif (1):
>   linux-firmware: Add CLM blob to linux-firmware-bcm4373 package
>
> Steve Sakoman (4):
>   glibc: update to lastest 2.31 release HEAD
>   expat: fix CVE-2022-23852
>   expat: add missing Upstream-status, CVE tag and sign-off to
>     CVE-2021-46143.patch
>   common-licenses: add Spencer-94
>
>  meta/classes/sstate.bbclass                   |  14 +-
>  meta/files/common-licenses/Spencer-94         |  12 +
>  .../grub/files/CVE-2020-25632.patch           |  90 +++++
>  .../grub/files/CVE-2020-25647.patch           | 119 +++++++
>  meta/recipes-bsp/grub/grub2.inc               |   2 +
>  .../expat/expat/CVE-2021-46143.patch          |   6 +
>  .../expat/expat/CVE-2022-23852.patch          |  33 ++
>  meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
>  meta/recipes-core/glib-2.0/glib.inc           |   2 +-
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
>  .../systemd/systemd/CVE-2021-3997-1.patch     |  65 ++++
>  .../systemd/systemd/CVE-2021-3997-2.patch     | 101 ++++++
>  .../systemd/systemd/CVE-2021-3997-3.patch     | 266 +++++++++++++++
>  ...-fsync-after-removing-directory-tree.patch |  35 ++
>  ...children-split-out-body-of-directory.patch | 318 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
>  .../util-linux/util-linux/CVE-2021-3995.patch | 139 ++++++++
>  .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++
>  ...ude-strutils-cleanup-strto-functions.patch | 270 +++++++++++++++
>  .../util-linux/util-linux_2.35.1.bb           |   3 +
>  .../binutils/binutils-2.34.inc                |   1 +
>  ...in-the-variable-table-used-when-reso.patch |  32 ++
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
>  .../ghostscript/CVE-2021-45949.patch          |  65 ++++
>  ...tack-limits-after-function-evalution.patch |  51 +++
>  .../ghostscript/ghostscript_9.52.bb           |   2 +
>  meta/recipes-extended/lsof/lsof_4.91.bb       |   2 +-
>  .../shadow/shadow-sysroot_4.6.bb              |   2 +-
>  meta/recipes-extended/shadow/shadow.inc       |   2 +-
>  meta/recipes-extended/timezone/timezone.inc   |   2 +-
>  .../linux-firmware/linux-firmware_20211216.bb |   1 +
>  meta/recipes-support/libcap/libcap_2.32.bb    |   2 +-
>  meta/recipes-support/libusb/libusb1_1.0.22.bb |   4 +-
>  34 files changed, 1863 insertions(+), 15 deletions(-)
>  create mode 100644 meta/files/common-licenses/Spencer-94
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
>  create mode 100644
> meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
>  create mode 100644
> meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
>  create mode 100644
> meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161757):
> https://lists.openembedded.org/g/openembedded-core/message/161757
> Mute This Topic: https://lists.openembedded.org/mt/89166126/6360406
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ranjitsinhrathod1991@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000b776a05d81dad61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">May I know by when this will be available on dunfell bran=
ch?<div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"a=
uto">Ranjitsinh</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 15 Feb, 2022, 10:59 pm Steve Sakoman, &lt;<a h=
ref=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The following changes since commit f3be01483=
b01c88f8c4ba24ca73ccf1bcc33665c:<br>
<br>
=C2=A0 build-appliance-image: Update to dunfell head revision (2022-01-27 1=
6:16:08 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembedded.org/op=
enembedded-core-contrib</a> stable/dunfell-next<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/dunfell-next" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dun=
fell-next</a><br>
<br>
Alexander Kanavin (1):<br>
=C2=A0 libusb1: correct SRC_URI<br>
<br>
Joshua Watt (5):<br>
=C2=A0 tzdata: Remove BSD License specifier<br>
=C2=A0 e2fsprogs: Use specific BSD license variant<br>
=C2=A0 glib-2.0: Use specific BSD license variant<br>
=C2=A0 shadow: Use specific BSD license variant<br>
=C2=A0 libcap: Use specific BSD license variant<br>
<br>
Marek Vasut (1):<br>
=C2=A0 binutils: Backport Include members in the variable table used when<b=
r>
=C2=A0 =C2=A0 resolving DW_AT_specification tags.<br>
<br>
Marta Rybczynska (2):<br>
=C2=A0 grub: add a fix for CVE-2020-25632<br>
=C2=A0 grub: add a fix for CVE-2020-25647<br>
<br>
Minjae Kim (1):<br>
=C2=A0 ghostscript: fix CVE-2021-45949<br>
<br>
Peter Kjellerstedt (1):<br>
=C2=A0 sstate: A third fix for for touching files inside pseudo<br>
<br>
Purushottam Choudhary (1):<br>
=C2=A0 systemd: Fix CVE-2021-3997<br>
<br>
Ranjitsinh Rathod (1):<br>
=C2=A0 util-linux: Fix for CVE-2021-3995 and CVE-2021-3996<br>
<br>
Ross Burton (2):<br>
=C2=A0 lsof: correct LICENSE<br>
=C2=A0 shadow-sysroot: sync license with shadow<br>
<br>
Rudolf J Streif (1):<br>
=C2=A0 linux-firmware: Add CLM blob to linux-firmware-bcm4373 package<br>
<br>
Steve Sakoman (4):<br>
=C2=A0 glibc: update to lastest 2.31 release HEAD<br>
=C2=A0 expat: fix CVE-2022-23852<br>
=C2=A0 expat: add missing Upstream-status, CVE tag and sign-off to<br>
=C2=A0 =C2=A0 CVE-2021-46143.patch<br>
=C2=A0 common-licenses: add Spencer-94<br>
<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 +-<br>
=C2=A0meta/files/common-licenses/Spencer-94=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 12 +<br>
=C2=A0.../grub/files/CVE-2020-25632.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 90 +++++<br>
=C2=A0.../grub/files/CVE-2020-25647.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 119 +++++++<br>
=C2=A0meta/recipes-bsp/grub/grub2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../expat/expat/CVE-2021-46143.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0.../expat/expat/CVE-2022-23852.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 33 ++<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.2.9.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">expat_2.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.31.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">glibc_2.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../systemd/systemd/CVE-2021-3997-1.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
65 ++++<br>
=C2=A0.../systemd/systemd/CVE-2021-3997-2.patch=C2=A0 =C2=A0 =C2=A0| 101 ++=
++++<br>
=C2=A0.../systemd/systemd/CVE-2021-3997-3.patch=C2=A0 =C2=A0 =C2=A0| 266 ++=
+++++++++++++<br>
=C2=A0...-fsync-after-removing-directory-tree.patch |=C2=A0 35 ++<br>
=C2=A0...children-split-out-body-of-directory.patch | 318 +++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_244.5.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">systemd_244.5.bb</a>=C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +<br>
=C2=A0.../util-linux/util-linux/CVE-2021-3995.patch | 139 ++++++++<br>
=C2=A0.../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++<br>
=C2=A0...ude-strutils-cleanup-strto-functions.patch | 270 +++++++++++++++<b=
r>
=C2=A0.../util-linux/<a href=3D"http://util-linux_2.35.1.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">util-linux_2.35.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../binutils/binutils-2.34.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...in-the-variable-table-used-when-reso.patch |=C2=A0 32 ++<br>
=C2=A0meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |=C2=A0 =C2=A02 +-<br>
=C2=A0.../ghostscript/CVE-2021-45949.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 65 ++++<br>
=C2=A0...tack-limits-after-function-evalution.patch |=C2=A0 51 +++<br>
=C2=A0.../ghostscript/<a href=3D"http://ghostscript_9.52.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">ghostscript_9.52.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-extended/lsof/<a href=3D"http://lsof_4.91.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">lsof_4.91.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../shadow/<a href=3D"http://shadow-sysroot_4.6.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">shadow-sysroot_4.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-extended/timezone/timezone.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_20211216.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">linux-firmware_20211216.bb</a>=
 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-support/libcap/<a href=3D"http://libcap_2.32.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">libcap_2.32.bb</a>=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.22.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libusb1_1.0.22.bb</a> |=C2=A0 =
=C2=A04 +-<br>
=C2=A034 files changed, 1863 insertions(+), 15 deletions(-)<br>
=C2=A0create mode 100644 meta/files/common-licenses/Spencer-94<br>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch=
<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-1.=
patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-2.=
patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-3.=
patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-optionally=
-fsync-after-removing-directory-tree.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-refactor-r=
m-rf-children-split-out-body-of-directory.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3=
995.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3=
996.patch<br>
=C2=A0create mode 100644 meta/recipes-core/util-linux/util-linux/include-st=
rutils-cleanup-strto-functions.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Inclu=
de-members-in-the-variable-table-used-when-reso.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-=
2021-45949.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ghostscript/ghostscript/chec=
k-stack-limits-after-function-evalution.patch<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161757): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161757" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/161757</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89166126/6360=
406" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/89166126/6360406</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ranjitsinhratho=
d1991@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@=
gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000b776a05d81dad61--


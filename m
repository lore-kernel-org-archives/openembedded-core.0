Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB6EC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 13:32:40 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.31678.1685626355022436657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 06:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LCBIiGj3;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33b3674acdeso6997635ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685626354; x=1688218354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9I6ldcSGSV1HWk5zJvlZ1cvg36Okne5RTu6ffSAsD0=;
        b=LCBIiGj3EVY5qhGU5eafORqQQjEN2UNzjP1OK0Ri23JX7DTjeaRRxRiHGhg3CAHU7X
         F90ADYKjjTlgcfqPFQ2hSHlmkMuBnGb/rTTU4K1+MOZMP8on3rqvls0S7Evay5aBxHkH
         OicsSuYthKG4ZNmhqxaoSJiuDtdCq0akQU6DviI+4b+h/sJVqjRosimOYdMcHVmemgWo
         +kQmMui4fsg1ms99AE+pMKDSW6elZIugd9tynV2+IBbP9/W53tQFS4Rz48wVHSDjMZrV
         L35WQ7JRIABE6Cad4Me1O+tyouC9aiVwe9GSBuDOhkPy5s1i6YCJrBA2vGZYNRHCqEsi
         QDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685626354; x=1688218354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9I6ldcSGSV1HWk5zJvlZ1cvg36Okne5RTu6ffSAsD0=;
        b=fIjEpHAcWQqMPT4AVDUxAXhj+QJrmkl9FdXR0X+vSfSvv0FtWUGg9rdHB/5ArhbeBX
         e4qCocIih3fjBliRNfNQ5aKrq1cYxae/ig/myyEMEbmqWC1iScphaDhgKN4Vz8BjFjt7
         PSchO1FaIDRcbzGV6k+pqeoSmI0d7u46/XE9wa9oo1XFhPNl5N8ehdyJLBcn+y00S2hP
         GiccpLUpsewYl4m6Hydz9yBHnkAL5Q+dn8ix0DdWcu6ASy2L9dYUu+U75f28fVTm4rF6
         qN3I/c+fIYseApuisbOdG0j7o0pSMUMhTHb4FRXkRHYHUQhxf7Yqxbrz6sslRTzXnG8i
         0iKQ==
X-Gm-Message-State: AC+VfDxZ5yfB27Xt5J9XUA3mzpkyQPKtD5O0v/Yfs1V/EuQfbxZo+v1/
	XXWC0YRuj8JJszjYMnDviWULC8gQyL2YecnmaS1d7DOZufE=
X-Google-Smtp-Source: ACHHUZ6bCfdSPBRUdicnWfyBBogPYrTd5XNPyO5XFzFW5hbPczA0x2KUkN2+8pH8w2XPnU/N76TtRlaCNvULkg4WSoo=
X-Received: by 2002:a05:6e02:170f:b0:33b:3b9:5c02 with SMTP id
 u15-20020a056e02170f00b0033b03b95c02mr2299011ill.15.1685626354182; Thu, 01
 Jun 2023 06:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <01fcd740217f9836f3d13deb15b77ea94910f62e.camel@linuxfoundation.org>
 <20230601092823.3271071-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230601092823.3271071-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Jun 2023 09:32:22 -0400
Message-ID: <CADkTA4NXhx1h5znY-Ayemm1BAnpuMeFV+GO5v1b56Gv1JmR9Qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182107

On Thu, Jun 1, 2023 at 5:28=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver.=
com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Currently all files as below packaged into one package such as
> qemu-7.2.0-*.rpm. After the qemu package installed on the target,
> it will take up about 464M which includes not only the one matches
> the arch of the target but aslo all available built qemu targets
> which set by QEMU_TARGETS.
>
>  # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
>  qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
>  qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-system-x8=
6_64
>  qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
>  qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
>  qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
>  qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
>  qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
>  qemu-riscv32    qemu-system-arm      qemu-system-mips64el
>  qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
>  qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system-sh4
>
> Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-aarch64-7.2.0*.=
rpm,
> qemu-system-x86_64-7.2.0*.rpm and etc. And let user can only choose the
> corresponding qemu arch package they want to install should ease the conc=
erns
> who cares much about the size in embedded device as it decreases the qemu=
 rpm
> (qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of the
> extracted qemu RPM decreased from about 464M to about 248M.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index a87dee5c99..e1ed3bbd4d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,11 @@ INSANE_SKIP:${PN} =3D "arch"
>
>  FILES:${PN} +=3D "${datadir}/icons"
>
> +python populate_packages:prepend() {
> +    archdir =3D d.expand('${bindir}/')
> +    do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%=
s', 'QEMU full system emulation binaries(%s)', extra_depends=3D'${PN}', pre=
pend=3DTrue)

extra_depends=3D'${PN}' is already the default IIRC.

Bruce

> +}
> +
>  # Put the guest agent in a separate package
>  PACKAGES =3D+ "${PN}-guest-agent"
>  SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> --
> 2.25.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182093): https://lists.openembedded.org/g/openembedde=
d-core/message/182093
> Mute This Topic: https://lists.openembedded.org/mt/99260306/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


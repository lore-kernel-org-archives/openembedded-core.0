Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F99C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:09:08 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.12239.1685711339411903126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=niYfRD+2;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77493b3d18cso41713739f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685711338; x=1688303338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIOJLlKhqNjGxemBDVxdTbDtVb/aJuZSucHLtQIo73w=;
        b=niYfRD+2/VCaLRkToXHfYU6XExbdTdq3bLpJUR6pfI3SdKz6Ltmd5cpXqNNj8p8vf+
         lBrULBHoVumk9S44dxDJWHe2Qe830kV/TM+0qeWqHJijJQWd8To1YmJjhgzRACEclHdO
         ZW3mkVetJFIxl33qla66xwMN55apGkQsE7mEfS+AuYtZZ8/rWH/tUIMqJgybh8WzDLhC
         8dH4BmX6HXVAKJy6Jz5e3y2Cn2iRMTaEPF1Fqr/aMM8ze+YZVZwy3cfBqsgr73JikRXw
         6WGydxu9sugFxUR+pNmcmWJUoHdiL/G8W4XSF0VQiLcfjbr2YnOgbSsj0VhsKitwx06B
         NbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711338; x=1688303338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIOJLlKhqNjGxemBDVxdTbDtVb/aJuZSucHLtQIo73w=;
        b=kSOzIdY38QRuPAluo7GfK0N7RedCtFKPZ0kykETbWfifgWmR64brLwHB/cC7yEU/pZ
         m/SdT/InlwQadmO97hZ+YPTuTOz8kntRgCFO//r5v9HD/j8SS7MZpMk1IWufGLfWfywV
         NGvfhBx/f38DUZjifsW51Zax4Y9Gc8g+qbHnKKt5iC1zV+sbkBGClF7FdY9TdKie5INO
         Unhv7+XAHDd3ftmiKYBbD/x2VnCXxSMuxidex9oVbOUsUByLTZcrjTfERZ/tySfqGpJF
         Z5eulyNs+lk7ZWSKNvY3freqszD+PtXsgtTBgnaiTN4k0ysTcv6t+GdMzSBy3+hPAey2
         tUzg==
X-Gm-Message-State: AC+VfDzOmBd8NdeqsH94N6cWZ1IIIYftNYgaUa2ZPCTwioosrtD1xJwt
	fCOoNEVAm5lfRLSotH/99RfqYqi/Axx96BHpBC8=
X-Google-Smtp-Source: ACHHUZ6un4mRRZM629B/k8b8h9jbLGsIUWsYG+1UEkMlaX5WsDyMlBdlMZ0Hi1CSTFoppHdQDWlSubTcJvoztNYsLWY=
X-Received: by 2002:a6b:c412:0:b0:760:ebf0:bdfa with SMTP id
 y18-20020a6bc412000000b00760ebf0bdfamr2526096ioa.2.1685711338496; Fri, 02 Jun
 2023 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4NXhx1h5znY-Ayemm1BAnpuMeFV+GO5v1b56Gv1JmR9Qg@mail.gmail.com>
 <20230602023657.309867-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20230602023657.309867-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Jun 2023 09:08:47 -0400
Message-ID: <CADkTA4P19O3EHGZpSPBaTKjQXpWuV8hF1T-pWiKzuNiVgnc5eA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] qemu: Split the qemu package
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182317

On Thu, Jun 1, 2023 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
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
> index a87dee5c99..c6fd39aab6 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -230,6 +230,11 @@ INSANE_SKIP:${PN} =3D "arch"
>
>  FILES:${PN} +=3D "${datadir}/icons"
>
> +python populate_packages:prepend() {
> +    archdir =3D d.expand('${bindir}/')
> +    do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%=
s', 'QEMU full system emulation binaries(%s)' , prepend=3DTrue)
> +}

I don't see a v3 changelog, but that does look like the unnecessary
default runtime dependency is gone, but what would be the method of
installing the packages if I have an image where I'd like the old
non-split functionality ?

Either a meta packages (qemu-system-all ?) or a way to override the
functionality (a variable around the do_split call ?) are options to
enable that sort of thing. As I mentioned before, there's a different
expected split of the packages in some scenarios, and it would be
ideal to not break those use cases.

Bruce

> +
>  # Put the guest agent in a separate package
>  PACKAGES =3D+ "${PN}-guest-agent"
>  SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182138): https://lists.openembedded.org/g/openembedde=
d-core/message/182138
> Mute This Topic: https://lists.openembedded.org/mt/99279217/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


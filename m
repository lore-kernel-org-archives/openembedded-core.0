Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 530EC7F359
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:10:09 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id e27so5928732ljb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5IfGGbLtjdYcnbzMv37wuNJYZbAVmCTrMNssnWi1IuE=;
	b=JtE4rArlrgvCcbODEwQEvnTD4p2RVujr7vSjkJuJf6A2ZFB6X4DFb73K5H4Xvg/Vgx
	9EK7Gd+vE2MB4JQ2yMJ4vXfTMJLYazNIHohDwtVkG7fGB584rjpj4bkg16/ptWBGVE+1
	EVH5vF/es0sc+wNHNOS8iAQN+qrXevgYsstkEDpmSxjYQq2IJxWndvGNRWEeUTTEaIq+
	8+750XPDgYZ65gVCIGwU0S+LBjDU6WaP6el19f1yJ2PZoOV7zxG2ZIPMBmF6XR/Fkfhg
	4QC2AxS1gGacuIb57FsHJHjD0/xd/xPHUhO4++g3xUxdOuSAE3YTxbZTSn0rduHrcN+p
	Cr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5IfGGbLtjdYcnbzMv37wuNJYZbAVmCTrMNssnWi1IuE=;
	b=r9xNDm0/g3wye8BWTNfw7P5fxR2MxnHdtQpWpdLyOQTpNX0Ka2u1nTvzq2f16POgBV
	ucHOEJbcRwuKZiwNUGpeQcBrbCIMVOZRC9Ixhxexw5mdlI7PwLNPuCLB4hWmlHSVNaxG
	uiNlfk7ahoq+s3IdBrCMzh3vsL32Uup7Wf8SLN9z15CxEou0Ir/X29yZJd5WV59/Ik1V
	OKbV8lwp3f7Qc3MSjlygL1PqCXCVIMW7m+rpcYJBkKhoU9nsjP51j84ln0eEIOxDV4PB
	ny+pNVfPSimEpZxLYzcaDyJf9a6cjaNaTVLqa7RbxNv8Eji4iDznmpZsqyT/KSM3+iuq
	IMEw==
X-Gm-Message-State: APjAAAXqw6NiZXClCYJsR8ly4VTwRhbKLJ/tnmDjv5skAF45e/oDiS3A
	U6Quw+zYkebT5AXFzyi8F8iD+o5QtBX6ItBt51U=
X-Google-Smtp-Source: APXvYqyW1oyahfi8pHsl2Ql2+oD3si91OGbDMwcI+IHTj4mTnMw1yKUOFkhqn2fAtjr69BkJpKEcmBByP3EI6Py2KlY=
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr6165499ljr.119.1565975409852;
	Fri, 16 Aug 2019 10:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190815213145.8986-1-alistair.francis@wdc.com>
	<20190815213145.8986-3-alistair.francis@wdc.com>
	<f641f2e5-ca75-3580-24ba-b785c17981af@mikrodidakt.se>
In-Reply-To: <f641f2e5-ca75-3580-24ba-b785c17981af@mikrodidakt.se>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Aug 2019 10:06:14 -0700
Message-ID: <CAKmqyKM6aCWHptWV72oyWqC60cH4DNqz-D6n6ukRjdpTG0i3XA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
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
X-List-Received-Date: Fri, 16 Aug 2019 17:10:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 11:40 PM Jacob Kroon <jacob.kroon@mikrodidakt.se> w=
rote:
>
> Hi,
>
> On 8/15/19 11:31 PM, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
> >   meta/conf/machine/qemuriscv64.conf            | 2 --
> >   2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/=
machine/include/riscv/qemuriscv.inc
> > index 797a27660d..2ebd0a01f2 100644
> > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > @@ -28,7 +28,7 @@ UBOOT_ENTRYPOINT_riscv64 =3D "0x80200000"
> >   QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> >   QB_MEM =3D "-m 512"
> >   QB_MACHINE =3D "-machine virt"
> > -QB_DEFAULT_KERNEL =3D "fw_jump.elf"
> > +QB_DEFAULT_BIOS =3D "fw_jump.elf"
> >   QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,down=
script=3Dno"
> >   QB_NETWORK_DEVICE =3D "-device virtio-net-device,netdev=3Dnet0,mac=3D=
@MAC@"
> >   QB_ROOTFS_OPT =3D "-drive id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=
=3Draw -device virtio-blk-device,drive=3Ddisk0"
> > diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qem=
uriscv64.conf
> > index dba8f09e93..99b48b309b 100644
> > --- a/meta/conf/machine/qemuriscv64.conf
> > +++ b/meta/conf/machine/qemuriscv64.conf
> > @@ -4,8 +4,6 @@
> >
> >   require conf/machine/include/riscv/qemuriscv.inc
> >
> > -QB_OPT_APPEND +=3D "-show-cursor -monitor null -device loader,file=3D$=
{DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=3D0x80200000"
> > -
>
> Was it intentional to remove these lines aswell ? I can't tell from the
> commit message.

This was intentional.

We used to use:
 -kernel: Specify the firmware
 -device (above): Specify the kernel

Now we can use:
 -bios: Specify the firmware
 -kernel: Specify the kernel

So this line isn't required.

Alistair

>
> /Jacob
>
> >   EXTRA_IMAGEDEPENDS +=3D "u-boot"
> >   UBOOT_MACHINE =3D "qemu-riscv64_defconfig"
> >   UBOOT_ELF =3D "u-boot"
> >
>
>
>
> [mikrodidakt]
> Jacob Kroon =E2=80=A2 +46 46325040
>
> mikrodidakt.se =E2=80=A2 Skifferv=C3=A4gen 48, SE-224 78 LUND, Sweden
>
> Consultans since 1980 =E2=80=A2 SW, HW, Embedded Systems, Linux
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


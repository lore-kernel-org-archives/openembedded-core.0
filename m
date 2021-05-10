Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.33654.1620661311732168873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 08:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NsD8iCoC;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id k127so15733039qkc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xJKfGf3QxMRJekgWuaQTpaIUrXWjDwk619u1zn8J8sY=;
        b=NsD8iCoCn7umrV4S2X7yMUdqttoQMJGMt7TPaEvGF79uVSffS6zx8ET4YLuSrztMOq
         selEMgJVK0137ZLjSs55uUwI4A8qTfwH01ynvkXDqHvDCx10fI677f2xFs7dX51E2nvG
         MIgOVSzG/uEOCgUFzFeDVE1Xo9DNt4Tcc4rgGajnpyKFvXO5y4MN73PDLydaezLIoUEZ
         MgLhLZQVj2POSI5h1hC/vaLa+JQp3MMejpCOH8Mq2z/9Nz/Hgcw8jc/Qd1JeBctemhm9
         2SvlFeOKKHfkMHqgAj3YPhwB0RxFNi4KhMsVquxQROuIBnmsHzNNP4hZaA4JVAIcnXlm
         DFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xJKfGf3QxMRJekgWuaQTpaIUrXWjDwk619u1zn8J8sY=;
        b=YltmOWv2zuZ+lduZIkN15wVqqIQZNbu7Be78tAXofG6wSr71sJh9Ni65R3T0u7RcZn
         X6OcwkS7HEryXi7w5RBGw4h0nnOZFOZ6I7a0mRI3mPHtgIlQncO+q9KdFlwmEgB+yjVH
         a2sAoecDy/jPaLcPin9whmJRcTUfzv54DEBElkvGEPsJuNUsuipJRvSmetULBxnGBuf+
         2hrRJE8QOJo3m6PvDzpMzuCBRp0W00U1BrIVB7w7JdSdMjsGLa/aoEVFJmgDqgn3BpUN
         P9qfEQdZabnWh5DdHR1GpZTNwcjIP1EY3n5r2OTKh3pz5mmchVhwvIRk5WpbsMYjotRl
         eUiQ==
X-Gm-Message-State: AOAM531NZQy9uXDl2Sao9LNYKh3eNqoP6eCRWid0sJE77RKMSmLg8ZAG
	QagsavBbKE+fJX4e9LutHJdT6CjdafYyxYV/m8Q=
X-Google-Smtp-Source: ABdhPJzSoweQD1XuhbTFw4yyFRAjj3WQtTTxl/ApX5oHXWkn7RQelEd4P53fGl6JaByrrAnbLceOoI++YnS+IAgjj2s=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr23081785qky.125.1620661310751;
 Mon, 10 May 2021 08:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210508083031.1448886-1-alejandro@enedino.org>
 <CAKmqyKNVQQf6fsKaHT=_T_5GFOnNytqaXoisYQ7eDiFLK_1N5A@mail.gmail.com> <CAHMutrYTzT4ouvQw2HAY1KjiwuOwYfRUuLyE2HePTSR+HC4KrQ@mail.gmail.com>
In-Reply-To: <CAHMutrYTzT4ouvQw2HAY1KjiwuOwYfRUuLyE2HePTSR+HC4KrQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 10 May 2021 08:41:24 -0700
Message-ID: <CAMKF1sqkN5rQU-uHJkJhprkVbSBFMUBMjJHev7SX2JQts6Lb3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Enable RISC-V 64 port
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Alistair Francis <alistair23@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 8:36 AM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
> On Sun, May 9, 2021, 7:25 PM Alistair Francis <alistair23@gmail.com> wro=
te:
>>
>> On Sat, May 8, 2021 at 6:30 PM Alejandro Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> > Add support for MACHINE=3Dqemuriscv64.
>> >
>> > $ runqemu nographic
>> >
>> > BIOS: [tmp/deploy/images/qemuriscv64/baremetal-helloworld-image-qemur=
iscv64.elf]
>> > MACHINE: [qemuriscv64]
>> >
>> > runqemu - INFO - Running tmp/work/x86_64-linux/qemu-helper-native/1.0=
-r1/recipe-sysroot-native/usr/bin/qemu-system-riscv64
>> >
>> > Hello OpenEmbedded on RISC-V 64!
>> >
>> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedi=
no.org>
>> > ---
>> >  .../baremetal-examples/baremetal-helloworld_git.bb   | 12 ++++++++++=
--
>> >  1 file changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/barem=
etal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples=
/baremetal-helloworld_git.bb
>> > index ee945c1ff0..3b7b8193a7 100644
>> > --- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-he=
lloworld_git.bb
>> > +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-he=
lloworld_git.bb
>> > @@ -4,7 +4,7 @@ DESCRIPTION =3D "These are introductory examples to s=
howcase the use of QEMU to ru
>> >  LICENSE =3D "MIT"
>> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39346640a23c701e4f459e05f=
56f4449"
>> >
>> > -SRCREV =3D "99f4fa4a3b266b42b52af302610b0f4f429ba5e3"
>> > +SRCREV =3D "0bf9ea216e6f76be50726a3a74e527b7bbb0ad93"
>> >  PV =3D "0.1+git${SRCPV}"
>> >
>> >  SRC_URI =3D "git://github.com/aehs29/baremetal-helloqemu.git;protoco=
l=3Dhttps;branch=3Dmaster"
>> > @@ -28,12 +28,13 @@ inherit baremetal-image
>> >  # machine that QEMU uses on OE, e.g. -machine virt -cpu cortex-a57
>> >  # but the examples can also be run on other architectures/machines
>> >  # such as vexpress-a15 by overriding the setting on the machine.conf
>> > -COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64"
>> > +COMPATIBLE_MACHINE =3D "qemuarmv5|qemuarm|qemuarm64|qemuriscv64"
>> >
>> >  BAREMETAL_QEMUARCH ?=3D ""
>> >  BAREMETAL_QEMUARCH_qemuarmv5 =3D "versatile"
>> >  BAREMETAL_QEMUARCH_qemuarm =3D "arm"
>> >  BAREMETAL_QEMUARCH_qemuarm64 =3D "aarch64"
>> > +BAREMETAL_QEMUARCH_qemuriscv64 =3D "riscv64"
>> >
>> >  EXTRA_OEMAKE_append =3D " QEMUARCH=3D${BAREMETAL_QEMUARCH} V=3D1"
>> >
>> > @@ -49,3 +50,10 @@ FILES_${PN} +=3D " \
>> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin \
>> >      ${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf \
>> >  "
>> > +
>> > +# RISC-V tunes set the BIOS, redefine since runqemu jumps there
>> > +QB_DEFAULT_BIOS_qemuriscv64 =3D "${IMAGE_LINK_NAME}.elf"
>>
>>
>>
> Hey Alistair,
>
> The issue here is that the runqemu script doesn't have wiring to pass "-=
bios none", if a Bios isn't defined the bios paremeter isn't passed at all =
and it ends up booting to opensbi, if it makes more sense I can force "-bio=
s none" using QB_OPT_APPEND and unset QB_DEFAULT_BIOS
>

yes that sounds good to me.

> Cheers,
>
> Alejandro
>
>>
>> You should also just be able to say `-bios none` and then use the
>> -kernel argument as normal.
>>
>> Alistair
>>
>> > +
>> > +# Use the medium-any code model for the RISC-V 64 bit implementation=
,
>> > +# since medlow can only access addresses below 0x80000000
>> > +CFLAGS_append_qemuriscv64 =3D " -mcmodel=3Dmedany"
>> > --
>> > 2.25.1
>> >
>> >
>> >
>> >
>
>
>=20
>

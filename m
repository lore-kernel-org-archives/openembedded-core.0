Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.7217.1590589938395617108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 07:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ks7oRFya;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id t23so1227934vkt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QSRepFlyvZYCvt/Emf9JyxeuFQI6B13c7kB0Wy93OMw=;
        b=ks7oRFyaRbJNax6kCPG0xqtOfNy4wY3hbc0OWr4cKZZQ/SG1QNwrwY37LXPPqhOBa+
         vle4p9riGMnyiReU/nSPZvnR7c4P4bBABUBf0ZmRH0fWGxswFzhYayGMHm/9dBoH6F07
         ZLeklzvsVf2wcIqBxm9EVrmy/rdQH/qCd/W4gg/XxO+kGDxSXvSNntkApPky4ZdlaY8K
         vWuT06KR9xz5ZDOpLczfLdjp8+P38oWsahfwWL2IpjYvpY5DwBPQQg+U6l97fHxVJ4op
         88D+5sgreD59dvDi/m9+VgvmBTt7Gyb/dJnJ9U230cuCFnqsdsjgnhrcNEQYeYCQJH5L
         rT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QSRepFlyvZYCvt/Emf9JyxeuFQI6B13c7kB0Wy93OMw=;
        b=HwPqQA+J608hXsh/G3o3oViu5/FMeYGUEjeKlWqNtqbNp4RO+FqG+g5nQEh38IGclD
         5ORsBfSj+UfC+n/xCkkK16eGCGYvnqzjQzbh8uO++gwiZWvhhazLrfL36RBi7YGHDrz+
         sFVkP6upT3QnA47YFQgVTTtNQLJ0k1+15JAZvYmJ7ekDTahuslaYt3xm4ddyx4C4wDTs
         WQWpcX5KaKgwUCAHMZDMKQCaHkzpOJJ4s1Ge+ssZroSKOKwL4qmLOM2nNW/mRbubNIji
         Rc/Nha9uUc0X+G22RPAK6gPaEsEijV1BOQ+SgZor0McMK+xfZoWk3j5xfinim9uaekaJ
         HGiA==
X-Gm-Message-State: AOAM5303Gdn2ZafO0DjLWUHHD6/ytQMAbZRGTj2dOoqZ57YPgyS0wmxU
	RhAtW1WdDhxjCOjviMyXnXWlFb2qKgp8zqy6bIg=
X-Google-Smtp-Source: ABdhPJxpVsobMPOPm1prak38lGuvEXzroDKZImeuzspzrZ/E/hFM5309an1BJXk3llauNhp30465Bt3B62+b9PgwUUc=
X-Received: by 2002:a1f:4dc2:: with SMTP id a185mr5352305vkb.9.1590589937409;
 Wed, 27 May 2020 07:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <qGlJFzBcawqf2UFr8E8EaYuftNrwyxaR9FaRpw7UDU7hVtXdCiCR9oZT9pWwRM-XXY-_OoOVLDeYazLfwnS7FbFIijyMlVVBGHDUc6R_EP8=@protonmail.ch>
 <CANNYZj-5X7R+u8DbcukZcCYcZH6iAdX6b-4Q9vcbFpA2yJMzig@mail.gmail.com> <FG9FuupfY7gDkVp6dksFTfV4g1Qle4LG1sHTTz91zoOH_jEESEpz1O8GNILOjGMyVMrEXt9qYL59sFCppoS8R3684y7ke6_dTGJ1ylWbnfA=@protonmail.ch>
In-Reply-To: <FG9FuupfY7gDkVp6dksFTfV4g1Qle4LG1sHTTz91zoOH_jEESEpz1O8GNILOjGMyVMrEXt9qYL59sFCppoS8R3684y7ke6_dTGJ1ylWbnfA=@protonmail.ch>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 27 May 2020 16:32:05 +0200
Message-ID: <CANNYZj--Yx21SroOLE6eONZZ+ZwJKpX2LPQF+zFG+0deSMffHw@mail.gmail.com>
Subject: Re: [OE-core] Issue with qemu and a shared sstate-cache used by different linux distribution supported by yocto
To: vygu <vygu@protonmail.ch>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033e44a05a6a214f0"

--00000000000033e44a05a6a214f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Runqemu is running qemu binaries from a different location (that of
qemu-helper-native sysroot), and on my machine, qemu in that location
resolves libraries correctly. Can you try the same please?

ak@linux-f9zs:~/development/poky> ldd
build-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nat=
ive/usr/bin/qemu-system-aarch64.real

        linux-vdso.so.1 (0x00007ffcf73d9000)
        libvirglrenderer.so.1 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libvirglrenderer.so.1
(0x00007fdb2efce000)
        libepoxy.so.0 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libepoxy.so.0
(0x00007fdb2ee9a000)
        libgbm.so.1 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
(0x00007fdb2ee89000)
        libasound.so.2 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libasound.so.2
(0x00007fdb2ed93000)
        libSDL2-2.0.so.0 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libSDL2-2.0.so.0
(0x00007fdb2ec5f000)
        libX11.so.6 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libX11.so.6
(0x00007fdb2eb1f000)
        libgtk-3.so.0 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgtk-3.so.0
(0x00007fdb2e440000)
        libgdk-3.so.0 =3D>
/home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native=
/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgdk-3.so.0
(0x00007fdb2e38c000)

(etc, there is a lot of similar lines)

Alex

On Wed, 27 May 2020 at 15:59, vygu <vygu@protonmail.ch> wrote:

> For example:
>
> with the sstate-cache build on a debian, we have:
>
> $ ldd ../build/ tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/sysroot=
-destdir/home/user/yocto/build/tmp/work/x86_64-linux/qemu-system-native/4.1=
.0-r0/recipe-sysroot-native/usr/bin/qemu-system-aarch64
> 	linux-vdso.so.1 (0x00007ffe7dbc0000)
> 	libseccomp.so.2 =3D> /lib/x86_64-linux-gnu/libseccomp.so.2 (0x00007f533d=
18a000)
> 	libbrlapi.so.0.6 =3D> /lib/x86_64-linux-gnu/libbrlapi.so.0.6 (0x00007f53=
3d17d000)
> 	libvdeplug.so.2 =3D> /lib/libvdeplug.so.2 (0x00007f533d175000)
> 	libasound.so.2 =3D> /lib/x86_64-linux-gnu/libasound.so.2 (0x00007f533d07=
4000)
> 	libz.so.1 =3D> /lib/x86_64-linux-gnu/libz.so.1 (0x00007f533ce56000)
> 	libnfs.so.8 =3D> /lib/x86_64-linux-gnu/libnfs.so.8 (0x00007f533cc1d000)
> 	librbd.so.1 =3D> /lib/x86_64-linux-gnu/librbd.so.1 (0x00007f533c8dc000)
> 	librados.so.2 =3D> /lib/x86_64-linux-gnu/librados.so.2 (0x00007f533c76c0=
00)
> 	libacl.so.1 =3D> /lib/x86_64-linux-gnu/libacl.so.1 (0x00007f533c761000)
> 	libgfapi.so.0 =3D> /lib/x86_64-linux-gnu/libgfapi.so.0 (0x00007f533c7320=
00)
> 	libglusterfs.so.0 =3D> /lib/x86_64-linux-gnu/libglusterfs.so.0 (0x00007f=
533c624000)
> 	libgfrpc.so.0 =3D> /lib/x86_64-linux-gnu/libgfrpc.so.0 (0x00007f533c6040=
00)
> 	libgfxdr.so.0 =3D> /lib/x86_64-linux-gnu/libgfxdr.so.0 (0x00007f533c5e40=
00)
> 	libuuid.so.1 =3D> /lib/x86_64-linux-gnu/libuuid.so.1 (0x00007f533c5db000=
)
> 	libpixman-1.so.0 =3D> /lib/x86_64-linux-gnu/libpixman-1.so.0 (0x00007f53=
3c535000)
> 	libutil.so.1 =3D> /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f533c530000=
)
> 	libfdt.so.1 =3D> /lib/x86_64-linux-gnu/libfdt.so.1 (0x00007f533c524000)
> 	libgthread-2.0.so.0 =3D> /lib/x86_64-linux-gnu/libgthread-2.0.so.0 (0x00=
007f533c51d000)
> 	libglib-2.0.so.0 =3D> /lib/x86_64-linux-gnu/libglib-2.0.so.0 (0x00007f53=
3c3fe000)
> 	librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0x00007f533c3f4000)
> 	libstdc++.so.6 =3D> /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f533c27=
0000)
> 	libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007f533c0ed000)
> 	libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f533c0d30=
00)
> 	libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f533c=
0b0000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f533beef000)
> 	libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f533beea000)
> 	/home/user/yocto/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-=
x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f533e447000)
> 	libceph-common.so.0 =3D> /usr/lib/x86_64-linux-gnu/ceph/libceph-common.s=
o.0 (0x00007f5333422000)
> 	libboost_system.so.1.67.0 =3D> /lib/x86_64-linux-gnu/libboost_system.so.=
1.67.0 (0x00007f533341b000)
> 	libboost_thread.so.1.67.0 =3D> /lib/x86_64-linux-gnu/libboost_thread.so.=
1.67.0 (0x00007f53333ed000)
> 	libattr.so.1 =3D> /lib/x86_64-linux-gnu/libattr.so.1 (0x00007f53333e5000=
)
> 	libtirpc.so.3 =3D> /lib/x86_64-linux-gnu/libtirpc.so.3 (0x00007f53333b10=
00)
> 	libcrypto.so.1.1 =3D> /lib/x86_64-linux-gnu/libcrypto.so.1.1 (0x00007f53=
330c8000)
> 	libpcre.so.3 =3D> /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f5333054000=
)
> 	libresolv.so.2 =3D> /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f533303=
8000)
> 	libboost_regex.so.1.67.0 =3D> /lib/x86_64-linux-gnu/libboost_regex.so.1.=
67.0 (0x00007f5332f23000)
> 	libboost_iostreams.so.1.67.0 =3D> /lib/x86_64-linux-gnu/libboost_iostrea=
ms.so.1.67.0 (0x00007f5332f05000)
> 	libblkid.so.1 =3D> /lib/x86_64-linux-gnu/libblkid.so.1 (0x00007f5332eb00=
00)
> 	libsmime3.so =3D> /lib/x86_64-linux-gnu/libsmime3.so (0x00007f5332e81000=
)
> 	libnss3.so =3D> /lib/x86_64-linux-gnu/libnss3.so (0x00007f5332d33000)
> 	libnspr4.so =3D> /lib/x86_64-linux-gnu/libnspr4.so (0x00007f5332cf0000)
> 	libibverbs.so.1 =3D> /lib/x86_64-linux-gnu/libibverbs.so.1 (0x00007f5332=
cd5000)
> 	libboost_atomic.so.1.67.0 =3D> /lib/x86_64-linux-gnu/libboost_atomic.so.=
1.67.0 (0x00007f5332cd0000)
> 	libgssapi_krb5.so.2 =3D> /lib/x86_64-linux-gnu/libgssapi_krb5.so.2 (0x00=
007f5332c83000)
> 	libkrb5.so.3 =3D> /lib/x86_64-linux-gnu/libkrb5.so.3 (0x00007f5332ba3000=
)
> 	libk5crypto.so.3 =3D> /lib/x86_64-linux-gnu/libk5crypto.so.3 (0x00007f53=
32b6d000)
> 	libcom_err.so.2 =3D> /lib/x86_64-linux-gnu/libcom_err.so.2 (0x00007f5332=
b67000)
> 	libicudata.so.63 =3D> /lib/x86_64-linux-gnu/libicudata.so.63 (0x00007f53=
31177000)
> 	libicui18n.so.63 =3D> /lib/x86_64-linux-gnu/libicui18n.so.63 (0x00007f53=
30e9c000)
> 	libicuuc.so.63 =3D> /lib/x86_64-linux-gnu/libicuuc.so.63 (0x00007f5330cc=
d000)
> 	libbz2.so.1.0 =3D> /lib/x86_64-linux-gnu/libbz2.so.1.0 (0x00007f5330cb80=
00)
> 	libnssutil3.so =3D> /lib/x86_64-linux-gnu/libnssutil3.so (0x00007f5330c8=
6000)
> 	libplc4.so =3D> /lib/x86_64-linux-gnu/libplc4.so (0x00007f5330c7f000)
> 	libplds4.so =3D> /lib/x86_64-linux-gnu/libplds4.so (0x00007f5330c7a000)
> 	libnl-route-3.so.200 =3D> /lib/x86_64-linux-gnu/libnl-route-3.so.200 (0x=
00007f5330a01000)
> 	libnl-3.so.200 =3D> /lib/x86_64-linux-gnu/libnl-3.so.200 (0x00007f53307e=
0000)
> 	libkrb5support.so.0 =3D> /lib/x86_64-linux-gnu/libkrb5support.so.0 (0x00=
007f53307cf000)
> 	libkeyutils.so.1 =3D> /lib/x86_64-linux-gnu/libkeyutils.so.1 (0x00007f53=
307c8000)
>
> without the sstate-cache, on an ubuntu 16.04, we have:
>
> ldd  ../build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/sysroot-d=
estdir/home/user/yocto/build/tmp/work/x86_64-linux/qemu-system-native/4.1.0=
-r0/recipe-sysroot-native/usr/bin/qemu-system-aarch64
>         linux-vdso.so.1 (0x00006b9b308f2000)
>         libasound.so.2 =3D> /usr/lib/libasound.so.2 (0x00006b9b307d0000)
>         libz.so.1 =3D> /usr/lib/libz.so.1 (0x00006b9b307b6000)
>         libpixman-1.so.0 =3D> /usr/lib/libpixman-1.so.0 (0x00006b9b3070e0=
00)
>         libutil.so.1 =3D> /usr/lib/libutil.so.1 (0x00006b9b30709000)
>         libfdt.so.1 =3D> /usr/lib/libfdt.so.1 (0x00006b9b306ff000)
>         libglib-2.0.so.0 =3D> /usr/lib/libglib-2.0.so.0 (0x00006b9b305d40=
00)
>         librt.so.1 =3D> /usr/lib/librt.so.1 (0x00006b9b305c9000)
>         libstdc++.so.6 =3D> /usr/lib/libstdc++.so.6 (0x00006b9b303ec000)
>         libm.so.6 =3D> /usr/lib/libm.so.6 (0x00006b9b302a7000)
>         libgcc_s.so.1 =3D> /usr/lib/libgcc_s.so.1 (0x00006b9b3028d000)
>         libpthread.so.0 =3D> /usr/lib/libpthread.so.0 (0x00006b9b3026b000=
)
>         libc.so.6 =3D> /usr/lib/libc.so.6 (0x00006b9b300a2000)
>         libdl.so.2 =3D> /usr/lib/libdl.so.2 (0x00006b9b3009c000)
>         /home/user/yocto/buildv1.8/tmp/sysroots-uninative/x86_64-linux/li=
b/ld-linux-x86-64.so.2 =3D> /usr/lib64/ld-linux-x86-64.so.2 (0x00006b9b308f=
4000)
>         libpcre.so.1 =3D> /usr/lib/libpcre.so.1 (0x00006b9b3002a000)
>
>
>
>
>
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Wednesday 27 May 2020 14:43, Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
>
> Can you please provide the lib names which are problematic?
>
> Alex
>
> On Wed, 27 May 2020 at 14:29, vygu via lists.openembedded.org <vygu=3D
> protonmail.ch@lists.openembedded.org> wrote:
>
>> Hello,
>>
>> Since the zeus serie (also with dunfell), we observe an issue with
>> runqemu when we share the sstate-cache thanks to a mirror between differ=
ent
>> linux distribution supported by yocto.
>>
>> If we build a sstate-cache on a debian 10 x86_64 buildfarm,  and after
>> that we use it on an ubuntu 18.04 x86_64, runqemu don't find several lib=
s.
>> We have reproduced this problem on two different pc with ubuntu 18.04 an=
d
>> 16.04.
>>
>> We don't have this problem, if we use the shared sstate-cache on another
>> debian.
>>
>> In all cases, a  ldd on the qemu binary shows us the use of local/host
>> libs, not the yocto libs.
>>
>> Is it an expected behavior? or not?
>> Runqemu's libs have to come from the linux distribution or from the yoct=
o
>> build env?
>>
>> Cordially,
>>
>> vygu
>>
>>
>>
>>
>

--00000000000033e44a05a6a214f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Runqemu is running qemu binaries from a different loc=
ation (that of qemu-helper-native sysroot), and on my machine, qemu in that=
 location resolves libraries correctly. Can you try the same please?</div><=
div><br></div><div>ak@linux-f9zs:~/development/poky&gt; ldd build-st/tmp/wo=
rk/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qem=
u-system-aarch64.real <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-vdso.so.1 (0x00=
007ffcf73d9000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libvirglrenderer.so.1 =3D&gt=
; /home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-nati=
ve/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libvirglrenderer.so.1 (0x000=
07fdb2efce000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libepoxy.so.0 =3D&gt; /home/a=
k/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1=
/recipe-sysroot-native/usr/bin/../lib/libepoxy.so.0 (0x00007fdb2ee9a000)<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgbm.so.1 =3D&gt; /home/ak/development/poky/=
build-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-nat=
ive/usr/bin/../lib/libgbm.so.1 (0x00007fdb2ee89000)<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 libasound.so.2 =3D&gt; /home/ak/development/poky/build-st/tmp/work/=
x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib=
/libasound.so.2 (0x00007fdb2ed93000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libSDL2=
-2.0.so.0 =3D&gt; /home/ak/development/poky/build-st/tmp/work/x86_64-linux/=
qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libSDL2-2.0.=
so.0 (0x00007fdb2ec5f000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libX11.so.6 =3D&gt=
; /home/ak/development/poky/build-st/tmp/work/x86_64-linux/qemu-helper-nati=
ve/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libX11.so.6 (0x00007fdb2eb1f=
000)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 libgtk-3.so.0 =3D&gt; /home/ak/developm=
ent/poky/build-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sy=
sroot-native/usr/bin/../lib/libgtk-3.so.0 (0x00007fdb2e440000)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 libgdk-3.so.0 =3D&gt; /home/ak/development/poky/build-=
st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/us=
r/bin/../lib/libgdk-3.so.0 (0x00007fdb2e38c000)=C2=A0</div><div><br></div><=
div>(etc, there is a lot of similar lines)</div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 27 May 2020 at 15:59, vygu &lt;<a href=3D"mailto:vygu@proton=
mail.ch">vygu@protonmail.ch</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>For example:<br></div><div><br></div><div>w=
ith the sstate-cache build on a debian, we have:<br></div><pre>$ ldd ../bui=
ld/ tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/sysroot-destdir/home/=
user/yocto/build/tmp/work/x86_64-linux/qemu-system-native/4.1.0-r0/recipe-s=
ysroot-native/usr/bin/qemu-system-aarch64
	linux-vdso.so.1 (0x00007ffe7dbc0000)
	libseccomp.so.2 =3D&gt; /lib/x86_64-linux-gnu/libseccomp.so.2 (0x00007f533=
d18a000)
	libbrlapi.so.0.6 =3D&gt; /lib/x86_64-linux-gnu/libbrlapi.so.0.6 (0x00007f5=
33d17d000)
	libvdeplug.so.2 =3D&gt; /lib/libvdeplug.so.2 (0x00007f533d175000)
	libasound.so.2 =3D&gt; /lib/x86_64-linux-gnu/libasound.so.2 (0x00007f533d0=
74000)
	libz.so.1 =3D&gt; /lib/x86_64-linux-gnu/libz.so.1 (0x00007f533ce56000)
	libnfs.so.8 =3D&gt; /lib/x86_64-linux-gnu/libnfs.so.8 (0x00007f533cc1d000)
	librbd.so.1 =3D&gt; /lib/x86_64-linux-gnu/librbd.so.1 (0x00007f533c8dc000)
	librados.so.2 =3D&gt; /lib/x86_64-linux-gnu/librados.so.2 (0x00007f533c76c=
000)
	libacl.so.1 =3D&gt; /lib/x86_64-linux-gnu/libacl.so.1 (0x00007f533c761000)
	libgfapi.so.0 =3D&gt; /lib/x86_64-linux-gnu/libgfapi.so.0 (0x00007f533c732=
000)
	libglusterfs.so.0 =3D&gt; /lib/x86_64-linux-gnu/libglusterfs.so.0 (0x00007=
f533c624000)
	libgfrpc.so.0 =3D&gt; /lib/x86_64-linux-gnu/libgfrpc.so.0 (0x00007f533c604=
000)
	libgfxdr.so.0 =3D&gt; /lib/x86_64-linux-gnu/libgfxdr.so.0 (0x00007f533c5e4=
000)
	libuuid.so.1 =3D&gt; /lib/x86_64-linux-gnu/libuuid.so.1 (0x00007f533c5db00=
0)
	libpixman-1.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpixman-1.so.0 (0x00007f5=
33c535000)
	libutil.so.1 =3D&gt; /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f533c53000=
0)
	libfdt.so.1 =3D&gt; /lib/x86_64-linux-gnu/libfdt.so.1 (0x00007f533c524000)
	libgthread-2.0.so.0 =3D&gt; /lib/x86_64-linux-gnu/libgthread-2.0.so.0 (0x0=
0007f533c51d000)
	libglib-2.0.so.0 =3D&gt; /lib/x86_64-linux-gnu/libglib-2.0.so.0 (0x00007f5=
33c3fe000)
	librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt.so.1 (0x00007f533c3f4000)
	libstdc++.so.6 =3D&gt; /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f533c2=
70000)
	libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.so.6 (0x00007f533c0ed000)
	libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f533c0d3=
000)
	libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f533=
c0b0000)
	libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 (0x00007f533beef000)
	libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f533beea000)
	/home/user/yocto/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x8=
6-64.so.2 =3D&gt; /lib64/ld-linux-x86-64.so.2 (0x00007f533e447000)
	libceph-common.so.0 =3D&gt; /usr/lib/x86_64-linux-gnu/ceph/libceph-common.=
so.0 (0x00007f5333422000)
	libboost_system.so.1.67.0 =3D&gt; /lib/x86_64-linux-gnu/libboost_system.so=
.1.67.0 (0x00007f533341b000)
	libboost_thread.so.1.67.0 =3D&gt; /lib/x86_64-linux-gnu/libboost_thread.so=
.1.67.0 (0x00007f53333ed000)
	libattr.so.1 =3D&gt; /lib/x86_64-linux-gnu/libattr.so.1 (0x00007f53333e500=
0)
	libtirpc.so.3 =3D&gt; /lib/x86_64-linux-gnu/libtirpc.so.3 (0x00007f53333b1=
000)
	libcrypto.so.1.1 =3D&gt; /lib/x86_64-linux-gnu/libcrypto.so.1.1 (0x00007f5=
3330c8000)
	libpcre.so.3 =3D&gt; /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f533305400=
0)
	libresolv.so.2 =3D&gt; /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f53330=
38000)
	libboost_regex.so.1.67.0 =3D&gt; /lib/x86_64-linux-gnu/libboost_regex.so.1=
.67.0 (0x00007f5332f23000)
	libboost_iostreams.so.1.67.0 =3D&gt; /lib/x86_64-linux-gnu/libboost_iostre=
ams.so.1.67.0 (0x00007f5332f05000)
	libblkid.so.1 =3D&gt; /lib/x86_64-linux-gnu/libblkid.so.1 (0x00007f5332eb0=
000)
	libsmime3.so =3D&gt; /lib/x86_64-linux-gnu/libsmime3.so (0x00007f5332e8100=
0)
	libnss3.so =3D&gt; /lib/x86_64-linux-gnu/libnss3.so (0x00007f5332d33000)
	libnspr4.so =3D&gt; /lib/x86_64-linux-gnu/libnspr4.so (0x00007f5332cf0000)
	libibverbs.so.1 =3D&gt; /lib/x86_64-linux-gnu/libibverbs.so.1 (0x00007f533=
2cd5000)
	libboost_atomic.so.1.67.0 =3D&gt; /lib/x86_64-linux-gnu/libboost_atomic.so=
.1.67.0 (0x00007f5332cd0000)
	libgssapi_krb5.so.2 =3D&gt; /lib/x86_64-linux-gnu/libgssapi_krb5.so.2 (0x0=
0007f5332c83000)
	libkrb5.so.3 =3D&gt; /lib/x86_64-linux-gnu/libkrb5.so.3 (0x00007f5332ba300=
0)
	libk5crypto.so.3 =3D&gt; /lib/x86_64-linux-gnu/libk5crypto.so.3 (0x00007f5=
332b6d000)
	libcom_err.so.2 =3D&gt; /lib/x86_64-linux-gnu/libcom_err.so.2 (0x00007f533=
2b67000)
	libicudata.so.63 =3D&gt; /lib/x86_64-linux-gnu/libicudata.so.63 (0x00007f5=
331177000)
	libicui18n.so.63 =3D&gt; /lib/x86_64-linux-gnu/libicui18n.so.63 (0x00007f5=
330e9c000)
	libicuuc.so.63 =3D&gt; /lib/x86_64-linux-gnu/libicuuc.so.63 (0x00007f5330c=
cd000)
	libbz2.so.1.0 =3D&gt; /lib/x86_64-linux-gnu/libbz2.so.1.0 (0x00007f5330cb8=
000)
	libnssutil3.so =3D&gt; /lib/x86_64-linux-gnu/libnssutil3.so (0x00007f5330c=
86000)
	libplc4.so =3D&gt; /lib/x86_64-linux-gnu/libplc4.so (0x00007f5330c7f000)
	libplds4.so =3D&gt; /lib/x86_64-linux-gnu/libplds4.so (0x00007f5330c7a000)
	libnl-route-3.so.200 =3D&gt; /lib/x86_64-linux-gnu/libnl-route-3.so.200 (0=
x00007f5330a01000)
	libnl-3.so.200 =3D&gt; /lib/x86_64-linux-gnu/libnl-3.so.200 (0x00007f53307=
e0000)
	libkrb5support.so.0 =3D&gt; /lib/x86_64-linux-gnu/libkrb5support.so.0 (0x0=
0007f53307cf000)
	libkeyutils.so.1 =3D&gt; /lib/x86_64-linux-gnu/libkeyutils.so.1 (0x00007f5=
3307c8000)</pre><div>without the sstate-cache, on an ubuntu 16.04, we have:=
<br></div><pre>ldd  ../build/tmp/work/x86_64-linux/qemu-system-native/4.1.0=
-r0/sysroot-destdir/home/user/yocto/build/tmp/work/x86_64-linux/qemu-system=
-native/4.1.0-r0/recipe-sysroot-native/usr/bin/qemu-system-aarch64
        linux-vdso.so.1 (0x00006b9b308f2000)
        libasound.so.2 =3D&gt; /usr/lib/libasound.so.2 (0x00006b9b307d0000)
        libz.so.1 =3D&gt; /usr/lib/libz.so.1 (0x00006b9b307b6000)
        libpixman-1.so.0 =3D&gt; /usr/lib/libpixman-1.so.0 (0x00006b9b3070e=
000)
        libutil.so.1 =3D&gt; /usr/lib/libutil.so.1 (0x00006b9b30709000)
        libfdt.so.1 =3D&gt; /usr/lib/libfdt.so.1 (0x00006b9b306ff000)
        libglib-2.0.so.0 =3D&gt; /usr/lib/libglib-2.0.so.0 (0x00006b9b305d4=
000)
        librt.so.1 =3D&gt; /usr/lib/librt.so.1 (0x00006b9b305c9000)
        libstdc++.so.6 =3D&gt; /usr/lib/libstdc++.so.6 (0x00006b9b303ec000)
        libm.so.6 =3D&gt; /usr/lib/libm.so.6 (0x00006b9b302a7000)
        libgcc_s.so.1 =3D&gt; /usr/lib/libgcc_s.so.1 (0x00006b9b3028d000)
        libpthread.so.0 =3D&gt; /usr/lib/libpthread.so.0 (0x00006b9b3026b00=
0)
        libc.so.6 =3D&gt; /usr/lib/libc.so.6 (0x00006b9b300a2000)
        libdl.so.2 =3D&gt; /usr/lib/libdl.so.2 (0x00006b9b3009c000)
        /home/user/yocto/buildv1.8/tmp/sysroots-uninative/x86_64-linux/lib/=
ld-linux-x86-64.so.2 =3D&gt; /usr/lib64/ld-linux-x86-64.so.2 (0x00006b9b308=
f4000)
        libpcre.so.1 =3D&gt; /usr/lib/libpcre.so.1 (0x00006b9b3002a000)<br>=
</pre><div><br></div><div><br></div><div><div><br></div><div><br></div></di=
v><div><br></div><div>=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90<br></div><div> On Wednesday 27 May 2020 14:43, Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><div> <br></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr"><div>Can you please provide the lib names whic=
h are problematic?<br></div><div><br></div><div>Alex<br></div></div><div><b=
r></div><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 27 May 2020 at =
14:29, vygu via <a href=3D"http://lists.openembedded.org" target=3D"_blank"=
>lists.openembedded.org</a> &lt;vygu=3D<a href=3D"mailto:protonmail.ch@list=
s.openembedded.org" target=3D"_blank">protonmail.ch@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div>Hello,<br></div><div><br></div><div>Since the zeus serie (also with dun=
fell), we observe an issue with runqemu when we share the sstate-cache than=
ks to a mirror between different linux distribution supported by yocto.<br>=
</div><div><br></div><div><div><div>If we build a sstate-cache on a debian =
10 x86_64 buildfarm,=C2=A0 and after that we use it on an ubuntu 18.04 x86_=
64, runqemu don&#39;t find several libs.<br></div></div><div>We
 have reproduced this problem on two different pc with ubuntu 18.04 and 16.=
04. <br></div><div><div><br></div><div>We don&#39;t
have this problem, if we use the shared sstate-cache on another debian.<br>=
</div></div><div><br></div><div>In all cases, a=C2=A0 ldd on the qemu binar=
y shows us the use of local/host libs, not the yocto libs. <br></div><div><=
br></div><div>Is it an expected behavior? or not?<br></div></div><div>Runqe=
mu&#39;s libs have to come from the linux distribution or from the yocto bu=
ild env?<br></div><div><br></div><div>Cordially,<br></div><div><br></div><d=
iv>vygu<br></div><div><br></div><div><div><br></div></div><div><br></div></=
blockquote></div></blockquote><div><br></div></blockquote></div>

--00000000000033e44a05a6a214f0--

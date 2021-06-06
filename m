Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.28611.1623016314347242362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 14:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V+0BwjP7;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id h20so14890918qko.11
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 14:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iiCl9uHFcCKug3PxWnf+MKVo2Sq+BCCoOWxsEyKt86c=;
        b=V+0BwjP7Kg4dW5fWK0WeqiVoWikCwx1bDjjusn9zqbu6FsoSAKd1GPrOjCkzK0cJBo
         pJn7SK3+CaPF2Wj1Xj7ooCWGLmuj9V+Xm/uPo4gBtQ8MhjHWXgaATad4QnflyFfLNxCC
         zzCsgOrP2uJT1a9nZ1dFg9CW4xc6pVTThw8XquQKaGN59POXNKzCcspM8OrvHK1m/VsR
         XnV92XZAZCblxS6sBtBzJuWFQvrZyi+ITYn/5L39lbQjey6XyuxnYS5QwLvu4HFBkwBw
         ErfaHu5GDvIwja+KmR3szkSnwTT/NUD9ldkNFuI2ty9BAaPJBgBn3AQJAGs592yjoduR
         LCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iiCl9uHFcCKug3PxWnf+MKVo2Sq+BCCoOWxsEyKt86c=;
        b=iXYVb5DGjXoCIkQIoO69n6ntjsFlVaA8NP5t4iCS4cr10RR18p+MwuEgIhwvVNmMA6
         b1lCowxyF8sMytbaFB4KRVn4KXvqltcJGCGbwN/nvQLCkv42ZvEcqAhdboENMoajJktA
         WBsoYvE3eopfBz9YDIgEW3PlT5ux6WukgJbKEeY9LSb+8Q9zms5vPrlrtij9H6YJV1PA
         5OVsjUFNEjJ/Gv6dxEcedhZsxFfkq6g5icVgxZKozCX2e9K3zYgmrHHhbOu5tDg0amND
         3rSfcWhHigJuc38MwVybDwd6Hk/JhxCtrdnBa2GLKi/2itB3RtKONTDTKCZYhr/w6CgZ
         zhhg==
X-Gm-Message-State: AOAM533rmk65h1ogKolmkQzROR93micMuHUJGno4xYC9B6G7JOJD2rP8
	fq/FX2AP4CVWI0bpAbCg7ajDUdt3ruAi1KmwPxw=
X-Google-Smtp-Source: ABdhPJyc+4d58TCVNl9NscvNb9R6uePggFkZKYTB2QMDTZfTkNNIQy9+hAgUQpUMGbNoZU4YiltTAfYto9dP/86YWxU=
X-Received: by 2002:a37:855:: with SMTP id 82mr14397203qki.25.1623016313213;
 Sun, 06 Jun 2021 14:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org> <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
In-Reply-To: <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 6 Jun 2021 14:51:27 -0700
Message-ID: <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 6, 2021 at 12:51 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 6 Jun 2021 at 01:10, Richard Purdie <richard.purdie@linuxfoundati=
on.org> wrote:
>>
>> I tried again with the autobuilder, still fails:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516
>>
>> so whatever it is, it is still "live".
>
>
> I did some digging. The issue happens when:
> - host is centos8
> - SDKMACHINE is i686 (e.g. cmake is 32 bit)
>
> Then there's a failing syscall attempting to set file times:
> utimensat_time64(AT_FDCWD, "../install/usr/local/lib/cmake/assimp-4.1/ass=
imp-config.cmake", [{tv_sec=3D1622966723, tv_nsec=3D6319439026193432576}, {=
tv_sec=3D1622966579, tv_nsec=3D17840053692309438464}], 0) =3D -1 EINVAL (In=
valid argument)
>
> On latest Fedora, there's no issue:
> utimensat_time64(AT_FDCWD, "../install2/usr/local/lib/cmake/assimp-4.1/as=
simp-config.cmake", [{tv_sec=3D1623002886, tv_nsec=3D6369724778172907520}, =
{tv_sec=3D1623002886, tv_nsec=3D17839174083007217664}], 0) =3D 0
>
> utimensat_time64 only appeared with 5.1 kernels, however, 4.18 should be =
returning ENOSYS in that case probably?
>
> i686 SDK is using its own libc, and from what I can tell that libc is try=
ing to be Y2038 compatible, e.g. calling the 64 bit version first, and if t=
hat returns ENOSYS, it falls through to the 32 bit version. But because cen=
tos kernel returns EINVAL, the 32 bit version is never attempted:
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/=
linux/utimensat.c;h=3D909a29762b504091a4e32487d8bc4cc68d34c508;hb=3DHEAD
>
> I also tried this in Ubuntu 18.04 (kernel 4.15), the fall-through works c=
orrectly:
> syscall_0x19c(0xffffff9c, 0x579e4260, 0xffe46590, 0, 0xf7aace3c, 0xffe467=
68) =3D -1 (errno 38)
> utimensat(AT_FDCWD, "../install2/usr/local/lib/cmake/assimp-4.1/assimp-co=
nfig.cmake", [{tv_sec=3D1623008744, tv_nsec=3D0} /* 2021-06-06T19:45:44+000=
0 */, {tv_sec=3D1623008629, tv_nsec=3D0} /* 2021-06-06T19:43:49+0000 */], 0=
) =3D 0
>
> The bottom line, this looks like a botched kernel update in Centos8 - pos=
sibly a backport of time64 calls that doesn't work with non-centos libc?
>

Good sleuthing.  Can you find out if libseccomp is in play ? if so
what version of libseccomp is being used by cmake if it is libseccomp
< 2.4.2 then time64 syscall support won't be there unless
its backported to the older version.

> Alex

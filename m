Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.27357.1623009112371479875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 12:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZwwU8BUx;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id q2so419617vsr.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzsi4Cb6Qh1XVK5c6qwh2awxuJ8obCRKPfyFIdBno7A=;
        b=ZwwU8BUxdkvR7DgRt/HnNJZ/IkGRqtBCBU+vn8HJ6R3x57oIy/yXPFPSLliNRJH6AN
         rtSal8t5WWdtXKvmLWMM7wfSv52cR5ESvSnjpXWuxuCq9TOsu35UsP8jGAsdcesM0D2m
         RDOOmzr4VEErAt8ptJgxhq7zq8KaAU19tAXTb9oxUTNwkLkvXYsIkRKnKy1AzT58tuPz
         cuRNbInmO7GqYAZNceG2egU+mzUuLXwouUdRo7RxpTYRrnSF+tAeP1EN61CKcU6HgIPt
         X+9MVCZGSIHwSWO5PSlfAiYTIeZHaC8LMEiqyvVtwF16U2SwtMv0ja41NqpxmdrLk0H1
         lwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzsi4Cb6Qh1XVK5c6qwh2awxuJ8obCRKPfyFIdBno7A=;
        b=OGVJG/TENEcq7NV0g+FLOuYAVM4TqzTEAnAujRS9ml9fROhS5X4PZuqgBP8cbFv57+
         +iH4YNnBFsOTWnis996CANcovI2fibhqhYxQ8LWdS7NbXlSCvmLCOob1nrgs8Hti+ieg
         4Cx09XxW1RvWeaJNcep8D9kOPQsXZRqI0QnVWpXh6TZcZ7kx1gwDRu2lKUb7C6gX2K/w
         VK8d6bRL2rpLnelahM9OSS+16yT3acSMhfb8wWNB00w8Cfb2h8pWuh03sptcZ0XwkTFU
         E+CBcT48g6Jml01QYLxMZK1Uxm7o0Go909m+cKQFRlLHjJSmYT4nsFKLEm4g622bpewd
         9zsw==
X-Gm-Message-State: AOAM5335JOkce7Oy0/g8nH1SP+6Fj8sdT4jMR16mgP/EVrvfUOXk4oly
	lgX/5kQaioSUaZhtUyqBtot8kUBKOOcoP2Bing4=
X-Google-Smtp-Source: ABdhPJwu5V/4rx5HeRLf1wRRtI02qiit93+P8SXLiSK5MMYU5zfUYiwExjl/zL3eFC81NrxSl5Gz7IBq47omf6Esnd4=
X-Received: by 2002:a67:1502:: with SMTP id 2mr7203345vsv.54.1623009111579;
 Sun, 06 Jun 2021 12:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com> <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
In-Reply-To: <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 6 Jun 2021 21:51:39 +0200
Message-ID: <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009021d405c41e4110"

--0000000000009021d405c41e4110
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Jun 2021 at 01:10, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I tried again with the autobuilder, still fails:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516
>
> so whatever it is, it is still "live".
>

I did some digging. The issue happens when:
- host is centos8
- SDKMACHINE is i686 (e.g. cmake is 32 bit)

Then there's a failing syscall attempting to set file times:
utimensat_time64(AT_FDCWD,
"../install/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1622966723, tv_nsec=6319439026193432576}, {tv_sec=1622966579,
tv_nsec=17840053692309438464}], 0) = -1 EINVAL (Invalid argument)

On latest Fedora, there's no issue:
utimensat_time64(AT_FDCWD,
"../install2/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1623002886, tv_nsec=6369724778172907520}, {tv_sec=1623002886,
tv_nsec=17839174083007217664}], 0) = 0

utimensat_time64 only appeared with 5.1 kernels, however, 4.18 should be
returning ENOSYS in that case probably?

i686 SDK is using its own libc, and from what I can tell that libc is
trying to be Y2038 compatible, e.g. calling the 64 bit version first, and
if that returns ENOSYS, it falls through to the 32 bit version. But because
centos kernel returns EINVAL, the 32 bit version is never attempted:
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/utimensat.c;h=909a29762b504091a4e32487d8bc4cc68d34c508;hb=HEAD

I also tried this in Ubuntu 18.04 (kernel 4.15), the fall-through works
correctly:
syscall_0x19c(0xffffff9c, 0x579e4260, 0xffe46590, 0, 0xf7aace3c,
0xffe46768) = -1 (errno 38)
utimensat(AT_FDCWD,
"../install2/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake",
[{tv_sec=1623008744, tv_nsec=0} /* 2021-06-06T19:45:44+0000 */,
{tv_sec=1623008629, tv_nsec=0} /* 2021-06-06T19:43:49+0000 */], 0) = 0

The bottom line, this looks like a botched kernel update in Centos8 -
possibly a backport of time64 calls that doesn't work with non-centos libc?

Alex

--0000000000009021d405c41e4110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 6 Jun 2021 at 01:10, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I tried=
 again with the autobuilder, still fails:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/3516" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/48/builds/3516</a><br>
<br>
so whatever it is, it is still &quot;live&quot;.<br>
</blockquote><div><br></div><div>I did some digging. The issue happens when=
:</div><div>- host is centos8</div><div>- SDKMACHINE is i686 (e.g. cmake is=
 32 bit)</div><div><br></div><div>Then there&#39;s a failing syscall attemp=
ting to set file times:</div><div>utimensat_time64(AT_FDCWD, &quot;../insta=
ll/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake&quot;, [{tv_sec=3D162=
2966723, tv_nsec=3D6319439026193432576}, {tv_sec=3D1622966579, tv_nsec=3D17=
840053692309438464}], 0) =3D -1 EINVAL (Invalid argument)</div><br><div>On =
latest Fedora, there&#39;s no issue:</div><div>utimensat_time64(AT_FDCWD, &=
quot;../install2/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake&quot;, =
[{tv_sec=3D1623002886, tv_nsec=3D6369724778172907520}, {tv_sec=3D1623002886=
, tv_nsec=3D17839174083007217664}], 0) =3D 0</div><div><br></div><div>utime=
nsat_time64 only appeared with 5.1 kernels, however, 4.18 should be returni=
ng ENOSYS in that case probably?</div><div><br></div><div>i686 SDK is using=
 its own libc, and from what I can tell that libc is trying to be Y2038 com=
patible, e.g. calling the 64 bit version first, and if that returns ENOSYS,=
 it falls through to the 32 bit version. But because centos kernel returns =
EINVAL, the 32 bit version is never attempted:</div><div><a href=3D"https:/=
/sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/linux/uti=
mensat.c;h=3D909a29762b504091a4e32487d8bc4cc68d34c508;hb=3DHEAD">https://so=
urceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/linux/utimen=
sat.c;h=3D909a29762b504091a4e32487d8bc4cc68d34c508;hb=3DHEAD</a></div><div>=
<br></div><div>I also tried this in Ubuntu 18.04 (kernel 4.15), the fall-th=
rough works correctly:</div><div>syscall_0x19c(0xffffff9c, 0x579e4260, 0xff=
e46590, 0, 0xf7aace3c, 0xffe46768) =3D -1 (errno 38)<br>utimensat(AT_FDCWD,=
 &quot;../install2/usr/local/lib/cmake/assimp-4.1/assimp-config.cmake&quot;=
, [{tv_sec=3D1623008744, tv_nsec=3D0} /* 2021-06-06T19:45:44+0000 */, {tv_s=
ec=3D1623008629, tv_nsec=3D0} /* 2021-06-06T19:43:49+0000 */], 0) =3D 0</di=
v><div><br></div><div>The bottom line, this looks like a botched kernel upd=
ate in Centos8 - possibly a backport of time64 calls that doesn&#39;t work =
with non-centos libc?</div><div><br></div><div>Alex<br></div></div></div>

--0000000000009021d405c41e4110--

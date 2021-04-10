Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.8077.1618077492427570071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Apr 2021 10:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxaMFZxB;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g24so6762845qts.6
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Apr 2021 10:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1eh6r00mfp/TI5p6BpwnVtw3f1T53+WUbXDQtpGV8dw=;
        b=KxaMFZxB3RRXtt5GbS+EgQ5/0KdQDpAaaC8D4aRzfQyvwZbnLuePHBlBl9/UA8Ogbp
         prNHBiTeOhJogEb1Jp2Qqnb1HMbEg36SpsqxkTdVTBPOCpSDEkPkzJPbmAY3LPmh+cBZ
         3JhJvT+I2OkO6nvmOoab8eUzv8+eZjNwyztue6zfMTaZqhmJaUMx6uY+cCpaTPZNYQrD
         sF2FolzancXWydRGIPo7Es3j3o965OvAnfizTh3laxM+PxVm8kRpBOGenLRzDvteg6Wv
         yEIw/GA2aeNGs6NIxxEnUAQr1tKBHz9XtZXQJqaYdJi00RcHErs4hEdkkwV9d8Yfk0Qm
         +g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1eh6r00mfp/TI5p6BpwnVtw3f1T53+WUbXDQtpGV8dw=;
        b=nxQ+zYzlGTfjRJ3T8d+a77jJniybjLMST1Rv0FTyw35f1AviZ3lu9HWyBkJzsQrjy1
         fweTt2lwHX7QwAVmjdAketJGpCEpZo9yWjCx3R7dtrhMZQdZT2kIKCn/9bEFNJGRduLi
         5YxcLkkI/VQ/D/8/9aOL8AH6+ieJJvyXUrBaaAn0bxQGHIL4+l9RK5zSgrCAXzgR9KUG
         VuuRnYhv+m/JxzOalEHMnpQpP+oalmxMOTFBB2haCJ8yQUWsE6XTvFh2mbG8wTHGwkSv
         nFQd/vUGxm8+m5EwUjwRmO5hjMbFHpXlIniWxQZ915o16wrbJQ1EyKzATWzV4UexFuzT
         oRgg==
X-Gm-Message-State: AOAM532afNLCsQdyKpHYvGhZZAPeOfMTZ7PKNblPdLTRk+e+AoDcH3fD
	2cyw95MK8h/a9J0kKMxFDQIlHWbiXdD2qCPzNhA=
X-Google-Smtp-Source: ABdhPJxX/K52DiuEa9ASYyyd8GorFw1uMaXDmKRmwyfIDW54vw5BjIyDo1yH1OBVT+jlU60aotAyf3dDoW4Zhw2Vd0E=
X-Received: by 2002:ac8:7ef9:: with SMTP id r25mr8001962qtc.369.1618077491613;
 Sat, 10 Apr 2021 10:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210330213019.2300696-1-raj.khem@gmail.com> <e0ae7b52770cea4b073f0e5d108af408781066cf.camel@linuxfoundation.org>
In-Reply-To: <e0ae7b52770cea4b073f0e5d108af408781066cf.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 10 Apr 2021 10:58:00 -0700
Message-ID: <CAMKF1spGGNJJ2bKVxjwikTDepYhsbeb0tqScQ2wU5UVGS_3LdA@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH 0/2] GCC 11 Pre-release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <JPEWhacker@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001b524805bfa20632"

--0000000000001b524805bfa20632
Content-Type: text/plain; charset="UTF-8"

Thanks for testing it out I think I will try to address them in a follow up
perhaps next week

On Sat, Apr 10, 2021 at 8:13 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-03-30 at 14:30 -0700, Khem Raj wrote:
> > This patchset updates to upcoming gcc 11 release, Please give it a try
> > in your test beds if you have cycles, since there is still sometime left
> > for final GCC 11 release perhaps we can squeeze in some bugfixes
> >
> > They are also available via git here
> >
> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-11
>
> I ran this through with the gnutls fix you found. There appear to be
> reproducubility issues in gcc:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/159/steps/12/logs/stdio
>
> An issue with meta-mingw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/3296
>
> Missing maintainers entry:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2004
>
> valgrind ptest regressions on x86 and arm (even with the valgrind upgrade):
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1688/steps/12/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1976/steps/12/logs/stdio
>
> Cheers,
>
> Richard
>
>

--0000000000001b524805bfa20632
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for testing it out I think I will try to address t=
hem in a follow up perhaps next week=C2=A0</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 10, 2021 at 8:13=
 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Tue, 2021-03-30 at 14:30 -0700, Khem Raj wrote:<br>
&gt; This patchset updates to upcoming gcc 11 release, Please give it a try=
<br>
&gt; in your test beds if you have cycles, since there is still sometime le=
ft<br>
&gt; for final GCC 11 release perhaps we can squeeze in some bugfixes<br>
&gt; <br>
&gt; They are also available via git here<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/=
?h=3Dkraj/gcc-11" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-11</a><br>
<br>
I ran this through with the gnutls fix you found. There appear to be=C2=A0<=
br>
reproducubility=C2=A0issues in gcc:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/118/buil=
ds/159/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/118/builds/159/steps/12/logs/=
stdio</a><br>
<br>
An issue with meta-mingw:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/89/build=
s/3296" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/89/builds/3296</a><br>
<br>
Missing maintainers entry:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/2004" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/79/builds/2004</a><br>
<br>
valgrind ptest regressions on x86 and arm (even with the valgrind upgrade):=
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/82/build=
s/1688/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1688/steps/12/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/1976/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1976/steps/12/logs/=
stdio</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000001b524805bfa20632--

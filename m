Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.4989.1611618784356540782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CAbWloEJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id by1so20570961ejc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSt/XmKYSqdDnOBqxk4pB2ahP4+QPDsyNBF/KdSo7vw=;
        b=CAbWloEJb/TQsC1Uu97tx7rcn+CZ7qXR6THy+xA+x78FFjhi2VlOByo1CuEcXnmTpR
         BW3aobWh9gDRsEhYu2enNObd5emEbl4yrExSf60BwaAJ2jPYJc9YbnjcVz/d9V7eXWMb
         veFcpKPASdyXPQOoKuBUcFov1TAON7hbwvuauyYiP6jXBykxkpdnIvY4wHAm6HmzIZcT
         U0ZIMbTie+PQKX1/tf02MELj+5Nk2RlU6jR+Az6fZN0w4gD6FaTXLoWqcV8mXqd6j2Le
         wAzeoBfb5W49f0a2kbxPRsIlbtPJte7DZICyljBD/j/IFbKAyPRmYbjT35fLdzzg1013
         qDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSt/XmKYSqdDnOBqxk4pB2ahP4+QPDsyNBF/KdSo7vw=;
        b=DNjqWcgNWmkA8Q6MlU/ckTFo0jmi/ZgTXEWakysW8OAbamn0WRAQxiRUueLKr+79p+
         5o0Oq7MgQZ/culQslKUGXKLq80Vvai0GRJK644ni8jWAFZintGYlfd4Y/5S82I9ph4Bn
         NWz8gI9G1f/yd99Sa7F5n7I3mHNZ4cLuau/wLQPswAZZXxQsDBAnIRa1YybLPxXZrp5z
         fOuHUnLlHFwCnyZ34DeMEHKQPlFCtL0pYF+isQ61jv1MciCWK9BO2yxN6PWA8rVnrDUI
         6rBA3Upjdf4h2vxMIWssqy4+BpnfK1LN/lOpFYY8DA27e74TCe9Vpt+VADfBMrwfiuzs
         gtDw==
X-Gm-Message-State: AOAM531BgjHsG9K0OamCbjca1dJKVi2LLWR5gRT+epiwub7CEMtdpFX3
	h/jidsXoRuSXtcqFKVwQLb5APoFent+mbFWqHoU=
X-Google-Smtp-Source: ABdhPJyhHR9OHh1aY3dR7pCMiFZG9/LY3OmS7ZsndbHfVay6jwO9sLboqZ19ygNoeam0lkHloNS2jyJ/J5lGK99izME=
X-Received: by 2002:a17:906:76c9:: with SMTP id q9mr1873217ejn.484.1611618782730;
 Mon, 25 Jan 2021 15:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
 <20210124182647.1613511-3-quaresma.jose@gmail.com> <37e34b2d593317b1910784a988fe14de1d32c232.camel@linuxfoundation.org>
In-Reply-To: <37e34b2d593317b1910784a988fe14de1d32c232.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 25 Jan 2021 23:52:51 +0000
Message-ID: <CANPvuR=3dY1KvoPcjrpAzdMnr2o5kSfR_M7PcVQEnFmhQn3wTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] selftest/reproducible: remove spirv-tools-dev from exclusion list
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000000edc6f05b9c23d34"

--0000000000000edc6f05b9c23d34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

librt.so is part of the glibc and are allays present on staging sysroot.
how does the cmake can find the librt.so outside of the sysroot if it are
present on that.

The problem is at:
https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1afd12d05bf238ac7368bb=
49de73cd620a8e/source/CMakeLists.txt#L397

Probably I need to force the find_library to search first on
STAGING_DIR_HOST

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 25/01/2021 =C3=A0(s) 20:13:

> On Sun, 2021-01-24 at 18:26 +0000, Jose Quaresma wrote:
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index eee494e5cc..deddf6e50b 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -65,7 +65,6 @@ exclude_packages =3D [
> >       'quilt-ptest',
> >       'rsync',
> >       'ruby',
> > -     'spirv-tools-dev',
> >       'swig',
> >       'syslinux-misc',
> >       'systemd-bootchart',
>
> Thanks for looking at this, unfortunately in testing it shows there is
> still some kind of issue:
>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-8161=
_obd/packages/diff-html/
>
> Looks like it shouldn't be too hard to fix though!
>
> Cheers,
>
> Richard
>
>
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--0000000000000edc6f05b9c23d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div>librt.so is part=
 of the glibc and are allays present on staging sysroot.</div><div>how does=
 the cmake can find the librt.so outside of the sysroot if it are present o=
n that.<br></div><div><br></div><div>The problem is at:</div><div><a href=
=3D"https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1afd12d05bf238ac73=
68bb49de73cd620a8e/source/CMakeLists.txt#L397">https://github.com/KhronosGr=
oup/SPIRV-Tools/blob/b27b1afd12d05bf238ac7368bb49de73cd620a8e/source/CMakeL=
ists.txt#L397</a><br></div><div><br></div><div>Probably I need to force the=
 find_library=C2=A0to search first on STAGING_DIR_HOST</div><div><br></div>=
<div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; escreveu no dia segunda, 25/01/2021 =C3=
=A0(s) 20:13:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Sun, 2021-01-24 at 18:26 +0000, Jose Quaresma wrote:<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 1 -<br>
&gt; =C2=A01 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/o=
eqa/selftest/cases/reproducible.py<br>
&gt; index eee494e5cc..deddf6e50b 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
&gt; @@ -65,7 +65,6 @@ exclude_packages =3D [<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;quilt-ptest&#39;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;rsync&#39;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;ruby&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;spirv-tools-dev&#39;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;swig&#39;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;syslinux-misc&#39;,<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0&#39;systemd-bootchart&#39;,<br>
<br>
Thanks for looking at this, unfortunately in testing it shows there is<br>
still some kind of issue:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2021=
0125-8161_obd/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-8161_obd/=
packages/diff-html/</a><br>
<br>
Looks like it shouldn&#39;t be too hard to fix though!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quar=
esma</div></div></div></div>

--0000000000000edc6f05b9c23d34--

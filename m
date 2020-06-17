Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.75.1592433258286922272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 15:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20150623.gappssmtp.com header.s=20150623 header.b=QsCloL+Y;
 spf=none, err=SPF record not found (domain: e-labworks.com, ip: 209.85.222.196, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-qk1-f196.google.com with SMTP id f18so3747565qkh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 15:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMR79MKIFSbeeFEEzQjhzKuk/Yc8VfANryuq+9Q4AXU=;
        b=QsCloL+YYs2ybFf5CYxj3gwtKhnjHlgO1LEIRywi4R33fW5lhfwjy6iOubefSzfmaF
         KUVT0E2tocdW5REfAvqv+3i+H6EAx95eHBcTudUIEmYFYffbGkvS5ibD4mOtXvoR2hX+
         DvAEi6SdTAEOJSrSxHJ3QaRV/PpwrMUKgzdDSmGHYk+ahR8d4YPA4V+w7zfif9tWO856
         ZvFdmc1BmaN/b1PRheHz1mpS3cc6EDGerYK6JnPKgF+wI3PZN5hodcZEMgIocN2eIN6k
         ZdlTc6LQsMBXhSuMIQq1vMc07mvYPEOZAOdIhe4BZh+ZmBcFIIzi8OxMhicmj+mwziSZ
         BTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMR79MKIFSbeeFEEzQjhzKuk/Yc8VfANryuq+9Q4AXU=;
        b=n5L0528k+t1d2xeJAnquk12VHWOTLVWP3sMgLuSPDTJiGzRwyAz8nQZvEqfHI93Lww
         Ul7eVyw47i8uJ/vtReStVIfn332qgqtGOl14Cirxl+gbcxFBGMV6FuFi7x1sugUeGT6n
         6Rl/UsJdsS4boFa0Y4tPpskhDonp58bxpXbKglYZ/0guRHZt9o3SPHYPPQrlV8HQUsAS
         prK8OzqW0lDJgDkjka+Q+MhYkcsSElXRUEtqOrNSi6Z6vr6xJx4wmXKQVbGjPEa/TH2R
         Bx2LOi5EhEO74CQ2KgzYNoFl+ciU84UpKy4Bt+QG1cZQSQGy2Ot0FqO/m5T4ZvmWdAhD
         4xrQ==
X-Gm-Message-State: AOAM5307dSiZlb+WdBvKSWiMdM9i6jUluRhamMm3GKQqF4FGahMFfyfn
	JHe2//fjN8UHFbghgFJTzVWHy7RwRQPNVuCJb2wZmg==
X-Google-Smtp-Source: ABdhPJwUMu2IAFyBFygycy5Jkuz16RlCC1UV421QclZ/xcol5Ae7AUSnTrwjMjb9WFSVcobw4G7cArw306Gt1hLsDkU=
X-Received: by 2002:a37:845:: with SMTP id 66mr898427qki.67.1592433257328;
 Wed, 17 Jun 2020 15:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200612204520.7818-1-sergio.prado@e-labworks.com> <1a10f4ab0edc44730a6e20bb7fe522787177e142.camel@linuxfoundation.org>
In-Reply-To: <1a10f4ab0edc44730a6e20bb7fe522787177e142.camel@linuxfoundation.org>
From: "Sergio Prado" <sergio.prado@e-labworks.com>
Date: Wed, 17 Jun 2020 19:34:06 -0300
Message-ID: <CANu7NGu1isAKtQWSOBX0-rOXfW3NeHANcoZ4fOq5yuRZUCvdZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zlib: build and package minigzip
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1c78405a84f4244"

--000000000000a1c78405a84f4244
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

> >  do_install() {
> >       oe_runmake DESTDIR=${D} install
> > +
> > +     install -d ${D}${sbindir}
> > +     install -m 0755 ${B}/minigzip ${D}${sbindir}
> > +     install -m 0755 ${B}/minigzipsh ${D}${sbindir}
> > +     install -m 0755 ${B}/minigzip64 ${D}${sbindir}
> >  }
> >
> >  do_install_ptest() {
>
> Breaks oe-selftest:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1039
>
> Reproducer:
> oe-selftest -r pkgdata.OePkgdataUtilTests.test_list_pkgs
>
> Also breaks meta-mingw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/2031

Thanks for the report. The problem is that minigzip64 is not generated with
toolchains without large file support.

I'll fix and send V2.

Thanks,

Sergio Prado
Embedded Labworks

--000000000000a1c78405a84f4244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br>&gt; &gt; =C2=A0do_install() {<br>&gt;=
 &gt; =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D${D} install<br>&gt; &gt; +=
<br>&gt; &gt; + =C2=A0 =C2=A0 install -d ${D}${sbindir}<br>&gt; &gt; + =C2=
=A0 =C2=A0 install -m 0755 ${B}/minigzip ${D}${sbindir}<br>&gt; &gt; + =C2=
=A0 =C2=A0 install -m 0755 ${B}/minigzipsh ${D}${sbindir}<br>&gt; &gt; + =
=C2=A0 =C2=A0 install -m 0755 ${B}/minigzip64 ${D}${sbindir}<br>&gt; &gt; =
=C2=A0}<br>&gt; &gt; <br>&gt; &gt; =C2=A0do_install_ptest() {<br>&gt;<br>&g=
t; Breaks oe-selftest:<br>&gt;<br>&gt; <a href=3D"https://autobuilder.yocto=
project.org/typhoon/#/builders/79/builds/1039">https://autobuilder.yoctopro=
ject.org/typhoon/#/builders/79/builds/1039</a><br>&gt;<br>&gt; Reproducer:<=
br>&gt; oe-selftest -r pkgdata.OePkgdataUtilTests.test_list_pkgs<br>&gt;<br=
>&gt; Also breaks meta-mingw:<br>&gt;<br>&gt; <a href=3D"https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/89/builds/2031">https://autobuilder.y=
octoproject.org/typhoon/#/builders/89/builds/2031</a><br><br></div><div>Tha=
nks for the report. The problem is that=C2=A0minigzip64 is not generated wi=
th toolchains without large file support.</div><div><br></div><div>I&#39;ll=
 fix and send V2.</div><div><br></div><div>Thanks,</div><div><br></div><div=
>Sergio Prado</div><div>Embedded Labworks</div></div>

--000000000000a1c78405a84f4244--

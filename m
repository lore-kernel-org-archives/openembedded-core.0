Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web10.4644.1588706787517924866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 12:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KIlVazGZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id i185so800982vki.12
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 12:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TW6d1JidSq6iQZt5wqvonxIAlbvu71W5LYrV8ZFbHnA=;
        b=KIlVazGZDXN+zGUkYa5U81TNdxDu5md9j8iVkVOsmbsnllc5in2nFnwuPDzYkutJMV
         hp1pWcnAN+R/o97kUZp+Tw9LaJlLCE+biMfaPS06+RSpSROudoyBjPEbh6FCN+JFWnen
         nRUTHQGpeuFP1iSafZLLGRDS+x6Jpk2uH6DsgPu0JoWufgUJdyM14QZ6jaFynqHgwmxH
         c/j3GpR8qOmYYfrvz5BeM8s3WUFNcnAcm8ecg/bhwzzCcf/IsHq1W8NAAPxMB1zcVYHs
         c78oJ9rOD3iRchiqvV9VpfJiA5iztoHHUtcv1Fz7iMP5vzlP+TcGRgBnMqRgfCDeKZgo
         A3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TW6d1JidSq6iQZt5wqvonxIAlbvu71W5LYrV8ZFbHnA=;
        b=XCbgfW0RIW6VDLcqOXJp8z9qZcDMBvDoft0nv7cs/mYhTNAMVuc8q9AyGnpXYRwRlc
         GkwTUbsqhijrCkQkFclfz/ZkCOS1hNB6EUy3Zw6u+KyaVIIXbUVHZiLOD0BCectMX3dq
         8MOGRiJMESIJuF7Xu0xO9u0fH7QUG7Re1XEJkz+CoSvTp+nnF1Bh+kRbcAzGLLELAhYB
         g57G0p3FS46dcyvIGg6/g1LjVVVzruz5/+ttVNfV5PjuP56tA6tw1OK6rUYgzhPQ5uuK
         +ktSZwxsojw46bxgIQ7xkQGb8QFrIUVZ5NcVODtb/ggzsos4Pn6zm0P486BHw/mRj/Rl
         VqVQ==
X-Gm-Message-State: AGi0PubimiDxHKqiStDmHZy8rgbYPaluxdsrEIu7IfU2tJQeUTwKCvJK
	gUt1bLt5TL1lY3Gz1Wbr3TW6cS30IZCU4Dt5PUI=
X-Google-Smtp-Source: APiQypKhGBT5WUPh1da+hRLAox4qND7U136Vpui1+dVrYvVppVHyG0fAFJok6eg+UZf1Zkb+5F2L/7mhtfTf1n73LCY=
X-Received: by 2002:a1f:908c:: with SMTP id s134mr3978111vkd.1.1588706786616;
 Tue, 05 May 2020 12:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200501082616.11296-1-andrej.valek@siemens.com>
 <20200501113952.15847-1-andrej.valek@siemens.com> <c87e24dbc0db75e91726ecb3a09c77de63dc4509.camel@linuxfoundation.org>
In-Reply-To: <c87e24dbc0db75e91726ecb3a09c77de63dc4509.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 5 May 2020 21:26:14 +0200
Message-ID: <CANNYZj-ja5thm=-ajpA3AwoLX=7romXsd8+JRpQmVTjR3n+wEA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] icu: upgrade 66.1 -> 67.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrej Valek <andrej.valek@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000ab284005a4eb9f5b"

--000000000000ab284005a4eb9f5b
Content-Type: text/plain; charset="UTF-8"

I think this might be a more serious issue with hash equiv (or maybe
something in the icu recipe), as reverting the change produced the same
error (linking error due to symbols in libvte pointing to wrong icu
version).

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/926

Alex

On Tue, 5 May 2020 at 17:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2020-05-01 at 13:39 +0200, Andrej Valek wrote:
> > - 0001-icu-Added-armeb-support.patch - rebased
> > - 0001-Fix-big-endian-build.patch - removed, already included in new
> > version
> > - icu-pkgdata-large-cmd.patch - removed, implemented correct size
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>
> This is failing to build on arm native machines:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/1187
> (and other arm native builds)
>
> Cheers,
>
> Richard
>
> 
>

--000000000000ab284005a4eb9f5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this might be a more serious issue with hash =
equiv (or maybe something in the icu recipe), as reverting the change produ=
ced the same error (linking error due to symbols in libvte pointing to wron=
g icu version).</div><div><br></div><div><a href=3D"https://autobuilder.yoc=
toproject.org/typhoon/#/builders/83/builds/926">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/83/builds/926</a></div><div><br></div><div>Ale=
x<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, 5 May 2020 at 17:00, Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Fri, 2020-05-01 at 13:39 +0200, Andrej Valek wrote:<br>
&gt; - 0001-icu-Added-armeb-support.patch - rebased<br>
&gt; - 0001-Fix-big-endian-build.patch - removed, already included in new<=
br>
&gt; version<br>
&gt; - icu-pkgdata-large-cmd.patch - removed, implemented correct size<br>
&gt; <br>
&gt; Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemen=
s.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
<br>
This is failing to build on arm native machines:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/buil=
ds/1187" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/97/builds/1187</a><br>
(and other arm native builds)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000ab284005a4eb9f5b--

Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.8847.1586342432115184713
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 03:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOlq85Yr;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 131so4724696lfh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sQgz/O7u2U7rZmBh+ThjmhrPpiD5+qr4FleXlD/Di/s=;
        b=jOlq85YrCzWmk7FGHgUB1yXlDtpo2FEoWEUHwVCReoE0BV63Arf8gNxV4N8/93IkcL
         GInM93qNQ92BHVPFFJPodWng0HPjwVXCRawayPjdMaIZhXV6UNgUSHdRdl2ilgGz/yhL
         S96sLQme26NgrJuigdqRZHTUwwCDRLPa8hreROEHNtqrP9CMs70lx9S64GxaWglOjas1
         w8qpFW4CyvijYxUFMHxufhTdiQ+oLT4PTY47FjJX5QJ0Occ/zPTVed3IzlnlfaVwj2Zd
         vQJ4NEq89BpCfiRwzZ8BK+WXOLRos+0epX+u1ZdlIlsT1/6yARHPOi2C5mo4luvBunog
         KS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sQgz/O7u2U7rZmBh+ThjmhrPpiD5+qr4FleXlD/Di/s=;
        b=Ob6u7Vgc8q3SDiB0x+5IMLBn3wdTIgj2kcvdVOKo8j0T401ZjiKDknud/5L4adBGxH
         wjn8LHzyHdRiQ+I4ALAJKvVTDO3vqgEj8LKtx1a02DWQZ6NdZV4lNvSSQwuxDMD5rpXB
         sMb4zzXQaO+KnQaHESQt1z0tM6obTT808R/6R/8IOC2dmkTUtito8wHrINt5UeKMxHI7
         a3vXYv+Lrcu65/axZHN4QlXP/6eYIq5bjjbXm018KBD0H4Uucge1j6Gmr50PHG3kwT+m
         9Sad+b42WoQT97V4CivE+ZWS53GP1zIcpjt/nyHKGauM6HsbhULwwPhXsBG+JzUsCJtU
         TVIA==
X-Gm-Message-State: AGi0PuYSzPSG4nkI2LjFdxe+cnz26hEsB0T+iTHxaTpZE1+sW1V7EV/a
	1/igrDtR9lhdBz/E4vQlJdN56/eNBdzTUm9ZKl0=
X-Google-Smtp-Source: APiQypJDspasPqCdwA5vjkSPasE6APXhXFF4jz5+n/Z13gSjogZxHFldr16B94rcagiloRh4dfYH2++uUtgOw9i24Pw=
X-Received: by 2002:ac2:418b:: with SMTP id z11mr4274773lfh.134.1586342430194;
 Wed, 08 Apr 2020 03:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0GO0510UjoSWx=sK9oiyCFCJanB7-C7Ph6y62BtOmfNXA@mail.gmail.com>
 <20200408071242.GC1578@denix.org>
In-Reply-To: <20200408071242.GC1578@denix.org>
From: "Ankur Tyagi" <ankur.tyagi85@gmail.com>
Date: Wed, 8 Apr 2020 22:40:19 +1200
Message-ID: <CADySD0GibZ7NHOTiOhR5bqVrpda9K2MpFQ-UBw=E5jhTPjyLdg@mail.gmail.com>
Subject: Re: [OE-core] Including vendor's pre-built binary in image
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000b404f05a2c5218d"

--0000000000000b404f05a2c5218d
Content-Type: text/plain; charset="UTF-8"

Thank you Denys, INSANE_SKIP "file-rdeps" solved the issue

cheers

On Wed, Apr 8, 2020 at 7:12 PM Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > I am sure this is not being discussed for first time and I tried
> > all suggested solution in previous emails but none worked hence I am
> asking
> > again.
> >
> > Trying to include a pre-built binary from vendor in my image but getting
> > following QA error:
> >
> > ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> contained
> > in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no
> providers
> > found in RDEPENDS_my-recipe ? [file-rdeps]
> > ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool
> > contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), but
> no
> > providers found in RDEPENDS_my-recipe ? [file-rdeps]
> > ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Please
> > consider fixing them.
> > ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_qa
> >
> > I have tried following in my-recipe_1.0.bb but error still persists
> > RDEPENDS_${PN} += "libstdc++6"
> >
> > How can I fix this?
>
> https://lists.yoctoproject.org/g/poky/message/11900
>
>
> > thanks
> > Ankur
>
> > 
>
>

--0000000000000b404f05a2c5218d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Thank you Denys, INSANE_SKIP &quot;file-rdeps&=
quot; solved the issue</div><div class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif">cheers</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 8, 2020 at 7:12 PM Deny=
s Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 Apr 08, 2020 at 01:52:47PM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I am sure this is not being discussed for first time and I tried<br>
&gt; all suggested solution in previous emails but none worked hence I am =
asking<br>
&gt; again.<br>
&gt; <br>
&gt; Trying to include a pre-built binary from vendor in my image but gett=
ing<br>
&gt; following QA error:<br>
&gt; <br>
&gt; ERROR: my-recipe-1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool con=
tained<br>
&gt; in package my-recipe requires libstdc++.so.6(CXXABI_1.3), but no prov=
iders<br>
&gt; found in RDEPENDS_my-recipe ? [file-rdeps]<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: QA Issue: /etc/vendor/tool<br=
>
&gt; contained in package my-recipe requires libstdc++.so.6(GLIBCXX_3.4), =
but no<br>
&gt; providers found in RDEPENDS_my-recipe ? [file-rdeps]<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: QA run found fatal errors. Pl=
ease<br>
&gt; consider fixing them.<br>
&gt; ERROR: my-recipe -1.0-r0 do_package_qa: Function failed: do_package_q=
a<br>
&gt; <br>
&gt; I have tried following in <a href=3D"http://my-recipe_1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">my-recipe_1.0.bb</a> but error still persists=
<br>
&gt; RDEPENDS_${PN} +=3D &quot;libstdc++6&quot;<br>
&gt; <br>
&gt; How can I fix this?<br>
<br>
<a href=3D"https://lists.yoctoproject.org/g/poky/message/11900" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/g/poky/message/11=
900</a><br>
<br>
<br>
&gt; thanks<br>
&gt; Ankur<br>
<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000000b404f05a2c5218d--

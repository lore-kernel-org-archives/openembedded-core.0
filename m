Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.5174.1598991254578645719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 13:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sPgifeTy;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id v20so845515ual.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 13:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btWyF6RiFdViNNK7yctfYlToNLVUlKLHDXkKQ5umtjM=;
        b=sPgifeTyBij4jvvyxcXAZX6E7kivGPjvNZKG1SzTKbnq/OqDC9vmY3HfkWzHBa9JHL
         V4sDpYpq3MPRd+TMD/HZJBWZMnU8andNbsLPj2wTrqnldRBG5TNUEthIBisNlwcj+D/Z
         45w6gvAox+t8s0GOZybLRhJmdOaHYQXYwgdVx016V61pbiOXIpofLS9O2wRfevsbIInr
         kOkJnk7Q/4H5/I3KqDzLKMHon8WR6h/YWLwyrwHjAjnxrV9ZRFbixTsjhd2NVIdnlEjj
         /NZrxw2X/ofXdwKf5bgPPw72PW4NDK7m3rLJbe9/XjGbZ5WRpbfv31tW5E+IM4ca60F3
         pODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btWyF6RiFdViNNK7yctfYlToNLVUlKLHDXkKQ5umtjM=;
        b=VAK7HsRw2u/DzENTbEKRToz80ZHKt339zsPdnza+pUdxmfykeoiyuVXhROHENw/mjv
         c93BhL874mLD3x/LHydALRjP89Vw3iGpmDMWWXDHTXPoATPuAHGdXCX9HvO5lA56oDNo
         m+QUx6qN/Mb4vFohGi85YK8V5KoZw81JF+FpOb4xtKLKLzY1hYaCSJ4z0jBt1eB/52EU
         CGeIyNCgHXnuhRkdmTAu6RLyCl4heT+ICaY2VqK6vw3WG4JuuEabKlJ6pi3XGpi1RWEF
         2UNxiGSGEL9xlZmlgFGfuX6EbopaBKAHPDglfxw97cK+uezcENrPcZrwFiHes7z2pgoM
         wUJA==
X-Gm-Message-State: AOAM532AoJLVd7bnlagoHfhdH7kxPt68Hxz5lyuVWy7Sga/qOaSaxWlk
	/t/xomV5mBxSHzpLDTgyZXKhAllbhemjW1Ov6Mo=
X-Google-Smtp-Source: ABdhPJy4hh78+JeGWdFfC7CVAEY6e/buvpxv+BOCUiV3ucsCklN5WtJsBelrN4to+inpnQ+by1me0zg/BqAePrqp2Oc=
X-Received: by 2002:ab0:7157:: with SMTP id k23mr2936272uao.39.1598991253549;
 Tue, 01 Sep 2020 13:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200831095948.15750-1-changhyeok.bae@gmail.com>
 <20200831095948.15750-2-changhyeok.bae@gmail.com> <b2d48e4fdb1020a36aed221b472014cbf41735b3.camel@linuxfoundation.org>
In-Reply-To: <b2d48e4fdb1020a36aed221b472014cbf41735b3.camel@linuxfoundation.org>
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
Date: Tue, 1 Sep 2020 22:14:01 +0200
Message-ID: <CACrLJgBmqCx+SeCuaPSEXHaCt_7YpSQY7aJzRiJB3N9uXUSqvA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] iputils: upgrade s20190709 -> s20200821
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aab98e05ae462960"

--000000000000aab98e05ae462960
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard

Thank you for the report. I will look into it.

Best regards,
Changhyeok

2020=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2:32, Ri=
chard Purdie <richard.purdie@linuxfoundation.org>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1:

> On Mon, 2020-08-31 at 11:59 +0200, Changhyeok Bae wrote:
> > - libgcrypt is not required anymore because the md5 implementation was
> >   part of this project.
> > - ninfod patches are upstreamed and other patch is not required anymore=
.
> >
> > Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> > ---
> >  .../0001-iputils-Initialize-libgcrypt.patch   | 55 -------------------
> >  ...riable-name-to-avoid-colliding-with-.patch | 51 -----------------
> >  ...-fix-systemd-Documentation-url-error.patch | 28 ----------
> >  ...tils_s20190709.bb =3D> iputils_s20200821.bb} |  8 +--
> >  4 files changed, 2 insertions(+), 140 deletions(-)
> >  delete mode 100644
> meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.p=
atch
> >  delete mode 100644
> meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to=
-avoid-colliding-with-.patch
> >  delete mode 100644
> meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentati=
on-url-error.patch
> >  rename meta/recipes-extended/iputils/{iputils_s20190709.bb =3D>
> iputils_s20200821.bb} (87%)
>
> Hi,
>
> Thanks for the upgrade. There seems to be an issue with tftpd:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2389
>
> Error:
>  Problem: package packagegroup-core-full-cmdline-1.0-r6.noarch requires
> packagegroup-core-full-cmdline-extended, but none of the providers can be
> installed
>   - package packagegroup-core-full-cmdline-extended-1.0-r6.noarch require=
s
> iputils, but none of the providers can be installed
>   - conflicting requests
>   - nothing provides iputils-tftpd needed by iputils-s20200821-r0.core2_3=
2
> (try to add '--skip-broken' to skip uninstallable packages)
>
> Any ideas what changed?
>
> Cheers,
>
> Richard
>
>

--=20
Thanks
Changhyeok

--000000000000aab98e05ae462960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard<div><br></div><div>Thank you for the report. I =
will look into it.</div><div><br></div><div>Best regards,</div><div>Changhy=
eok</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">2020=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84=
 2:32, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mo=
n, 2020-08-31 at 11:59 +0200, Changhyeok Bae wrote:<br>
&gt; - libgcrypt is not required anymore because the md5 implementation was=
<br>
&gt;=C2=A0 =C2=A0part of this project.<br>
&gt; - ninfod patches are upstreamed and other patch is not required anymor=
e.<br>
&gt; <br>
&gt; Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gma=
il.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-iputils-Initialize-libgcrypt.patch=C2=A0 =C2=A0| 55 ---=
----------------<br>
&gt;=C2=A0 ...riable-name-to-avoid-colliding-with-.patch | 51 -------------=
----<br>
&gt;=C2=A0 ...-fix-systemd-Documentation-url-error.patch | 28 ----------<br=
>
&gt;=C2=A0 ...<a href=3D"http://tils_s20190709.bb" rel=3D"noreferrer" targe=
t=3D"_blank">tils_s20190709.bb</a> =3D&gt; <a href=3D"http://iputils_s20200=
821.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a>} |=C2=
=A0 8 +--<br>
&gt;=C2=A0 4 files changed, 2 insertions(+), 140 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ip=
utils-Initialize-libgcrypt.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ni=
nfod-change-variable-name-to-avoid-colliding-with-.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ni=
nfod-fix-systemd-Documentation-url-error.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/iputils/{<a href=3D"http://iputils_=
s20190709.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20190709.bb</a>=
 =3D&gt; <a href=3D"http://iputils_s20200821.bb" rel=3D"noreferrer" target=
=3D"_blank">iputils_s20200821.bb</a>} (87%)<br>
<br>
Hi,<br>
<br>
Thanks for the upgrade. There seems to be an issue with tftpd:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/build=
s/2389" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/75/builds/2389</a><br>
<br>
Error: <br>
=C2=A0Problem: package packagegroup-core-full-cmdline-1.0-r6.noarch require=
s packagegroup-core-full-cmdline-extended, but none of the providers can be=
 installed<br>
=C2=A0 - package packagegroup-core-full-cmdline-extended-1.0-r6.noarch requ=
ires iputils, but none of the providers can be installed<br>
=C2=A0 - conflicting requests<br>
=C2=A0 - nothing provides iputils-tftpd needed by iputils-s20200821-r0.core=
2_32<br>
(try to add &#39;--skip-broken&#39; to skip uninstallable packages)<br>
<br>
Any ideas what changed?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Thanks<div>Changhyeok</div></di=
v></div>

--000000000000aab98e05ae462960--

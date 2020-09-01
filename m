Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.5979.1598993320318437608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 13:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vJzoOQFh;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id s29so883901uae.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H4Jy37VeACls/bfwkzmXFFdHRFl0KL9ZA4Bwz4jTv6Q=;
        b=vJzoOQFhLC0LZhSTbqRPBL/wCKV5cnYmZu3XjsxTkI4k8+rDpu1HsbdexTzq5VXZ1u
         o3HpErWXrv/ALjKw8NAyNY4YzoiTO5K38QR2mnDPRd/d498sNRynL3zevcjTcTTLjnkF
         44vxhOBnAkTWBQttS9lVUJHNJYZdR9/s/W4RH2GVHZ2MIP7zz7ihj0akhXa8xwP0Beds
         sR28lVLgw9hJia6MLLccX1AJJywtn/Y4ItUhQL5jMaB3RhctSEBCrwxs9T/1p0Y7VBzF
         7qCNy7ZMrn+tRVOggfYkzcvys2CO3OLrwB6VEz9H3vBNluA66+Mv+uY4XQHtvpbSJ8ET
         qKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H4Jy37VeACls/bfwkzmXFFdHRFl0KL9ZA4Bwz4jTv6Q=;
        b=alAIxUTLjaKo8RSnaxuufujFbUOFbfBpclTErK9vIU3YcGyC+2NdsrL7VIlk69JrZT
         nWCAwpN0WKo64eUGUefFR0GnffsWXy/44/QDC9J0Tlu5djhhD9RplFYlrLK6rFmBBhUi
         SWIXRmhoVT1a2Ms+sHmEuJ/0rAlDaOK5j2C6PCv/XWOPVx3hf8iAI/G1yUpnMfgrbr6e
         1CTlXWUH/L2r3cSsVhcH5GgWp0gxrIkMU+/PPZ+r1hqEypjfJH5GBlsrY1v9tsj/dXBo
         Y4WZbzv3k/+jwSLsm97EFOFUfs5sL1FGrHCjQjl4MypObfM9kYYstFrsFnTjtNTnmxjJ
         Vzlw==
X-Gm-Message-State: AOAM531Nd6bIPI7OncFLiW0QH7zPiJwh6YEdd2KZK+aJAGZPPQYhoPkV
	oclg6VpihTbCFZRMEjHRiCdN38yql4nNLGZdIkM=
X-Google-Smtp-Source: ABdhPJwcCvWEOe2c/jO9/5+1uBUZ0k0OMtdMzZyw+C6UYFjrebWRX6AeAZoPegP1JftZXrnCH+nOIUegOv15PavyjA4=
X-Received: by 2002:a9f:2c9a:: with SMTP id w26mr3057488uaj.89.1598993319414;
 Tue, 01 Sep 2020 13:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200831095948.15750-1-changhyeok.bae@gmail.com>
 <20200831095948.15750-2-changhyeok.bae@gmail.com> <b2d48e4fdb1020a36aed221b472014cbf41735b3.camel@linuxfoundation.org>
 <CACrLJgBmqCx+SeCuaPSEXHaCt_7YpSQY7aJzRiJB3N9uXUSqvA@mail.gmail.com>
In-Reply-To: <CACrLJgBmqCx+SeCuaPSEXHaCt_7YpSQY7aJzRiJB3N9uXUSqvA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 1 Sep 2020 22:48:28 +0200
Message-ID: <CANNYZj8P2iHG4o3ke96kNxpcXL6YzpqeKSL=cB9ggsiBKY5byQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] iputils: upgrade s20190709 -> s20200821
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cd4ea005ae46a413"

--000000000000cd4ea005ae46a413
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think tftpd option is now off by default, and we probably should disable
it as well:

https://github.com/iputils/iputils/commit/737d8a91e394518d2ccdaf398bb16283=
eb8e4a81

Alex

On Tue, 1 Sep 2020 at 22:14, Changhyeok Bae <changhyeok.bae@gmail.com>
wrote:

> Hi Richard
>
> Thank you for the report. I will look into it.
>
> Best regards,
> Changhyeok
>
> 2020=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2:32,=
 Richard Purdie <
> richard.purdie@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
>> On Mon, 2020-08-31 at 11:59 +0200, Changhyeok Bae wrote:
>> > - libgcrypt is not required anymore because the md5 implementation wa=
s
>> >   part of this project.
>> > - ninfod patches are upstreamed and other patch is not required anymo=
re.
>> >
>> > Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
>> > ---
>> >  .../0001-iputils-Initialize-libgcrypt.patch   | 55 -----------------=
--
>> >  ...riable-name-to-avoid-colliding-with-.patch | 51 -----------------
>> >  ...-fix-systemd-Documentation-url-error.patch | 28 ----------
>> >  ...tils_s20190709.bb =3D> iputils_s20200821.bb} |  8 +--
>> >  4 files changed, 2 insertions(+), 140 deletions(-)
>> >  delete mode 100644
>> meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt=
.patch
>> >  delete mode 100644
>> meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-=
to-avoid-colliding-with-.patch
>> >  delete mode 100644
>> meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documenta=
tion-url-error.patch
>> >  rename meta/recipes-extended/iputils/{iputils_s20190709.bb =3D>
>> iputils_s20200821.bb} (87%)
>>
>> Hi,
>>
>> Thanks for the upgrade. There seems to be an issue with tftpd:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/2389
>>
>> Error:
>>  Problem: package packagegroup-core-full-cmdline-1.0-r6.noarch requires
>> packagegroup-core-full-cmdline-extended, but none of the providers can =
be
>> installed
>>   - package packagegroup-core-full-cmdline-extended-1.0-r6.noarch
>> requires iputils, but none of the providers can be installed
>>   - conflicting requests
>>   - nothing provides iputils-tftpd needed by iputils-s20200821-r0.core2=
_32
>> (try to add '--skip-broken' to skip uninstallable packages)
>>
>> Any ideas what changed?
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> Thanks
> Changhyeok
>=20
>

--000000000000cd4ea005ae46a413
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think tftpd option is now off by default, and we pr=
obably should disable it as well:</div><div><br></div><div><a href=3D"https=
://github.com/iputils/iputils/commit/737d8a91e394518d2ccdaf398bb16283eb8e4a=
81">https://github.com/iputils/iputils/commit/737d8a91e394518d2ccdaf398bb16=
283eb8e4a81</a></div><br><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 1 Sep 2020 at 22:14, Ch=
anghyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gmail.com">changhyeok.bae=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">Hi Richard<div><br></div><div>Thank you for th=
e report. I will look into it.</div><div><br></div><div>Best regards,</div>=
<div>Changhyeok</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">2020=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=
=
=A4=ED=9B=84 2:32, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Mon, 2020-08-31 at 11:59 +0200, Changhyeok Bae=
 wrote:<br>
&gt; - libgcrypt is not required anymore because the md5 implementation wa=
s<br>
&gt;=C2=A0 =C2=A0part of this project.<br>
&gt; - ninfod patches are upstreamed and other patch is not required anymo=
re.<br>
&gt; <br>
&gt; Signed-off-by: Changhyeok Bae &lt;<a href=3D"mailto:changhyeok.bae@gm=
ail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-iputils-Initialize-libgcrypt.patch=C2=A0 =C2=A0| 55 --=
-----------------<br>
&gt;=C2=A0 ...riable-name-to-avoid-colliding-with-.patch | 51 ------------=
-----<br>
&gt;=C2=A0 ...-fix-systemd-Documentation-url-error.patch | 28 ----------<b=
r>
&gt;=C2=A0 ...<a href=3D"http://tils_s20190709.bb" rel=3D"noreferrer" targ=
et=3D"_blank">tils_s20190709.bb</a> =3D&gt; <a href=3D"http://iputils_s2020=
0821.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a>} |=
=C2=A0 8 +--<br>
&gt;=C2=A0 4 files changed, 2 insertions(+), 140 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-i=
putils-Initialize-libgcrypt.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-n=
infod-change-variable-name-to-avoid-colliding-with-.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-n=
infod-fix-systemd-Documentation-url-error.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/iputils/{<a href=3D"http://iputils=
_s20190709.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20190709.bb</a=
> =3D&gt; <a href=3D"http://iputils_s20200821.bb" rel=3D"noreferrer" target=
=
=3D"_blank">iputils_s20200821.bb</a>} (87%)<br>
<br>
Hi,<br>
<br>
Thanks for the upgrade. There seems to be an issue with tftpd:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/75/buil=
ds/2389" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/75/builds/2389</a><br>
<br>
Error: <br>
=C2=A0Problem: package packagegroup-core-full-cmdline-1.0-r6.noarch requir=
es packagegroup-core-full-cmdline-extended, but none of the providers can b=
e installed<br>
=C2=A0 - package packagegroup-core-full-cmdline-extended-1.0-r6.noarch req=
uires iputils, but none of the providers can be installed<br>
=C2=A0 - conflicting requests<br>
=C2=A0 - nothing provides iputils-tftpd needed by iputils-s20200821-r0.cor=
e2_32<br>
(try to add &#39;--skip-broken&#39; to skip uninstallable packages)<br>
<br>
Any ideas what changed?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
"><div dir=3D"ltr">Thanks<div>Changhyeok</div></div></div>
<br>
</blockquote></div>

--000000000000cd4ea005ae46a413--

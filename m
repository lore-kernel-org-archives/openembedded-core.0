Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9123F7896A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:10:43 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id v13so5751987iob.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p+tgZxtzZ6Y6/HAvu+x24SOBOdEmhXXazRan+Cc3n0k=;
	b=qxoiWHMrwooGgMezH4jnTeEg4SjYrOGfE3oPqe3igfcP1NknPbnia63yqWUZwuceBq
	vzPtzFeKNEgtwxJsv/EQaKNb7mhDWjH2molTd6Shbzrcw4TyzerEgk63CPgoXbtQH7nz
	74Pf0aRUV1luCbb4yQRmGB2Z9kgCIzytlL7D2aeI50t49853Ev+jXpOm8JOkHlmigv4d
	045eoM/wj124ODzfrl3Ns1Elq4QMgeoRog6jVMcOa3vwWZyrAgVD5ayJUvRUC12nLAG/
	1ddz+m0PClxZKmsSDU+PhCIj0dcUSo9Kne4OvpPgVxSv7b8iU8vALr4ars8LKZyj9O67
	BELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p+tgZxtzZ6Y6/HAvu+x24SOBOdEmhXXazRan+Cc3n0k=;
	b=T3PTd9RX4hkEb2C/Ahwgd3ayIgh4aF2LEnhFjkb6DZVQLNHPBbe1TZSDopR6UMsuuS
	A0bDcOzXfnqN8v9cQ7J/4J0cWLf4YStb7/l6sc6g0WwDbzZbXK3ztf3CCaBqQFayWTsh
	eRsPUZyxEFXau0hllwg+ai5FzLIBpS3CGs5NJwq2J89GkmIMidsBNPyTvadnz7tXtioo
	h52V+tYNXYuI9CObZKLYo3BffD8JgPKtYjyI9D/ZjiVgMcNqHloMNbhZU1h0o7YVXzJw
	HSpLyicf+P1XwSDUHZr03p3zU3IhWBwBMki6pcLIUUaMARPt4il935kup6yQUZNSamwE
	0afQ==
X-Gm-Message-State: AElRT7Fy+5OtN5xtktz+jQRHxpw1J+4/yqvo5ryEgc2YvAz9B0OS7ZKf
	1QzoGgfM0y8h6hfsXSUdScm/S81y97jJQmbLucs=
X-Google-Smtp-Source: AG47ELvDe8x4XR1JAZEBW5Dmfh5scP4Sv4swrZ2EIYppoaIjoJVqI1k6+xbCGiO7VedWDe6DnKj6yK64OWwFtJsID7I=
X-Received: by 10.107.16.65 with SMTP id y62mr19480841ioi.213.1521623444698;
	Wed, 21 Mar 2018 02:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.176.144 with HTTP; Wed, 21 Mar 2018 02:10:24 -0700 (PDT)
In-Reply-To: <CAPGMVzEjwrXXsEchqDonFeNDBoB7up0espUMk4F8SvLRE3YUfg@mail.gmail.com>
References: <CAPGMVzEjwrXXsEchqDonFeNDBoB7up0espUMk4F8SvLRE3YUfg@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 21 Mar 2018 10:10:24 +0100
Message-ID: <CAB2nKc9O=dv1QqbpHKTsS6smApSUX1B+3OufCE6N1LsO+NMBNQ@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package inclusion error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 09:10:43 -0000
Content-Type: multipart/alternative; boundary="001a113f2256e73a640567e890ef"

--001a113f2256e73a640567e890ef
Content-Type: text/plain; charset="UTF-8"

Hi,

With "oe-pkgdata-util list-pkgs -p opencv" command, you can check every
packages made from opencv recipe.
One of them is python3-opencv, did you add it to IMAGE_INSTALL as well as
opencv?

Best regards,
Vincent

2018-03-21 8:18 GMT+01:00 Rajath C S <rajathcs.1996@gmail.com>:

> opencv recipe is in meta-oe layer, i have included meta-oe path in
> bblayer.config file
> and i have also included open cv in IMAGE_INSTALL and have successfully
> built the target using bitbake but still when i am doing 'import cv2' on
> python terminal on yocto's poky it says 'no moudle named cv2'. what is the
> solution?
> Thanks
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113f2256e73a640567e890ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>With &quot;oe-pkgdata-util li=
st-pkgs -p opencv&quot; command, you can check every packages made from ope=
ncv recipe.</div><div>One of them is=C2=A0python3-opencv, did you add it to=
 IMAGE_INSTALL as well as opencv?=C2=A0</div><div><br></div><div>Best regar=
ds,</div><div>Vincent</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2018-03-21 8:18 GMT+01:00 Rajath C S <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996=
@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r"><div><div>opencv recipe is in meta-oe layer, i have included meta-oe pat=
h in bblayer.config file<br></div>and i have also included open cv in IMAGE=
_INSTALL and have successfully built the target using bitbake but still whe=
n i am doing &#39;import cv2&#39; on python terminal on yocto&#39;s poky it=
 says &#39;no moudle named cv2&#39;. what is the solution?<br></div>Thanks<=
br></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a113f2256e73a640567e890ef--

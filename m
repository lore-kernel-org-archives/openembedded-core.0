Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C8625786E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 10:30:35 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l17so4331595ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Eswen4Fr0+NhY4hY+0UqlTWX4NGT3EG/u4W0tS5v4zo=;
	b=LxfarmhewJ7NA0f7SBgtEP8D3tGlZnKwClXYQp7oqM/pwYn5X60kjnJJEjFHC9SG0K
	nTaAQp4Si6xQCxH1LNLjHqKxQZ46oXXq+bPYyiBW5Al4hSTNrFzJL1afP0KUMFPmxMnz
	4MEZzEdcm92IsUtOspqt13+6wgMuvitvU9I1XPQZxhqJHlq3k5A1zl8IiYLMQM5fOTA9
	JowNiiDMfLzRbwYWYe+TZReHHgYNDLEegnezD47J/hcHCRlCE7NsKW4zFct53bs+eIJM
	zWjTR09NaDE8vPSJLADJHsdoYVU7or97QZYuKeFQDpeCOComJ+dbk4VMYRAqxoQAYOhI
	Bkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Eswen4Fr0+NhY4hY+0UqlTWX4NGT3EG/u4W0tS5v4zo=;
	b=g05uDLJtdIh9MDgeHN6ELmQKaSdJlN16/k7/7EHhPkJLvM46LqofdQQrf6qVRj0wdl
	GN2QO+hOoc44V1zZMgru5mEKrm1u0l0QC+W4l3BxvsCILIEcx8jSPGG8bsY2yhj2HX6l
	D6i2/34hDmUJZSFXqp/iMANduJShxTnPBQTo6G4bWRvRKPg4lxnC3VIrUV8g/Ne1BnZL
	KJHvKXKItnW2KjOrFnAzexUOqhNaQhjcME0283JDgZqNOvd9w28cul359tL7dUc7jFNl
	UwxZGoeU3iHhdkE3TlpP/0fra0V4TSxTtji9HwEuU4az8Ju2RzmL1UWe6X1YjVx178Bk
	2kCQ==
X-Gm-Message-State: AKwxytd933dPuemgzbLSkwMRCYeZAmmKkAz6aJElaP1ZXb15uXoWLqA6
	7u4nb7ZpecdclSIycGkgEBlTl7Us4ZkP5EesStJoVA==
X-Google-Smtp-Source: AH8x224w9w/0PFfnxFtjaFdTAdWw9snYddNdNBqYy+9CBvd9vMOaqCFadMkDPLTETxoxm2JVJclBwiK8Tx+cU+reMYg=
X-Received: by 10.107.32.19 with SMTP id g19mr7723697iog.217.1516789836779;
	Wed, 24 Jan 2018 02:30:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 24 Jan 2018 02:30:16 -0800 (PST)
In-Reply-To: <20180124100855.4551-2-hainsvdbosch@ziggo.nl>
References: <20180124100855.4551-1-hainsvdbosch@ziggo.nl>
	<20180124100855.4551-2-hainsvdbosch@ziggo.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jan 2018 10:30:16 +0000
Message-ID: <CAJTo0LYt3FjTD_xXGMDOjM_bihkKDpDHsf0kUZDE=OzPWvfz_g@mail.gmail.com>
To: Hains van den Bosch <hainsvdbosch@ziggo.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] libcdio: update to version 2.0.0
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
X-List-Received-Date: Wed, 24 Jan 2018 10:30:36 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a46baadf0563832728"

--001a1141a2a46baadf0563832728
Content-Type: text/plain; charset="UTF-8"

Wrong list, meta-oe patches go to openembedded-devel@

On 24 January 2018 at 10:08, Hains van den Bosch <hainsvdbosch@ziggo.nl>
wrote:

> ---
>  .../recipes-multimedia/libcdio/{libcdio_0.93.bb => libcdio_2.0.0.bb} | 5
> +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-multimedia/libcdio/{libcdio_0.93.bb =>
> libcdio_2.0.0.bb} (86%)
>
> diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
> b/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
> similarity index 86%
> rename from meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
> rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
> index 99e6a84bc..6bf64d663 100644
> --- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.93.bb
> +++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.0.0.bb
> @@ -5,8 +5,9 @@ LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>  SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "d154476feaac5a7b5f180e83eaf3d689"
> -SRC_URI[sha256sum] = "4972cd22fd8d0e8bff922d35c7a645
> be0db0ab0e7b3dfaecc9cd8272429d6975"
> +
> +SRC_URI[md5sum] = "0cb25905113b930e4539d2f4eb6574b0"
> +SRC_URI[sha256sum] = "1b481b5da009bea31db87580566597
> 4e2fc568e2b2afa516f4036733657cf958"
>
>  inherit autotools pkgconfig
>
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141a2a46baadf0563832728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong list, meta-oe patches go to openembedded-devel@</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 24 January 20=
18 at 10:08, Hains van den Bosch <span dir=3D"ltr">&lt;<a href=3D"mailto:ha=
insvdbosch@ziggo.nl" target=3D"_blank">hainsvdbosch@ziggo.nl</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">---<br>
=C2=A0.../recipes-multimedia/<wbr>libcdio/{<a href=3D"http://libcdio_0.93.b=
b" rel=3D"noreferrer" target=3D"_blank">libcdio_0.93.bb</a> =3D&gt; <a href=
=3D"http://libcdio_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_2=
.0.0.bb</a>} | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-multimedia/<wbr>libcdio/{<a href=3D"http://lib=
cdio_0.93.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_0.93.bb</a> =3D&=
gt; <a href=3D"http://libcdio_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank=
">libcdio_2.0.0.bb</a>} (86%)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libc=
dio_0.93.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_0.93.bb</a> b/met=
a-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libcdio_2.0.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libcdio_2.0.0.bb</a><br>
similarity index 86%<br>
rename from meta-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libcd=
io_0.93.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_0.93.bb</a><br>
rename to meta-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libcdio=
_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_2.0.0.bb</a><br>
index 99e6a84bc..6bf64d663 100644<br>
--- a/meta-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libcdio_0.9=
3.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_0.93.bb</a><br>
+++ b/meta-oe/recipes-multimedia/<wbr>libcdio/<a href=3D"http://libcdio_2.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libcdio_2.0.0.bb</a><br>
@@ -5,8 +5,9 @@ LICENSE =3D &quot;GPLv3+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d32239bcb673463a=
b874e80d47fae5<wbr>04&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/${BPN}/${BP}.<wbr>tar.gz&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>d154476feaac5a7b5f180e83eaf3d6<wbr>89&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>4972cd22fd8d0e8bff922d35c7a645<wbr>be0db=
0ab0e7b3dfaecc9cd8272429d<wbr>6975&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>0cb25905113b930e4539d2f4eb6574<wbr>b0&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>1b481b5da009bea31db87580566597<wbr>4e2fc=
568e2b2afa516f4036733657c<wbr>f958&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141a2a46baadf0563832728--

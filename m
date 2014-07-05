Return-Path: <sadlife1990@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id E31727026E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 12:12:52 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id oy12so2423786veb.37
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kRdpnlUr2JxU3QFhW8aekB921HTKWbV7HrwkxdwT8lI=;
	b=V16oNtDPJRRb6mXypIrBoCp4CMDBYJZMUAqhUJdxFcUHPFASi9bTzvWJ910vbyxGum
	+HZV//WGkZ6P7DOdkFXZ5kcwTIbw/0ZtIglsaYcEJJuz3KXoyUmgPxqFFLcCFkeCIJGr
	gZIAcbkCRul/PlMFqXVwve7f+QTEdq/gMuLXgGBcEBQRwFPQvYk+rs45VJsKAARkolth
	dwTqsSiC7IgqOsfc7hJSb/gctAAErLASQxVi+CRFM+pqI7p3VeztdRg+GleVz3U+Sqj8
	Mhm7Z0wzjJzRdKjeUDXKCsnSlxP+ywZQ7yLB2gXao1Kf4ucp9oS3/xNpa8EahjDIQmIc
	Pqdg==
MIME-Version: 1.0
X-Received: by 10.52.163.208 with SMTP id yk16mr144264vdb.36.1404562373491;
	Sat, 05 Jul 2014 05:12:53 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Sat, 5 Jul 2014 05:12:53 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B43AB5B@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
	<CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
	<CAAHuHfzUxTVUVtNec_pSghazarNeiVRd-3dYWRGXJ8w1nQDTig@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB5B@post.tritech.se>
Date: Sat, 5 Jul 2014 15:12:53 +0300
Message-ID: <CAAHuHfxRyjJZnncMbjcE6MdgfttW5aap8ESDFTg8NecAKy57ng@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
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
X-List-Received-Date: Sat, 05 Jul 2014 12:12:53 -0000
Content-Type: multipart/alternative; boundary=001a11c24dfe563fdd04fd7129d7

--001a11c24dfe563fdd04fd7129d7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you for quick reply, I'm using angstrom-v2013.12-yocto1.5

PACKAGE_CLASSES =3D "package_ipk"



2014-07-05 15:01 GMT+03:00 Mats K=C3=A4rrman <Mats.Karrman@tritech.se>:

>
> On Saturday, July 05, 2014 1:51 PM, Life Life wrote:
> > yes
>
> It might help if your answers were a little more verbose... :-/
>
> > no I'm not using -e switch, e.g: bitbake console-image
>
> If you use the -e switch you will see the value of all variables,
> including PACKAGE_CLASSES and
> IMAGE_PKGTYPE. Then if these does not exist or does not have the values
> that you
> expected, it means something is wrong with your setup.
>
> Are you using poky or bare openembedded?
>
> In case of poky, the setup script will copy the local.conf to a new
> directory under the build
> dir and that is used instead of the original so you must update the
> correct file.
>
> The -e option will also tell you exactly what files/dirs are used by
> bitbake.
>
> // Mats

--001a11c24dfe563fdd04fd7129d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for quick reply, I&#39;m using angstrom-v2013.12=
-yocto1.5 <br><pre class=3D"">PACKAGE_CLASSES =3D &quot;<span class=3D"">pa=
ckage_ipk</span>&quot;</pre></div><div class=3D"gmail_extra"><br><br><div c=
lass=3D"gmail_quote">
2014-07-05 15:01 GMT+03:00 Mats K=C3=A4rrman <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Mats.Karrman@tritech.se" target=3D"_blank">Mats.Karrman@tritech.=
se</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On Saturday, July 05, 2014 1:51 PM, Life Life wrote:<br>
&gt; yes<br>
<br>
It might help if your answers were a little more verbose... :-/<br>
<div class=3D""><br>
&gt; no I&#39;m not using -e switch, e.g: bitbake console-image<br>
<br>
</div>If you use the -e switch you will see the value of all variables, inc=
luding PACKAGE_CLASSES and<br>
IMAGE_PKGTYPE. Then if these does not exist or does not have the values tha=
t you<br>
expected, it means something is wrong with your setup.<br>
<br>
Are you using poky or bare openembedded?<br>
<br>
In case of poky, the setup script will copy the local.conf to a new directo=
ry under the build<br>
dir and that is used instead of the original so you must update the correct=
 file.<br>
<br>
The -e option will also tell you exactly what files/dirs are used by bitbak=
e.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
// Mats</font></span></blockquote></div><br></div>

--001a11c24dfe563fdd04fd7129d7--

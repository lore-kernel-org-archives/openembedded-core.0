Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A9A547026E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 11:11:40 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id la4so2315898vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 04:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9U9+VVaPSSQYn/7Ake59Y7Fp+CFEEzKhSueo8Kz0XXY=;
	b=zv6nsH708eS0i7r21ANdcjSU2isfotVcprdGIDbZAuyuxuRo0eOUmcdU66V2pHrRv8
	Z32KwP4XzPFo5tfvCeNgLHlcW9VqmUNNpiKyWdrK4Z06TPFLCHx2SFmEI3Ql94CiHClH
	492Fq2xA+GJOUa5Kv5oN0vY+1yIW+d908b/CW541VBRHKdVZXDQAVseLW+j/hah0eJBO
	IcI78Ol9jIRmqW8IjZOVGNbeukSO5qiuhSCPpy5Zv7p0Vaoe4WkVspNoRNWDLtO5dAIE
	EzCR4vgD9uIHOlj4VYfYz8SBec/+1HM5d86xjIBcLtjnnVxV11Y0GdYSVveBK1siyepK
	H2SA==
MIME-Version: 1.0
X-Received: by 10.58.149.170 with SMTP id ub10mr2120240veb.0.1404558702150;
	Sat, 05 Jul 2014 04:11:42 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Sat, 5 Jul 2014 04:11:42 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
Date: Sat, 5 Jul 2014 14:11:42 +0300
Message-ID: <CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 05 Jul 2014 11:11:45 -0000
Content-Type: multipart/alternative; boundary=047d7b6760028207bb04fd704e8c

--047d7b6760028207bb04fd704e8c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

no I'm not using -e switch, e.g: bitbake console-image


2014-07-05 13:04 GMT+03:00 Mats K=C3=A4rrman <Mats.Karrman@tritech.se>:

> Hi again,
>
> On Saturday, July 05, 2014 11:55 AM, Mats K=C3=A4rrman wrote:
> > On Saturday, July 05, 2014 10:42 AM, Life Life wrote:
> >> I'm trying build simple image and I run this command bitbake
> console-image After I see this error. How to solve this problem ?
> >> ERROR: ParseError at
> /home/setup-scripts/sources/openembedded-core/meta/classes/image.bbclass:=
1:
> Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
> >
> > If you run your build command with the '-e' switch, what do you get for
> IMAGE_PKGTYPE? E.g:
> >
> > $ bitbake console-image -e |egrep '^IMAGE_PKGTYPE'
>
> Or, to cut things short a bit..
> Your configuration, e.g. config/local.conf should contain something like
> this:
>
> PACKAGE_CLASSES =3D "package_ipk"
>
> or
>
> PACKAGE_CLASSES =3D "package_rpm"
>
> This class will then set a value for IMAGE_PKGTYPE.
>
> BR // Mats

--047d7b6760028207bb04fd704e8c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">no I&#39;m not using -e switch, e.g: bitbake console-image=
<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">201=
4-07-05 13:04 GMT+03:00 Mats K=C3=A4rrman <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Mats.Karrman@tritech.se" target=3D"_blank">Mats.Karrman@tritech.se</=
a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi again,<br>
<div><div class=3D"h5"><br>
On Saturday, July 05, 2014 11:55 AM, Mats K=C3=A4rrman wrote:<br>
&gt; On Saturday, July 05, 2014 10:42 AM, Life Life wrote:<br>
&gt;&gt; I&#39;m trying build simple image and I run this command bitbake c=
onsole-image After I see this error. How to solve this problem ?<br>
&gt;&gt; ERROR: ParseError at /home/setup-scripts/sources/openembedded-core=
/meta/classes/image.bbclass:1: Could not inherit file classes/rootfs_${IMAG=
E_PKGTYPE}.bbclass<br>
&gt;<br>
&gt; If you run your build command with the &#39;-e&#39; switch, what do yo=
u get for IMAGE_PKGTYPE? E.g:<br>
&gt;<br>
&gt; $ bitbake console-image -e |egrep &#39;^IMAGE_PKGTYPE&#39;<br>
<br>
</div></div>Or, to cut things short a bit..<br>
Your configuration, e.g. config/local.conf should contain something like th=
is:<br>
<br>
PACKAGE_CLASSES =3D &quot;package_ipk&quot;<br>
<br>
or<br>
<br>
PACKAGE_CLASSES =3D &quot;package_rpm&quot;<br>
<br>
This class will then set a value for IMAGE_PKGTYPE.<br>
<br>
BR // Mats</blockquote></div><br></div>

--047d7b6760028207bb04fd704e8c--

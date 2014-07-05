Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E310B70290
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 11:51:23 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ij19so2411633vcb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 04:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x0xfAO62UFwtKtJdl8EKgbvPcEyQFjS+sUJ2zC7AWng=;
	b=B9pZHkFszCF6MrgHxJtE6jkPDy+mqAt2+Di3Lo0YaeIKGyc+UFEL2tq1FUiSLc+WKt
	0yCxbvMd6ITaelSQQbYgfA52GQf7iOqTYq0T9GOGSpHKDLKC2X9KU67BUyewS0XtT4IE
	EQVocQ265pcIhPo7LbcKThWHQhtKXOO+4dqnwsNHCrqFZ1PEYEfmuthT7jo2mmgZBcik
	2YQv90tRBAwohOmF5DjvqXkIFUwDxMQpUwsO81WEL1/Bv3TzKtM/nn/C8IQyfNdCG/ue
	UqsJmO9eBz4G5oAET4lnGEpvrQrQNa71u7sIjsSl5Zr3ZS66IpPbBn1/bL3wRdUseeOI
	Oxuw==
MIME-Version: 1.0
X-Received: by 10.58.185.227 with SMTP id ff3mr4159vec.45.1404561084188; Sat,
	05 Jul 2014 04:51:24 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Sat, 5 Jul 2014 04:51:24 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
	<CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
Date: Sat, 5 Jul 2014 14:51:24 +0300
Message-ID: <CAAHuHfzUxTVUVtNec_pSghazarNeiVRd-3dYWRGXJ8w1nQDTig@mail.gmail.com>
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
X-List-Received-Date: Sat, 05 Jul 2014 11:51:27 -0000
Content-Type: multipart/alternative; boundary=047d7b6759ee7d0d7f04fd70dcca

--047d7b6759ee7d0d7f04fd70dcca
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

yes


2014-07-05 14:15 GMT+03:00 Mats K=C3=A4rrman <Mats.Karrman@tritech.se>:

> On Saturday, July 05, 2014 1:11 PM, Life Life wrote:
> > no I'm not using -e switch, e.g: bitbake console-image
>
> I meant for you to try using it...
> The -e switch will do nothing but display the parsed value for all
> variables of the recipe you are building.
>
> Do you have a PACKAGE_CLASSES definition in your config?
>
> BR // Mats
>

--047d7b6759ee7d0d7f04fd70dcca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yes<br></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">2014-07-05 14:15 GMT+03:00 Mats K=C3=A4rrman <span dir=3D"=
ltr">&lt;<a href=3D"mailto:Mats.Karrman@tritech.se" target=3D"_blank">Mats.=
Karrman@tritech.se</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Saturday, July 05, 2014 1=
:11 PM, Life Life wrote:<br>
&gt; no I&#39;m not using -e switch, e.g: bitbake console-image<br>
<br>
</div>I meant for you to try using it...<br>
The -e switch will do nothing but display the parsed value for all variable=
s of the recipe you are building.<br>
<br>
Do you have a PACKAGE_CLASSES definition in your config?<br>
<br>
BR // Mats<br>
</blockquote></div><br></div>

--047d7b6759ee7d0d7f04fd70dcca--

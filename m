Return-Path: <kergoth@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A60377E7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:57:16 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id x24so996210uah.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tqCIwY8OCZsPqTFzOpwqX18WdUiGIeZ06FCayuTFNUg=;
	b=rc0ykhSIPpwBVbb73yx1wnrddk2k3d0RxPatCwHnjNIEG203Kt0g2T37nZMxC/mzEc
	Uw0PsMNjGazS0N2uljfA4tU6doYOb83rZ/BfPy7b/2T2owcZ+BHS7rBLT+PLzvLdZIzQ
	HXolgsxSloGOz17kPT8rFF/eZNh+5oZR7xexC4PAcZm82lX3L4NfEnG2jvbPV/RLOWP+
	oexP2L/ad9/gHAA9927W2DRZtYNme71wM2v+3uiciBQhqmM1XXUs8YSUNFShdVkGCUiO
	+YrHp9/sCPzr+gdp9zSlqp57atXM2+w1v0Dgk/edVLBEjTwn/kBYYrGtUrKCDVpSnLp6
	JeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tqCIwY8OCZsPqTFzOpwqX18WdUiGIeZ06FCayuTFNUg=;
	b=bC0nqp/tsI9hIN3rkyZQU6u5eMhyzB8iom3pVMhtrMf5CML5LabCUAP9Rd29Yo2wm3
	2GSQqBHAqNSLUMrucF2JTz/9LQB+3ALtzfBO50FyhiwSY6nHpspjf1pcqT1IsdfmFa1G
	+jgaRsDJMwBZ8pMbgOUUdEblNcpNnPKX0Tw6mxLXJuL4j85p474V3QLSurlT4/t28U7u
	vrM9dP9ocrzcrULR68sC8vOGkkzU2YEmeJGyKtEPCMNn+o3qvFleV7dtUjivvguvR5Fn
	jjSatuUqWRwjFzqZVP1X9DuZB+BO+/GpWCmV4vyYYHXV8xOb1tZ1IaFWj0OlfBOcYMp9
	NI3w==
X-Gm-Message-State: AHYfb5hrt5buJF4/TkpVAOcaditOLaE5SFY6fNjjXWYZ1Zj/vyytfXY6
	U+l+3oh2dsvL7tslIBGt0P0xh8B+rmLL
X-Received: by 10.159.33.97 with SMTP id 88mr20072116uab.5.1502834238334; Tue,
	15 Aug 2017 14:57:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.84.146 with HTTP; Tue, 15 Aug 2017 14:56:57 -0700 (PDT)
In-Reply-To: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 15 Aug 2017 14:56:57 -0700
Message-ID: <CABcZAN=12C5xBzCo7oRm504nFoLZRVz5DZYbemaBBkRE3XZSpQ@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-python3: add packagegroup
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
X-List-Received-Date: Tue, 15 Aug 2017 21:57:17 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b321aeeacf90556d1dc81"

--94eb2c0b321aeeacf90556d1dc81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2017 at 2:05 PM, Jose Lamego <jose.a.lamego@linux.intel.com=
>
wrote:

> Many of the most usual python3 modules are missing when
> trying to import them to python3 in images built with
> python3-core installed.
>
> This change creates the python3 packagegroup, containing
> the most usual python3 packages to be installed for images
> featuring complete python functionality by using the
> FEATURES_PACKAGES variable to define python3 as a new feature
> and then adding it to the image to build.
>
> [YOCTO #10667]
>
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>


Out of curiosity, why not just install =E2=80=98python3-modules=E2=80=99?
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c0b321aeeacf90556d1dc81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 15, 2017 at 2:05 PM, Jose Lamego <span dir=3D"=
ltr">&lt;<a href=3D"mailto:jose.a.lamego@linux.intel.com" target=3D"_blank"=
>jose.a.lamego@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Many of =
the most usual python3 modules are missing when<br>
trying to import them to python3 in images built with<br>
python3-core installed.<br>
<br>
This change creates the python3 packagegroup, containing<br>
the most usual python3 packages to be installed for images<br>
featuring complete python functionality by using the<br>
FEATURES_PACKAGES variable to define python3 as a new feature<br>
and then adding it to the image to build.<br>
<br>
[YOCTO #10667]<br>
<br>
Signed-off-by: Jose Lamego &lt;<a href=3D"mailto:jose.a.lamego@linux.intel.=
com">jose.a.lamego@linux.intel.com</a><wbr>&gt;</blockquote><div><br></div>=
<div>Out of curiosity, why not just install =E2=80=98python3-modules=E2=80=
=99?=C2=A0</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--94eb2c0b321aeeacf90556d1dc81--

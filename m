Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id A3BAE77E6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 10:36:15 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id v27so4775750qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LLRxhYN1FuXcZVs3qOBMmFGTO0ZcB3Zx8/H25tXe1uk=;
	b=hMSm9bIL8K1xFoaM/Dg14ClIwiAhOEkLL8SgOrdoDooXSZGRNnBeqUyC80+1Jdf0UY
	HVDu0/JMXVKyGL2Rijuc/IAJTmm4HCMBETXLGu+ABszwyLguG+C06sFfEXkombfyNe/K
	aGItjkKIGibnux2daV2lGMnMNbQNW08WouyU8yQ0NDgWc9io3msyF+uHc4yqzjd0Y6vM
	0R4NBi/fF2qcGnH6zGTWNovgYW8Ls5ij6jHikM+Ge2dKM5eQ25+AmofzewvCwB9K8+FT
	XW2WIk1enugZhv1qN+2qV/nOCK7El0kZKNMGuw0QO7jbUvZIBCIZOswxzberx4FpcYnR
	deXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LLRxhYN1FuXcZVs3qOBMmFGTO0ZcB3Zx8/H25tXe1uk=;
	b=Y1/lvvVKExjKG5rTp/HeCQjFngiFPGL2Wczi7enoCqIhl/UuD1MVgV750jc4I7ZtaQ
	rqbICqwrWlZ6UH1sZ7cXsmEP2krs8GIsxNujJnqBss0aSA5nd81vz0q+H4yvfyfG38XA
	IanBNI3/q0bKwWL9R2z5VQ7GSB4/fw46WJR5/PFuAEVLP0uGqbQP2Jw+d0Zq3TjXKC2O
	XhdI+LJaI22QWVoxS0pa7DV4Smzgo2S6lVi8fJ7Krpzoh8PD9fq16KJ4U19IViIUUtF2
	im8QO3Q4kAhoo6VghFWS15UtCsGcDYi0FSHYB4za1PL3DWTk7V3HyoZTu7AUo0aFd4n7
	gaAA==
X-Gm-Message-State: AODbwcD0YOXq+4hiklSjzt7u3kAaq7/gl/s4y1EkSRFlDTB1oy6UG4d4
	j4luJ4dlcrWzuJ0YZvUVrO/kPqoHHPYB
X-Received: by 10.200.43.99 with SMTP id 32mr1471052qtv.6.1495794976445; Fri,
	26 May 2017 03:36:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 26 May 2017 03:35:56 -0700 (PDT)
In-Reply-To: <20170525144732.15447-1-raj.khem@gmail.com>
References: <20170525144732.15447-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 May 2017 11:35:56 +0100
Message-ID: <CAJTo0Lbhw_Rmds0A636rBwxgy1Gzj7=9AWk2ks+7T1-5Jou8bQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] meta-perl: Make glibc-gconv deps apply for glibc based systems alone
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
X-List-Received-Date: Fri, 26 May 2017 10:36:16 -0000
Content-Type: multipart/alternative; boundary="001a1146fb463a680e05506ae8bf"

--001a1146fb463a680e05506ae8bf
Content-Type: text/plain; charset="UTF-8"

On 25 May 2017 at 15:47, Khem Raj <raj.khem@gmail.com> wrote:

> musl does not provide separate gconv packages
>

Wrong list :)

Ross

--001a1146fb463a680e05506ae8bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2017 at 15:47, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":33s" class=3D"a3s aXjCH m1=
5c4014948d747a6">musl does not provide separate gconv packages<br></div></b=
lockquote></div><br>Wrong list :)</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1146fb463a680e05506ae8bf--

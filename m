Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 89CBA775ED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 17:33:28 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id y76so15565222qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 09:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N10/dPAWhAYPnMy0ykgdNOT9WmnxpvgkPDvYo6EAtNw=;
	b=proTeg2YYF/4EZtjaC9zdAUndl6lKr4o+wa+64kY4FqltoXMrUBbauobTa8UfuVryJ
	Kw6PsXYLeR8hHZug08NGqwWx2xN/ZAd80vYi5HoLx2w1LqykY7T4cFOTDgaCRAVDoh4Q
	bSgJ4iKjcVJWSaKKFEwS5tBj5ZNYks+TJ+pOIXsYCKYrOzXVwlnWseNBAf3uHIaQ91f1
	X98XdXkhYaEtwrFESYeaCm1NGbwHAtFC7Ov06Ea/X4FRYga1DYTkr7NSYS1kiRxLqtMx
	HHyFCD5awgTzPGQD1Kh4bCQ47h8784MvyLbW1TsQ0SgiWkZn0p85fdBRpeBiWgkPZZyQ
	7Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N10/dPAWhAYPnMy0ykgdNOT9WmnxpvgkPDvYo6EAtNw=;
	b=IgoxFuvMD3Da+hWVaMY0ES/aUPrMbF3H/8SUMvYBF/6Ky3QfmnGtsxKM7QuVJLgeq7
	5r7ctE1gzqeLIO6+Oc8vAz4Iz86hiyQL1wS2CJStEep+KnIW8VodxrYvju3vUAg0gCx2
	6nirxXV73D6tF3bIEJ9tfFXMjLSSdd2U2Xu2kIOQu204WIMKqxKt/efY77WgFawcitIT
	6sQ+1ggzVNqjB5nazRfxE7uTA1FmqysJ2RQBLkt6wE3j5SCzoyw8mBSKT0xXRczYTIQr
	fl3LrqFtU052c22J/pSM41T2mG6RNmYFn7Yp2SYGM6ow51042DiwdhbAv9iM8YJIQw3p
	adwQ==
X-Gm-Message-State: AMke39mhOrMy+O4aRwFPEgYxN95NREK+MFFLYYQswyGGziV9T314iJyh9SW/Rbk/gi4OA7I5fPz8YlY4yeRQ6maR
X-Received: by 10.237.39.158 with SMTP id a30mr1920821qtd.65.1488908009272;
	Tue, 07 Mar 2017 09:33:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 09:33:08 -0800 (PST)
In-Reply-To: <CAAtXAHeMJ-78DJRvOojxCLTmkg32piWVikCeUdGYgaVTHO-jAw@mail.gmail.com>
References: <1488644775-25405-1-git-send-email-moritz.fischer@ettus.com>
	<CAJTo0LbZ5Ld2QaSic-6cUJ-CwABC9A6F0Gm6y=N1RbECsL2SPQ@mail.gmail.com>
	<CAAtXAHeMJ-78DJRvOojxCLTmkg32piWVikCeUdGYgaVTHO-jAw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 17:33:08 +0000
Message-ID: <CAJTo0LbgPMMjF-puXKrpcfYz3zuPG9Ab8H2Wer_vRR_SvSg38g@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC/PATCH] boost: Fix issue with python-numpy
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
X-List-Received-Date: Tue, 07 Mar 2017 17:33:29 -0000
Content-Type: multipart/alternative; boundary=f403045f26a4ff296c054a276815

--f403045f26a4ff296c054a276815
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 19:58, Moritz Fischer <moritz.fischer@ettus.com> wrote:

> > Making another option would definitely be desirable.
>
> So would you apply the patch to remove it if not PACKAGECONFIG[numpy]?
>

Depends on how the patch is implemented.  You might need to patch the build
configuration to expose an option.

Ross

--f403045f26a4ff296c054a276815
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 19:58, Moritz Fischer <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:moritz.fischer@ettus.com" target=3D"_blank">moritz.fischer@ettus.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&g=
t; Making another option would definitely be desirable.<br>
<br>
</span>So would you apply the patch to remove it if not PACKAGECONFIG[numpy=
]?<br></blockquote></div><br>Depends on how the patch is implemented.=C2=A0=
 You might need to patch the build configuration to expose an option.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--f403045f26a4ff296c054a276815--

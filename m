Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.2317.1587978563029369420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 02:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@stusta.de header.s=default header.b=H3tVVth8;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=o7af=6l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 499f9B4qRlz3r;
	Mon, 27 Apr 2020 11:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1587978559;
	bh=D3WJJos0EK7aMShn214u4FAoXsHBHOaYwX1kbEllvVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3tVVth8tDbbEMBMRcsoGdStq1RA8cT2jajy/S0pLfQTeyGpnsLxGN0YKWfSY7Q02
	 dcBGP6NAS/mlxQ1h48BRdOpFfbq3p35miscFs5cdruqKfjrpkt4ouAn3sd1yNLaNbU
	 +fmE2+/Hv0FPAHAOQQ8cDBrfcbNczaH5LMA2KZBrgKeeo1nqqU8wDx812GX/DItwnl
	 Oby7fMoJOWMnuGBS7mdzSvRk5U3hQ9MWaYaUnq7F64bANHdxT/UhgR7TqgESakgYqv
	 +Of/pIwtYvJ4vJKespmbPn0sPBCM5AltnsNa95Vf4pl8F/hVpQc/xOGxRVFXTIN2T8
	 jCfPre3HBXm0HuQ+iFt2zjUWRhkZg1jQ8PSbpYNNMxbZpjr6QgSPf8PTEbDbOlYPSO
	 gYfH/GbuivvKLmVA8N4nJtDbV6qtYXq4hmrS29i3+6s5N7LfzxBnkBR/HZDr+7Y758
	 1HpsFDVl6xnWCWxmXwuEMuf4TEWvmZqFGgccet9myS8W7Fh0DHillxYGE1jkQA5EHv
	 zjBBgsNxgFgJxbROnycBNmWeEFU54ZTTZmWwgHcoZ/gTMu7RKaYNli3s1IctSgQK4i
	 B+0QsF13WnTb7nDX9ZFWCo2WIrTuAe8O7elq8vdr0juU5GiHiCi5QK6Gm/02UttgfY
	 5Dd5bPFKQkdYCFJtL31htLc0=
Date: Mon, 27 Apr 2020 12:09:11 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
Message-ID: <20200427090911.GA19242@localhost>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
 <160972188EAFC253.2907@lists.openembedded.org>
 <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Apr 26, 2020 at 10:07:30PM +0100, Richard Purdie wrote:
> On Sun, 2020-04-26 at 22:40 +0200, Alexander Kanavin wrote:
>...
> > What is particularly odd is that the centos/debian failures are non-
> > deterministic: in some cases rpm-native fails to build due to missing
> > omp.h, in other cases it builds, but the resulting binaries segfault.
> >...
> > Ubuntu always segfaults, but maybe it's just coincidental.
>...
> We are aiming to support these using buildtools tarball which should
> already be active on centos7/debian8 (but not ubuntu1604) so I'm a
> little worried this may point to a problem with the buildtools tarball
> :(
>...

I don't see omp.h installed anywhere by the buildtools-extended tarball.
This would explain the build failures.

gcc 6 updated OpenMP support from OpenMP 4.0 to OpenMP 4.5.
This might be a plausible explanation for segfaults on systems
with older libgomp.

> Cheers,
> 
> Richard

cu
Adrian

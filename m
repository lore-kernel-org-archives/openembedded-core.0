Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id C1BA3719CF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 14:48:52 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id o68so20597891qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dxZVap9LT83nxeShxyfJI+tFHXuptku9y22jgRRKMk8=;
	b=LYHPtJypIkOUneiNE/JOX/FcLQo6Vv6fc5Rh7NzDM6YCHEqxp+pumllPkHQ9kcfOv9
	8ig7IAWQZFm29gRJHl9A5siSI9uG4iFCNUP8Ewn+2IZ9nraAmB2oEyPVFBCE2gVviR2J
	NfB5o9IGG7ThNu2lytPZCLUIsNprJweM/8JbBcGgeKp0OO7aHwPwE+LkA2X/k/+8u239
	2kJ5WdWIinEwl/vlzbgdJQB3Qukk2DbnZvrHjWTAiXWk0Y3T5JxwAahQ7qqJxR5EBBFY
	1NF3nfPlpU4RD3N9XNqmJxHE9JKW9vOErmiurwYSc3QffXy6jaze6JZKDnkEczSWzlSw
	j8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dxZVap9LT83nxeShxyfJI+tFHXuptku9y22jgRRKMk8=;
	b=S6xVbGXpsKl6FmpDyBgbVAESzTdKP+hT9LJ3QxfHfPHNZsOmmqfz882Cm1OVHS93Cj
	WaGF6/P+D3z0h6Nn8kOVfiV9xSX4UUH3YrDiIve14QUGZ0arNRrckws7o5rH9e4cVX2G
	yg5y9+y6dlnFIhlq/2Qutt3gKkgBW7TVsFrT6FVJnReB/qbHON+7q4tr1Q+QyWxAN2G0
	WV6xjKud5eWuUILozNDFJOnsrsS/qOmA+D2gx7iIQbEHmmD1MbHkg7tZDUExwU3ZIZen
	RFTooWoDUfcDb+UPo7Mgn/RJlM01XjQIcGjky+9gHv8PAREDf8OQTtoZgjCDhUTssfyU
	PPDw==
X-Gm-Message-State: ABUngvfyJxGU9TRgBfwfyQhP1Mt8icC2v+pmkBMdJdJmfwfsD3ndciYTOwxOhGrpcqMbYpKC9L4p7dCPkqEG8gc9
X-Received: by 10.55.215.6 with SMTP id m6mr3292016qki.244.1478098134458; Wed,
	02 Nov 2016 07:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 07:48:34 -0700 (PDT)
In-Reply-To: <20161102120724.30063-1-marex@denx.de>
References: <20161102120724.30063-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 14:48:34 +0000
Message-ID: <CAJTo0LaoMkEMaB8LC=w_DUFcZE4AVr4ARZMWTVZNGKJu=X=dAQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 02 Nov 2016 14:48:54 -0000
Content-Type: multipart/alternative; boundary=001a1149dcbc3f95860540528a7c

--001a1149dcbc3f95860540528a7c
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 12:07, Marek Vasut <marex@denx.de> wrote:

> Drop the incorrect EXTRA_OEMAKE and just use the one
> from u-boot-common*.inc . Moreover, since U-Boot buildsystem
> already strips the tools, add INSANE_SKIP = "already-stripped" .
>

But u-boot-common doesn't set EXTRA_OEMAKE...

Ross

--001a1149dcbc3f95860540528a7c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 12:07, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":2pa" class=3D"a3s aXjCH m1582=
4f04e95cf58f">Drop the incorrect EXTRA_OEMAKE and just use the one<br>
from <span class=3D"il">u</span>-<span class=3D"il">boot</span>-common*.inc=
 . Moreover, since <span class=3D"il">U</span>-<span class=3D"il">Boot</spa=
n> buildsystem<br>
already strips the tools, add INSANE_SKIP =3D &quot;already-stripped&quot; =
.</div></blockquote></div><br>But u-boot-common doesn&#39;t set EXTRA_OEMAK=
E...</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1149dcbc3f95860540528a7c--

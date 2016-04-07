Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id F06BF6FF93
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 10:24:28 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id gy3so98347906igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ctr7Vg1r83vNZKhU6Y9eUrqb0+5/ngIX49SdyrDR8sI=;
	b=YaE7VsVwYo5DymmMAopbzSITLFDCevKiEw/qgL2FuuTqwpamNaxJXLtwWvgEJl2WX/
	6jh7SEJ8dDIgRil6rc0o412bCd20dhDJaHQrpD+482j3K9OMkRjqw900Q47t7WyPJWlG
	8GnDc9gBnWsw0pFrMiO9XUHfLzUMSSjtcH5Z9TMIU1g4kY9KJRsjDkE7zm9ObD309W9V
	aCF9aQy+R7IUIUpln6p+/5xbLtl9z87SnJdDsNC4ugaS1vvFeMU7pJ0Czpy6tUtdau45
	y3nWp4qGNHFbCkUO+aHTllH69bYvfDS6B6fYgiF1hM0FxStG9gQgTmzlDGP5frTBC+F6
	iKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ctr7Vg1r83vNZKhU6Y9eUrqb0+5/ngIX49SdyrDR8sI=;
	b=IMMps9UcKWkHZIOxAKT4uKI55v371dvlZ89HZ6FZAQPVGIhMgnrNezLsQc3BNitjPr
	RkAwif36cnN1IoRSFSTJItjv2OzNEaOX8KDu10l7QYrh9zrYATw2v7JB/qXhN87Lh76E
	5E9kPn/kRmy3dNa4FUE7NTxHdFsmrMWefxTs5JsGafiNqZ+POQNWyOITLcZN+j8X64B9
	A7DI2nJn+nm8AM8hGAYndd1yDIFGNYxfY0omay9Xrg+jJ/SaUfgo6J3JEJ/heHiwgRvP
	0a4v/TP97hQJXqlyT3rp9Jpu1c/0EMv8x1C13mnHKd3AgbybIzNvqH8Cvarh4YJQ4YOE
	oVPA==
X-Gm-Message-State: AD7BkJIXo/BzrAVt/5iZ5Cqa83nHoUyel9n6UbAkOz8Q+G4HcSoHFmVRmV5HN3zl5sgPmOkSuebrOpfNBMknBiNh
X-Received: by 10.50.78.8 with SMTP id x8mr2688075igw.78.1460024669090; Thu,
	07 Apr 2016 03:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 03:24:09 -0700 (PDT)
In-Reply-To: <ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
References: <cover.1460020929.git.Qi.Chen@windriver.com>
	<ca141106b28e9f213b0965de589507300ccbbca3.1460020929.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 11:24:09 +0100
Message-ID: <CAJTo0LZLevMcyDJhgGe9uADDW60PgBXHm+GD1kijm8F6BSnCRw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 07 Apr 2016 10:24:29 -0000
Content-Type: multipart/alternative; boundary=089e01183a4cc3ce91052fe27b21

--089e01183a4cc3ce91052fe27b21
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 10:22, Chen Qi <Qi.Chen@windriver.com> wrote:

>   configure: error: Large file support is required
>

Is it safe to ignore configure.ac telling you that large file support is
required?

Ross

--089e01183a4cc3ce91052fe27b21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2016 at 10:22, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":eqq" class=3D"a3s" s=
tyle=3D"overflow:hidden">=C2=A0 configure: error: Large file support is req=
uired<br></div></blockquote></div><br>Is it safe to ignore <a href=3D"http:=
//configure.ac">configure.ac</a> telling you that large file support is req=
uired?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--089e01183a4cc3ce91052fe27b21--

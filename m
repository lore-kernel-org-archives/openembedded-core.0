Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC9271A15
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:07:17 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n204so26821188qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 16:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZPEC7YG3CTNDsmjHjI72N+0jfBUIiYsnWViu2uICT4s=;
	b=ukUv9hpj0pIC0pR8thqLq8eAa6dAp/ZWaGnr49+Icp1XPf24i6fxRf7Hbi02bxenYb
	rcFlbdrzZdxMs9JzMFhIIK0e87H4PmXu0yQ8npMVlK0Z4O9LMu4N/kvYxHDOohPMTR1I
	HM/XM7SqBg58faAZMuIRNrbRh+OPmwVcbayAb8WZfynyG7yA/KXWMx2b8j6yHJZR6+bc
	1XtB8D1LuooNE9PFdu5KZUeowqbuu03777vS/cfnZVjhsDauW/BGa4cy8k/OvKXHehp0
	7AVbpbipQf0CdQn7mPPF0kgEAc3Cx9bc4nrl9W9AOVB1IxlWmy05NfVdcO3erKptIwiG
	rgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZPEC7YG3CTNDsmjHjI72N+0jfBUIiYsnWViu2uICT4s=;
	b=CoFp6bXrVhB2o02DzD+l3Sqoli7eDLlN5gzJspKZxPuppg7VKR3MOw8wjrTFE+Ml0E
	6shPGjs6v1LxZiVCiS+ihv+TcsHCpepgrw/sJo5W+4ihHSBWR+me5nRGXG4sdlKN3TnK
	pGUWyi+afHM9dHVew1HsSVyEuHbGPGbfD8Ek9ARfU2o4vHFYmwy52H4sugCqX+IECjRZ
	kHEcsiDVJcK/b7mlkdz/ifhJtSaeissf6UI5VnFcllxlygiBr/DXPwEMQe2mKE4dxeyN
	9E98CArGWvtdBAsOwQbvxviUH0HAKBPfHhGFDVcYSVmMk09hnqkSDjwTeNi8JioDfky3
	q1ig==
X-Gm-Message-State: ABUngvcE0kJrVy9kX/dA9xkhPJTkJXJomMrLjYL6ZmWlFxlBks3ksPKpQKxQzwIHw1uT/QKRllLaW2OyYmRRH3sF
X-Received: by 10.55.130.7 with SMTP id e7mr5849199qkd.121.1478128039171; Wed,
	02 Nov 2016 16:07:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 16:06:58 -0700 (PDT)
In-Reply-To: <ac4a3766-6dee-2e89-141f-1eab2e4b9fa6@denx.de>
References: <20161102120724.30063-1-marex@denx.de>
	<CAJTo0LaoMkEMaB8LC=w_DUFcZE4AVr4ARZMWTVZNGKJu=X=dAQ@mail.gmail.com>
	<ac4a3766-6dee-2e89-141f-1eab2e4b9fa6@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 23:06:58 +0000
Message-ID: <CAJTo0LaXYexn4cwQasj2gWvUpdO3uQFE2b81-soEnFoeM5ZdgQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 23:07:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c074bdab53293054059807b

--94eb2c074bdab53293054059807b
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 19:40, Marek Vasut <marex@denx.de> wrote:

> > But u-boot-common doesn't set EXTRA_OEMAKE...
>
> Should be u-boot.inc , sorry.
>

Yes, but u-book-mkimage doesn't include that file. :)

Ross

--94eb2c074bdab53293054059807b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 19:40, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; But u-boot-common d=
oesn&#39;t set EXTRA_OEMAKE...<br>
<br>
</span>Should be u-boot.inc , sorry.<br></blockquote><div><br></div><div>Ye=
s, but u-book-mkimage doesn&#39;t include that file. :)</div><div><br></div=
><div>Ross=C2=A0</div></div><br></div></div>

--94eb2c074bdab53293054059807b--

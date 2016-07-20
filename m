Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 054B560722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 11:56:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id b62so45115958iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 04:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nSh6iGXlogyMbr6EGHowZ8DXspCF3h8LN9lMKR2wNDA=;
	b=z7Nz+UR5uZnI43dx+aHe90oSJjVx7oTsg8d7HtCXUFs1h0+wNry1DFhLgLKXEq3GjE
	H3D8hiihl7aniJ7Cx+Ckw/do/E+FUmg9KlR5z/XQLrc3pD++e5MLuvBs5lPQYFXbulkl
	EGPMyv3MFovYQ9WsqdgXQ8zzfPtCnlyBwu9yCxOe4PAOtxK8cY47M4gxRfR2uo7yzB7f
	re9gzF4eepEpoBge7m2JTfgQvsH0LaxqeX80syWFKq5j1jFRkF4TX829GcWge0UIH0pV
	rjeSCzPFy+lRi0yCARgHmCFtPDr1gt/6YpjqmcBAd9c8OfXYkynS49kCQKHscIHZSB4F
	1rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nSh6iGXlogyMbr6EGHowZ8DXspCF3h8LN9lMKR2wNDA=;
	b=QVwQV+gqBJorZlk2pBz5TcCqYvXJLK78LoRp0WiVtMxnLb6dxA0Wn9ATwWaSimcxFS
	DDI1m1jAyZHev/FOe8GiZJibOVyy7ri/8AFfyOIVaUpvVFBOHgP0UPEGQuV+A/pMyLIL
	elowW7V3+5yLsOBcOIMCcSJP6/p1lsIvd/3MU+9CTkwapgKbNkH2GR10/l8LyAXGqqoR
	owaAezJs2bTUdSH7IuQpDjfwcdooNUDvKvqTbr/6OjmDEEf4jowfXodhKLsg8Io3gbSe
	HDg6+8bXgxZCJzYQvKTgwYeO1b2OVp9eNEQx0qZ4kQhicj8Nw3+18QHhx6IaBp4tKtn/
	iHVA==
X-Gm-Message-State: ALyK8tKrOZNg3AwUz8EkyFS6UqUeMseOWz3TVsqlWNB3EyUhDzg9vTuplQiihtDK8JyGMWWmm+1w5/C4E6XkLpaW
X-Received: by 10.107.135.142 with SMTP id r14mr48658499ioi.133.1469015794117; 
	Wed, 20 Jul 2016 04:56:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 20 Jul 2016 04:56:14 -0700 (PDT)
In-Reply-To: <1468930727-2937-1-git-send-email-matt@madison.systems>
References: <1468930727-2937-1-git-send-email-matt@madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jul 2016 12:56:14 +0100
Message-ID: <CAJTo0LbN7s2Au_77p=rU=oMKrv9JC3u5EnijyPf572jxyiA3Qg@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: fix Python 3 error
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
X-List-Received-Date: Wed, 20 Jul 2016 11:56:34 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc940ddd05380fe4ea

--001a113eccbc940ddd05380fe4ea
Content-Type: text/plain; charset=UTF-8

On 19 July 2016 at 13:18, Matt Madison <matt@madison.systems> wrote:

> -        for dep in rdepends.keys():
> +        for dep in [k for k in rdepends.keys()]:
>

I'll admit to being fairly new to Python 3 idioms, but wouldn't
list(rdepends.keys()) be neater?

Ross

--001a113eccbc940ddd05380fe4ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2016 at 13:18, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3sv" class=3D"a3s=
 aXjCH m1560319094e04058">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in rdepends.=
keys():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in [k for k in rdepends.keys()]:<br></=
div></blockquote></div><br>I&#39;ll admit to being fairly new to Python 3 i=
dioms, but wouldn&#39;t list(rdepends.keys()) be neater?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbc940ddd05380fe4ea--

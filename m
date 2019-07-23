Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id D182B7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 09:04:03 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o9so80291082iom.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L86xn+CBZLyPzn9Zuhoqtvtaoe1KM/rSvY8y0f1rlgI=;
	b=KJC316DtW0EUcKa1X6YXLvjRjYjDf55eYcK+W/KYr8pdzOxY8zt7ds8uSSf9SzXrgI
	fKUiEZY+AXKU5hwfP/3BN146GkrX+tKpj6J91GzDc8+hY69D1T9qiYFgGHBgKeLh5I5X
	kD65aS/7lpZFRI1kQicYFpSIUTCg0CvB1l2+obV9DfllPINK+9/cwyXutXDVZlHUadT2
	Xjpysj3o/VrI9HNnrTjfy1Ezajr9v4sP1FAtrsGm5iZCaw1aFyk874BimDqgshFufsdl
	m26AlrFCOvmVwstgaxmXve2viwl/CpLky7l9LbjXnR1VAnYM5vun2r21nZK6h1nx73W7
	kjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L86xn+CBZLyPzn9Zuhoqtvtaoe1KM/rSvY8y0f1rlgI=;
	b=MNZh17Hp/guSj5t5lVpI55B2DVsZHfrVhr8GbV0vjYKjVVj7As1Cy+LvaR0MSVCtuy
	AhDoLue8NwqyeoUjUw3LEWOAnpjX3eDuDkQ0E6dGGrD0a1GlC9SSx+GurCE7AI7yXjNz
	vpEsxdaaWimyTSwOLwufy3uUn0CuRxjIKmmig162ouizOhpxStaWJJvFS6HQwjbXbyTz
	XQ2CmiIwo4fbCwPtsi0DcebJKym7VB5J3kS7ZYB2fMt40PIga7LaL5TfyFHVygcZ76rq
	rNf1sp4z/Qo+ns+uYPDUKw5kglpyjswFBOA/RbmMvB8B9GGlh8aZuV/eo+fNqqsfiOdc
	+LZQ==
X-Gm-Message-State: APjAAAXaewpwAZrRe3T6D6CxFqXtjTsx7q1moH8EDHDsizhMKk8BJr+P
	ukHykP7qYf7uz0tlCKnit0RM585ijG715+VpfwGWtUvt
X-Google-Smtp-Source: APXvYqz6034ZfKrjDGPNTgZU1mugbS6SbjegHSxGCosGCRlGxmXMtDl9Jn+x+IPlSds9WBmnI0ZZvvmm/NBnBa5vxFA=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr20388434ioh.261.1563872644643;
	Tue, 23 Jul 2019 02:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
	<20190723054328.GA27144@localhost>
	<CAJTo0LZDXcLhYqvgYmY4-hX4Uc+ZJniDhqWkrjtaYu_k58Fr8w@mail.gmail.com>
	<20190723083512.GC27144@localhost>
In-Reply-To: <20190723083512.GC27144@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2019 10:03:52 +0100
Message-ID: <CAJTo0LZP1GoYtuNGhYiuRGn+qjxT_roJWQsagF=cu4bxGe1PHA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 09:04:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2019 at 09:35, Adrian Bunk <bunk@stusta.de> wrote:
> In meta-openembedded the only other recipe using scons is
> PNBLACKLIST[mongodb] = "Since bbclass scons convert to python3, build mongodb failed"
>
> So 2/2 of the scons-using recipes in meta-openembedded so not work with
> the Python 3 version right now, and there might be more in other layers.

Sounds like the class needs to have a variable to control whether Py2
or Py3 is used?

Ross


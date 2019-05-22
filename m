Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4107E399
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 15:40:12 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c15so1781393qkl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iv/JavybpEsmeRVltNpkEBWORuq1wN2VrWKekl03dXQ=;
	b=XU6XfenOBFD1dCgRI2IP+6SFmyzsQCB/BU9xbHhYt7C2Fk7uFLrCfBG2ErEQvXraVz
	WhMynu8QYPxl16xzzGRnmlanAmkYCgEt61Az6xnQp/S7g8PeT0dAZHOsnvsEDs9LjQp7
	YHilDHDu82AnJmP8qhmAOguY7UyLV0LF+0/cWS/Zkf31w9OdqPT8d8E58asScoEX/IOq
	n6XIw/cEE4kTsEo4uYluG1Qr5a/IgjxfLUf+VA/nIz53K6lFSGgCWhWRZZUDVlVJug8j
	Hz2mt30hpMIZ/hYr71J8U+asKX/k3W25R4SRh41Q8s4ljO6dFysvcLhNGIxyq2Jgru6e
	C2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iv/JavybpEsmeRVltNpkEBWORuq1wN2VrWKekl03dXQ=;
	b=GaTN0je6ajEBNt+CWtgMoFpqTqifZ9bXreDqu8zOTaM9E7o+Q8vTa9npweKh7YAaib
	g5dYMEyx26A6QxSZm7nMm7MUOAMlsAszETTKr5VngaBKIQXapUpB73vBbJBwV8XiOvdf
	Pt3RdMiMipVw+I926Elpo4HIhTUB9dT9C/Ys82oP3clETDuqogYG3w1NUn2kr03jX+gL
	mqVQEM5KihO8DUGK7PL76OwASBQwshkfjzkgpcbT6J168uIv5rG8Dc+Fqu13PUp9vEyt
	8dfsa9FN2dSaDD6KHCzO5goKk/09i6m+wumO0be2hKdnLXRS4DT+afryHwl9i2MOItck
	39/A==
X-Gm-Message-State: APjAAAUeDSes+UOJYdN1R3BPC+vhILBbuqHd4NyxYcIAXm8tULqpRr/a
	xqhssL6RLkzYswTT9bFDeIZ8Fqpj2SAgbQRPuIk=
X-Google-Smtp-Source: APXvYqyq7leuc+6Roui+LoRR3dAZi+WfNfjsdBRmZS4UV4KSueLTB82LSn6XLAQZNPIohKs8H4MkIIeax4dMKNUqNvI=
X-Received: by 2002:a37:b287:: with SMTP id b129mr61024438qkf.20.1558539612822;
	Wed, 22 May 2019 08:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<f3fecc483c5b64b3f2743cee80ebad3c2f798548.camel@linuxfoundation.org>
In-Reply-To: <f3fecc483c5b64b3f2743cee80ebad3c2f798548.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 08:39:46 -0700
Message-ID: <CAMKF1sr1eyAczgAd7nPccDeZqBhpDZuGhd9v4kg3_vemYfmXeQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] musl-obstack: Add recipe
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
X-List-Received-Date: Wed, 22 May 2019 15:40:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 4:10 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-05-21 at 18:32 -0700, Khem Raj wrote:
> > obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
> > and other packages outside OE-Core, this recipe helps provide this
> > functionality standalone on musl systems, and helps in getting full
> > versions of dependent packages
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta/recipes-core/musl/musl-obstack.bb
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/623
>

this was due to missing pkgconfig inherit I believe.  I have sent a v2 now see

https://patchwork.openembedded.org/patch/161515/

> Cheers,
>
> Richard
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id EAD7176EA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:20:29 +0000 (UTC)
Received: by iod35 with SMTP id 35so39980729iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rBQNW90MGIMtVOPstyJ3uOb/26hFa9e1u2seracK7gE=;
	b=BMuH6iG+yWj1vYB0DqemgLMpI5znhSVc+viEvZIPsLWbqh9rlj6GkHrqefViNKYXxI
	Fs8icb6ogFuyTyynUY7HIiGgy4ImjSksXRyImTYVbMuIBTGnslwo9hWXHQ25u//nvnYy
	lJW+yKPXu48pB5uRMc2mKDO9nvGdH12b3O45xqIbdAh3Kwt/zeBsBpqnrCTuuMbLTmKn
	mQ9tOWV2b0WdIwpGu50g2xXofm0Xy7q89nAiSIocgaPx1XjAAXr3gn7nFJunFT3A1j6X
	oo0XwJ+3JYQEv3TrW/h3M/3yPNBodSEyCjYDHyeJvvJg38jphfeTlq1BBLNb+FyzoRvh
	imZA==
X-Received: by 10.107.35.195 with SMTP id j186mr24155465ioj.49.1441048829444; 
	Mon, 31 Aug 2015 12:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Mon, 31 Aug 2015 12:20:00 -0700 (PDT)
In-Reply-To: <55E4940B.5050105@windriver.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 12:20:00 -0700
Message-ID: <CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 19:20:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> The way the recipe 'LICENSE =' field was defined, AFAIK, was that it was the
> license of the source used to construct the binaries.
>
> So if the autoconf was GPLv3, but the package and it's sources are GPLv2+, it
> would be listed as GPLv2+.
>
> Making this assumption allows us to be confident that the general license of
> recipe matches the binaries constructed by the recipe, allowing LICENSE-${PN} =
> ${LICENSE} in the general case.
>

it seems in your view the build system or generator files are
excluded. Which we can not say untill and until the generator files
say that explicitly like the autoconf exception.  In my understanding
the build scripts and files also form the part of compilatiion
process.

> This does certainly put in an interesting situation though if there is an
> obscure license where the binaries and sources are effectively under different
> restrictions.  (Perhaps if a build environment contained a license that required
> an advertising clause, but the produced binaries did not include it.  The
> obligation to advertise or not could be up for some debate by a lawyer, even
> though the source code may need to be redistributed.)

We may not treat build system differently than other sources of component.

>
> Do you know of any cases where this may be true or where end users may have
> concerns that a license is not properly represented?

proprietary components based on some external build systems may be


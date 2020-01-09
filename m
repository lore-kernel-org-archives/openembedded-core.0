Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E15877FEA8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 01:23:36 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z76so4586332qka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 17:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=23pLbkiyriP2R96eFjSuWprGGgMsnX+VMJVlGadUwWM=;
	b=m6CC8gjX6JCb1a4nm16rhfRkO89sbTovMLk7gJnUw1QYEaMxs1WJe8p+RDXve1Uuze
	ZNTwaE+c1xwK/LBD562A0HSbZe23tYR+LzXDT52c8ARygYU+opeePCWFjf3pHsMYFBz/
	8Bs8H3hZ8YePAKrz64Uq9NFfQdAzOnKC2srixqJh+Dks7iz2YK5SkouQDfSZ+ENOLVj+
	rwRRfptTOpg+tOfszAuYyllrJa3++HGAPiOMy6DKsn/llzq9Pf270+vbSFnN1GZM6lDS
	RxSkITXLN4WwAg/gnZy39WEHeXovcOfSmSY1Iin9cEXScFrrX0lxhxlWH1TiT+sfWKVq
	QekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=23pLbkiyriP2R96eFjSuWprGGgMsnX+VMJVlGadUwWM=;
	b=ZzM/B7vZjW+zUc3RkjF3TwO+gNo0BFTfW0mR30/4zDZX6PCZjx5s5G2wK+hSbvY6RD
	gF4U72UL6M9s+wu6My2DjZDZ9f2mclV3v9VnooJs+hK/ZDzq2RIHHahq2lPldwOs3ZJH
	Q4N48NN6m25R6UR80fZGlQxTr6Mp43kLJCRs5aYx2ucc1L/6FZYCLblHRhd/qX13b+lV
	wPU9Ok6bxUGbGfJk/t4zLrekW7MSuOF9UsTwssXIqKhxv4vDDVVMI6tZaEjxXUcMrbhN
	qFL8Xt/llIiP9SvNsU/GDDQcrGcwUP8wO6FRQOF/mYdFbSsSTPMC/ArfftA5FrI38xP5
	moQw==
X-Gm-Message-State: APjAAAX9jJn3NpXhiIFOr9TE4VdvFElKypIiRQkmr8bw4Eh0sfrSEUc/
	NrBe2TQoKjAAtCME+zYUtR/lu+ov+ZT3+B9Vhc0=
X-Google-Smtp-Source: APXvYqxOayNtAAPGCXr3aOz3bRETZRkWPnIG6PuqicYOAHhKqQZ00ocklXT4iVGi1fzKGtiJIiVLIOvJjdVfMFShsiA=
X-Received: by 2002:a37:bf82:: with SMTP id p124mr7221483qkf.337.1578533017426;
	Wed, 08 Jan 2020 17:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
In-Reply-To: <492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 17:23:11 -0800
Message-ID: <CAMKF1sqk2LvX3iX3d2zfgAFyAGv-OG_zhEe3K7R_Aw3MV8yyig@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Thu, 09 Jan 2020 01:23:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 3:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > Drop backports, rebase other patches.
> >
> > One patch I wasn't able to rebase as upstream code changed too much:
> > 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> > Please determine if it is still needed, produce a new version,
> > and work with upstream to get it merged.
> >
> > 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> > is removed as the use case (allowing python 2 and 3 to coexist
> > in SDKs) is no longer relevant with Python 2.x reaching end of line
> > and upstream has refactored the code making a rebase difficult.
> > If needed, please re-add the patch to py2, rather than py3.
> >
> > Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> > recipes
> > and classes accordingly.
> >
> > The manifest for the 3.8.0 version is updated; particularly pkgutil
> > module is now packaged in -core (as other things in core need it);
> > this also necessitates allowing empty -pkgutil package to avoid
> > breakage across layers.
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442
>

few more
https://errors.yoctoproject.org/Errors/Details/305697/
https://errors.yoctoproject.org/Errors/Details/305694/


> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1C5B6D494
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 17:58:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y20so16089199qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 09:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=782a9Z9uTXwlUUCUD5XCHEWNLDQBqFY+WTnPR9RBNrE=;
	b=C3WExT2uCQibJFCNaYpwPyRi9/0RFmswxqCYL4cyr4BUBZ/RvT1oZtdGyKqPTyeB0Q
	regzgNid/vcvV3VwIEnx1AXsFiZuuOrVfQrTdYfafIp/AnaM7L0/hoHnEy9ltTrpuMzJ
	Y9gyLbK/od7MPXat3LwJm7o5C99H5RYVSD1XpMC8JAKxNYgGbk2rEbgRQbkxn+zPIW1m
	UHk0UQv9pgG0pNvbi8Mva+vqcrnu9NYVqX0iSQyXJd5CoDBz6ffKZpdMZEP8DX/3Pl/m
	XDLKIBWe0S6a/DRZbq8g6q+m3LPiTJOdyIiZL/I1yV0fqbS487rushqDDkWRiXjU5ooP
	9biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=782a9Z9uTXwlUUCUD5XCHEWNLDQBqFY+WTnPR9RBNrE=;
	b=Jj8xZdDhM2zyxR9aBAe3AjFAbLIygbYdtHznr9SPHzauecHT08QcUZtLjBsQcAi4Y/
	i9CanZXSxRW7EFu1VI4YqEJN7LmfWgWJXQQLwIz2708frrVjXXhQPvNRDR5BLO9xLYr5
	De/iFdFeFGAoFWELxzjejIe4Vb0uqqIQSwMkgJjh54NlTwUlhVjtj6QRAQMnnV3HIn6F
	lfS5gUOR4vgq+M7lYaDffDsTIVYEmM3hTAo9w0X6P/li93yq6s6LE6tTQcH1pKxLjSHy
	Tgtb+DoCnbbEV1KBGirGlSAohjj1oJlUb0+3XpJ2AzY++SSnaKKkrq9B9r5OkeG3z7ZQ
	/ZBg==
X-Gm-Message-State: AJcUukd1dCmZYbfOMGulPfl36PIFhtaYW+EW8KtPhK6TiZhVyVMQMFE8
	JaDpgOIaJHW4Sa/o8nrFJG99dGMMUcUcCMlDkxF+w/Kt
X-Google-Smtp-Source: ALg8bN6j5H1iK9ziHceCiIYMB+cATCNsTwBd2B8KWOF2wmxzwcHqBw0LL5b5oP1fzcUbAq8SSoMcHolYjF04lVPlAxQ=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr16954631qte.29.1547834330678; 
	Fri, 18 Jan 2019 09:58:50 -0800 (PST)
MIME-Version: 1.0
References: <1547782346-11763-1-git-send-email-chunrong.guo@nxp.com>
	<CAJTo0LYchfYRFiTJJ-f5BnyDosXsV8PYWRcfPYq4FuEMDF_+kQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYchfYRFiTJJ-f5BnyDosXsV8PYWRcfPYq4FuEMDF_+kQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jan 2019 09:58:24 -0800
Message-ID: <CAMKF1sq1xb6wpH+xvps6G8xi=deRBirtbwyV-cpOJyZDFtDC5A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: glibc support powerpc e5500 and e6500
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
X-List-Received-Date: Fri, 18 Jan 2019 17:58:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 18, 2019 at 2:51 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 18 Jan 2019 at 03:33, C.r. Guo <chunrong.guo@nxp.com> wrote:
> > +Upstream-Status: Pending
>
> I prefer not to carry large patches to glibc for a long time if
> possible.  Is this going upstream?
>

I concur with you Ross, this should go upstream but the patch is
pretty much contained for e5500/e6500
so impact wise, its not as worrisome

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


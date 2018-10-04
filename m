Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 550FA79A3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 22:57:25 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 84-v6so6850120qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fqNWTq5xpAnkOKoxEb2mmmgnLBulreY9k3Q+A7P9I+s=;
	b=WWr9HTU5rYzgTRHX5362Q3P2Aq4M9SU5RwgjIGGc+b9uBrzYkLNQWacGFqMCvPUc75
	Kjhk1qRS4if9XTTl/K1TkgK3XoBkZiiDOGxcYCWmDEN3FcMpSx4bIJLocN9jGCUA8pIT
	v9eCfK9mytGOt52OoqdOGq4ZBrYGFoyrBxzru5mypDXfPmErj9YFBPunHSyqxFFpW7MK
	gmAO1vLxIN8j6SOLPgmkafyzny4GWclKIXxr7iYk1H2CpgJxUGH69b7kVIfHfmkltz3i
	k2tnpynmfwDY3o7hZKvweOFm6rjcN9EkuNgB3Dm0ujPrk7nHrpOd6TTzpMFtJ97OzLEd
	A4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fqNWTq5xpAnkOKoxEb2mmmgnLBulreY9k3Q+A7P9I+s=;
	b=Rr800di8BwaKKYoh9MLx47RVPS0x3+WlV5t3EwdZeuOIa/dgpZRJVE31KnV+1OeRYl
	Oi8Dmby4+Eo6BWMBO4ZZFZugyd7xEIdSYoIPR5TDzIOqQZLLB6rLIrHdxZKgqqZl2jUA
	2IprzHaaSZpKzSMq0u2JPEkGGdoLAUkXxWu4o/jf/5B1QlMU7koerUhBrOQnp7FgWES8
	c0GTGFvnzZRFMKFh2XQBOTfeDcvtLz6jRDd0k4EOzfi1oDeKCb86b6LjX6fQkwjeHCRn
	oFYHXy/mBiHutT/HSB2AU6bNTufJMqMR+ZbSE+8qzVucl+9MNe3IT9TKgUMk6ATxyHFe
	0XVg==
X-Gm-Message-State: ABuFfohs8jplJoCT3E0JJkVz3ZT9gGlaHjVhyDn+Gl4aM3tuTHvaLo8W
	S8lm58WE8BVG0bqjw45BVsyFkSB3GKrcDra38Xw=
X-Google-Smtp-Source: ACcGV60MR8AcvSSyIkrWPrUbljFy8JGF9P0W9sEQS/ubknXlAfZWZUlMcz9bTo5TCsJgjhwyetIjt+slEiAkJOFdvBc=
X-Received: by 2002:a37:655:: with SMTP id 82-v6mr6911014qkg.223.1538693845948;
	Thu, 04 Oct 2018 15:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20181004132953.3568-1-angelo@sysam.it>
	<20181004132953.3568-4-angelo@sysam.it>
	<1ff9c0ececb825b383c89508e5033cf0f94e3f1b.camel@linuxfoundation.org>
In-Reply-To: <1ff9c0ececb825b383c89508e5033cf0f94e3f1b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2018 15:56:59 -0700
Message-ID: <CAMKF1souwoj9qvR1Pbad0r1u6G5UrUpSy20rWQiBixOzyNT-+Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, angelo@sysam.it
Subject: Re: [PATCH 3/4] conf/machine/include: add m68k architecture definitions
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
X-List-Received-Date: Thu, 04 Oct 2018 22:57:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 4, 2018 at 3:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2018-10-04 at 15:29 +0200, Angelo Dureghello wrote:
> > Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> > ---
> >  meta/conf/machine/include/m68k/README        | 9 +++++++++
> >  meta/conf/machine/include/m68k/arch-m68k.inc | 8 ++++++++
> >  2 files changed, 17 insertions(+)
> >  create mode 100644 meta/conf/machine/include/m68k/README
> >  create mode 100644 meta/conf/machine/include/m68k/arch-m68k.inc
>
> I'm going to queue these even though its late in the cycle. I removed
> the README from the patch though since I didn't think it was adding
> much value.

this series should be harmless so including it is ok I believe.

>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id EC4846C53C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 23:18:38 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a67-v6so6082770ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 15:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y0APzt2AwcmGjV7zUGJ1+tuGtz7Xmny1FfmSNT42puk=;
	b=mhG/j7MmIn4EenF2GyfkeKgZFlw30ATZJ3Q/DwVu78X/rZEMuFb6dYBVHcA4ciWuHn
	xuYyfo2XAXm2eapgfbsR/cmRk+w2mPmYF549HXWMaJo3N9IvZmrTLrOyKvH3ud1bnqn3
	PdAgehbdq2amqldKbaR7eM/eEy8o3Wtu1bGzYIX7mPspKPbWaDy4fqNwKQ+KpeV1xPEx
	JcdQIPsWaSqu8p5ieC1fDFNx0A4ah3kBXHvvnqLcoQ0VZOUjp5rU5gwTTsagYdyYmefN
	MxB5Y/Xbb67XYSzcEDcZjujbiMB8BcHE5aG0pcwrnFREMZMebDuIMeXwuG0Q6hOrjZnL
	69RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y0APzt2AwcmGjV7zUGJ1+tuGtz7Xmny1FfmSNT42puk=;
	b=HfnyrnSuFcdm9JMQ4SNzE6sAG9+Jk7uc8r9hu0HfbYuWFfCLqwMC1DH3QNTH9IUuvI
	c3pwoeN3q7kbg1QKqARpBKgWUHv9YFUZwy8AjTgQqEtcPEIT4+mBYjXwITDE1Bd4dp8G
	y3nHoi9ca19nJuU+t6nPTDTCMfMtUwdeydA113mLC8hRkxLoOTv5/eABBKw40ksiTaOo
	U+7oUE/+LTCJeNWu6Di7Q9Rq2ACQX9CUsMYnO2HlIMjNDVHJe9/XcPsiWOUTBYwZ64tg
	5eUsMgheAMx9JEx4aZToZwX8l9grRARq2VkyGBACc5DSatU13nQ+eWk3EgqlZpESXdTg
	vX5g==
X-Gm-Message-State: AA+aEWZzwiaSf4FX0Z4uANSJMlusLzYgnuQiOhtx6GwKl3QaSwGjRUuX
	aW0mmUN64vnPVf/9OpVRzIP+GYUMtyeEHS7X2KQ=
X-Google-Smtp-Source: AFSGD/UJsfMalwX0J+lReObCAToSU6dXrTVtENXRyITjUttopFEVLuvzssvS7GJw3P/dCBdGRY6KLRJxCoOdSC6G7G8=
X-Received: by 2002:a25:ad4a:: with SMTP id
	l10-v6mr17463143ybe.10.1543879119737; 
	Mon, 03 Dec 2018 15:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<20181201030142.9385-1-JPEWhacker@gmail.com>
	<c492b503-696b-9cad-0f69-9bd9129a6e14@gmail.com>
	<CAMKF1soDs+MZ3G5e2_MDvO2r+bPy+ofLn5UEEvUQ3jcteU=Y3A@mail.gmail.com>
	<CALbNGRT1=wNg2DrGYT8xq2gCVU4jgaF91Ex0ea56on7SfVvBFw@mail.gmail.com>
	<6db30983a3c00e0f09854ad7b1b1d51ff458f66c.camel@gmail.com>
In-Reply-To: <6db30983a3c00e0f09854ad7b1b1d51ff458f66c.camel@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 4 Dec 2018 00:18:25 +0100
Message-ID: <CALbNGRS4D+wWLB+83CZAOfWNHxqYom71y0XP4ve7TNnAxEOQsg@mail.gmail.com>
To: jpewhacker@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Mon, 03 Dec 2018 23:18:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 3, 2018 at 11:22 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> > Hmm - the a2jmidid shows what's going to happen: All packets shipping
> > older waf need workaround hacks. This should not be the way to go
> > because then we can remove waf.bbclass entirely.
>
> Yes, that might actually be the most "waf" answer to that problem...
> for better or worse waf is designed to be fully self contained, so
> having a "standard" class that builds it is somewhat problematic. Waf
> itself could change at any time and render the canned configuration
> useless. This doesn't really affect any of the projects using waf
> because they usually just download (or build) the latest when they
> start development and don't upgrade (or do so infrequently).
>
> The other option that I've though about (not that I really like it) is
> to have some sort of WAF_VERSION variable that waf.bbclass keys off of
> to detect what support is available. However, even this isn't fool
> proof because of add-in modules that you can choose to build into your
> project's version of waf... these can basically do whatever you want
> including adding new command line arguments, and adding or modifying
> existing behaviors. I'm not in favor of going down the road of making
> variables like WAF_HAS_GNU_DIRS_PLUGIN that each project has to
> configure.
>
> OTOH, as long as the projects we are building with waf currently use a
> new enough version (I know 1.7 works and 1.4 is broken), our current
> bbclass works and maybe that's "good enough" for now?
>
> I'm open to suggestions.
Have meta-qt5-extra with many recipes on old sources which potentially
fail for this change. Will build with your's and Khem's patch and fix
affected recipes. Think version magic is not necessary.

Andreas


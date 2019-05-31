Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id EBC4E7E1CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:27:32 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id j204so10877174ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WVZBmGViOrJ+sqpv3Kllu8oNKmIZSAJkWCJ5AWd+Sdo=;
	b=xW6m6Pqmr7f8VkfMCRKLBe1dUnEgQKvSQ2AJXcUHfSmeXWtnhLWucVqeO1nwBFihn/
	F6xU3mtaUMb6+Vy0+TUcJhxwtCQdtgriN38iDSAyBPlUtTyXpN8Xf5y+YqMQLrlKLPfJ
	wRgmsq4UcOzjM3FavICPLq37zQjt2yc87Aa6AhhyBG97aUD2wFcjg406znIFLRgYaPKX
	+4d3pKV4e8rTqaZq0qajRt+0PyH2nliKz8RYe3jVz+KoEDAeFukyJeuVhH5+8sMSk09K
	JL/njWpyfJdT2DaLEXhBdU5R04hJq9734ALoS0YJa8MlVAKPR14K4l7VxEKHtvm17V0B
	/WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WVZBmGViOrJ+sqpv3Kllu8oNKmIZSAJkWCJ5AWd+Sdo=;
	b=BSDyWu0HdjRiUN5VWMH3Pq4/SUjkx7aoIYOHxDZI9uRQlbepIw98JGjlmBOfPVVFs3
	3rS4LG989CalJOrQ9PoSm5uqIvMAdilTBI4O339G0ih02kThY5WoMg1cH6j3IIm6kH/r
	HkJM/orOhIZYBC0NT7rib1KOvon+2DChcqJm72q55LvT36fDHuKiRGTuheO6iiS8FZ6V
	C1yJgAz3FMFW8DbHoXVeHw+6itR+JyCwPmpG9gc4et7/aaeuV3hQ1/m118nSC9S7xDTN
	ZecTXDGvijLWeuH9lbJIIVCkfwh5uBUC+smhR2J04NF8vWRbh3Vs2KfDsbhccVB3Uatt
	SCjw==
X-Gm-Message-State: APjAAAU780etSVAhaI/b9lPHW3NvWcbkbbvRk4oKveQqcaPqW/9cgERx
	Vad7XQ+/Vaj3wMSPGymhfiSpBExRPaprltLdXeOY8w==
X-Google-Smtp-Source: APXvYqwNa0GfFkkyeNpwlZsiMRNeMcnz8AUVRq2JPQfWKFdIxV16fDV4pgE0k9Fu2jY3k6QaZnzD/w6Q0Ee8s3t2qww=
X-Received: by 2002:a24:64c5:: with SMTP id t188mr7728445itc.83.1559320053882; 
	Fri, 31 May 2019 09:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
	<20190531155612.75663-7-alex.kanavin@gmail.com>
	<b22d487548905237681a0d8ea2c18a17da1714c2.camel@linuxfoundation.org>
In-Reply-To: <b22d487548905237681a0d8ea2c18a17da1714c2.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2019 17:27:22 +0100
Message-ID: <CAJTo0LYzkjafKZ9uiY493gFSq_YgsRdMMQnUNN12cj0yKtOxJA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] mesa: switch over to official git
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
X-List-Received-Date: Fri, 31 May 2019 16:27:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2019 at 17:25, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2019-05-31 at 17:56 +0200, Alexander Kanavin wrote:
> > The tarballs for all versions prior to 18.x have been moved to
> > https://mesa.freedesktop.org/archive/older-versions/
> >
> > To avoid this practice causing fetching failures in the future,
> > let's use the git.
>
> I'm really not sure we want to move things over to git, it does end up
> making the build process slower as they take longer to fetch, unpack
> and clean up :/.

Maybe explain to upstream that this older-versions/ thing is just a
bit annoying for distros and they'll remove it?

The alternative is to do what libpng already does for this situation:

recipes-multimedia/libpng/libpng_1.6.37.bb:
MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/
${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"

Not pretty, but it works.

Ross


Ross


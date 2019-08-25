Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB0F7F63A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 18:39:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46GkSM0YT8z29;
	Sun, 25 Aug 2019 20:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566758355;
	bh=N3ejIA7Ocgi86ldqEqAR2GlHV5DflNlZ5EIuhouZnUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCrJE1lWQwGdUKlPFrLHWpAzOsTw8PGSocklgL3NPsvtArDnE2d+HiWAx+GBWC6+o
	vGRCy7dRIVPBcovcRzbB5cbsLDQdSt3WMPkAp+omt6NPwz+5MwMufZglmrUgsJUG+X
	C8tFuraLj+QixCs9c2GM9FTRBlhoYfGXD6E0spExxnebvVPLwvm68QNnDi0aH+dqQ4
	VnmX/k0k4dM4iuEaLxeV0YM3ec5voZxzPcKiXKocxW1mecbRBJ8dFLfCkQRku28nuQ
	8RLbjNObjfFfZ4Yx2qmQ6w9AuYvHp3yiLvcU0njgYjomKgHWF85I8IjkKrN1r7XGTl
	wc9URZ7GmlWDzrcYzfwJPBnU0k7SHmLoBiVMwCVoat7FKysyPClj5USaEZ2WcYqDlv
	HDWayj4A40Q9d8QFvT8I3UF2TKbc6m8XM4rDnbKLK5kiueK2c46t08B4XFjiQ8mZJv
	zlsMDHlwVc91gAtNtOGL1E9MCmzBoA0TgFE0VZPvDmX3N+I7rrELdWaGt/VDJe8tla
	OK8hAbRIhnp0f9wJl38RxkX5i8YAibP1aSwi1JlbXESvGTUlvyA0kM5QIDahmrrduj
	TvYFOHUPuBd2JHwY4+eX5x27ZlL4EHYC4Obt6pmKvl4kkQrJP4vTeVRuVjl5BCC4bv
	eK9STcpCw69BbEnbcaMQZnI4=
Date: Sun, 25 Aug 2019 21:39:08 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190825183908.GB32283@localhost>
References: <20190825172116.23759-2-bunk@stusta.de>
	<e9974e1d-04bf-d589-ee04-ea534377466e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e9974e1d-04bf-d589-ee04-ea534377466e@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove LSB support
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
X-List-Received-Date: Sun, 25 Aug 2019 18:39:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Aug 25, 2019 at 10:37:16AM -0700, akuster808 wrote:
> On 8/25/19 10:21 AM, Adrian Bunk wrote:
> > The only part with some (marginal) usage is lsb_release,
> > which is split from the lsb package into an own lsb-release
> > package.
> 
> Thank you for doing this work.
> 
> There was talk about creating a layer for those folks needing lsb
> support. This helps identify what is currently there.
> 
> 
> - armin
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> > https://github.com/AdrianBunk/meta-lsb contains a preliminary
> > meta-lsb layer, looking for a maintainer.
>...

This is a preliminary version of such a layer.

The current state should be enough to avoid regressions compared to 
having LSB support in OE-core, but further improvements should be
done by people needing LSB support.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



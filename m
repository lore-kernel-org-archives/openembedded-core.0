Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AF2467E169
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457PwH6dnjz4D;
	Tue, 21 May 2019 07:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558417760;
	bh=DFAyqkjvOzCPtMdOtLCf2VOBEra8Q9JuQCStzT82mZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMpc4pMoOrRLBdY5aSk0PvK82RcfDtUZii5GijeqrRZi3/ac+7sxnC8wzv/FpZgAV
	cWKsH6Rzs20VWf+iW1zL0+s7AM5KHcdmswrH0G3rWnhniCTSgCZlBW+dack4S8ucEA
	i7hrMQwuh/FH8l7srQlTOVhjb4Mf0yBog9JDrUspMmEKfTvbvYwuEHnLA8+1c+n1PW
	cY3adhHJ+owVi4l6FIxzI+Wbdgh2fPjZ5UeM9c0scNzYYi30B1bzVVin7pH7Fy/6u3
	MgPYXHgG7r1MGsFndeAG8hnLRlRAhssZIfV4wRw/M1MJomhrtUnkoFQVT4F4BgTHEV
	/DXdCqByP/lhNoRxkNf3s7+dQ2i7zoV1N3d1NZYn3fu9E70t4q4TFZO+vzBGtB0qxk
	Zh9O71BvuOck2ONUsUbvv0cbWJJyQslOrOD5xJR5BXNEz7GJdk62bRRR3Bkbv/wifV
	vmY6K0U0FywChJFlu7t0IrarlgNtHLYfj87TA0olU0w3n1C915HXvf87w5lF7u29DQ
	gqtp7Lyi89EgAgWmsgootvr3H3UcGt5Rr+le6bhZHWCOhi7m2Bquvlim87nYoDh+GV
	1cfh/jt4iyxFTK51E9K/YNUL+jdLUXiYujJ4U7WvHe8qR6V0JEuMjwgm2RWsyWG1jI
	QmobXsmMXGXE2K6l7OAg4Ghs=
Date: Tue, 21 May 2019 08:49:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521054917.GB9971@localhost>
References: <cover.1558402534.git.akuster808@gmail.com>
	<d7dac4925b2fcdacac2758a556ebdefaae4af1ee.1558402534.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d7dac4925b2fcdacac2758a556ebdefaae4af1ee.1558402534.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/15] shadow: Backport last change reproducibility
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
X-List-Received-Date: Tue, 21 May 2019 05:49:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 06:43:04PM -0700, Armin Kuster wrote:
>...
> ++#ifdef HAVE_SECURE_GETENV
> ++#  define shadow_getenv(name) secure_getenv(name)
> ++# else
> ++#  define shadow_getenv(name) getenv(name)
> ++#endif
>...

If I understand the upstream discussion correctly,
combined with the other changes this does create
a security vulnerability in musl builds.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12246.1631111884172581443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6B5151C0010;
	Wed,  8 Sep 2021 14:38:01 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:37:29 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 7/7] package_rpm: use zstd instead of xz
Message-ID: <YTjKqfuI1nTAkXpI@piout.net>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
 <20210830184800.954770-7-alex.kanavin@gmail.com>
 <YTie/qN+H1Yo4qjp@piout.net>
 <CANNYZj9BCohUTvCt0GJs-VLtih47xi4k=ptVrSYjV2Z9abJLdQ@mail.gmail.com>
 <YTiyelo2c53gbo8Y@piout.net>
 <CANNYZj-kpayUgC4zTvjkEcwrgKB5eLkqXkXbXZrHL6VYfj3MWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-kpayUgC4zTvjkEcwrgKB5eLkqXkXbXZrHL6VYfj3MWg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/09/2021 16:02:16+0200, Alexander Kanavin wrote:
> On Wed, 8 Sept 2021 at 14:54, Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > Sure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/641/steps/13/logs/stdio
> >
> >
> > I also have this one with the patch removed but with the previous lua
> > patches and it only has a lua issue:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/628/steps/12/logs/stdio
> >
> 
> This patchset was not completely tested and I had sent it with [RFC PATCH]
> in the subject which I hoped would result only in comments and feedback on
> the content, and not maintainers pulling it into various -next builds :)
> Please drop, I have everything fixed locally, and will resend.
> 

No problem, I dropped it but at least, now it is tested ;)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

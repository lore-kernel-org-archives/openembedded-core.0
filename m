Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA04CEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 12:00:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.5526.1689940817346899224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 05:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=egr9VELZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D9E01C000F;
	Fri, 21 Jul 2023 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689940815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfP8W5o2n2wQMs6O9dZF1hq8Swn2kSQbuzDXYsd32rs=;
	b=egr9VELZc2eU5WveMHdTAeZjwD1Pj7V+EERAJg7cAhD1Qwyc5XNPA/Smd5QpW9A9RlQcXZ
	84r4owPv7mj7GhMy91pOpNrs46lnWZb8x6ITRy7pM/a07adF3Im0kKWOX5jMyuje+Ds9TC
	Tqmo8gNsbsoHhyYgJ/lc/P2fiINWuH4UIZCiGewYqXHzZodMTjnJ5U4jxJZRzPr8Bbqgkk
	H+OqUbIRZyqrsunpXO4FuJwzYLoMYEIP7gGJILxr5IEUNiFlCSkiC8GyRuIp22KsNgiutJ
	uVMGl9iMgRqdyx/oq6EK96LXf0wBqH3kHJhpPC8uDVWSb83LTzj13MjiLshYkw==
Date: Fri, 21 Jul 2023 14:00:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr
 distro native features support
Message-ID: <202307211200147e423198@mail.local>
References: <20230719194843.330741-1-p.lobacz@welotec.com>
 <202307210930548e9d76ad@mail.local>
 <1773D81D0EEA3783.27973@lists.openembedded.org>
 <VI1PR04MB5373508095825FE89990A5AC913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5373508095825FE89990A5AC913FA@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 12:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184687

On 21/07/2023 11:23:10+0000, Piotr Łobacz wrote:
> OK do you want it to be on top of openembedded-core-contrib/origin/abelloni/master-next or just openembedded-core/master-next?

Now that the opkg upgrade had been merged in master, you can rebase on
top of master.

> ________________________________
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> w imieniu użytkownika Piotr Łobacz via lists.openembedded.org <p.lobacz=welotec.com@lists.openembedded.org>
> Wysłane: piątek, 21 lipca 2023 11:31
> Do: Alexandre Belloni <alexandre.belloni@bootlin.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro native features support
> 
> Yes but within an hour?
> 
> Wysyłane z aplikacji Outlook dla systemu iOS<https://aka.ms/o0ukef>
> ________________________________
> Od: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Wysłane: Friday, July 21, 2023 11:30:54 AM
> Do: Piotr Łobacz <p.lobacz@welotec.com>
> DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro native features support
> 
> Hello,
> 
> I want to give this a shot again, can you rebase on top of my
> master-next branch ?
> 
> On 19/07/2023 21:48:38+0200, Piotr Łobacz wrote:
> > Include support for ACLs and extended file attributes for native
> > builds, by default.
> >
> > Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9625a6fef4..8daaaad615 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -904,7 +904,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
> >
> >  # Native distro features (will always be used for -native, even if they
> >  # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVE ?= "acl x11 ipv6 xattr"
> >  DISTRO_FEATURES_NATIVESDK ?= "x11"
> >
> >  # Normally target distro features will not be applied to native builds:
> > --
> > 2.34.1
> >
> 
> >
> >
> >
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C01%7Cp.lobacz%40welotec.com%7C2fcf33853c84429feb0708db89cd2f44%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638255286582480321%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=VzoZv0Pjtc0D2%2FwMEi32VYkRde7xvWr4b5hHMopFJN0%3D&reserved=0<https://bootlin.com/>

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


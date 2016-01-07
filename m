Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id C8FAA6FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:44:10 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id yy13so174687143pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=rOdh2Is7Q2i/ChR/GZ/UO4eG6rGnua+7mvrmNa/eznk=;
	b=P8apNU9oJ1ThkizuFbjCypE20sugMd9SBg6eN2r1riDcfewwnl496RvvK5bgvgQVxY
	NJ91lsiffeS+HTfocNbeaiu8DufJHFNfn3WOYB45l3qnknhLzG5XhxT9aC7+X7yKF4CT
	5Ru8PL3MW83P10ece/d6HOmEn5D4So58/+WWFTFiLA0I/sK5iKuODgpkoONd+xE4qds8
	+rJlwdVZCOMSm6Ntvaa2G38lLnsslaEllJyWlciJ2OF2sGv8o1KN8JcatrhUfOTkD/wN
	/4wL7QHzCf9d8cHXRn1zR7zEF5LK5moq0yrCGVreCfhSCPHAWgQImR0xbWPEXNWemzuE
	9dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=rOdh2Is7Q2i/ChR/GZ/UO4eG6rGnua+7mvrmNa/eznk=;
	b=EMokLDBWrwp5WuwTJJ1N0DKZ9jMc2dkXtesEVf06nryAnLMu7o7ApuyWWV78p0kPy5
	IF7HAEnaRRvS2O143vZv+/Bkuk2oY7Dg3NkbHljYhkw2mrF7eNMkkdZDDBp4CMLAYDU0
	aJWt0eV+DNh+8FGZmPdPNp/UAJjONOXw59zfa0LdwoeXbHtfANHlziw3ZL55ZGpUBZqE
	jgOULdHP0/g2S6Hr97iqm9VaIg7n5Vh90dtl8+BVS2RPJ8jG3MkniuqGVaMMx5HRRRrp
	i0TB8nuQrqXFCiAbLMyhrnG0SlylECCs0n/NBMvyQoesjv1hqVh3gDTFn1rJ5cDxdy7/
	d13Q==
X-Gm-Message-State: ALoCoQkFWtOGJlmrwCcibJ6REeqltQmcPBCsMWWn1ELggoR8XzcOziTgxJThY5OwuxEqpFuEeAb3I0KTklemLgKS4C0bdx5VxQ==
X-Received: by 10.66.255.70 with SMTP id ao6mr94004889pad.64.1452199450755;
	Thu, 07 Jan 2016 12:44:10 -0800 (PST)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	cq4sm45857121pad.28.2016.01.07.12.44.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 12:44:09 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id uo6so248990145pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:44:09 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.122.97 with SMTP id lr1mr15339398pab.68.1452199449045;
	Thu, 07 Jan 2016 12:44:09 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 7 Jan 2016 12:44:08 -0800 (PST)
In-Reply-To: <VI1PR0401MB1821ACB2780D69703AB13B28E6F50@VI1PR0401MB1821.eurprd04.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-3-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKpug+pfzP++x_LQ4XwMjtkiLrW0kJYzrUbGwPPfRum7bg@mail.gmail.com>
	<AMSPR04MB309D9FAC0C65002218BAE1CE2F50@AMSPR04MB309.eurprd04.prod.outlook.com>
	<VI1PR0401MB1821ACB2780D69703AB13B28E6F50@VI1PR0401MB1821.eurprd04.prod.outlook.com>
Date: Thu, 7 Jan 2016 18:44:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoe92Wf+Vrw+pqHdH9QXYkLLtA+iR1vtfq0W_3mUi-DyQ@mail.gmail.com>
Message-ID: <CAP9ODKoe92Wf+Vrw+pqHdH9QXYkLLtA+iR1vtfq0W_3mUi-DyQ@mail.gmail.com>
To: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 3/4] packagegroup-core-x11-base: Remove matchbox for XWayland case.
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
X-List-Received-Date: Thu, 07 Jan 2016 20:44:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello Prabhu,

(adding Ross on CC)

On Thu, Jan 7, 2016 at 6:29 PM, Prabhu Sundararaj
<prabhu.sundararaj@nxp.com> wrote:
> Xwayland with Weston and MatchBox cannot go together. Both are window managers. In the xwayland(core-image-weston), matchbox will run on top weston.
> XWayland need Wayland supported Window Manager (Weston in this case) to run X applications.
>
> When Matchbox added to xwayland(in this case weston image), then it will be two window managers. Which does not makes sense
>
> Also while building core-image-weston, someone should not expect matchbox. It is meant for Weston.
>
> I understand your usecase, but that can be achieved using mutter(clutter). Mutter is a full window manager supports both X11 and wayland. Users will not see any difference whether xwayland or x11 image.

Great; so the mutter or another option is how we ought to work on
OE-Core. We cannot apply hacks here just to move on but instead we
ought to fix this in OE-Core and move all ecosystem to the right
direction.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


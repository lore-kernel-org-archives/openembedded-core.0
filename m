Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id D5A8A77D16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:14:22 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id r103so151708498wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hnNcHnVTTZncEbuBVd3ZYod0961m32ZObtsUJQZ3SoI=;
	b=re/OOdAbrRplIkoN/ZW9q0MFCnjA7f3d3gCcztNSL+2Y6EhK5kDMOwHvGAUkaU223w
	88FU4yruJwZ5Ltg2/7TETaZe0CTSvmBlHwX0vBGQL70lEeUCezwN6paT48EOGaT4f+io
	zUuO87uXpMsqzdd+QqZ+KTqEMQwARUB7i+qQN7aGMZRmmW7mztFL8RsqQ4rOMl/7TZsf
	jQL7h1QIUgvvBGYHX425jOeJSbdkMthdoxPKQR/8LBbkPsyZaNWv7JA8rxuNL/2U4tnB
	CGH5qn5H7MRVeUwpeFxJWZvGxCvrQbYPR5EMIWQ5OC0oG3PT6sWHihxykqd8v6VQgo/y
	G/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hnNcHnVTTZncEbuBVd3ZYod0961m32ZObtsUJQZ3SoI=;
	b=sB3CIOyozJPE3SUhMRvyFlUc0PW+k5JUUIpmZ/B9v6ZAfMfP3PJ/iI8979hNtHqJrS
	9fS5Zo8izNTy3EP3aI5kQux4AfM57biAynu28AfuEuh6MEFItS/TR/hGJiq3vVlaaJKg
	lQWgRcLH1w7OzGhMmZQ8QvavMiKF4waqnSI1vY5eP6slyaHLgbY/0IQqXzFr3paEv2PB
	bUNmoVqZjH1nYcO3hwb0IIp24ooOVzZXkQf9NNGAJbteVFR/yNIDOTiu6en00RUr2Txg
	hfR0Ne9ffVIxXw16cB/EKP0KzP+O9rcYZ7mMOKEpOLzKtgJ1cBnERqnG+zl0zwk8pkWD
	dUSA==
X-Gm-Message-State: AIVw113a4KyVZOiefvRDd6NDeIsuFbKiygQpKiOiA6YI9f3ifO2T5yKc
	Wl8D1MrNjdAR9PmmqLc=
X-Received: by 10.28.32.5 with SMTP id g5mr8949710wmg.70.1499714063323;
	Mon, 10 Jul 2017 12:14:23 -0700 (PDT)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
	[209.85.128.177]) by smtp.gmail.com with ESMTPSA id
	m196sm6746842wma.17.2017.07.10.12.14.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 12:14:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f177.google.com with SMTP id k67so151021878wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:14:22 -0700 (PDT)
X-Received: by 10.28.195.67 with SMTP id t64mr8784734wmf.41.1499714062017;
	Mon, 10 Jul 2017 12:14:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Mon, 10 Jul 2017 12:14:21 -0700 (PDT)
In-Reply-To: <4615032e-7bc7-5309-43f7-a917b3007b03@denx.de>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
	<02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
	<4615032e-7bc7-5309-43f7-a917b3007b03@denx.de>
Date: Mon, 10 Jul 2017 16:14:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrTTdawLdeqE9v5k=NEivm_92UqPGSH==BKfKagkvUBhg@mail.gmail.com>
Message-ID: <CAP9ODKrTTdawLdeqE9v5k=NEivm_92UqPGSH==BKfKagkvUBhg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 19:14:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 4:11 PM, Marek Vasut <marex@denx.de> wrote:
> On 07/10/2017 09:08 PM, Khem Raj wrote:
>> may be pushing to upstream and then pulling before populating the
>> mirrors could solve such issues. but I think we should use github.com
>> in OE src_uri's for speed reasons.
>
> Not everyone is a big fan of github and their ToS, so I wouldn't be a
> big fan of such move.

Without a more specific reasoning I see no problem in changing it for
the official mirror.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


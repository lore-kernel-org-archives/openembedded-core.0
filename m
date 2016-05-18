Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 87FE6763F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 21:35:26 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yl2so5864975pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=PAaXKKRzpB5ex3L0PhBhGYNVskVJeOqKuEXnoe9DR3o=;
	b=KOsjuq+XUzvOSr3PVaFoIK7OmRFkq2yoYzGHXmtr0gKEPstUNHWLIzrZwMHv/EfeIP
	FI2bzmp0tM1hfswFi+NRmSeAYHR19+5zmnsdJrO+YF85xv9gMTmG72G62mLjkhSWFKT6
	eCpq3lt9y6dSM974mTPzmFcIACxZy0nG3zcQWjtPBISvzAzH36BZ4ZJIE4puYkQHw7xx
	MhVIlfAxG652rVqYkv9G0YTgRQXh/lwzlh/dKsKuo5vv31k0vQ7KksHyClA2CRHQSwyD
	wBn3x3o4wBRzYNgt8LQLR+fiirtWA6M7JyTFVaPCYL2UBHbX10fy5qoeYUldakWZdb6N
	El3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=PAaXKKRzpB5ex3L0PhBhGYNVskVJeOqKuEXnoe9DR3o=;
	b=aMUJrf+qXH9M6VkOGXSAFx1yrdvMNL6zya7oxPLPPnH7buCFakGEryFLqPNjeEsxEj
	AI0v0rSm9dNBErym6LqhvaQnAM9d8/DezCL7ia6ybSNgQKw01zZdvrowe82yuJCyX7WA
	DyMSaMBkDyTKk5r1dhvLl9qyvpfe07Gx2Lfu0bz1BmherykmSUjmyXT4MG/ozovsWEFR
	UvNu993YudPa+glyoDY29+7HjxRhL8CXnjuRbItBhwIMG26ER4yYbMXGXdZ1AJkkYJ2s
	33NnfeYsb5ZMKtMHcZZVdGA4Q29JMTHaFiIuYiBg+01uOEF4/WK/kl1YdadoDcU3klLM
	HpQA==
X-Gm-Message-State: AOPr4FV7Z5SWLNGs1l+fZtAg34nGBUg5JK7C3h8Cnjd0M3HkP3X7h1hn5Oj66MUT4V8bzQ==
X-Received: by 10.66.122.100 with SMTP id lr4mr13599467pab.99.1463607327080;
	Wed, 18 May 2016 14:35:27 -0700 (PDT)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	d78sm14430965pfb.59.2016.05.18.14.35.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 14:35:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f41.google.com with SMTP id qo8so21796811pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 14:35:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr14040607pad.1.1463607324732; Wed,
	18 May 2016 14:35:24 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Wed, 18 May 2016 14:35:24 -0700 (PDT)
In-Reply-To: <1463589648-28641-14-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
	<1463589648-28641-14-git-send-email-otavio@ossystems.com.br>
Date: Wed, 18 May 2016 18:35:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpwMT+EOwF6qx_wUoaGrKCwYgt6P0WjrnWJk1cHPSQP1Q@mail.gmail.com>
Message-ID: <CAP9ODKpwMT+EOwF6qx_wUoaGrKCwYgt6P0WjrnWJk1cHPSQP1Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: Re: [oe-core PATCH v8 13/13] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Wed, 18 May 2016 21:35:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 1:40 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> When the distribution has X11 and Wayland backends, we enable XWayland
> support and include XTerm as a test application for the XWayland
> backend.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

As discussed on IRC, instead of XTerm - which is not included on
OE-Core - we could use Xeyes as an utility to show it is working. What
do you think? Do you want me to send a v9 changing it or do you change
it when applying it?



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0B06D6C125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 19:22:29 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id x202so14789873oif.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 11:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=YFmqutiXgCmlLgCMxuTRawc0dAOc4P3qSE6GAqfkDls=;
	b=kVCn5ipxleVJXVbNuFOl9hhG2cU/gRPHywSZadqQZ/rGrK6GaoFL0gB9zGD70u4Ved
	w3PRwarswm+nQ58VD6KTAAscGwGlChah+08SWjrW4enMeYEKntUiHNx7Tzl1Gy1xra/g
	3R0HaZU8G5HXJfc6kcmKnFT66U0hzSJyVIVxliwCZAPLE0cpg2rKoY/VAchD8QdI2dAt
	+QhQ3Ohe/bcH8vCQYF8GDggllyjexGDWZAKPqoqEjJyZ3NjT723iwCr2Piuae2p7lTPW
	DtZu4TJcm5SpCuVAxjQeZJ5+QSke00Y0DborfzhXUT9+/tdQdrP3PhOJ6GaqxmYjVbth
	2f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=YFmqutiXgCmlLgCMxuTRawc0dAOc4P3qSE6GAqfkDls=;
	b=eH+we8+oYGUXmlw7JRnZSoP6P9FlpETKyJw83gQKIWAbrB0NpuEdKZq1mgdGM5T7nm
	vJUC9Iu09GfFvk2p/uqidlrcey3lPmqKDRz16+VhBlrm4AQFMUJOAIJEJup/x17h/ea/
	FxJ7oU/HuO34QMV6vkvu9+9ovm+xYJFgIxbQ0FQqcr0DjrePNS8U48bBsCFlwNR9C3iO
	qTy8fBpdB6Dx71SHTDpx0pKflCTIUkMrXHtpSs0ebXyhmzmUiq5Vfq9tv+jbwygjtTmR
	zAVK57Zo1Qtrwov6/V9qV6tnYg3wzwiEDMzk+9qdnCRrXTWbgvVAhviwWcRJ2PmVcUlb
	TXzg==
X-Gm-Message-State: AGRZ1gLdQBs9B2zJkGKtQEn+vEPjA+yLkrGfI1/grLFZDNm17zQIWEsg
	KMGcGx/pem1PKVLLFvER/TlwgQUfSM8attHq
X-Google-Smtp-Source: AJdET5frdw0OPXMbAHsai+sxEwCrJBR6sPhWQeboVamIyNITr1IxanJKrcZjcCexzUM0AVI3sqQUUA==
X-Received: by 2002:aca:2803:: with SMTP id 3mr8302079oix.85.1542655350616;
	Mon, 19 Nov 2018 11:22:30 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
	[209.85.210.52]) by smtp.gmail.com with ESMTPSA id
	i34sm4911169otd.44.2018.11.19.11.22.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Nov 2018 11:22:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f52.google.com with SMTP id n46so28711737otb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 11:22:28 -0800 (PST)
X-Received: by 2002:a9d:5325:: with SMTP id g37mr14718835oth.253.1542655348261;
	Mon, 19 Nov 2018 11:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20181119100443.2882-1-abrodkin@synopsys.com>
	<1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
	<20181119190835.GO11247@bill-the-cat>
In-Reply-To: <20181119190835.GO11247@bill-the-cat>
Date: Mon, 19 Nov 2018 17:22:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
Message-ID: <CAP9ODKr6JkJ0HpOWMKXy6_qN61vwU=41xEAOveyzfqPnVqEcbQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Marek Vasut <marex@denx.de>, linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 19 Nov 2018 19:22:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 19, 2018 at 5:08 PM Tom Rini <trini@konsulko.com> wrote:
>
> On Mon, Nov 19, 2018 at 01:51:41PM +0100, Marek Vasut wrote:
> > On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> > > This utility is used for creation of images containing
> > > usable in run-time U-Boot environment.
> > >
> > > As of today this utility is added per-board like here [1]
> > > for Intel Edison board.
> > >
> > > [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> > >
> > > Given there're quite some U-Boot tools that we may want to add later
> > > this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> > > still for compatibility we provide "u-boot-mkimage" with help
> > > of PROVIDES as well as proposed "u-boot-mkenvimage".
> > >
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Cc: Otavio Salvador <otavio@ossystems.com.br>
> > > Cc: Martin Jansa <martin.jansa@gmail.com>
> > > Cc: Ross Burton <ross.burton@intel.com>
> > > Cc: Marek Vasut <marex@denx.de>
> >
> > Do we want to generate one package per tool or not ?
>
> I think so, yes.  Not all places will want all tools.

And a bonus to add a u-boot-tools-meta which rdepends on all. You can
copy code to do that from gstreamer-plugins packages.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


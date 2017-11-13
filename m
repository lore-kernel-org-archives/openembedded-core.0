Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 87E3C784EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:54:10 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r68so13494005wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 00:54:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6vlXtpdL3rrvygn/IWqhotASAvBAy4PPHoobxVQy/Jk=;
	b=AJtdI0QgC/Ilmcn6xykRP34fYvCUwVPiaOU8JSJOqGezQrB3RJva3kH5PnP73i4rBn
	3OP6h0t9+zo86RCOxTMxAmawkCSUAR8tpqmT65sELMHTcSq/QzvmpR404/rbXpcDnLX6
	vHb/LoLbHHfpl85lYJMug7YB4SqWMsDUBy2qYw7oEIhlKnft6mJRLwwLGL3ZPn2udAys
	dQfdF0GmTbVT6L4JhPVrgminol7w31tupDvYwV8F2P2MHIrn4DZRFyMq9k+w/G7//VPn
	HqvcJrPb46c4MeCFUUrayPk2ZqEGAS0fadgfdaH407ECeVjLLNI6uO/bWXHk9fvHcFQj
	uwow==
X-Gm-Message-State: AJaThX6HYzYsg3U/Vdsg+x75MJBLOkisH0JyZSiRwvaNS91/EwEvSChe
	dKHczLqMgpp7x/2bkwWyz5lH+ZpB
X-Google-Smtp-Source: AGs4zMZ4S7dghrXoltIiPEUNGQcKbHRukSvlbh3ZWl5FI3IlsUImImKUL6eWNmx6NNKt/TVn1e8Vjg==
X-Received: by 10.80.161.134 with SMTP id 6mr11638558edk.197.1510563251021;
	Mon, 13 Nov 2017 00:54:11 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	k42sm15652372edb.88.2017.11.13.00.54.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 00:54:10 -0800 (PST)
Message-ID: <1510563249.4049.33.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 08:54:09 +0000
In-Reply-To: <62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Mon, 13 Nov 2017 08:54:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
> autoconf-archive is a set of common m4 macros, it should be allarch,
> just like it is on other distros.

I have found previously that when changing a recipe to produce more generic
output, like in this case, and the old binary package is still in deploy/,
then the package manager would always pick the more specific version, even
if a more recent (by package version) exists in deploy. In my case I was
moving from PACKAGE_ARCH=${MACHINE_ARCH} to PACKAGE_ARCH=${TUNE_PKGARCH},
but I guess it'll be the same here.

What is the correct way to deal with that other that cleansstate?

Cheers,
Andre'



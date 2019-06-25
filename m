Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D44F7E3D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:48:32 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so616899ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XrmwgxIMS95+e6yp3aHoEe+3MGpT0vhsBwgyVpTYh9M=;
	b=agm7vMQQ5g/udVYfyonBCgkmxAtOFQ1YBwUuxDEnAYRMugM2zaJwq0VVd9BXyY9YPW
	G1glmYxcC5awCqur6hhe6R5fY8ekAF8gjRIlFYRZRY2tGiIOvEcjYQy8kPHuAKlKqHPc
	8//Agurl8X+sCWQfjy2X4ZNCjrfNBFp5Wf9MMc+0QObWwTGI8sqBuPzH8UNMV4dNB6ur
	WZSYoXu88pgxJa+xPmlBkATweo5Zq/7/2OHm/5lpJ0ANCpDHh6AGJboeN1o4KGyBvzST
	uU4++BfKlqj9nQjs7xr8x1UmSOW4d1LhRxo+bIkgEnl6dDagutCeCJD7nwuo6GTpgfxv
	t8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XrmwgxIMS95+e6yp3aHoEe+3MGpT0vhsBwgyVpTYh9M=;
	b=Pj9eMtzhVQo8Aai+Rojy1Ueb1vBZF5ur8s2IgI59TOj5U5X0uNZnGbbxxEcdLTB87J
	dvTZ55ZK7AKERuxP4Nflexb5nagoieNCv9ySpzsOd5SGrCfRd8Z2Oz0mJvzVxuBAj6KU
	k5tNqTsRXV36qgi4UdUVyovQz9OW6gh4E6lUz0qCmPrxa2OM2I3y62DE/pCisDiMsuJ9
	S0GM1nIa1S3fI6uBTX4fNi1qNKiRKFSyqEWuAiyA4UKIYB/VUdOVKeXm4Mh6o0epe1pL
	YNhC7T/pg5OLqyF9FKzxxAnIsdnOaxqCfdwNOrLllXWDQmn41pTPG8wwFDV0YZYHp2zg
	dfRQ==
X-Gm-Message-State: APjAAAUiZburFkunKkgFTOuMXd293uvuoZXxTrGY74rFVMbmx8dCUMfS
	dpKY/HQsIs4RzvQkAe16lruuAxdfWuysv9ObHQo=
X-Google-Smtp-Source: APXvYqwAOT1lF5fDostpzcnatgNPtD58wbmcHqc8CEoPGdaXD7hWzFaSYXbNhbkBMABO6751T/FwtW+UstrKCzKD9do=
X-Received: by 2002:a5d:8252:: with SMTP id n18mr35494056ioo.230.1561452514058;
	Tue, 25 Jun 2019 01:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
	<20190621130128.GU3459@hiutale>
In-Reply-To: <20190621130128.GU3459@hiutale>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Tue, 25 Jun 2019 10:48:22 +0200
Message-ID: <CAEz4NHqhdZstEKcXWE2z1gG=257kGdX00y4m95umQ9FsDyXOSw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Tue, 25 Jun 2019 08:48:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

> Also, the CVE db is updated using this custom task without link to
> do_fetch, which means a fetchall task would not update the database for
> off line NO_NETWORK builds.
>
> Could the task be added as dependency to do_fetch() or are there some other
> side effects?
>

Yes I can do that, I don't think this will cause side effects.

Pierre


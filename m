Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1836C0F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:08:51 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b4so14275645oif.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=AR6O3LH0cpFOm3szeF4G33Yvoy17zLiYMlli8/lIXFU=;
	b=dc3cyrP0f34S4HVID+UNaB3ytFNfezeCTISz7Ha13iHOU9ORQqKMHIEp0xcIAx/Srz
	FumxLW8Dc3vS/bVXP7WzA55Mr0MOUsovbiPtsZONHLI9eN55DjMOAgZFLm9PF152PMgD
	VbKzzzrRj75+L1Bo/ShFrF4pWQDCvIKQD61kmxGxAiXIvwD9ldKg3Lep2xCHZJPeDUDK
	l4TsrnLjXGiHTcxqgZoqsG+mKTKTQOeW7L8ipYBSzGP3zJVah9WdSaxxK/6lrsJScD6r
	hLP9axUoNo6KCxfx4YQgjh0A6gmMiElUNJBOGqRxz55WMzA5/zTW5nH4y6nn/rVFQW6n
	zdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=AR6O3LH0cpFOm3szeF4G33Yvoy17zLiYMlli8/lIXFU=;
	b=pIjEPa6ss9Tv5ALRa6RqeZ02PT3Rs77oQyNwl4OcnlXj9GoMBEuZuOL81f54nlV5/M
	CnvG5hLsKPYQw1JuIFfZzRsx7P8M9iv7DvqegQSAK5DJOpT/LZXTgKsRvdu+kBsis2wl
	qYJ8mpEMs3EQ9yZiqq0h2oEodj3TDuMjgHJh8zV84hjLBt4iR8bfBcaPJreQlywtO8K0
	6nrWJzg32qxpigi9+1jhsHA1tltlhtXRNYY/0S2FfCaBOYDqa+DGYlCqFnES+TZnsd58
	2dehNdxBkgG+5mwghmgB9lgu4jvixhES2AEjo7fYFgT8zlyM0KQP5/cV0vKOv6fFSA9/
	Acig==
X-Gm-Message-State: APjAAAWPjhH7R3YxE2bTR3qTxzsThVjWzLwLqv3P9wozvSmHqwJFsUGO
	vlnpPc5ZXDTEAx8ajZPv5zgMbZmDKJzDvQ==
X-Google-Smtp-Source: APXvYqxJdu2WGxKZ25ZBBQZZnWZrZ3IX8wpliwM2WiXI0rInm6imFILJNRTsIjLNKYMuZXmXlSqZ2g==
X-Received: by 2002:aca:f581:: with SMTP id t123mr118927oih.0.1552943331781;
	Mon, 18 Mar 2019 14:08:51 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
	[209.85.210.47])
	by smtp.gmail.com with ESMTPSA id x3sm4311446otg.52.2019.03.18.14.08.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 14:08:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f47.google.com with SMTP id c16so4370615otn.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:08:50 -0700 (PDT)
X-Received: by 2002:a9d:6d0f:: with SMTP id o15mr9331324otp.253.1552943330355; 
	Mon, 18 Mar 2019 14:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190318165138.30402-1-paul@betafive.co.uk>
	<CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
	<6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
In-Reply-To: <6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
Date: Mon, 18 Mar 2019 18:08:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqx7ZxqsYixxBV=AASzaOw2ePkBDjDuJoKyQqoU6sf+mQ@mail.gmail.com>
Message-ID: <CAP9ODKqx7ZxqsYixxBV=AASzaOw2ePkBDjDuJoKyQqoU6sf+mQ@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add tzdata-all package
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
X-List-Received-Date: Mon, 18 Mar 2019 21:08:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 2:10 PM Paul Barker <paul@betafive.co.uk> wrote:
> On Mon, 18 Mar 2019, at 17:02, Burton, Ross wrote:
> > I'd prefer that installing 'tzdata' installed everything, and then
> > there were other pieces for subsets.  We learnt this the hard way from
> > people installing "python" and wondering why bits of the standard
> > library were missing.
>
> That is a good argument. I just checked the difference in image sizes though (from buildhistory):
>
> core-image-minimal + tzdata = 8,868 kB
> core-image-minimal + tzdata-all = 15,788 kB
>
> So it's probably not an appropriate change for everyone.

Just, to align with other recipes, name the package tzdata-meta and
use a python function to generate the package runtime dependencies, so
it does not need manual updates.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


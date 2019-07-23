Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 920B07ED41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:12:24 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j6so9781336ioa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xUthvqORY8kyRElsFik7bNJqrH4iEwd1F1lowNZChnc=;
	b=xYoXZGYzUsq41b3d/IviJmtILOIEWOVgjshE3qQaJwUiWMjzu9TVQPC5LF9u9plyTt
	tJC5NRhl9BwR3FyvFeAzYHCYlUI/X71Kfg53AsKO7Kf13weRUcfUDju0wbymVF5mIwMk
	9viibKyRLibKe8yhhT4nhgw/D4nRV5TIeXW2KLa4PGexpk90B2mI/eTcdfVjiTuYjNEy
	r+9+APiLmqA2IOTAAXb1zA6ArscPA/axVUchAALpQX8ldy2qgKa++FwkfONUoefI4FeB
	WaD5sRZmk9pjmxIbtGOF73GnaQeY8o47xawxaMaHi8a+hcrcZkF4ATIjksGqVf7JRZTP
	3D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xUthvqORY8kyRElsFik7bNJqrH4iEwd1F1lowNZChnc=;
	b=OkORzM6Oz+FrX0wQQzUt9unEJVBxzFlTdm9f5pKhV3jL8FM+gLsfWmqw86178GNt65
	0liTgpOP7rkJea8F+qTL5a4CdcMi9s2NA/Qdv5cZccxWyWCXD4Alr+kdpR2PKLc7tR81
	incnvXrji+2qh8VbBQ6YejhhJ8MGc023No2DtrqFLAk0WyQdF3vq4c/3JQjWie9VsgRD
	0mGdquGvE2Rz2xqNvnitELUm4nnNdeHn3I0jwNdXW7uX4vUJiWK3dW5kJ9ohdvloSwvY
	1HmMwpLQlD7RMZStwhaMIxkIlLvq9+t7LqtdThiSbfU438BUH13L6v7LfRURpquNJc5X
	D7iQ==
X-Gm-Message-State: APjAAAWYIq67iXzNNFN4jPPx0BxBNoAAzG3TVvBEnYv/5fnda8an6Cni
	BiePZjK6Rx4fOZx1/wqtxcR881RvFNF91HztonpPNA==
X-Google-Smtp-Source: APXvYqx8HUEtFSHCnL3RGYscHEZ82FvqdzMw7Td82Up+nRmqAzKiHzuqVnNeYieO3lnwjGH3thFlm/6CYzz5epNh7Yw=
X-Received: by 2002:a02:7303:: with SMTP id y3mr79811521jab.97.1563916345227; 
	Tue, 23 Jul 2019 14:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190722144809.14972-1-ross.burton@intel.com>
	<f4a6845ad7408e22bb84a85da103f53ffd5b1736.camel@intel.com>
	<CAMKF1srhurgFYqP0sEgdHn7jpYY44ihY=3r2Y=hRz_R21Rzi1w@mail.gmail.com>
	<393734e9ff3b6095b159744b01405a0b0616269d.camel@intel.com>
	<CAMKF1sqQ2SSdfj7BYnTnzHuScw8Fucxhhd7kwuragxF+y7nufg@mail.gmail.com>
	<CAMKF1srgRYSK9DXBVet23Re8fpwxbrh38q4sKYG2eE-jF-vz1w@mail.gmail.com>
In-Reply-To: <CAMKF1srgRYSK9DXBVet23Re8fpwxbrh38q4sKYG2eE-jF-vz1w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2019 22:12:14 +0100
Message-ID: <CAJTo0LaH+-poVSJw-DPup=z2_73BLkMYfgLcCrKLujcknTwN6Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libical: upgrade to 3.0.5
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
X-List-Received-Date: Tue, 23 Jul 2019 21:12:24 -0000
Content-Type: text/plain; charset="UTF-8"

The last release of Orage was four years ago: I suggest removing that
from meta-xfce instead of keeping everyone else using an old version
of libical.

Ross

On Tue, 23 Jul 2019 at 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>
> this is causing a failure in meta-xfce
>
> https://errors.yoctoproject.org/Errors/Details/253910/
>
> On Mon, Jul 22, 2019 at 6:12 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Jul 22, 2019 at 6:05 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> > >
> > > On Mon, 2019-07-22 at 17:59 -0700, Khem Raj wrote:
> > > > On Mon, Jul 22, 2019 at 4:17 PM Mittal, Anuj <anuj.mittal@intel.com>
> > > > wrote:
> > > > > On Mon, 2019-07-22 at 15:48 +0100, Ross Burton wrote:
> > > > > > -LICENSE = "LGPLv2.1 | MPL-1.0"
> > > >
> > > > this should be MPL-2.0 | LGPL-2.1
> > > >
> > > > > > -LIC_FILES_CHKSUM =
> > > > > > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > > > > > -
> > > > > > file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
> > > > > > +LICENSE = "LGPLv2.1 | MPL-2"
> > > > > > +LIC_FILES_CHKSUM =
> > > > > > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > > > > > +
> > > > > > file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3da079536f0ed871 \
> > > > > > +
> > > > > > file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
> > > > >
> > > > > Should this be MPL-2.0 instead? This is causing warnings:
> > > >
> > > > the license is MPL-2.0 but the license file name is MPL2.txt so this
> > > > seems fine.
> > >
> > > I meant the field in LICENSE. Quoted the wrong text.
> >
> > reply quote confused me. yes it is wrong. It should be MPL-2.0
> >
> > >
> > > Thanks.


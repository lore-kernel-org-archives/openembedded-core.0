Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D66C07E417
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 06:41:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v15so27676272wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 23:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Jls0Dy/gAX3AXxe73I0T8tW08BbVEbAKoyZ29yDIukM=;
	b=eUtH0oalBf+WHk0O28nuqCqLFv789qz8pEVdZ+A6NMC9iIp67jnCS/0fR53ppSUD89
	li/iqJuGWgUvQl6bD/KZJ8h5Lq2euyl1NycUi4dDsOQsRymWR3QnQQuF3IUI3ih9UEqZ
	Z4R8qe/c5kNoHFe1hHnacqAKD+vx0eIVOP5pjbgVM4+UwOEsHiqvg+9Pc5wEXea3zcJG
	yz0udAqywi8KFFpBmgJAy+LKjcsW41GR86S2CeJsweCYBT/OV+ntGBRxr4XCpQFsz1wg
	31gIJ+vhKXDU14SM5usQr2lHruLFd3jb0j4wwf+Ug4nEyO0VHhquglrtUvJ+BYG/Seka
	u/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Jls0Dy/gAX3AXxe73I0T8tW08BbVEbAKoyZ29yDIukM=;
	b=GEe7K0rS0UkhRU2NAvaZWt1jP2iDntAmk26zmIa4OzESIGYieiJrwpsrkCuiqwsiah
	dMnsNB2JbQNcYqfcKl2luDG3U+sGbEHFE55N3W1shVTM2Ez9QcFD4vI8MJXGdY0QOwrP
	Ed5/JMLJKoUT2vcPv68+/KXsVjMnUv2awTLczBl0iA+00clnjHAX+ygq27lObSGMLUzQ
	RNHiBjMEl722ZkqOl894kk1icWRBgPZgXw0mQOq5SXsNnr91VYZGCWwf7QPlGLe1ByL5
	RYx1YIbWFIzZlcNIGh++DTf/kf1ZwDzlbnt7a9Cz713bd4gOqEn15Xfr/KOvEV/kaFmE
	QHug==
X-Gm-Message-State: APjAAAWd1oV2wdFhclHcGy3EspwF7COaZR0HJn6MITVJvvrk1NLgJtSg
	qxahP69O8MB1p3vIwid1FPo=
X-Google-Smtp-Source: APXvYqxvsr6C8+wj2ZmFXl7zKzsteNxxvYT5bbgR+W6M6cOaMEserF3hh8s5EiBeNQO652ozbgsJZQ==
X-Received: by 2002:a1c:2d58:: with SMTP id t85mr42592523wmt.61.1563518499616; 
	Thu, 18 Jul 2019 23:41:39 -0700 (PDT)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	e3sm25802065wrs.37.2019.07.18.23.41.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 23:41:39 -0700 (PDT)
Date: Fri, 19 Jul 2019 08:41:37 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <20190719064136.GB9894@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190717095039.121044-1-hongzhi.song@windriver.com>
	<20190718215132.GD26895@dell5510>
	<5eada992-c0d9-b167-ab9a-aa03a1a3f5ce@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5eada992-c0d9-b167-ab9a-aa03a1a3f5ce@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: getrlimit03: adjust-a-bit-of-code-to-compatiable-with mips32
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
X-List-Received-Date: Fri, 19 Jul 2019 06:41:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongzhi,

> > ...
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
> > > @@ -0,0 +1,62 @@
> > > +From e79652a3839869b1983d65999e5d5dcb50bc9cd7 Mon Sep 17 00:00:00 2001
> > > +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> > > +Date: Mon, 15 Jul 2019 03:39:06 -0400
> > > +Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
> > ...
> > > +Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > > +
> > > +Upstream-Status: Backport
> > > +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> > > +---
> > > + testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
> > > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > I have to say I prefer policy when only build fixes are backported / added.
> > (approach which e.g. buildroot has). Having many patches (25 atm) makes updating
> > a bit difficult (ok, not that much, 'Upstream-Status: Backport' shows what has
> > been merged since last release) and sometimes brings users patches which weren't
> > accepted by upstream (your mips patch [1] was not accepted [2]

> Thanks for your kindly remind.

> Agree with you. It's time to uprev ltp recipe.


> From now, if the "Submitting or Backport" is appropriate,

> I will make sure the patch was merged by ltp before it was sent to oe-core.
Great! Feel free to Cc me when sending patches.

> > ).

> > But I understand that LTP 3 months release cycle can be to
> > slow for some LTP users.

> > Kind regards,
> > Petr

> > PS: I'm slowly working on fixing all musl issues in LTP upstream. It's a long
> > term run but were moving towards that goal.
> > Patch "build: Add option to select libc implementation" [3] is a not a good
> > approach.  Instead it's needed to find for each failure why it's not presented
> > in musl.  Mostly because it uses non POSIX features or deprecated API, which
> > needs to be avoided or used kernel headers where it's available.

> > [1] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch

> I am working on this patch.
Good.


> > [2] https://patchwork.ozlabs.org/patch/982194/#2012168

> This patch has been merge by ltp finally.
To LTP upstream? I don't see it [4]. That's the patch you working on.

> --Hongzhi

> > [3] http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch

[4] https://github.com/linux-test-project/ltp/commits/master/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c


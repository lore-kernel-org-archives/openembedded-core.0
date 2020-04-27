Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.2823.1587982101870404693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 03:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=GJPGqmW6;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=o7af=6l=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 499gTG0GVPz3r;
	Mon, 27 Apr 2020 12:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1587982098;
	bh=wApcIwf3nEWhhO2+GsTEndtpPVGjySmHLVSu/y/lsvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJPGqmW6sUO2RltyMc7SlN81PnrPvaG4hn/9zj0NmnLQaOSDccqe7r+kMf/T9YHRC
	 kDRNS3uWlUc2T1n0RjUvR2cGM0pxgxdJRDhC87Rylzbdzn+VJ64ouMgstTrzUducj3
	 Pw8kO/gLGP+V8mRLgQOFSgg/0Cj/MZ+L6WF8n7k2rtOxQqfAUy5KO1JwbqVMdjIE4T
	 lmSKTlfdZxtKUNcRidhptOIL8tubPgdGXSsOjhQq/DzVPg0+BO1R3XDb5vs6HLcxD/
	 Av5Q8mGeE5u/Vuoxb9g2Fk1s1yNln8Uxql26sTdMoO25EzjuuB+MgIcNb2e81jMNoI
	 rN+DfYY8h9g5dyaDgRySLqBlMzwXj1l8nEfx0FKhNllh9ftA/xzTpTDXWBwo3g2ZPJ
	 WTQVIsLZzCqGy3p9F8QiIgJTDsxHl7vxK9TS4N08I8qOXzA9JO3Dx7yG48XPRH8vRq
	 9R5rRYhtk16/RHvGY1A5JxB+rXSkKYt2p4uQiqYAMqipz8p6fwETYjB1Cq6wbScb30
	 z8lfyRo1JZFU5+VSp8kyydnX50e9G1C3wnr3WJrJpT0C9vKmRJCoH5+XWnUrWXGsMV
	 bOrjixM70moZ47s1Kqmb2IKwiD0G3Kp7CcIq2D+9DjBI0FHSkGYEDFZkRiu09Ea8v/
	 6j7ZBt3NwVY+qZf6kqpC2mDQ=
Date: Mon, 27 Apr 2020 13:08:16 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
Message-ID: <20200427100816.GA27417@localhost>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
 <160972188EAFC253.2907@lists.openembedded.org>
 <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
 <20200427090911.GA19242@localhost>
 <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 27, 2020 at 11:54:15AM +0200, Alexander Kanavin wrote:
> On Mon, 27 Apr 2020 at 11:09, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > I don't see omp.h installed anywhere by the buildtools-extended tarball.
> > This would explain the build failures.
> >
> > gcc 6 updated OpenMP support from OpenMP 4.0 to OpenMP 4.5.
> > This might be a plausible explanation for segfaults on systems
> > with older libgomp.
> 
> Yes, I thought of sending a patch that adds libgomp-dev to the extended
> tarball, but... the mysterious problem is, in some cases, rpm-native will
> compile on the same worker machines without any failure (and maybe it then
> gets linked against 'wrong' gomp, hence failures)  - see links above. I'd
> like to try to ssh in and see how this could happen.

Richard had a possible explanation for that:

On Sun, Apr 26, 2020 at 10:07:30PM +0100, Richard Purdie wrote:
> I think what may happen is that sstate may become populated and then
> builds proceed further than they did previously.


> Alex


cu
Adrian

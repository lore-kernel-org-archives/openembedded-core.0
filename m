Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.9408.1589651228638230725
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 10:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=BkVO8VVt;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=yivk=66=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49PXlr2XKzz3s;
	Sat, 16 May 2020 19:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589651225;
	bh=iZwJAA8JQCI6IRtUpAjNeogKG+jZRwpabKS9ezCgzXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkVO8VVtkS2AThEbc/5Q+4j+DtIVw9PxWOaSeqoLTGoOxvAHS90ns/N5ZURS/LEj8
	 RUBu7Oezrw/Vgw3xUZpC1EnFWZfnAfSeRI6v0gXQSS2NjZwFX82FYnsBmB7tA9Y4IG
	 BQwkG+HlH1WyV10I+lhjYQdxH0/Hlu8FN4gJ+SO4aSV4ayUsxlxmqlQA24PCZylkYJ
	 yzwj1rIKvJuOQh6VZvdhNG3qYi1P14UjeCTu6EvVdyAOSFf7UgOMsqM7UH3Rz3DMyO
	 YvYhZibThan12pDaezmWOTPPf0Y/pGG2OynR8pElw/nGtAfGf3S+WX0PpwAN5s6ANY
	 jRbfCu83K3O2xNboFp/zpA4aoR2VbBmNpq0Z9Ir3ZwOsaNqBRv7c+2tvPUgrtQOc6W
	 vOLyCCkRpJpCE3OYk/JiwPtZevTG+CkIdrIUKQ9P+yTtY3Y0g0LhTWwzNTa6tpY9nQ
	 YISB20BgLjRl9XUbGjnGHM13TpZcuWZEt6lJ7s2ap8e6X5AKdN5wCatbOj+FqwqgIo
	 mgcoDQDsWZGYVbRK+++DAUmusPR57QATf0OQMtJSoPqOavYPmdXWCUYRkj/Gmf+InG
	 6+N8wUOVHOjGbLaOTWfbdminUmq5D5M+0Tymbg+DDVufcmhMQBdD4/yuTtDkrplTDv
	 75WInKP3OieVwaumDsboPVbc=
Date: Sat, 16 May 2020 20:47:02 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Steve Sakoman <sakoman@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	jdmason@kudzu.us, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200516174702.GA22042@localhost>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 15, 2020 at 03:21:57PM -1000, Steve Sakoman wrote:
> 
> I'm seeing a few votes of "yes for dunfell" and no opposition as yet
> (at least here on the list).
> 
> I support the desire to get rid of a meta-python dependency in bsp
> layers so I'm also a yes vote unless someone comes up with a good
> reason why we shouldn't.

meta-openembedded/meta-python has a higher layer priority than OE-core.

Adding higher upstream versions of these recipes to a lower-priority
layer in a stable series is a potential source for weird problems.

> Steve

cu
Adrian

Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.8489.1589298013813522613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Qmn8fMNX;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M27F4S5pz4y;
	Tue, 12 May 2020 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589298010;
	bh=84nXCtDXCX03oKnydm5wGrYECUZ8AJ2pr/KbX267ceg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qmn8fMNXJ1MKT2DkqLVPLJQNMbFYvZC2tlr2U9emfqfHvMWOW/J85+H466OCffvnp
	 ECK8sDk7pyEOC0yReRL0IfbPwhNct15aXj2VJcgwdA4YXRWXDBGajD9L657VLrIl3O
	 c05lriKt/3cls2eZcWGdS1sHtX7NgVKkuVxvq3mG64P22cwzCxjhnMdG85/HAMREZS
	 PbztfY7DLihXVDX5ufsru/ckUyBeyk/Kk5GfygwyT00Id6EnMY3EVLoQuTG0OKOOWj
	 exk/EEWrM9UjnxFgu0flUDkwn1tSaVvcTm0Ms3fH4bykHGhV+dzu79/UD2TC+5hm7A
	 1ybZNipShiUP1jIJjisJGeqn0Rs/32NqeX2ZgG1gbOrzZIdAvHYllWbRyxZgo4tF5j
	 HjLFTj6MmvQyuRFZWjya74brp74gR9t7GSvlIg9Us9YuHay/QSisnjzOGxt9tPiVTp
	 ILIUhEaRlm4CchR4eSBmwsLf4YJJMH4iJdWXYvwaj1DfMU7VuqjrspY0ivla2GTgDO
	 CDctcguekPrqyPxoSVwe9Fth8Thw96pck/Huu1kutc/kJU+6AkP/JQPeT1yu3jv1vZ
	 37rnsx93c0oyNcvnZ5EPgtN8gOZFma4KjYjRtC2CBJ/ycwVB6an7nB+ukPMTa9ZeQM
	 8V6oydwv5vpbPlWymMfQH8As=
Date: Tue, 12 May 2020 18:40:07 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 2/3] gcc10: Default back to -fcommon
Message-ID: <20200512154007.GD11943@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-2-raj.khem@gmail.com>
 <20200512134442.GA11943@localhost>
 <cd4b38c5-391f-5915-1246-4f04897f7341@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cd4b38c5-391f-5915-1246-4f04897f7341@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 12, 2020 at 08:16:14AM -0700, Khem Raj wrote:
> 
> 
> On 5/12/20 6:44 AM, Adrian Bunk wrote:
> > On Mon, May 11, 2020 at 11:28:11AM -0700, Khem Raj wrote:
> > > For time being change back to -fcommon as default, helps us iron
> > > out other issues, eventually this should be removed as we fix the
> > > packages to work with -fno-common
> > > ...
> > What packages are still unfixed?
> 
> There were ateast 100 failures when meta-openembedded

Ah, you want that for other layers.

> is considered too
> errors server has unfortunately dropped the build where it was reported but
> here is list if you are interested
>...

That's from a testbuild last year?

Some of these were already fixed in master by upgrading to the latest 
upstream (e.g. flashrom or mc).

cu
Adrian

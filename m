Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.24739.1589732086504304912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 09:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=X9ReM5iz;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q6fq0Crsz2W;
	Sun, 17 May 2020 18:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589732084;
	bh=fIyTSGd4GluynyWPsM8QPcIzcoxYu1h781X6Nl8PB+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9ReM5izI7SKdyxpE+t59Ql6XCVayrN+HzmJrNtReI1NbC5TYvHxqq97yegZuKsLA
	 gza0WJBFhlqO3znG1LEBqqyO3+dVzSFQtrteA0PpkLWK2ECH8GfriArXhDsaM99y7s
	 UFQUCmQvLfbBB6szWPVmTwArQ67R7b5FHvk2cAOY6lhhjlA1sF5KSkBwxBuJb2wTVu
	 McPf+Ev92Ir2McR7gBR4YhBJz9llIGu5dEBxvwHDXsPOGDzWRSw4OKdHgZ768EEJeo
	 cbjnrD+qSCmxgTPRMIcsDzYxvlZ0W8T5KCKgwcB6ldYYG3OuLz87E4flrSrY+lZqOV
	 uA2INwiREVVQ0bCzR51psw2gE8UDEPe9GETcB+qpERHmHe3/TSYXKDmtFqGlqknA1P
	 T/H6frDibVEvrxpnUykRJpNcXLyHJenY1wJF6sBJva7vlZPOQue2XWjWlUc1JNCtU6
	 9GELEZMs00Z25g63H6oNvpoy5TEqb8GH+cqajUfSxdXIN+rvpHCCWgSr1WZVlhYOHX
	 8gOs6iIMhyZt5YQ9ZGUNmEHRjcBwh1NTYCp4FS55T+hl3An3k+T2b0XyewAf878MEW
	 nD7jUPMo3YWRZRCZhAPsuvR8rpYoYNdVczXMFcmiFqz0WK4mvUGT0B4j4tOUWryEo2
	 yyRlsUPzu+FfeGitYwr7Xw2o=
Date: Sun, 17 May 2020 19:14:41 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Steve Sakoman <sakoman@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200517161441.GB16162@localhost>
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost>
 <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 17, 2020 at 06:00:58PM +0200, Martin Jansa wrote:
>...
> But IMHO carrying duplicate recipes in oe-core and meta-oe, just because
> some users aren't updating meta-oe, only adds more confusion.
>...

IMHO moving recipes from meta-openembedded (or other layers) to oe-core 
in a released stable series is not a good idea.

> Cheers,

cu
Adrian

Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2B53E603FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 12:18:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46LFkh5jXmz2Y;
	Sat, 31 Aug 2019 14:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567253933;
	bh=m3/w9xc/VQt3ejOiWjw0ZLPGiwyGT73MAF8xxmMGzz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXJHjdsfTehj0oWg6A5fetsO76bJmTm/8B/6oOt6ZScfuL91oUd8Qgus/z5f2kltx
	ZFWwc8mXrHe2s6cnlRVsZL59mgHzwBfaHR0EFhKFI6l0WYU9xrDj/F3P0cuefy+0xn
	dzkF9dIUwZUork2LcyACi3nfQi5C9Ye7OIvyZB+mUZhecMe/2a4VHUc5h6Y5WSwscs
	Bg4CdbNysiG4AIhArqOi43xpxNqpgfANyg0pC5Ozvvj9BIqMG0nWFUn53gBCaxbThz
	+GgmZSkZswyGIo7SACq4WuYAtzkDOl2OKMyzG2tTdG0fsyKCwDS5iCIxhVID0BHqsB
	/KQLtagzkN8zIdZxwaCpzgQHnq5swtTkzrAHlKGx0L13kUTWQo9IxL9H96d4KQaHX/
	Z/+YbStL0sH32/fN3Uh7SdeZx8Iuizp1HBqpk36pS7UGdJqk2NUX4ietfgG66rZvx2
	ZSoeeqWBfvU4AEzeUxL++Uch4L3EsZWcB7c4ya35xNzBmCt7ssau2ReG/bNOGN44Kh
	0hntmqzMXHuJYrYV59d8WKLGLo7JFawedHrMeT9zcRiQq24mJZAtVaZsrfexkLPhr2
	1M4SPHbmQR6tSwwrlMVQI2qCVf+CrB9JUaT2jzwoUN3EcpZClLF12BYsJ8DAjgzrZd
	BkGnF0Ja14ic6fY12Kl6g4mM=
Date: Sat, 31 Aug 2019 15:18:50 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190831121850.GA4729@localhost>
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 12:18:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 30, 2019 at 07:40:51AM -0700, Andre McCurdy wrote:
> On Fri, Aug 30, 2019 at 3:08 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>...
> > This patch would also break several other recipes which are using
> > appends to FETCHCMD, for example for FETCHCMD_wget the libedit would
> > fail since it appends the wget to use different User-Agent.
> >
> > I've copied Raj here since he introduced this recipe in the form it is
> > and would definitely break.
> >
> > Can you please have a look at this and advise on how one can continue
> > to use the FETCHCMD appends for the future?
> 
> One answer could be that modifications of the fetcher command lines
> should be done by completely defining them rather than appending. I'm
> not sure how reasonable that is though.
> 
> In the end the approach to fixing this depends on whether appending to
> the default fetcher commands is considered valid usage or not... and I
> don't know the answer to that.
>...

Disallowing appends could cause huge problems for a user or layer that 
has to append local options (e.g. proxy) building a recipe like libedit 
that has to change the User-Agent.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



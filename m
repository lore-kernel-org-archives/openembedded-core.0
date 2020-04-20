Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.3605.1587394339743330261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 07:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=P17QW5z+;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=b06j=6e=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 495V656Xk6z5Q;
	Mon, 20 Apr 2020 16:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1587394336;
	bh=tiUeIRrpQgd5ARX6sTlTCKj3HwBbPYwOpmd35Q5GRLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P17QW5z+5zmLohEt+tApMfgoginqCInUBo6gF9qeA4d8fmFH8DdTUb5Iw/U4HmiAb
	 bQj8qNYUOJm0L3OH2zVjBdasp41dLJ0pMxs1pGvvSkUX1TAvQT72BYGeFRjY8kky17
	 FboqNqVPiQJnqzrGFSBA9FAOjXPkM6U9cM5424QJDC5uljaimYbqnrSTwft818Yq4j
	 jX5PLgE1VqsdHGb1X7MCfPHTR9OECngNd6CczAfQeGpMjYhFOz0t7lvBKRvR9DM+iF
	 3HyEeBYGidNYbHpBpdELiNWVM0ULnS8+pUKszCWu/A9tmCR/uLiOzoqd3pn/s20S90
	 b6CubikUzUR7XCQzrL+SOmoZduKi94asPbsuuQsTbXcsVy4Q5Q4uPt0sXX5Nd8jxC4
	 kf6X/wHSao1vqhsxY9VQesYujE1GFg4Q60+rgqA1AHzE6sMW1x/r+MWNRuKagALYWr
	 YLe1NTLo39Hv0/UAO/pgNnrKCecz5hV9tJds4b9EyVhUvUX9yNTnejPh/QPR/5jDzt
	 sMg5o9+AzUtsYgQ9YIUqPlCaWKavDlwFhjiIcBxqIA/nhh1iO9girNm/OcphQ27dhL
	 BO6cJQ4Xd1xcUbdzgYX2+hDsXlvfM89Z4bTRvun4iB/oc1mtMEG9Xpbys79l3zDi02
	 k3LR6X8UhrYwOSiZhqgzpQ1A=
Date: Mon, 20 Apr 2020 17:52:11 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: chris.laplante@agilent.com, Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
Message-ID: <20200420145211.GA2315@localhost>
References: <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Apr 19, 2020 at 11:15:55PM +0100, Richard Purdie wrote:
> On Sun, 2020-04-19 at 21:58 +0000, Chris Laplante via
> lists.openembedded.org wrote:
> > One possible work around which I'm using for some prebuilt native
> > binaries is to call them with hosts loader (e.g. /lib32/ld-linux.so.2 
> > ${STAGING_BINDIR_NATIVE}/my-tool params)
> >  
> > Ooh, nice. Thanks for the tip! Definitely curious about a longer-term 
> > workaround but this is good for the short term.  
> 
> I suspect uninative assumes all binaries are for the main system
> architecture so its probably trying to change the interpreter to a 64
> bit one which clearly won't work in this case.
> 
> It would be a question of stopping it for these binaries somehow...

uninative is default but optional, would
  INHERIT_remove = "uninative"
solve this problem?

> Cheers,
> 
> Richard

cu
Adrian

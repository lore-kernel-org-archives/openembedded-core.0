Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.24240.1589730335232043764
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 08:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ntyRkGD3;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q6135d2lz2W;
	Sun, 17 May 2020 17:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589730331;
	bh=p9aAJY7Tz7425HOfkyEuhGj62zK3cM2SUOMG83y56LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntyRkGD3BlciEnzEtuBeo9KBjxzo4Q+5ur0YwRtm8kp5nXF05AEXWP/FBi9jJbtj/
	 m3aeiXAD7L7wMyZS0Vhodlc/Ap5WBe++GxbyqSUl4D7qVIhxgXagaK2pq9UGUbeH8Q
	 UVL/6vVVRo1ECl1TJguRCoXb6Km4w55zQypJrkKhNZ0BMaSdTgT6Dpu1KerNMpBwl9
	 sfjjeLo4VPouUktZY5pMpAEuDXx+wXWnIF9ck7SZRbZTk+gS23OlpY51us4CXDYrV3
	 5YQEpG/ojtV46LcJkFj58VjFv8mxO4cNKcUtaQfkzNe7sC7HHPPhc1SlZ7G7K2Ed99
	 CNnMth47qxoNwsaGDsFpsjGkynPByqU5tQ7CvXDGLDgC3Sw7SY+0JF45qDSQa6v8sc
	 PU9RAqf8crEUiBdI5C6swkNGH+8CIgJLTtqa+dScrkz8CbMLIl0MKSpNE4OkF46jt9
	 lmaQGyAUqvjqN498et0IIKwqSwmzfgj9jW0HLnrPJ/HgQbA3cMrdQfc3szFq7FUhh4
	 1t4+4SI3jLiK3PZ9REClQxwf54doszoA5N4RdyHaLag7OTvCGuvJMI78vrlYe5k6jF
	 wAbGvxqmQpkJzEaoy/lG7/ELH5RArGpoPPg8JxWbjOS61iaEoGOOcGvhKiw6Wjnf9m
	 z0krBP+jv3m+Px16QP1Iaeiw=
Date: Sun, 17 May 2020 18:45:25 +0300
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
Message-ID: <20200517154525.GA16162@localhost>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
 <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 17, 2020 at 03:56:20PM +0200, Martin Jansa wrote:
>...
> so upgrading
> from e.g. initial release revision of dunfell to latest in oe-core together
> with all other layers,
>...

Your "together" is an assumption that is not always true in my experience.

> Point releases are nice, but people should really use whatever is latest
> revisions in the branches they use and that's IMHO the recommendation from
> Yocto Project itself as well (IIRC we discussed it in OE TSC when talking
> about tags for point releases).

What often strikes me about OE/Yocto is how far apart what developer 
think how things should be done is from what users are actually doing.

Yocto lacks novice level documentation how users should maintain
a distribution they got from somewhere for building a product.

> Regards,

cu
Adrian

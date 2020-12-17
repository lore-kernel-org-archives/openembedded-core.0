Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.1907.1608170315353656495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 17:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Au7aJPFX;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Subject: Re: [OE-core] [meta-oe][PATCH v4] iproute2: split ip to individual package
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608170314;
	bh=P+EiY4N9mGR6+BBVYEhpPHseK6qFgom7X9+ZK1ucGIM=;
	h=To:References:From:Date:In-Reply-To:From;
	b=Au7aJPFXWEFrYZtEFGJYK3NWFPe2UQpq8HqJzJkf+12DmanxJ83190FbdvxyDAq8E
	 f+o8/i1qLa5PLK+Sjnqqs2V2JqumO+p6hljXyjXwgHf1XqWT2zGJZLrX6DLUCd6usm
	 x3yile1oAcvEiE08vOy6HoGk1mPMXxENflb28nt+PbwJzcCyQe1rZufxr1Fvvcta64
	 duQa1d/7+LqQ5AZd3103fgecrQE+U8C8fXpPX/2pRFmuNjp1Vhi3b2cBI8xK4g24g4
	 KTnitjJ6cDRS+Bc3CtQBMI44UdcJPlBk6rzXWL6DtrAmPhLUI4JlI06ZGrDy368Oh1
	 xU9ehvsjSn9BA==
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20201216175021.18813-1-okaya@kernel.org>
 <c140c451791b4523b97df878f492fba8@XBOX03.axis.com>
 <998de3f5-13a8-6a77-903b-172d4c542309@kernel.org>
 <c3075328cf4d45ecb2ae76bdbeeae4cc@XBOX03.axis.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <b0203c25-a954-795e-406c-d46f503c9efa@kernel.org>
Date: Wed, 16 Dec 2020 20:58:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <c3075328cf4d45ecb2ae76bdbeeae4cc@XBOX03.axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/16/2020 8:20 PM, Peter Kjellerstedt wrote:
>> I do something very similar in my bbappend now. On the other hand, we
>> have an upstream first principle in the company. I would rather try to
>> find an upstream friendly solution that works for everybody without
>> breaking existing users before falling back to bbappend route that I
>> need to maintain forever.
> Well, the problem as I see it is that some of these changes are pretty 
> invasive to the recipes. And when most seem fine with them as they are 
> (based on the fact that there has not been any push to split any of 
> them before AFAIK), the value of these changes are questionable, given 
> that more complicated recipes increase the maintenance burden. 
> 

The counter argument is that a user should not be required to rework a
recipe in bbappend for common tools that everybody uses the same way.

If I was doing something special for my target, it has no business in
upstream recipe.

Requesting to have the ip tool out of iproute2 package is a no-brainer
IMO and should be supported by default.

I can also go ahead and say that ip tool probably is the most important
tool in this package and is actually disappointing to see that it has
not been brought out either by PACKAGECONFIG or PACKAGE options. I
honestly don't care about the rest of the tools in that package.

At the end of the day, there is room for improvement in the recipe.
Whether we can do it safely or not is for reviewers to help here.

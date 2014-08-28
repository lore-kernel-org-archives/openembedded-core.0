Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 35C066FA94;
	Thu, 28 Aug 2014 07:48:50 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id rd3so1507405pab.3
	for <multiple recipients>; Thu, 28 Aug 2014 00:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qimw+gLR1Lo62EpxymIOMLwqELh6qg/l7fjz7mZDlds=;
	b=oK0Plhyk0Oz8QdXI+UOIHckg89VvUNH7rjg/5ZNkV7S0q60NK5WxD4HJo/M4hc7kIS
	3MfkiaQDWhVHGA+0aRxNJxCFahiS7NexB+TSXL+D/9jH22DPtScfaJrECnOnTrMoXpIt
	lIf4qaV1VHlLgS+GwOHbmZERe+AatKzsPQSyaYZSlNsUOfkzj5ErtCqRzd72h9JP20V8
	hhV5O9IhMI/6oV+e/sPqfNCv0PKSCRyHr6LtGQzwWSOJ0cTHfnZOr+j9vtJ0QqEi1qDK
	Rtpx7RsOnlHjnZXZG0Ow4N2FenwDTwWxkKLdN++axRHdO0wvn6qHzuds7RgJkczv+Rlz
	8svQ==
X-Received: by 10.66.174.17 with SMTP id bo17mr3167269pac.98.1409212130541;
	Thu, 28 Aug 2014 00:48:50 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id sf1sm2741570pbb.0.2014.08.28.00.48.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Aug 2014 00:48:49 -0700 (PDT)
Date: Thu, 28 Aug 2014 00:52:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140828075229.GI13139@haswell>
References: <20140828064051.GA13139@haswell> <1409210337.29296.131.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1409210337.29296.131.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Thu, 28 Aug 2014 07:48:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-28 08:18:57, Richard Purdie wrote:
> On Wed, 2014-08-27 at 23:41 -0700, Khem Raj wrote:
> > Hi All
> > 
> > As we all know eglibc has been merged back into glibc and 2.19 was the
> > last release, here I have put together the recipes for upcoming glibc
> > 2.20 release and removed eglibc 2.19 in favor of move.
> > 
> > I also thought about leaving eglibc in there but then eglibc and glibc
> > were pretty much same as they always have been that it would be an
> > incremental change with lot more patches this time.
> > 
> > The tree is here
> > 
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-to-glibc-2.20
> > 
> > This has not recieved much testing yet and I am looking out for helping
> > hands here, so try it out in your buid environments and machines of
> > interest and report back on issues.
> > 
> > The patches also forward port the options group support and few other
> > patches from eglibc, details are in commit logs, which I think would make 
> > good candidates for future glibc merge.
> > 
> > This tree will be reworked and rebased so sync back if you see issues
> > which we will address here
> > 
> > Thanks for your help
> 
> Thanks for doing this Khem, its quite some work and much appreciated!
> 
> Just to be clear, what is the intent here? Is it intended to get this
> into 1.7 or is this 1.8 material at this point? We're effectively past
> the toolchain freeze point for 1.7, just about at complete feature
> freeze but I'd like to make sure we're thinking the same things.

I am targetting for 1.7 thats why call for wider testing to expedite.  but it could only be decided with some level of
testing. I havent done enough of testing yet myself it to be sure but in coming few days, it
will be lot clear

But if it turns into major issues then we can wait for 1.8 but it will
be quite an effort to keep up with these patches over a long period of time.

> 
> I'm certainly happy to get this through the autobuilder and see what
> happens...
> 

yes, ceertainly would help. 

> Cheers,
> 
> Richard
> 


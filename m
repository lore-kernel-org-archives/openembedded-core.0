Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 91C0E6FE64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 01:15:25 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so19901468pab.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 18:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4E+21NJ7gOWuB6c/UGpnXwCRMYis4kpuoF+SmXu37oQ=;
	b=ueDNPs9juAFhUo5R9VOUXRY8ZqO9PFmwerHld6QZ47ythuSIFOx5sw82Mh8e2YxfU5
	Qe9tjl1LwUe92ALn5aCx10XyVH/DC4aoqBCc4JKdqy5Vr56tQ1jJaMgdI85pe8fFZAk4
	xZgtgVtfHvNtYvwdWMuJDvnl9Yf03KiOm8v0n5pFeHPXVn94nSYJ7I2X6IzE/cv7SMly
	9JXF0FzFDDyScz9Gf+IMK5HCQiVnSCjyuSpTEQCLd2I8KeE9yIGo1oBbTALudABFZpkn
	WVkCZVdiZsRLYyN/HbDZgwen5W5QsFTsaboCi3vRBSbYChKJmexUG0+Xm3AitSzx9jEj
	atHQ==
X-Received: by 10.68.139.99 with SMTP id qx3mr24012678pbb.75.1408929326668;
	Sun, 24 Aug 2014 18:15:26 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	ey1sm129845143pab.19.2014.08.24.18.15.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 18:15:26 -0700 (PDT)
Date: Sun, 24 Aug 2014 18:19:11 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140825011911.GA17537@haswell>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<8761hkpmx0.fsf@weregild.amer.corp.natinst.com>
	<1408783244.5457.10.camel@ted>
	<1911375.NGZ7NJg80z@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1911375.NGZ7NJg80z@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patch message guidelines and internal/corporate fields
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
X-List-Received-Date: Mon, 25 Aug 2014 01:15:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-24 16:33:39, Paul Eggleton wrote:
> On Saturday 23 August 2014 09:40:44 Richard Purdie wrote:
> > On Fri, 2014-08-22 at 10:24 -0500, Richard Tollerton wrote:
> > > Randy MacLeod <randy.macleod@windriver.com> writes:
> > > > Wind River patches used to include a "CQID" tag but we've changed
> > > > our process to avoid needing such internal tags. If National
> > > > Instruments can do so as well, that'd be best.
> > > > 
> > > > I did check my oe-core email list history and this seems like the
> > > > first patch from NI that has the tags included so I thought
> > > > I'd reply and see if we can get the tags dropped.
> > > 
> > > IIRC, we pinged Phil a few months ago on this topic, and he thought
> > > internal tags were OK. I think Wind River might have been cited as an
> > > example.
> > > 
> > > I see that
> > > http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines hasn't
> > > been updated with this requirement. Should it be? Will that require TSC
> > > approval?
> > 
> > I don't have a strong preference on this to be honest. I can imagine
> > cases where its useful to have some kind of tracking of issues into the
> > final commits.
> > 
> > Obviously it would be better if everyone can understand what the numbers
> > mean, equally, it seems pointless to force people to strip them when
> > they might be useful to people contributing to the project.
> > 
> > If they are used as a substitute for a good commit message, that
> > wouldn't be acceptable. Also, if they were taking over the commit
> > messages, that would able be unacceptable. So if we can keep them to a
> > small part of the commit, I'm prepared to let them pass but it can't be
> > at the expense of good commit messages.
> > 
> > I don't believe we need a TSC decision, that would only be needed if
> > there were strong disagreements we were unable to resolve and I don't
> > think we're quite there yet :) I'll let others comment though and see
> > where we're at.
> 
> FWIW I agree with all of the above - if they make contributors' lives easier 
> then I don't see a good reason to disallow their usage given we're only 
> talking about one line at the end of a proper commit message.

I would rather think that if the information is not accessible to community
members, its not a useful to add these numbers. Secondly it could be fixing
someone else's bug in a different bug tracking system with different
tracking number and if he she does a backport and adds his tracking
number as well to commit. Now think of what will happen if people start
to do it for Linux kernel. So IMHO its best that companies track it in
their respective issue tracking systems by adding upstream commit urls or SHA ids
whatever is convinient to support any automation tools they might
have(if any) That way we solve the problem for everyone. On
these grounds I would not recommend adding it in commit messages. We let Yocto
bugzilla entries in commits because that system is accessible to everyone using OE.

Thanks

-Khem



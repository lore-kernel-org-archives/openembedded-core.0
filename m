Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web08.20184.1611098036469136204
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 15:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.230.112])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 7B7AAA254A;
	Wed, 20 Jan 2021 12:13:52 +1300 (NZDT)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: luca.boccassi@gmail.com
Subject: Re: [OE-core] [PATCH v4] util-linux: split uuid in separate recipe to allow bootstrapping
Date: Wed, 20 Jan 2021 12:13:51 +1300
Message-ID: <2056926.Mh6RI2rZIc@linc>
In-Reply-To: <066f346a8d1c643650bf814cc3c18c363b820d5f.camel@linuxfoundation.org>
References: <20201123132823.3996355-1-luca.boccassi@gmail.com> <20201210184632.3448265-1-luca.boccassi@gmail.com> <066f346a8d1c643650bf814cc3c18c363b820d5f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Richard

On Wednesday, 20 January 2021 09:52:41 NZDT Richard Purdie wrote:
> I think the one remaining issue here is the need to change the DEPENDS
> of so many other recipes, likely not just here in this patch but in
> other layers. I think if util-linux DEPENDS on util-linux-uuid that
> might remove the need for those changes? That should still allow you to
> break the circular dependency problem?

I have to admit to a gap in my own knowledge of how our build system handles 
transitive dependencies. Of course the recipe sysroot should still get 
everything it needs in it even if the dependency is only indirectly included, 
in the back of my mind I have the impression that there are expectations that 
all dependencies are explicitly called out and there are subtle issues if they 
aren't, but that could be a mistaken impression on my part.
 
> I suspect libuuid should really be maintained/built as a separate
> software project given the dependency problems but that isn't my
> decision, we just have to deal with it.

I agree that it would be better being separate, FWIW.

> I am also worried this is going to break AUH and mean we have to
> manually handle this recipe but again, I suspect there is little to be
> done and we just have to deal with it.

Could we perhaps fix the AUH to handle this properly? Do we need some kind of 
mechanism to get it to always upgrade the two recipes together or is that only 
part of the issue?

Cheers
Paul



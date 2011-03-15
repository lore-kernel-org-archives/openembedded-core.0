Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pza2L-0002ri-GQ for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 20:36:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FJYNou023622;
	Tue, 15 Mar 2011 19:34:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23300-06; Tue, 15 Mar 2011 19:34:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FJYIVS023616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 19:34:18 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
In-Reply-To: <4D7FBDAB.7040501@linux.intel.com>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
	<4D7F9CC2.2030002@linux.intel.com>
	<AANLkTikC7yWvzTzf1Od2WLiBhQjz1iactGCaPCN+aAmR@mail.gmail.com>
	<1300213438.30423.1820.camel@rex>  <4D7FBDAB.7040501@linux.intel.com>
Date: Tue, 15 Mar 2011 19:34:08 +0000
Message-ID: <1300217648.30423.1837.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@beagleboard.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 19:36:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 12:27 -0700, Darren Hart wrote:
> 
> On 03/15/2011 11:23 AM, Richard Purdie wrote:
> > On Tue, 2011-03-15 at 10:24 -0700, Khem Raj wrote:
> >> On Tue, Mar 15, 2011 at 10:07 AM, Darren Hart<dvhart@linux.intel.com>  wrote:
> >>>
> >>> What are the ownership and perms on those?
> >>>
> >>> I suppose we could avoid the .pc directory - but it's going to require
> >>> something more than cp or some additional scripting. Something like tar's
> >>> exclude functionality might be needed - but I hate to add the intermediate
> >>> step as the kernel recipes are already so slow.
> >>
> >>
> >> hmmm I wonder why those are marked non readable in .pc directory  that
> >> seems wrong to me
> >
> > Its quilt that does this. Kind of annoying but its been doing that for a
> > few versions now...
> 
> I recall purging .pc for this reason (just in other development, outside 
> of poky).
> 
> I take it deleting .pc from the build dir would be bad as it would make 
> build/hack/build fail to work on the workdir tree. That leaves changing 
> the permissions and copying it, or just avoiding the copy. I'm leaning 
> towards avoiding the copy - but I hate to add a ton of scripting logic 
> in the copy, but that may be the best solution.

Can't you just do a "cp -r xxx/*" and if you need any . files "cp
xxx/.*" ?

Cheers,

Richard




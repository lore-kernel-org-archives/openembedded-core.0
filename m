Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPLOm-0007hx-RW for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 00:50:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JMbCbn010468;
	Fri, 19 Oct 2012 23:37:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06071-06; Fri, 19 Oct 2012 23:37:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JMaxw7010442
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 19 Oct 2012 23:37:00 +0100
Message-ID: <1350686218.2520.49.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Oct 2012 23:36:58 +0100
In-Reply-To: <20121019193829.GA29349@jama.jama.net>
References: <1350600718-3052-1-git-send-email-denis@denix.org>
	<20121019084432.GH3087@jama.jama.net>
	<20121019165616.GA27336@denix.org>
	<20121019193829.GA29349@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 22:50:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-19 at 21:38 +0200, Martin Jansa wrote:
> On Fri, Oct 19, 2012 at 12:56:16PM -0400, Denys Dmytriyenko wrote:
> > On Fri, Oct 19, 2012 at 10:44:32AM +0200, Martin Jansa wrote:
> > > On Thu, Oct 18, 2012 at 06:51:56PM -0400, Denys Dmytriyenko wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > 
> > > > The patchset adds 2 more standard tune files for the new ARM MPCore (multicore)
> > > > processors Cortex-A15 and Cortex-A7, as per:
> > > > 
> > > > http://www.arm.com/products/processors/cortex-a/cortex-a15.php
> > > > http://www.arm.com/products/processors/cortex-a/cortex-a7.php
> > > 
> > > Please check this patchset 
> > > http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030759.html
> > 
> > Yes, I've seen that patchset. Unfortunately it's still in the queue and is 
> > going through implementation iterations. Once it gets into OE-Core, I'd be 
> 
> Nobody commented on last iteration (except of acks from khem). So I
> don't plan to send another one.

It was made clear that we were concentrating on the release and these
were something we'd come back to afterwards. I also made it very clear
that I'm opposed to something that is repeatedly getting proposed here.
Lets just say it is unlikely I will simply change my mind if people keep
sending it.

I'm trying to get to the point of reviewing the patches that need
attention and give more constructive feedback having cleared the less
problematic ones out the way and shortened the backlog but I'm not there
yet. Ideally I'd like to take a break entirely but sadly that simply
isn't going to happen :(. I'll try and get to these as soon as I can but
there is a substantial queue. 

I'd also point out I'm getting considerable "feedback" as soon as
anything goes into master that destabilises the build so when anything
does merge, fixing fallout is taking priority too.

Cheers,

Richard





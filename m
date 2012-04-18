Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKS7B-0004mJ-Om for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 12:27:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IAITq5032691;
	Wed, 18 Apr 2012 11:18:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31095-10; Wed, 18 Apr 2012 11:18:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IAILYe032684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Apr 2012 11:18:23 +0100
Message-ID: <1334744304.24091.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Apr 2012 11:18:24 +0100
In-Reply-To: <818A5ABA-BD12-43CF-94FC-539A757435DD@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<818A5ABA-BD12-43CF-94FC-539A757435DD@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Branch/Release Naming
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
X-List-Received-Date: Wed, 18 Apr 2012 10:27:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 11:28 +0200, Koen Kooi wrote:
> Op 12 apr. 2012, om 11:02 heeft Richard Purdie het volgende geschreven:
> > Yes, there will be a branch created on OE-Core. 
> > 
> > At this point the actual branch naming/tagging is a little in flux.
> > There was some discussion about this at collaboration summit and the BSP
> > summit but there was no conclusion.
> > 
> > I've tried to write an email on the subject and it basically goes around
> > in circles. Ideally we need a scheme which can be used in all the layers
> > which doesn't contain numbers as these may conflict with various layer
> > schemes. The poky release names at least do that. Ideally people also
> > want something sortable with more context such as the year. Doing this
> > without numbers is harder.
> > 
> > I'm reluctant to change the numbering/branch scheme at this point in a
> > release as its unfair to release engineering and the documentation
> > maintainers.
> 
> Any update on this? I'd like to have the angstrom scripts and
> repositories ready before the end of the week and having some form of
> agreement on branch/tag naming would be awesome.

I've been giving this a lot of thought. Whilst I didn't say much in this
thread, I did read it and am considering everything that was said.

The most logical initial choice would be "yocto-project-1.2". I think
that real world use of it would cause several problems though. The
number in the name creates conflict for a start. If you want to release
version X of a BSP/Angstrom/OE-Core/Poky or even bitbake, figuring out
the relationship between 1.2 and the local release numbering is hard and
confusing. I don't really want to impose a unified numbering system with
the Yocto Project, particularly as many components have numbering
systems already.

I'm already conscious of the "When will there be a Yocto Project 2.0"
and I think these numbering schemes are artificial for that reason.
Also, Yocto Project is a trademark and I know there are discussions
going on at the moment about how/when it should be used and so on. I
can't imagine there being a problem in this area but we should really
let those discussions conclude which they have not as yet.

Finally, I think its unfair to pull the rug out from under release
engineering by changing things at this stage of a release.

So, I therefore want to continue to use codenames for the release
branches and this release will be "denzil".

The main downside to these codenames is the lack of sorting which I'm
going to categorize as unfortunate.

It therefore follows based off my comment above that tags will continue
to use the version scheme used by the specific projects. 

I am going to encourage "denzil" branches in repositories to show
compatibility and strongly recommend to the OE TSC that we have a denzil
branch in the OE-Core repository instead of 2012-1. Bitbake is the one
exception I'd make to the denzil branch naming scheme, not least as its
supposed to be backwards compatible and work anywhere so the branch
naming applies to metadata and not bitbake.

We can tag OE-Core as 2012-1 if so desired although I am starting to
dislike that version scheme for its bad handling of point releases (it
looks like a date). I guess that is a discussion for the next TSC
meeting.

So we have a decision, I'm not sure everyone will love this but such is
life.

Cheers,

Richard




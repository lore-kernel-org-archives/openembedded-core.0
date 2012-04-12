Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIG3v-0001ZQ-6R for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 11:11:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C928IM020034;
	Thu, 12 Apr 2012 10:02:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19488-06; Thu, 12 Apr 2012 10:02:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C920hF020027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Apr 2012 10:02:01 +0100
Message-ID: <1334221321.31685.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Julian Pidancet <julian.pidancet@gmail.com>
Date: Thu, 12 Apr 2012 10:02:01 +0100
In-Reply-To: <4F84D58F.8020608@gmail.com>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 09:11:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-11 at 01:51 +0100, Julian Pidancet wrote:
> On 04/09/12 19:01, Liu, Song wrote:
> > Hi all,
> > 
> > This is to restate and clarify the schedule for Yocto Project 1.2 M4 (milestone 4). If you are concerned or have patches you would like to merge, please see the following dates:
> > 
> > 1. RC3 official patch cut-off time: 12:00AM April 8th, 2012, PDT
> > 2. RC3 build: April 11th, 2012, PDT
> > 3. RC4 official patch cut-off time: 12:00AM April 15th, 2012, PDT
> > 4. RC4 build: April 18th, 2012, PDT
> > 5. YP 1.2 release: April 27th, 2012, PDT
> > 
> > You can also check out the schedule here: https://www.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23FFFFFF&src=mg0m150m30gs891eqqhtfu5jgg%40group.calendar.google.com&color=%238C500B&src=sc7rov4ck552t2f0pav120t7r0%40group.calendar.google.com&color=%23528800&src=theyoctoproject%40gmail.com&color=%23182C57&ctz=America%2FLos_Angeles 
> > 
> > Please feel free to let me and Beth know if you have any concerns or questions.
> > 
> > Thanks!
> > Song
> > PM, Yocto Project
> 
> Hi,
> 
> I don't see any commits tagged for these milestones in
> git.openembedded.org/openembedded-core at the moment. Will there be a
> release tag or a release branch created on the git repository when YP
> 1.2 comes out, to indicate people that there's a "stable" version of
> oe-core they can use ?

Yes, there will be a branch created on OE-Core. 

At this point the actual branch naming/tagging is a little in flux.
There was some discussion about this at collaboration summit and the BSP
summit but there was no conclusion.

I've tried to write an email on the subject and it basically goes around
in circles. Ideally we need a scheme which can be used in all the layers
which doesn't contain numbers as these may conflict with various layer
schemes. The poky release names at least do that. Ideally people also
want something sortable with more context such as the year. Doing this
without numbers is harder.

I'm reluctant to change the numbering/branch scheme at this point in a
release as its unfair to release engineering and the documentation
maintainers.

Its a hard problem...

Cheers,

Richard




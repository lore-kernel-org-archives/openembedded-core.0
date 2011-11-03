Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RM2rh-0004aR-O2 for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 20:22:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3JG6Y7031665;
	Thu, 3 Nov 2011 19:16:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30974-08; Thu,  3 Nov 2011 19:16:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3JFulq031659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Nov 2011 19:15:57 GMT
Message-ID: <1320347755.20107.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 19:15:55 +0000
In-Reply-To: <CADkTA4PyZ7r7aiGpENv1RSygtj-ni53XFOBPqOhETruUqem+Ew@mail.gmail.com>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
	<8B9E217B-2135-4E8D-9180-FAFD7E7478E0@dominion.thruhere.net>
	<CADkTA4PQspBbSFTVS9GZcGokvSR7zgyAqSq_kEE-EUqxpbfYQw@mail.gmail.com>
	<93B560B0-AFAE-4B57-B1A4-6516085B4E9E@dominion.thruhere.net>
	<CADkTA4PyZ7r7aiGpENv1RSygtj-ni53XFOBPqOhETruUqem+Ew@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 19:22:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-03 at 14:12 -0400, Bruce Ashfield wrote:
> On Thu, Nov 3, 2011 at 2:07 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 3 nov. 2011, om 18:53 heeft Bruce Ashfield het volgende geschreven:
> >
> >> On Thu, Nov 3, 2011 at 1:22 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>
> >>> Op 3 nov. 2011, om 18:11 heeft Bruce Ashfield het volgende geschreven:
> >>>
> >>>> Richard/Saul,
> >>>>
> >>>> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from TomZ.
> >>>> These are destined for master and separate from any point updates to the 1.1
> >>>> release.
> >>>>
> >>>> In case anyone cares my -dev kernel also has these changes, and it will take
> >>>> them to the latest kernel shortly.
> >>>>
> >>>> This also doesn't bump the preempt-rt branches, since they'll be updated
> >>>> to the new -rt first, before taking the 3.0.x stable updates.
> >>>>
> >>>> Built and booted for all the qemu targets.
> >>>>
> >>>> cc: Tom Zanussi <tom.zanussi@intel.com>
> >>>> cc: Darren Hart <dvhart@linux.intel.com>
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Bruce
> >>>>
> >>>> The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:
> >>>>
> >>>>  meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:28 +0000)
> >>>>
> >>>> are available in the git repository at:
> >>>>  git://git.pokylinux.org/poky-contrib zedd/kernel
> >>>>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >>>
> >>> Do you also have a tree against oe-core?
> >>
> >> I don't have a contrib branch, I asked a few week ago, but still don't have it
> >> created. So I have a tree, but no where to push submissions.
> >
> > Forking https://github.com/openembedded/oe-core is easy enough :)
> 
> Sure. But I dislike github in general (everyone has their preferences) and was
> trying to get a contrib branch. There's a myriad of machines I could use for it
> as well, but I see no reason for a contrib branch to be hard to get,
> so I'm waiting
> for the moment and focusing on getting some kernel work done.

I also have a dislike of github. Are you after access to
openembedded-core-contrib? I can sort that out...

Cheers,

Richard




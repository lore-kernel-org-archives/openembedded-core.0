Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rip02-0008Ee-Eg for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 16:13:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05F5dDd005940
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 15:05:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05894-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 15:05:35 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05F5XHD005934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 15:05:33 GMT
Message-ID: <1325775933.20759.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 15:05:33 +0000
In-Reply-To: <CADkTA4P9mPQXzXQq3-=t8ynv5U3so8Cc1+Wit4HC0JwU0d9ysA@mail.gmail.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<1325763002.20759.62.camel@ted>
	<CADkTA4P9mPQXzXQq3-=t8ynv5U3so8Cc1+Wit4HC0JwU0d9ysA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/28] Build Fixes and Updates
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
X-List-Received-Date: Thu, 05 Jan 2012 15:13:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 09:10 -0500, Bruce Ashfield wrote:
> On Thu, Jan 5, 2012 at 6:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2012-01-04 at 22:30 -0800, Saul Wold wrote:
> >> Richard,
> >>
> >> This is a set of changes that have been built and booted for
> >> sato. This address the failure we have seen on the Autobuilder,
> >> please check the master_under_test build currenly building.
> >>
> >> We have another kernel update from Bruce, with the sanity checks
> >> from Scott G. along with other change from the community.
> >> The matchbox changes make sense based on a better explaination
> >> from Edwin.
> >>
> >> Please review overall, but I am positive about this change set.
> >>
> >> Sau!
> >>
> >> The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:
> >>
> >>   valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)
> >>
> >> are available in the git repository at:
> >>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
> >>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> >>
> >> Bruce Ashfield (3):
> >>   kern-tools: import flexible branching support
> >>   linux-yocto: bump kernel version to v3.0.14
> >>   linux-yocto: use src_patches for out of tree kernel feature support
> >
> > These look related to the failures on the autobuilder so I didn't take
> > them.
> 
> The first one should fix errors with the the intel BSPs, I checked the
> autobuilder
> status, but didn't see the linux-yocto failures. Does someone have a link ?
> 
> The second two shouldn't have impacted anything, but I'll have a look if there's
> a link to share.

http://autobuilder.pokylinux.org:8010/builders/nightly-ppc/builds/210/steps/shell_67/logs/stdio
http://autobuilder.pokylinux.org:8010/builders/nightly-arm/builds/247/steps/shell_14/logs/stdio

Cheers,

Richard




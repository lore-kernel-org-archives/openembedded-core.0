Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwOdW-000285-8I for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 03:21:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1GlgR025635;
	Thu, 25 Aug 2011 02:16:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23761-09; Thu, 25 Aug 2011 02:16:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7P1Gacl025629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 25 Aug 2011 02:16:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4MRmsaUmC+B5WtxXETh7vAYVehK96H4KmKSgQSavgDkxA@mail.gmail.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
	<1314227326.5939.149.camel@rex>
	<CADkTA4Pvsk1jE+QXcRvLC4bSwH15XYkr=D_ZRR_5MOxLcFzBJg@mail.gmail.com>
	<CADkTA4MRmsaUmC+B5WtxXETh7vAYVehK96H4KmKSgQSavgDkxA@mail.gmail.com>
Date: Wed, 24 Aug 2011 18:16:35 -0700
Message-ID: <1314234995.5939.160.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated kernel pull request
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
X-List-Received-Date: Thu, 25 Aug 2011 01:21:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-24 at 19:29 -0400, Bruce Ashfield wrote:
> On Wed, Aug 24, 2011 at 7:21 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Wed, Aug 24, 2011 at 7:08 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> Hi Bruce,
> >>
> >> On Wed, 2011-08-24 at 16:50 -0400, Bruce Ashfield wrote:
> >>> Here's a consolidated kernel pull request that fixes a series
> >>> of bugs that have been around for a while and fixes some of the
> >>> remaining issues from the -rt work that completed last week.
> >>>
> >>> Darren: I also updated the -rt source revs and recipe with some
> >>> streamlining that builds on top of changse that merged last week.
> >>>
> >>> The patches have the details of the bugs and fixes.
> >>>
> >>> cc: Darren Hart <dvhart@linux.intel.com>
> >>>
> >>> The following changes since commit f852199ff598069bbecad4146f13377753df1648:
> >>>
> >>>   linux-yocto: update meta SRCREVs for beagleboard config changes (2011-08-24 16:29:22 -0400)
> >>>
> >>> are available in the git repository at:
> >>>   git://git.pokylinux.org/poky-contrib kernel-oe
> >>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> >>>
> >>> Bruce Ashfield (4):
> >>>   kern-tools: allow flexible branch points
> >>>   linux-yocto-rt: update qemuppc support and streamline variables
> >>>   linux-yocto: update machines and default configuration
> >>>   linux-yocto/2.6.37: apmd + get time of day fixes
> >>
> >> I took the first two of these. The other two didn't apply and I didn't
> >> feel happy taking them. I tried to look at the git tree above and I
> >> couldn't see the patches there...
> >
> > Really ? That strange .. how could they not apply, they were stacked
> > and pushed on top of an up to date master. Which part rejected ?
> >
> > I'll re-push and see what's up.
> 
> Heh. Operator error.  I did this:
> 
>    git push ssh://git@git.pokylinux.org/poky-contrib kernel-oe:kernel-oe
> 
> and generated the pull request against zedd/kernel-oe, which is
> largely fine, but
> I had one more patch in the stack.
> 
> I've now pushed to zedd/kernel-oe and everything is there. Let me know if you
> want anything resent.
> 
> The following changes since commit f8cddd74574756174a82c856cecdeb6f83b9dea5:
> 
>   mpc8315e-rdb: add kernel modules to rootfs (2011-08-23 20:45:07 -0700)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> 
> Bruce Ashfield (5):
>   linux-yocto: update meta SRCREVs for beagleboard config changes
>   kern-tools: allow flexible branch points
>   linux-yocto-rt: update qemuppc support and streamline variables
>   linux-yocto: update machines and default configuration
>   linux-yocto/2.6.37: apmd + get time of day fixes

Thanks, merged to master :)

Cheers,

Richard




Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 462D27299C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:00:11 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIL00KN75SAPJF0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Jan 2015 10:00:11 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
	a=ag1SF4gXAAAA:8 a=AXnfEkwIGC-3M8bpXcYA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7E88C2018E; Thu,
	22 Jan 2015 11:00:10 -0500 (EST)
Date: Thu, 22 Jan 2015 11:00:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20150122160010.GQ20639@denix.org>
References: <CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
	<CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
	<20150122145715.GO20639@denix.org>
	<CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
	<20150122151742.GP20639@denix.org>
	<CAP9ODKqeEKQiPzj3Os1Ps=+5xLk10i=g6gSmqDhHyyZ3+yMjrQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKqeEKQiPzj3Os1Ps=+5xLk10i=g6gSmqDhHyyZ3+yMjrQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 16:00:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 22, 2015 at 01:40:43PM -0200, Otavio Salvador wrote:
> On Thu, Jan 22, 2015 at 1:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Thu, Jan 22, 2015 at 03:02:06PM +0000, Burton, Ross wrote:
> >> On 22 January 2015 at 14:57, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> > Please note that he's talking about current 2014.07 version, not the
> >> > update!
> >> > Can you confirm that it works or fails on the autobuilder?
> >> >
> >>
> >> Sorry, got lost in the thread.  The old version works fine, the upgrade
> >> breaks.
> >
> > That's not the case for the rest of us, unfortunately...
> >
> > I'm suspecting sstate got something to do with the fact that it still works
> > for the old version on autobuilder.
> >
> >
> > Let me emphasise it - this specific u-boot-fw-utils-cross recipe used to
> > build fine, but now fails in the same exact way regardless of the version,
> > either current 2014.07 or the updated 2015.01.
> >
> > So, it seems to me that fixing it is rather out of scope of this version
> > update patch... :)
> >
> > I'm thinking of 2 short-term workarounds - don't update this particular recipe
> > to the new version; or remove it altogether. I'm sure Otavio wouldn't be happy
> > either way, but fixing it should probably be a separate effort...
> 
> We should have denied the update on previous versions. It has been
> broken by your update to 2014.07:
> 
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Tue Sep 16 19:10:01 2014 -0400
> 
>     u-boot: update to version 2014.07
> 
>     u-boot doesn't really support building its tools for the target, as they are
>     built with HOSTCC compiler, which is also used to compile fixdep utility
>     that gets executed during the build. Since it might be beneficial to have a
>     target version of mkimage, let's hack it to build fixdep in a separate step.
> 
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> and this has not been checked if it kept building at that time.

Yes, it was building that time! And Ross has proof of that with autobuilder 
logs. He wouldn't have accepted it if autobuilder was breaking. It was 
breaking on another recipe and I fixed that. But fw-utils-cross was fine.


> So I'm ok with this update to go and you work in fix it in a follow up
> patch, but drop it is not acceptable. It has a clear use case.

If it has such a clear use case, how do you use it when it's broken?

-- 
Denys


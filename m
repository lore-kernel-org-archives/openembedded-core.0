Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 41AFC60DF7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 02:08:24 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s7628PHd007231; Tue, 5 Aug 2014 21:08:25 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014080521082522-687319 ;
	Tue, 5 Aug 2014 21:08:25 -0500 
Date: Tue, 5 Aug 2014 21:08:04 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20140806020804.GA16858@bshelton-desktop>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>
	<53E129D4.3050402@windriver.com>
	<CAP9ODKqt79-1XkYDi01Wn-ZT5f13e4s=BhF08=zj8B==Hcjkpg@mail.gmail.com>
	<53E14013.1000301@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53E14013.1000301@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/05/2014 09:08:25 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 08/05/2014 09:08:25 PM,
	Serialize complete at 08/05/2014 09:08:25 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.27,
	0.0.0000
	definitions=2014-08-06_01:2014-08-05, 2014-08-06,
	1970-01-01 signatures=0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Wed, 06 Aug 2014 02:08:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08/05, Randy MacLeod wrote:
> On 14-08-05 04:09 PM, Otavio Salvador wrote:
> >On Tue, Aug 5, 2014 at 4:00 PM, Randy MacLeod
> ><randy.macleod@windriver.com> wrote:
> >>On 14-08-04 02:40 PM, Ben Shelton wrote:
> >>>
> >>>From: Richard Tollerton <rich.tollerton@ni.com>
> >>>
> >>>$DEVCACHE is observed to be 100k uncompressed; compressing it reduces
> >>>its size to ~5k.
> >>>
> >>>Natinst-Rally-ID: TA44427
> >>>Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> >>>Natinst-ReviewBoard-ID: 58620
> >>
> >>
> >>
> >>This is a good series of patches; thanks for sending them.
> >>
> >>It would be nice if you could remove your company's ID tags
> >>from the commit log. For example, you create and use could use
> >>a YP bugzilla ID ( https://bugzilla.yoctoproject.org/ ) and
> >>then match that up in your internal process.
> >
> >I don't think we should ask for this. I saw several of us to include
> >Id tags in past commits (I also did) and I think it is fine. We
> >shouldn't ask an extra step for people to be able to track it (open a
> >YP bugzilla ID issue for example).
> >
> 
> Wind River patches used to include a "CQID" tag but we've changed
> our process to avoid needing such internal tags. If National
> Instruments can do so as well, that'd be best.
> 
> I did check my oe-core email list history and this seems like the
> first patch from NI that has the tags included so I thought
> I'd reply and see if we can get the tags dropped.
> 
> Ben, what's the story?

In the past, I've stripped the tags before posting the patches.  Looks
like I forgot this time -- I'll remove the tags when I submit v2 of the
patch set.

Thanks,
Ben

> 
> -- 
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350


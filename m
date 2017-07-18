Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 51AB477F85;
	Tue, 18 Jul 2017 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EC41820AB4;
	Tue, 18 Jul 2017 18:54:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EMnfYLOPUjD5; Tue, 18 Jul 2017 18:54:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B0D8D20064;
	Tue, 18 Jul 2017 18:54:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 498DF162534; Tue, 18 Jul 2017 14:54:41 -0400 (EDT)
Date: Tue, 18 Jul 2017 14:54:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170718185441.GR26405@denix.org>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
	<CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
	<a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
	<CAJTo0LYV+oyEwE15JQ7+wyRAAWFqorcrAcCRGZOqLdoyY40w_g@mail.gmail.com>
	<dc06c161-4226-aae8-963b-87090202913e@windriver.com>
	<CAMKF1spYtmTfAw8aaayFkKbU1eJA2cdgqQX7qAH_VBuMu0FX5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spYtmTfAw8aaayFkKbU1eJA2cdgqQX7qAH_VBuMu0FX5g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-architecture@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Tue, 18 Jul 2017 18:54:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 15, 2017 at 06:13:55AM -0700, Khem Raj wrote:
> On Thu, Jul 13, 2017 at 3:03 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> >
> >
> > On 07/13/2017 05:50 PM, Burton, Ross wrote:
> >>
> >>
> >> On 13 July 2017 at 03:51, Robert Yang <liezhi.yang@windriver.com
> >> <mailto:liezhi.yang@windriver.com>> wrote:
> >>
> >>     BTW, I sent a meta-gplv2 patch to poky@yoctoproject.org
> >>     <mailto:poky@yoctoproject.org> two days ago, but
> >>     I didn't find it in poky@yoctoproject.org
> >> <mailto:poky@yoctoproject.org>,
> >>     Ross, did you see it, please ?
> >>     Maybe I should send it again.
> >>
> >>
> >> The list is yocto@yoctoproject.org <mailto:yocto@yoctoproject.org>.
> >> Please
> >> resend to the list.
> >
> >
> > Sorry, I had sent it to yocto@lists.yoctoproject.org which is from README,
> > but
> > I didn't get it in my mailing list, and I resent it to
> > yocto@yoctoproject.org
> > just now, I got it, should we update README, please ?
> 
> now meta-intel stepped ahead by applying the patch where as OE-Core
> does not (yet)
> have this patch applied. meta-intel should have waited for this patch
> to land in master.

Should this kind of behavior be addressed by BSP Guidelines and the Yocto 
Project Compatible 2.0 requirements?

Also, which BSPs are enabled on the OE-Core autobuilder by default?

-- 
Denys


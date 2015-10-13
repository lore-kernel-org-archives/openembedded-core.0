Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB88E73710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 20:43:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9DKhjcq015740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Oct 2015 13:43:45 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 13:43:45 -0700
To: Tom King <ka6sox@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20150907151449.GB2457@jama> <20150918173055.GB2385@jama>
	<CAHQecY67ET70Gz30Hunm6CFiuV4uw5By-M+2WUK1dstyz9_UFw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <561D6D00.4050702@windriver.com>
Date: Tue, 13 Oct 2015 16:43:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAHQecY67ET70Gz30Hunm6CFiuV4uw5By-M+2WUK1dstyz9_UFw@mail.gmail.com>
X-Originating-IP: [128.224.56.84]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: World builds HW Was: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Tue, 13 Oct 2015 20:43:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-18 01:56 PM, Tom King wrote:
> Martin, Randy et.al <http://et.al>.:
>
> I'm moving around things such that I can give Martin a full builder:
>
> 24Cores, 256GB RAM,  up to 3TB storage from the donation that HP made to
> WebOS-Ports (as I consider it essential to webOS-Ports that OE has a
> strong foundation)
>
> Tom

Thanks Tom.
I'm back from vacation, cleaning up old emails.

Did the upgrade help Martin?
Do you need additional systems?

../Randy
>
> On Fri, Sep 18, 2015 at 10:30 AM, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     On Fri, Sep 18, 2015 at 12:24:00PM -0400, Randy MacLeod wrote:
>      > On 2015-09-07 11:14 AM, Martin Jansa wrote:
>      > > Full jenkins build test takes over 3 days (depending on sstate
>     reuse,
>      > > one MACHINE can take more than 24 hours), so if I add them to
>      > > master-next after it's merged to oe-core it will take 3-6 days to
>      > > build-test them (6 days if they are sent just after current
>     queue is
>      > > sent for build).
>      >
>      > Hi Martin,
>
>     Hi Randy,
>
>      > Replying privately but you can add the list back in your
>      > reply if you like.
>
>     OK, adding both MLs
>
>      > I never build all of meta-oe but a day seems like a long time.
>      > On a 3-4 year old 24 core system, with 64 GB RAM and
>      > 2 large disks, I build oe-core + a whitelist of meta-oe + misc
>     layers in
>      > 5 hours using 18.3 of the 24 cores on average.
>      > What are the specs of your build machine?
>
>     It's one of VMs running on box donated by HP to webos-ports project. It
>     has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow IO
>     which we try to compensate a bit by using tmpfs for TMPDIR, VM has 80G
>     RAM, so I'm using 72G for tmpfs.
>
>     Tom: please fill-in the gaps, I don't know any details about the real HW
>     it's running on.
>
>     The same machine is also running some webos-ports builds sometimes.
>
>     BUT be aware that my world build is much bigger than what you're
>     probably building and changes in oe-core almost always ensure very low
>     sstate reuse.
>
>     e.g. last build with only small oe-core upgrade since previous build:
>     NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn't need
>     to be rerun and 33 failed.
>     NOTE: Build completion summary:
>     NOTE:   do_populate_sysroot: 21% sstate reuse (485 setscene, 1750
>     scratch)
>     NOTE:   do_package_qa: 12% sstate reuse (262 setscene, 1760 scratch)
>     NOTE:   do_package: 4% sstate reuse (76 setscene, 1750 scratch)
>     NOTE:   do_packagedata: 13% sstate reuse (281 setscene, 1750 scratch)
>     NOTE:   do_package_write_ipk: 12% sstate reuse (262 setscene, 1756
>     scratch)
>     NOTE:   do_populate_lic: 22% sstate reuse (521 setscene, 1806 scratch)
>
>     real    1485m40.070s
>     user    4166m49.125s
>     sys     2825m50.068s
>
>     BTW: you can see all this information in the world logs I'm sending
>     to MLs
>     (but not all the builds make it to ML report).
>
>      > A decent build box these days has 32+ cores, 64+ GB RAM  and
>      > and SSD or RAID disk filesystem. The costs of such a system
>      > are significant but worth it given the number of people's time
>      > involved in meta-oe.
>
>     That's true, but I have to do with what I have available :).
>
>      > Also, it would be nice if OE had a few such machines each
>      > working on builds for a MACHINE to reduce your turn-around
>      > to more like a day or so. :)
>
>     Yes, it would be nice, I'm trying to get Tom King to set another VM like
>     this in another location (another HP donated server), hopefully he will
>     finish it soon.
>
>     It's all hosted together with OE infrastructure, bandwidth is
>     limited, but
>     all I need for these builds is to fetch sources and upload the logs,
>     there
>     are no package feeds or sstate from these builds usable outside, but
>     now it
>     rsync the downloaded sources to sources.openembedded.org
>     <http://sources.openembedded.org>
>
>     If you know about some idling build servers, I would like to give them
>     something to do :).
>
>     Regards,
>
>     --
>     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


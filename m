Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B025E788C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91A0020A8A;
	Fri, 23 Mar 2018 21:19:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1Wcgmg1CrfWN; Fri, 23 Mar 2018 21:19:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F10EA20A41;
	Fri, 23 Mar 2018 21:19:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 59655163395; Fri, 23 Mar 2018 17:19:45 -0400 (EDT)
Date: Fri, 23 Mar 2018 17:19:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180323211945.GF2786@denix.org>
References: <EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
	<CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
	<CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
	<2be633e3-4845-fe97-07fe-dbf12beaf9d4@gmail.com>
	<EBAEBC3AA1B73F4887F286A67235352365980978@BGSMSX102.gar.corp.intel.com>
	<EBAEBC3AA1B73F4887F286A67235352365982A04@BGSMSX102.gar.corp.intel.com>
	<20180305202408.GE2786@denix.org>
	<20ae973a-1a8e-3950-193c-4adda84c513f@mvista.com>
	<20180315174854.GW2786@denix.org>
	<fbad2385-798f-bc58-4a6a-8b1a711fd5e5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <fbad2385-798f-bc58-4a6a-8b1a711fd5e5@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>,
	akuster <akuster@mvista.com>,
	'openembedded' <openembedded-core@lists.openembedded.org>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Fri, 23 Mar 2018 21:19:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yes, I saw it when it merged few days ago. Thanks!


On Fri, Mar 23, 2018 at 01:57:57PM -0700, akuster808 wrote:
> 
> 
> On 03/15/2018 10:49 AM, Denys Dmytriyenko wrote:
> > Ping. Any ETA for when it will be merged to morty?
> 
> Not sure if I answered this. Its now in morty
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=morty&id=34b26ec18450a3bc72f7b8a0f2df0bfaae1140dd
> 
> - armin
> >
> >
> > On Mon, Mar 05, 2018 at 01:29:22PM -0800, akuster wrote:
> >> its in stable/mory-next
> >>
> >>
> >> thanks,
> >>
> >> Armin
> >>
> >>
> >> On 03/05/2018 12:24 PM, Denys Dmytriyenko wrote:
> >>> Same thing just broke morty!
> >>>
> >>> http://cgit.openembedded.org/openembedded-core/commit/?h=morty&id=c134c583e0ef315e88644d94e5a3920b92c6f39d
> >>>
> >>>
> >>> On Mon, Feb 26, 2018 at 08:16:55AM +0000, Palleti, Avinash Reddy wrote:
> >>>> Gentle Reminder.
> >>>>
> >>>> Thanks,
> >>>> Avinash
> >>>>
> >>>> From: Palleti, Avinash Reddy
> >>>> Sent: Wednesday, February 21, 2018 10:22 AM
> >>>> To: akuster808 <akuster808@gmail.com>; Andrei Gherzan <andrei@gherzan.ro>; akuster@mvista.com
> >>>> Cc: openembedded <openembedded-core@lists.openembedded.org>
> >>>> Subject: RE: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
> >>>>
> >>>> It needs to be merged in both pyro and pyro-next.
> >>>>
> >>>> Thanks,
> >>>> Avinash
> >>>>
> >>>> From: akuster808 [mailto:akuster808@gmail.com]
> >>>> Sent: Wednesday, February 21, 2018 10:17 AM
> >>>> To: Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>>; Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>>; akuster@mvista.com<mailto:akuster@mvista.com>
> >>>> Cc: openembedded <openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded.org>>
> >>>> Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
> >>>>
> >>>>
> >>>> in stable/pyro-next
> >>>>
> >>>> On 02/20/2018 04:50 AM, Andrei Gherzan wrote:
> >>>> On Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>> wrote:
> >>>> On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>> wrote:
> >>>>  I submitted a fix sometime back,
> >>>> http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html
> >>>>
> >>>>
> >>>> Great. We have the fix available and approved by Saul. Shall we merge?
> >>>>
> >>>> Adding the pyro maintainer to this thread.
> >>>>
> >>>> --
> >>>> Andrei Gherzan
> >>>>
> >>>>
> >>>> -- 
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


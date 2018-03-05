Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2F72E78A68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1626A20B1A;
	Mon,  5 Mar 2018 20:24:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A03AW2Yi23rs; Mon,  5 Mar 2018 20:24:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C72DA208EE;
	Mon,  5 Mar 2018 20:24:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5262616330D; Mon,  5 Mar 2018 15:24:08 -0500 (EST)
Date: Mon, 5 Mar 2018 15:24:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>
Message-ID: <20180305202408.GE2786@denix.org>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
	<EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
	<CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
	<CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
	<2be633e3-4845-fe97-07fe-dbf12beaf9d4@gmail.com>
	<EBAEBC3AA1B73F4887F286A67235352365980978@BGSMSX102.gar.corp.intel.com>
	<EBAEBC3AA1B73F4887F286A67235352365982A04@BGSMSX102.gar.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <EBAEBC3AA1B73F4887F286A67235352365982A04@BGSMSX102.gar.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "'akuster@mvista.com'" <akuster@mvista.com>,
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
X-List-Received-Date: Mon, 05 Mar 2018 20:24:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Same thing just broke morty!

http://cgit.openembedded.org/openembedded-core/commit/?h=morty&id=c134c583e0ef315e88644d94e5a3920b92c6f39d


On Mon, Feb 26, 2018 at 08:16:55AM +0000, Palleti, Avinash Reddy wrote:
> Gentle Reminder.
> 
> Thanks,
> Avinash
> 
> From: Palleti, Avinash Reddy
> Sent: Wednesday, February 21, 2018 10:22 AM
> To: akuster808 <akuster808@gmail.com>; Andrei Gherzan <andrei@gherzan.ro>; akuster@mvista.com
> Cc: openembedded <openembedded-core@lists.openembedded.org>
> Subject: RE: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
> 
> It needs to be merged in both pyro and pyro-next.
> 
> Thanks,
> Avinash
> 
> From: akuster808 [mailto:akuster808@gmail.com]
> Sent: Wednesday, February 21, 2018 10:17 AM
> To: Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>>; Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>>; akuster@mvista.com<mailto:akuster@mvista.com>
> Cc: openembedded <openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded.org>>
> Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
> 
> 
> in stable/pyro-next
> 
> On 02/20/2018 04:50 AM, Andrei Gherzan wrote:
> On Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>> wrote:
> On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>> wrote:
>  I submitted a fix sometime back,
> http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html
> 
> 
> Great. We have the fix available and approved by Saul. Shall we merge?
> 
> Adding the pyro maintainer to this thread.
> 
> --
> Andrei Gherzan
> 
> 

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



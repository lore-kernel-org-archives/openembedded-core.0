Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0537E7716E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 18:18:23 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014))
	with ESMTPSA id <0O1T00A80XIN7MF0@vms173023.mailsrvcs.net>; Sun,
	31 Jan 2016 12:18:23 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=kj9zAlcOel0A:10 a=7aQ_Q-yQQ-AA:10	a=CCpqsmhAAAAA:8
	a=uSALV2TtMtaISeJ-p08A:9
	a=CjuIK1q_8ugA:10	a=Mn8Mk4gtqVEA:10 a=66zSKFQpzMcA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 14610161E4D; Sun,
	31 Jan 2016 13:18:23 -0500 (EST)
Date: Sun, 31 Jan 2016 13:18:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20160131181823.GI1652@denix.org>
References: <CAMKF1sriCy0VxkkJHKsHaLy0K1N4Ns2E7o-rE_Lq8wSGXoy8hw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sriCy0VxkkJHKsHaLy0K1N4Ns2E7o-rE_Lq8wSGXoy8hw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Glibc 2.24 _might_ require minimum kernel version 3.2
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
X-List-Received-Date: Sun, 31 Jan 2016 18:18:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jan 31, 2016 at 09:41:17AM -0800, Khem Raj wrote:
> Hi
> 
> This is FYI, as I have sent a RFT for glibc 2.24, there might be another change
> coming which is under discussion on glibc mailing lists which is on
> supported minimum
> kernel version bump to 3.2 since 2.6.32 will be EOLed this summer [1]
> 
> If anyone is planning on using upcoming yocto/OE release and sticking
> to kernels older than  3.2 then please plan for upgrading your kernel.
> 
> Thanks
> -Khem
> 
> [1] - https://sourceware.org/ml/libc-alpha/2016-01/msg00885.html

What about our timeline - is glibc 2.24 planned for the next 2.1 release?

-- 
Denys


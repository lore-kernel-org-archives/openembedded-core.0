Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2EC71AD2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 18:19:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t6Qkp6fPBz3hk42;
	Sun, 30 Oct 2016 19:19:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t6Qkp5Z2TzvkwF;
	Sun, 30 Oct 2016 19:19:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id yDVZV0WHhztA; Sun, 30 Oct 2016 19:19:45 +0100 (CET)
X-Auth-Info: OESxBcXJaOb4JtGVqsQuRfopKcS25uBpcesrwtPq6Nk=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 30 Oct 2016 19:19:45 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
	<20161028021134.GK2494@denix.org>
	<c53d058c-c4f9-ac6f-8a55-bc3d78c180a1@denx.de>
	<CAJTo0LbtQGRnE_ET=1joJKk2V70UF=uK10TfCv=WLSbnT7BAkA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7cf154dd-ce37-d648-4f56-636e82a197c0@denx.de>
Date: Sun, 30 Oct 2016 19:18:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbtQGRnE_ET=1joJKk2V70UF=uK10TfCv=WLSbnT7BAkA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Sun, 30 Oct 2016 18:19:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/28/2016 05:16 PM, Burton, Ross wrote:
> 
> On 28 October 2016 at 03:14, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     > Ross,
>     >
>     > Care to elaborate on what is breaking for you and what setup you are using?
> 
>     Please do, indeed.
> 
> 
> Sorry, I was away for a week and my out-of-office only fires for
> @intel.com <http://intel.com> senders to avoid spamming the mailing list. :)
> 
> This was doing a build of *target* u-boot-mkimage for qemux86-64.  I
> suspect that this autobuilder was running on Debian as Debian doesn't
> have a /lib/lib-linux-x86-64 but oe-core does, so a binary built for
> x86-64 oe-core may work on some distributions but not others.

So the simplest test would be to do the build of native u-boot-mkimage
on, say, centos/fedora ?

-- 
Best regards,
Marek Vasut


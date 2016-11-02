Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 547AB6E688
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 12:08:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t86Ln3TB6z3hjQQ;
	Wed,  2 Nov 2016 13:08:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t86Ln0WfCzvlQL;
	Wed,  2 Nov 2016 13:08:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id B4sY8qg7-fHc; Wed,  2 Nov 2016 13:08:16 +0100 (CET)
X-Auth-Info: N/mufIC8VvtQy9yLHqxZjgOFhNZi50cEInN2Mvz9NBM=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  2 Nov 2016 13:08:15 +0100 (CET)
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
	<7cf154dd-ce37-d648-4f56-636e82a197c0@denx.de>
	<CAJTo0LZoN5QRB3pg0+kP0_tQqJ_WTzZuaH_FA-ijDtoY+mYHPg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2cef9ced-0733-aa13-17e6-0cbc71616339@denx.de>
Date: Wed, 2 Nov 2016 13:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoN5QRB3pg0+kP0_tQqJ_WTzZuaH_FA-ijDtoY+mYHPg@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Nov 2016 12:08:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/31/2016 03:59 PM, Burton, Ross wrote:
> 
> On 30 October 2016 at 18:18, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     So the simplest test would be to do the build of native u-boot-mkimage
>     on, say, centos/fedora ?
> 
> 
> No, a build on Debian (I've just replicated this on my own debian build
> machine).  Literally just "bitbake u-boot-mkimage" fails to build.

Got it, replicated, thanks.

I sent a patch, see if that works for you.

-- 
Best regards,
Marek Vasut


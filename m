Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 49E126022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 03:02:05 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sztrX55XDz3hjSC;
	Thu, 20 Oct 2016 05:02:04 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sztrX4PtNzvkh5;
	Thu, 20 Oct 2016 05:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id JwZ89wAGoZDx; Thu, 20 Oct 2016 05:02:03 +0200 (CEST)
X-Auth-Info: mx4WNTFdHXpViS8w1CWOz7brGiPNClEwH2tdyJagIhs=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 20 Oct 2016 05:02:03 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>, Denys Dmytriyenko <denis@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de> <20161019201021.GP2494@denix.org>
	<26a26c16-7eaf-70c3-698e-164bdba67d8b@denx.de>
	<20161019211532.GV2494@denix.org>
	<CAJTo0LbWKZ1Ob1pQdUm4L4sLJX=CKDNifwHJpKSY_UVXoo-6Rw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3e990c83-4b72-10a9-e7ce-4c5f014f12a4@denx.de>
Date: Thu, 20 Oct 2016 00:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbWKZ1Ob1pQdUm4L4sLJX=CKDNifwHJpKSY_UVXoo-6Rw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Thu, 20 Oct 2016 03:02:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/19/2016 11:39 PM, Burton, Ross wrote:
> 
> On 19 October 2016 at 22:15, Denys Dmytriyenko <denis@denix.org
> <mailto:denis@denix.org>> wrote:
> 
>     > > But do we need to bump PE to ensure upgrade path and proper sorting?
>     >
>     > I don't think so, since the whole U-Boot version got updated.
> 
>     Still, vXXXX.YY will always sort higher than XXXX.YY no matter what
>     digits
>     there are. That's what PE is for, to get the sorting working even when
>     versioning schema gets changed in major way like this one...
> 
> 
> Agreed, PE is required here.

OK, snap. Can you pick 1,2,3,5 so I don't have to resubmit them ? They
should apply cleanly and they are pretty orthogonal from the 4/5.

I will check PE ASAP.

Thanks!

-- 
Best regards,
Marek Vasut


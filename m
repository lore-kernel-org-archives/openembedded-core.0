Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 512E371A06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:36:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t08wG62XYz3hjSD;
	Thu, 20 Oct 2016 15:36:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t08wG5VRszvkjX;
	Thu, 20 Oct 2016 15:36:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 86_fLsDEB5gK; Thu, 20 Oct 2016 15:36:13 +0200 (CEST)
X-Auth-Info: 5KG7e8H2vZxGtnFUmYuYVoGcvVTBguvi+JakoVqknqA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 20 Oct 2016 15:36:13 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de> <20161019201021.GP2494@denix.org>
	<26a26c16-7eaf-70c3-698e-164bdba67d8b@denx.de>
	<20161019211532.GV2494@denix.org>
	<CAJTo0LbWKZ1Ob1pQdUm4L4sLJX=CKDNifwHJpKSY_UVXoo-6Rw@mail.gmail.com>
	<3e990c83-4b72-10a9-e7ce-4c5f014f12a4@denx.de>
	<CAJTo0LaqYfAtkKguHX39Pdqp97S58aWKW5+eWvimrCEWu8Wi0Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3a6665b3-6f1a-61e0-3e6a-10edde133e22@denx.de>
Date: Thu, 20 Oct 2016 15:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaqYfAtkKguHX39Pdqp97S58aWKW5+eWvimrCEWu8Wi0Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2016 13:36:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/20/2016 12:13 PM, Burton, Ross wrote:
> On 19 October 2016 at 23:53, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     OK, snap. Can you pick 1,2,3,5 so I don't have to resubmit them ? They
>     should apply cleanly and they are pretty orthogonal from the 4/5.
> 
> 
> 1 is standalone and I've merged this into ross/mut already, but 3/4/5
> are all basically fixing problems in 2 so I think they should all be
> squashed together.

I'm not a huge fan of patches doing multiple things at the same time, so
I sent them separately. Feel free to squash them if you really want
to, I won't object either way.

Thanks for the PE hint :)

-- 
Best regards,
Marek Vasut


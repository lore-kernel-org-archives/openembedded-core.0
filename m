Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC9B6093D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 20:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EB2CA208EE;
	Wed, 19 Oct 2016 20:27:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BNGJZkPL7_oS; Wed, 19 Oct 2016 20:27:52 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB6B320058;
	Wed, 19 Oct 2016 20:27:51 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 02663162176; Wed, 19 Oct 2016 16:27:51 -0400 (EDT)
Date: Wed, 19 Oct 2016 16:27:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20161019202750.GU2494@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de>
	<78ae8d38-99d6-56d0-5e28-786bf2c13d43@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <78ae8d38-99d6-56d0-5e28-786bf2c13d43@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 19 Oct 2016 20:27:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2016 at 03:09:26PM +0300, Alexander Kanavin wrote:
> On 10/19/2016 12:55 AM, Marek Vasut wrote:
> >Drop the explicit setting of PV altogether. This changes the U-Boot
> >version string from "v20yy.mm" to "20yy.mm" , so layer setting the
> >PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.
> 
> Don't drop the 'v'. Package versions need to monotonically increase,
> and also package version needs to match git tags so that upstream
> version check can work.
> 
> Basically, rename the recipe filenames so that 'v' is in their
> versions, and then you can drop the PV from the recipes. All in a
> single patch.

This has been discussed at OEDEM - we are trying to unify u-boot recipes. 
Looking at the layer index, it seems there's 50/50 split of using vXXXX.YY vs. 
just XXXX.YY versions:

https://layers.openembedded.org/layerindex/branch/master/recipes/?q=u-boot

So, I'd vote to drop "v" prefix and bump PE to get it sorted out...

-- 
Denys


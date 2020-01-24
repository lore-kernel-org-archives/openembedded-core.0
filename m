Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 06A887FC06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 22:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D45B840BFC;
	Fri, 24 Jan 2020 22:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KauRWA8T-sLv; Fri, 24 Jan 2020 22:59:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 64ED4400E8;
	Fri, 24 Jan 2020 22:59:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 22E241743AA; Fri, 24 Jan 2020 17:59:45 -0500 (EST)
Date: Fri, 24 Jan 2020 17:59:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200124225945.GI4735@denix.org>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
	<20200123224340.GG4735@denix.org>
	<0620f17c-53ca-7e95-1607-621507baedd8@intel.com>
	<51f70cda-9ddf-ea8c-e8a9-3a3f69db8167@gmail.com>
MIME-Version: 1.0
In-Reply-To: <51f70cda-9ddf-ea8c-e8a9-3a3f69db8167@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Jon Mason <jdmason@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 22:59:50 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jan 24, 2020 at 09:05:09AM -0800, Khem Raj wrote:
> On 1/24/20 3:42 AM, Ross Burton wrote:
> >On 23/01/2020 22:43, Denys Dmytriyenko wrote:
> >>>Such as all the various cortex etc CPU tuning files?
> >>
> >>LOL! :) Of course, since ARM is such an inferior arch to x86.
> >>Otherwise we
> >>should move everything that is not needed by qemux86 to
> >>meta-intel... JK :)
> >
> >I almost pre-empted this comment in my reply because I knew it was
> >coming. :)
> >
> >Personally, not a terrible idea.  The slight difference is that
> >meta-intel is *Intel's* BSP and we don't share stuff like
> >firmware/drivers with AMD.
> >
> >Ross
> 
> it will be good to find what the overlap will be, is it something
> that BSPs can use with minimum changes, or are we providing a
> template that will be copied over and housed in form of bbappends or
> bbs. I am not familiar enough to assess that.

It depends how much of a specific platform support was already upstreamed 
to ATF. For example, full TI platform support requires a more recent version 
that 2.2 release (plus some "linkage" to OPTEE). And based on meta-rockchip 
submission from Joshua, RK3399 requires a secondary Cortex-M toolchain to 
build some parts. So, it seems like it would require some bbappends in BSPs.


> Perhaps it would be good to limit this to arm compatible machines,
> secondly, there is a point in having it in OE-Core if meta-arm is
> limiting itself to arm provided BSPs alone. I think it will be good
> to have a platform supported in core to be able to test it, between
> qemu and beaglebone, I guess it is not used. Or pehaps it is and we
> do not use it, so that change would be good to have as well.

Well, beaglebone is arm32. From the Yocto Project perspective, we don't 
have an arm64 reference platform (membership questions, etc.), which would 
require ATF.

-- 
Denys


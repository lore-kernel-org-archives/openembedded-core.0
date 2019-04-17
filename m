Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEF17D01C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:50:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44kctH3MQ7z3G;
	Wed, 17 Apr 2019 11:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555494631;
	bh=8yodkVAwhWkw5pSMoUBcmYAnYl5HiE6rzYwP4x9asC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6nz6izzAdsBKW2+M4RqLXjvbSOzEWUJW1TRPDQBk/BlV1L7fAdGVAppZkHwzxrt6
	rAhc21GbuB+Ec+eFcJMtSmK3kKbhouxuc6hs6TdXV+9uuWsPVIRQ/u8Xmus5Vnudka
	r0B9q0ZwMicTDML+TrtPTxwcHSsLTer7vOzm7a1iB2TtO5U2Zdj3HPyhwRxQiFf11v
	kExb7asFaNhZEuEBgreNxBT9oTf0ncmoAJ/cG0wwBR0V3Du4mdmrb6/d0tqFoMJk9P
	IlyoF24uyoOqul0FFhhcSCzrBrEaqJLRdyt0GSE8uk3AQnjPVSuatSwxxWkdjQo5ho
	S6R1+7r7BhJ86/zyvlSOWtAFbeM+0xhv+28uFG0miv47xeMXIVXjl/2OfPm7LIU5G8
	vZwpo/+Eh4gFz1TZH2pcg+MwESRWq2uhnDf4p8VgZwq5X0C7KklVMmyc8Q74XK9+FQ
	qtMgA9peggp5ngDsRufEkXiSpnlVVD2xx6LpVn9CUDc70QC7qt7cw/1qdZYo2FwisW
	O31ilGBgTTcVWUOSaQjbIUcyOVct4PLBREgMGRH9L7Fan9dAbA3xGvJgjV3AKjmNAB
	gwUDnbwuNSwdXZhwm080hKuhdwYJcbPfG2jT8d39y2YLIa5giTgNL49GLx/xr49Job
	GmuLHG+c+GieQkR7Ciey0JQI=
Date: Wed, 17 Apr 2019 12:50:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190417095029.GB895@localhost>
References: <20190416055919.9090-1-naveen.kumar.saini@intel.com>
	<b7de17b7188d78a1da3c7200ce5263edcf979a22.camel@linuxfoundation.org>
	<95a0e409-ad9c-759e-bcf2-c9e6b20a2e50@intel.com>
	<eac500ca51a96c769ab3080bcd78dd93316bea9f.camel@linuxfoundation.org>
	<20190417093520.GA895@localhost>
	<fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fdc87321d0cba27741ae1b9e1dde703e42683fa2.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 17 Apr 2019 09:50:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 17, 2019 at 10:37:45AM +0100, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-04-17 at 12:35 +0300, Adrian Bunk wrote:
>...
> > Your "everyone has to install it" worry misses the much bigger
> > problem 
> > that git-lfs is a relatively new tool and not available in
> > distributions 
> > like Debian 9 or Ubuntu 16.04.
> 
> Someone could certainly write a native recipe for lfs and add that as a
> dependency which would also solve this problem. I'd be quite happy to
> see that and it would neatly solve the problems.

This was also my first thought.

It stops being neat once you realize that it requires packaging
a 3 digit number of Go libraries.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



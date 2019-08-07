Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C54467F454
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 14:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 463YFX6HzXz4s;
	Wed,  7 Aug 2019 16:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565186769;
	bh=f6p5ZjjntM9s8pRsA8U9IJR7uE/fnvPi+/+xW/qnoMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cC9F6ISFuc8eDO+KSzJTxSFhvW6rTI+5Udn1SXzUi7v+mYHVVr0Hk2MWQWGFdVnlz
	xNZargBqvGg9bsAaH6ajd5t9W3DsY5O3GuUvkdW4jLTEMmK9i5wjg2Xr4W+DBx6+Kb
	nL4lB5RXLjIzIWZap2C0Psi60ce+GtNBo1Vy9UjjHMyf6vi7VEFMYt3u/iJZg6wSpo
	hlBSQWJGyo5jXanQnVlj5NALQ2qYlH40NRCbLVnzO3I2gS28D3NWBI5dlqOi1MdpeU
	rl9/3KjakdNYKkhLdDRmDJ5JwUwFnEX3fXQ0QsKV3WsdlXWZgsiE1fiC8CBF1BdL2n
	ZKRsdS38WMxEYG5xV20ivWSFaJc8L36fkdHwrjswYH9eERw71RSNPUlBl4E57yjTmu
	eBpmyWJ4QqDFqoF3WLtUOTn0WvnKhII91TvvMvKh0vqDSrUSC+mKWCV3bH5sR1VlzF
	DyIfYBP25Sr2300CQ8c913PqEwp/xUx6RoLMMRdKXaYYPiB/F5tFTJgVWjJczjwO0b
	dr7waQFbVIkbaf4ORtM89/OTv5hR35FgwpfOXUqdrHUnMxZRsfYUSNyaeCnWvsbmcN
	CySC+OCttpn3sicsCUwyW3QmJxhFHNOH+m7fernWCLuJEB8QL9tOh5PHDWxWF3tsWY
	kpPmPdCrQkF0DJzpmEF/w6fM=
Date: Wed, 7 Aug 2019 17:06:06 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190807140606.GB24727@localhost>
References: <20190807140147.8956-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190807140147.8956-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] aspell: update to 0.60.7
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
X-List-Received-Date: Wed, 07 Aug 2019 14:06:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 07, 2019 at 04:01:47PM +0200, Oleksandr Kravchuk wrote:
>...
> --- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
> +++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
> @@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>  
>  PR = "r1"
>...

PR should be dropped on version upgrade.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9B679D4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:59:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43W3JL0W3mz5B;
	Thu,  3 Jan 2019 23:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1546556354;
	bh=uV9nh7BpWzLqEQhsgw6Ha53gTDf9G+yS+7zhVIBZxnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ljsMbDzZiASzlxO17jxqGPEn2v7x+VRbU8+pySpzI/bDy0UExs71wV7nhxtQ0wEND
	ED7a64VgcLhZsnyogpqNdP5NukQM6Aio7BEX2+OEaY96yEiI2LvKjH3/RDCPZYZ3Lt
	B0D3jzseWQM+A+8BfqiBG4QvdYZi5uqUBn1Og86SzKnwjQItMX9OhzFTilYGbbSS/P
	kEIve94aV4Tfvh888JkhQxq3HoXh2V6qbzCwS4SgSJvj31EIG+gPNviFmyJWEiM9ex
	6/CcxnHql56vBDlKymCPkdch8CttQiRZf7+2U9wXq6BoCsa8eARaW4Rbd5+NtAkuTC
	L6GQg3OscIt6zndb25M8D0XQ89tgL4kN1NGKKj5FZcEBmLko22LI//hNVtxT1z8UOG
	Y9O8hbfaJd/xy2PFFkeLaY5j72mFx+nlWqB/0U+scgla7kN67vtdRcpmm1DJdvK1ig
	V4pd6esTMMBxovRp+bNELXqibGMU/njC1X9OOPPQ9WF14f7knIOPGJAN0VhhOCxx5k
	WmHMDeETRekTL31KKyhokyd+BCYOVpkwx3+u/f//YuerGeKxPwYgGt6ZkdkVzZs7u2
	it/NB+kdWT/GTw4s9yySe6svkNfKOKGM73CV5AGAvTAe/bZ8s+zyPp2sdhiVMuYN3Y
	4j43UJkJr8brJjPUaFz2QNN8=
Date: Fri, 4 Jan 2019 00:59:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190103225915.GB29139@localhost>
References: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yocto Project <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Dropping armv5 and armv5e tunes in 2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 22:59:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 03, 2019 at 02:01:42PM -0800, Khem Raj wrote:
> Hello All
> 
> You might have noticed a recent commit in gcc trunk
> 
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b232e6b58e3766bc66fe08fdb7bcba1bdadda8a2
> 
> Which removed support for deprecated -march=armv5 and armv5e, this
> will be released along with gcc-9 release which is upcoming and we
> might be able to add gcc9 to 2.7 release or 2.8 release for sure.
> 
> We still have non-thumb tunes for armv5 and armv4 in our tune pack, I
> would like to propose a patch to remove them.
>...

Note that gcc 9 does *not* remove non-thumb armv4 support.

Non-thumb armv5/armv5e have been removed due to
"have no known implementations".

Non-thumb armv4 support was deprecated in gcc 6 together with armv2/armv3,
but there are still people using recent gcc on StrongARM - which is 
non-thumb armv4.

> Thanks
> -Khem

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



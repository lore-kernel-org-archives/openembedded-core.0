Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14C316FF23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 12:01:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4PC1Htp011672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 May 2016 05:01:17 -0700 (PDT)
Received: from server.local (147.11.119.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 05:01:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <caee4419-7e24-aedc-5553-2f4424dfc92f@windriver.com>
Date: Wed, 25 May 2016 08:01:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464158362.9570.87.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Wed, 25 May 2016 12:01:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-05-25 2:39 AM, Richard Purdie wrote:
> Thanks to the patches from Bruce we're looking better, linux-yocto 4.1
> works, just 4.4 has a couple of issues. I also removed a patch which
> removed the xdg-utils failure. That leaves us with:
>
> qt4-x11-free:
>
> arm, mips, ppc, world-lsb, x86, x86_64:
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
> ds/767/steps/BuildImages/logs/stdio
>
> qt4-embedded:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/bu
> ilds/520/steps/BuildImages/logs/stdio
>
> linux-yocto-4.4 mips:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/
> 795/steps/BuildImages_1/logs/stdio
>
> linux-yocto-4.4 ppc:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
> 07/steps/BuildImages_1/logs/stdio
>
> diffutils - non-gplv3:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
> lds/797
>
> Bruce: Looks like 4.4 might also need a patch you merged to 4.1?
>

I'll check 4.4 stable, otherwise, I can do a port myself.

Bruce

> Cheers,
>
> Richard
>



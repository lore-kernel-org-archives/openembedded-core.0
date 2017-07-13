Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3E0971A35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 16:33:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6DGXIGS006858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Jul 2017 09:33:18 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 09:33:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
	<CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <e99d1232-1ed5-5df1-7fc7-81437053988a@windriver.com>
Date: Thu, 13 Jul 2017 12:33:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] linux-yocto/4.1: update to v4.1.41
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
X-List-Received-Date: Thu, 13 Jul 2017 16:33:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/12/2017 06:17 PM, Burton, Ross wrote:
> 
> On 11 July 2017 at 16:04, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
>  >
>  > Integrating the korg -stable update that comprises the following
>  > commits:
> 
> I'm guessing this is the cause of this failure with poky-lsb on qemux86-64.
> 

I was trying to reproduce the failure here, and I of course was
only getting a 4.1.39 build, since that is the SRCREV as set in
the meta-yocto-bsp for genericx86-64.

I tried to figure out the layers that were in play for that build,
but it wasn't immediately clear to me. Is there something that
sets AUTOREV in the build, and hence why it triggered the error
that I'm not seeing ?

But regardless, I do see that it errored due to me fat fingering the
version to .41 versus .42.

How would you like the fix, a completely new patch, or an incremental
fix on my branch ?

Bruce

> ERROR: Package Version (4.1.41+gitAUTOINC+9f9c9a66ef_9f0d87a53d) does 
> not match of kernel being built (4.1.42). Please update the PV variable 
> to match the kernel source or set KERNEL_VERSION_SANITY_SKIP="1" in your 
> recipe.
> 
> (http://errors.yoctoproject.org/Errors/Details/147312/ 
> <http://errors.yoctoproject.org/Errors/Details/147312/>)



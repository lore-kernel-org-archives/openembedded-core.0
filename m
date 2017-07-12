Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF3F5780C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 22:39:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6CMdIQ1007505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jul 2017 15:39:18 -0700 (PDT)
Received: from server.local (128.224.23.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 15:39:18 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
	<CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <745b7e44-8e58-7ee8-5796-7c91a3957743@windriver.com>
Date: Wed, 12 Jul 2017 18:39:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
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
X-List-Received-Date: Wed, 12 Jul 2017 22:39:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-07-12 6:17 PM, Burton, Ross wrote:
> 
> On 11 July 2017 at 16:04, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
>  >
>  > Integrating the korg -stable update that comprises the following
>  > commits:
> 
> I'm guessing this is the cause of this failure with poky-lsb on qemux86-64.
> 
> ERROR: Package Version (4.1.41+gitAUTOINC+9f9c9a66ef_9f0d87a53d) does 
> not match of kernel being built (4.1.42). Please update the PV variable 
> to match the kernel source or set KERNEL_VERSION_SANITY_SKIP="1" in your 
> recipe.

Yep, anything using 4.1 needs to have a PV bump done. I
haven't typically done that in the past, but can loop
around in a bit and see what needs bumping.

Bruce

> 
> (http://errors.yoctoproject.org/Errors/Details/147312/ 
> <http://errors.yoctoproject.org/Errors/Details/147312/>)



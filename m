Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07E2560746
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 09:02:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6L927Iq023950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 21 Jul 2016 02:02:09 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jul 2016 02:02:05 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1468994042.git.liezhi.yang@windriver.com>
	<6dc817964ba46c0263b3b07cccf84a9917b72121.1468994042.git.liezhi.yang@windriver.com>
	<CAJTo0La07P1tsmf_trC0Gj+WQHVYwM=QiASRjBS8fFaBUjSaAA@mail.gmail.com>
	<579029B1.8030102@windriver.com>
	<CAJTo0LZV214ESWaX+c6aRHofKGjKgkw1nK9-JF_xivKDP+Hj6Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57908F8B.8010709@windriver.com>
Date: Thu, 21 Jul 2016 17:02:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZV214ESWaX+c6aRHofKGjKgkw1nK9-JF_xivKDP+Hj6Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Thu, 21 Jul 2016 09:02:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/21/2016 04:46 PM, Burton, Ross wrote:
>
> On 21 July 2016 at 02:47, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Thanks, I was misleaded by eudev, whose udevlibexecdir is ${rootlibexecdir}
>     which is ${libdir}/udev, so it is /lib64/udev. It supports /lib/udev and
>     /lib64/udev as the code in eudev-3.2/src/udev/udev-rules.c shows:
>
>
> Well thanks to eudev for introducing incompatible changes for no reason.
>
> In that case we should fix the FILES definition in bitbake.conf which packages
> the udev rules into PN.

Thanks, I will add ${base_libdir}/udev and send V2.

// Robert

>
> Ross


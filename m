Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0E992745B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 22:14:37 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40mTHx5th2z1qsjj;
	Thu, 17 May 2018 00:14:37 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40mTHx5X7pz1rDn3;
	Thu, 17 May 2018 00:14:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id y-HOvrPYZuFS; Thu, 17 May 2018 00:14:37 +0200 (CEST)
X-Auth-Info: vp3OefFXt+Xf+lX9Fq+aPXnnguN/hyj3k14byZupouU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 17 May 2018 00:14:36 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20180516201415.8002-1-marex@denx.de>
	<CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
	<CAMKF1sofR4pwFFPNocd2r3jk+AxohUQLg_ih+0B9fbWUnccoAQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <e830bc77-2de1-bbf9-4c15-847d8db0b662@denx.de>
Date: Thu, 17 May 2018 00:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sofR4pwFFPNocd2r3jk+AxohUQLg_ih+0B9fbWUnccoAQ@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 22:14:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 12:05 AM, Khem Raj wrote:
> On Wed, May 16, 2018 at 3:00 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Wed, May 16, 2018 at 5:14 PM, Marek Vasut <marex@denx.de> wrote:
>>> This upgrades the U-Boot from 2018.03 to 2018.05 release.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Cc: Ross Burton <ross.burton@intel.com>
>>
>> Nice work :-)
> 
> 
> is libfdt/dtc host/target mixup faux pas fixed in this version

Do a build test please, I'm not triggering it here.

-- 
Best regards,
Marek Vasut


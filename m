Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC0C60125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 16:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7HG8m2o021198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Aug 2015 09:08:48 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 09:08:48 -0700
Message-ID: <55D2070F.9040505@windriver.com>
Date: Mon, 17 Aug 2015 12:08:47 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
	<8a20f52f97c27d6a37d73962f2c8c2b1ea9fe5a7.1439549437.git.alexander.kanavin@linux.intel.com>
	<55CEC72D.4060702@windriver.com> <55D1D9E7.6070309@linux.intel.com>
	<D110DB7D-32DE-4EA4-9BDF-AAF02AD5C7F1@gmail.com>
	<55D20605.6050008@linux.intel.com>
In-Reply-To: <55D20605.6050008@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/22] midori: remove the recipe and replace references to midori with epiphany
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
X-List-Received-Date: Mon, 17 Aug 2015 16:09:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-08-17 12:04 PM, Alexander Kanavin wrote:
> On 08/17/2015 06:48 PM, Khem Raj wrote:
>
>>>> Mips64 support using the newer webkitgtk may be better.
>>>> Wenzong please check on that once this code is in master-next
>>>> and reply here.
>>>
>>> Latest Webkit (2.8.5) actually does build for MIPS64 (where 2.8.4
>>> failed), but I couldn't find a way to test the n32 variant using poky
>>> - any suggestions?
>>
>>
>> may be you can use multilib on same mips64 configuration and build
>> libn32-epiphany ?
>
> Thanks, I'll also try to see if powerpc64 build can be tested the same
> way, because it was not, for the same reason (poky has a configuration
> for ppc, but not ppc64).

It would be nice to add qemuppc64 but it's not a high priority.
Interested? :)
../Randy

>
>
> Alex


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76B806D147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 01:39:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3P1dNaF025355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Apr 2019 18:39:33 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 24 Apr 2019 18:39:12 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190415034231.105641-1-kai.kang@windriver.com>
	<c5cfa394-44e4-bdae-d334-82b9fe109f86@windriver.com>
	<CAJTo0LYvVT5g0LG+XGf5Nz-XJj-Nw32tubmNGw1_dNPyWs9R4w@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <6ba3a9e8-bbb1-c2e1-b29f-968e41d1aa93@windriver.com>
Date: Thu, 25 Apr 2019 09:36:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYvVT5g0LG+XGf5Nz-XJj-Nw32tubmNGw1_dNPyWs9R4w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev: update SRCREV
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
X-List-Received-Date: Thu, 25 Apr 2019 01:39:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/4/24 下午8:38, Burton, Ross wrote:
> I'd prefer this to be applying the patch, which also makes the fix
> easier to backport.

OK. I'll send v2 to apply the the patch.

Regards,
Kai


>
> Ross
>
> On Wed, 24 Apr 2019 at 03:26, Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/4/15 上午11:42, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Update SRCREV of cryptodev which only contains one fix for linux 5.0:
>>>
>>> $ git log fd8b15ef1c8398a69a37932ee48c74ab40329a29..f971e0cd4a0ebe59fb2e8e17240399bf6901b09b
>>> commit f971e0cd4a0ebe59fb2e8e17240399bf6901b09b
>>> Author: Derald D. Woods <woods.technical@gmail.com>
>>> Date:   Sun Feb 10 13:22:19 2019 -0600
>>>
>>>       Fix module loading with Linux v5.0-rc5
>>>
>>>       This commit fixes this module load error:
>>>       [...]
>>>       [   29.112091] cryptodev: loading out-of-tree module taints kernel.
>>>       [   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
>>>       [   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
>>>       modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
>>>       [...]
>>
>> Without this patch it fails to modprobe module cryptodev. Ping.
>>
>> Kai
>>
>>
>>>       Upstream Linux support for unused GIVCIPHER, and others, was dropped here:
>>>
>>>       c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)
>>>
>>>       Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>    meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> index 252d39d23a..79ddefd435 100644
>>> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>
>>>    SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
>>> -SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
>>> +SRCREV = "f971e0cd4a0ebe59fb2e8e17240399bf6901b09b"
>>>
>>>    S = "${WORKDIR}/git"
>>>
>>
>> --
>> Kai Kang
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Kai Kang



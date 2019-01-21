Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09B9F6BE0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 02:19:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0L2JC5X011993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jan 2019 18:19:12 -0800 (PST)
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 20 Jan 2019 18:19:12 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
	<CAJTo0Lb-wU6Mre2uqg6e2x=_FAAr21s4sqP_oj-saQznQQsNbA@mail.gmail.com>
	<CAMKF1sots+CQU4CucnE7VfQbVsJzh-urOCWZbnQ_whbMP93WHA@mail.gmail.com>
	<63eaa7eb-17b1-0b26-f28a-b4dd811eef31@windriver.com>
	<CAMKF1sqvEN+-_9uU6ZzX=+G=0dp3fKmOBWQ8o1CVXxeLJ_pwYQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d6f1f3ee-a815-6a93-cb46-5bf9b289eade@windriver.com>
Date: Mon, 21 Jan 2019 10:18:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqvEN+-_9uU6ZzX=+G=0dp3fKmOBWQ8o1CVXxeLJ_pwYQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Mon, 21 Jan 2019 02:19:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/1/21 上午10:17, Khem Raj wrote:
> On Sun, Jan 20, 2019 at 6:12 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/1/19 上午4:54, Khem Raj wrote:
>>> On Fri, Jan 18, 2019 at 12:43 PM Burton, Ross <ross.burton@intel.com> wrote:
>>>> On Fri, 18 Jan 2019 at 17:55, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> I am bit concerned about using -ffile-prefix-map here, its gcc only
>>>>> option so will cause clang to fail
>>>> It's almost like we need a toolchain override so this can be gcc-specific...
>>>>
>>>> I've been meaning to do that for about a year now :(
>>>>
>>>> Until then, couldn't meta-clang just override the value from the layer?
>>> yes it can, but one by one there are many changes to keep and core becomes
>>> tied to gcc. We should be conscious about it.
>>
>>   From the link https://reviews.llvm.org/D49466 pasted by Dan, we know
>> that clang will support option '-ffile-prefix-map'.
>> I prefer to override DEBUG_PREFIX_MAP in meta-clang and remove it when
>> clang support for '-ffile-prefix-map' implemented.
> Thats ok, not worried about clang at this point. But the patch itself
> was not working last time on gcc either. So if that is fixed we can consider it.


OK. I am working on the issued pointed by Richard.


>
>> Regards,
>> Kai
>>
>>
>>>> Ross
>>
>> --
>> Kai Kang
>>

-- 
Kai Kang



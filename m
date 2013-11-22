Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 393226D88C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 06:29:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM6TS6Y029890
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 22:29:28 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 22:29:28 -0800
Message-ID: <528EF9C6.6030202@windriver.com>
Date: Fri, 22 Nov 2013 14:29:26 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<726632570b9d8a6bfcd88c5a411a6387f6869f91.1384854113.git.jackie.huang@windriver.com>
	<1385088300.3614.25.camel@dvhart-mobl4.amr.corp.intel.com>
	<528EE256.2030909@windriver.com>
	<1385096527.3614.32.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1385096527.3614.32.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 06:29:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2013 1:02 PM, Darren Hart wrote:
> On Fri, 2013-11-22 at 12:49 +0800, jhuang0 wrote:
>>
>> On 11/22/2013 10:45 AM, Darren Hart wrote:
>>> On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>
>>>> It's not a good idea to generate the target EFI image in
>>>> a native packge,
>>>
>>> This was admittedly a hack when I wrote it...
>>>
>>>>    it would be a problem when build a 64bit
>>>> target on 32bit host.
>>>
>>> I build 32b on a 64b host regularly, why is it a problem the other way
>>> around?
>>>
>>> There is infrastructure in place to specify the target architecture for
>>> the grub efi binary and the modules. The 32b compiler should be able to
>>> do -m64 just as the 64b compiler can do -m32.
>>
>> It should be, but for most 32bit linux distributions, gcc is not
>> compiled for supporting 64bit cross compiling.
>
> Thanks for the detail - including this information in the justification
> would be a good idea so anyone looking at the commit log can understand
> why it was necessary.
>
>
>>>> -do_install[noexec] = "1"
>>>> -do_populate_sysroot[noexec] = "1"
>>>> +FILES_${PN}-dbg += "${libdir}/${BPN}/${GRUB_TARGET}-efi/.debug"
>>>
>>> Technically this is an independent functional change...
>>
>> You mean it should be in a separate commit?
>
> I was thinking so, but I see Saul raised it as an issue with V2, so
> please disregard this comment, it's fine.
>
> I'd like to see a blurb added to the commit message stating the bit
> about gcc not having support in some distributions (debian/ubuntu do
> have it for example, but later versions require the compat package or
> some such). The fact that some don't is enough though, and your solution
> is cleaner and more consistent with bitbake recipe conventions anyway.

I will add these information to the commit log in v4.

Thanks,
Jackie

>
> Thanks for keeping at it, this is a good improvement.
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (unknown [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60BD3736BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 02:56:06 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BDZ05974; Fri, 03 Apr 2015 10:56:00 +0800 (CST)
Received: from [127.0.0.1] (10.111.55.101) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1; Fri, 3 Apr 2015
	10:55:58 +0800
Message-ID: <551E010D.8010309@huawei.com>
Date: Fri, 3 Apr 2015 10:55:09 +0800
From: Junling Zheng <zhengjunling@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1427882425-19536-1-git-send-email-zhengjunling@huawei.com>
	<34C00CB4-D932-4317-A2B6-E6C7346464A0@gmail.com>
	<551D0FCB.5080603@huawei.com>
	<0D1A6BA1-78E2-4AA5-9DD0-6553A974B447@gmail.com>
In-Reply-To: <0D1A6BA1-78E2-4AA5-9DD0-6553A974B447@gmail.com>
X-Originating-IP: [10.111.55.101]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.551E0141.003B, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7a2ad17c04612007b64485a41d5e0a85
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc: fix undefinition of '_dl_strchr' in libdl.a
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
X-List-Received-Date: Fri, 03 Apr 2015 02:56:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

OK, I'll submit a patch v2 to both oe-core and uclibc upstream.

Cheers,

Junling

On 2015/4/2 22:35, Bernhard Reutner-Fischer wrote:
> On April 2, 2015 11:45:47 AM GMT+02:00, Junling Zheng <zhengjunling@huawei.com> wrote:
>> On 2015/4/2 14:42, Bernhard Reutner-Fischer wrote:
>>> On April 1, 2015 12:00:25 PM GMT+02:00, Junling Zheng
>> <zhengjunling@huawei.com> wrote:
>>>> The orign_path.patch introduced '_dl_strchr' into
>> ldso/ldso/dl-elf.c,
>>>
>>> Please fix the origin patch directly.
>>> Thanks,
>>>
>> Hi, Bernhard
>>
>> The orign_path.patch is backported from:
>>
>> http://lists.busybox.net/pipermail/uclibc/2011-March/045003.html
>>
>> It's an individual. Should I still fix this patch directly?
> 
> Yes.
>>
>> BTW, should uclibc upstream need this patch to avoid the above problem
>> too?
> 
> There currently is no in-tree user of these, so no.
> $ORIGIN support is on my todo list..
> 
>>
>> I had submitted a patch to the uclibc upstream, and expected your
>> review:)
> 
> See above :)
> 
> Cheers,
>>
>> Thanks,
>>
>> Junling
> 
> 
> 
> 




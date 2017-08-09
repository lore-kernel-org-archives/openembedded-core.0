Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E61B77D11
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 09:46:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v799klJF007553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 9 Aug 2017 02:46:47 -0700
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 9 Aug 2017 02:46:46 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
	<2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
	<1502206246.18633.250.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <9e608de9-0ccb-c576-875c-d174e0070f5c@windriver.com>
Date: Wed, 9 Aug 2017 17:46:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1502206246.18633.250.camel@linuxfoundation.org>
Subject: Re: [PATCH 01/10] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Wed, 09 Aug 2017 09:46:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/08/2017 11:30 PM, Richard Purdie wrote:
> On Mon, 2017-07-31 at 02:50 -0700, Robert Yang wrote:
>> The "if qemu_use_kvm" is not needed.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/lib/oeqa/targetcontrol.py | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/targetcontrol.py
>> b/meta/lib/oeqa/targetcontrol.py
>> index 3255e3a5c63..11e6c820e85 100644
>> --- a/meta/lib/oeqa/targetcontrol.py
>> +++ b/meta/lib/oeqa/targetcontrol.py
>> @@ -132,9 +132,8 @@ class QemuTarget(BaseTarget):
>>          dump_host_cmds = d.getVar("testimage_dump_host")
>>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>>          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>> -        if qemu_use_kvm and \
>> -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
>> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
>> +        if qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
>> +            d.getVar("MACHINE") in qemu_use_kvm.split():
>>              use_kvm = True
>>          else:
>>              use_kvm = False
>>
>
> It is needed since qemu_use_kvm could be None and None.split() will
> cause an error.

Thanks, I removed from the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/ptest
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

// Robert

>
> Cheers,
>
> Richard
>


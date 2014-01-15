Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B12C6E38C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 15:12:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0FFBvlD010743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Jan 2014 07:11:57 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 15 Jan 2014 07:11:56 -0800
Message-ID: <52D6A528.5020909@windriver.com>
Date: Wed, 15 Jan 2014 10:11:36 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>	
	<d42eed80edc6fbaec7b8dbd614ba2292dd91ba5a.1389765320.git.bruce.ashfield@windriver.com>
	<1389798400.14987.81.camel@ted>
In-Reply-To: <1389798400.14987.81.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] linux-yocto/3.10: update to 3.10.25
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
X-List-Received-Date: Wed, 15 Jan 2014 15:12:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-15 10:06 AM, Richard Purdie wrote:
> On Wed, 2014-01-15 at 00:57 -0500, Bruce Ashfield wrote:
>> Updating the 3.10 tree to the 3.10.25 korg -stable release.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 10 ++++------
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
>>   3 files changed, 16 insertions(+), 18 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> index e81a77ba4ea5..d301c06eae37 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> @@ -3,13 +3,11 @@ require recipes-kernel/linux/linux-yocto.inc
>>   KBRANCH = "standard/preempt-rt/base"
>>   KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>>
>> -SRCREV_machine ?= "ee9480cd91b2b46325a2da9aa6ae779d8e4163c0"
>> -SRCREV_machine_qemuppc ?= "5c126504c0a2f72d80bae9d96cea7eb9d7854290"
>> -SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
>> +SRCREV_machine ?= "957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d"
>> +SRCREV_machine_qemuppc ?= "37e40b7017a9c78d676b19716011494dc7cb6369"
>> +SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
>>
>> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>> -
>
> I'm guessing this shouldn't remove the above line? It triggers parse
> failures...

urk. He who rebases patch series late at night, shouldn't hit send until
the morning.

That was aggressive trailing whitespace cleanup gone bad. If you can
restore it, I'll be eternally grateful. Or I can resend, but that
seems like excessive overhead for an obvious mess up.

Bruce

>
> CHeers,
>
> Richard
>
>> -LINUX_VERSION ?= "3.10.19"
>> +LINUX_VERSION ?= "3.10.25"
>>
>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>
>



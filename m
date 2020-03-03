Return-Path: <zhengjunling@huawei.com>
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	by mail.openembedded.org (Postfix) with ESMTP id AADBC60637
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 03:22:41 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 159A0649403FB328FDD2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 11:22:41 +0800 (CST)
Received: from [127.0.0.1] (10.111.155.88) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
	11:22:33 +0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20200302171744.30713-1-zhengjunling@huawei.com>
	<c62719bb-8bda-2221-358d-3ff7f6f2a469@gmail.com>
From: Junling Zheng <zhengjunling@huawei.com>
Message-ID: <d61e15e5-df08-745f-c24b-f483e41bfdc7@huawei.com>
Date: Tue, 3 Mar 2020 11:22:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c62719bb-8bda-2221-358d-3ff7f6f2a469@gmail.com>
X-Originating-IP: [10.111.155.88]
X-CFilter-Loop: Reflected
Cc: wangnan0@huawei.com
Subject: Re: [RESEND PATCH 1/2] security_flags: Remove stack protector flags from LDFLAGS
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
X-List-Received-Date: Tue, 03 Mar 2020 03:22:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2020/3/3 2:40, Khem Raj wrote:
> 
> 
> On 3/2/20 9:17 AM, Junling Zheng wrote:
>> The stack protector flag is a compile option, not a link option, so
>> remove it from LDFLAGS.
> 
> we use compiler driver to do linking as well, what does this change fix for you.
> 

I know that we use gcc to do linking, and this is just a code cleaning, not a bugfix :)

>>
>> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
>> ---
>>   meta/conf/distro/include/security_flags.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
>> index aaf04e9e59..5b79340be9 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
>>   SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>   SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>>   -SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
>> -SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
>> +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
>> +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
>>     # powerpc does not get on with pie for reasons not looked into as yet
>>   GCCPIE_powerpc = ""
>>
> 
> 




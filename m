Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB1546D4AA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 03:33:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB63X0VK027172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 19:33:30 -0800
Received: from [128.224.163.204] (128.224.163.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Dec 2018 19:33:18 -0800
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <3fdeffd5-0d20-b50a-0d8c-8aec3715ebb2@windriver.com>
	<a545e5df-65fc-1249-4fcd-d0c9b0175e27@windriver.com>
	<b8a47a27-bc7c-8404-9133-2c036a25a930@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <e321e6c6-40e4-ecda-c738-5d6784beefee@windriver.com>
Date: Thu, 6 Dec 2018 11:33:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b8a47a27-bc7c-8404-9133-2c036a25a930@windriver.com>
X-Originating-IP: [128.224.163.204]
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IElzIGl0IG5lY2Vzc2FyeSB0byBmaXggdGhlIEJ1Z3ppbGxhIOKAkyBCdWcgMTE4MDcgYW5kIDU4NzYgPw==?=
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
X-List-Received-Date: Thu, 06 Dec 2018 03:33:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/06/2018 11:04 AM, Hongzhi, Song wrote:
>
>
> On 12/05/2018 06:57 PM, Bruce Ashfield wrote:
>> On 12/5/18 5:17 AM, Hongzhi, Song wrote:
>>> Hi all,
>>>
>>> I don't know if it is necessary to do this enhancement.
>>>
>>> 1. Bug 11807:
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11807
>>>
>>>
>>> 'CONFIG_EXTRA_FIRMWARE' is used to be set to the names of firmware 
>>> files which
>>>
>>> should be provided by driver vendors.
>>>
>>> 'CONFIG_EXTRA_FIRMWARE_DIR' is set to a path which contains above 
>>> firmware
>>>
>>> files. The default path is /lib/firmware if the 
>>> 'CONFIG_EXTRA_FIRMWARE_DIR' is not set.
>>>
>>>
>>> The path and firmware files must exist in rootfs eventually.
>>>
>>>
>>> 2. Bug 5876:
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5876
>>>
>>>
>>> I think it mean that bbclass should check the state of menuconfig.
>>>
>>>
>>> I don't know if is necessary to fix these bugs. Could you give me help?
>>
>> I have some enhancements and other things in flight that can already do
>> what these two bugs are talking about. Paul and I had discussed some of
>> the config auditing on the list about a year ago, and agreed that
>> there's no sense duplicating the functionality that already exists
>> (rather I was going to tweak a few things to make it more easily
>> accessible).
>>
>> If you want, you could assign 5876 to me, and I could take care of it.
>
> Hi Bruce,
>
> Thanks, I will assign it to you.
>
>>
>> As for 11807, that is simply a kernel configuration option and it should
>> be handled like any other. I don't see the need for anything special to
>> be done.
>>
>
> This option is different from the common options. It can only be set 
> two types
> of value, "" and "filename1 filename2 ...", which depends on customer.
>
> Maybe we can add a variable containing useful firmware in kernel 
> recipe for customer.
> The variable will eventually set CONFIG_EXTRA_FIRMWARE in .config .

How to translate the variable to CONFIG_EXTRA_FIRMWARE and set the 
option in .config ?
1. Append do_kernel_configme in kernel recipe with sed command inside it.
2. or modify the bbclass.

I am not sure if the requirement in the bug 11807 is reasonable and if 
my above opinion is
practical.

Thanks,
--Hongzhi

>
> --Hongzhi
>
>> Bruce
>>
>>
>>>
>>>
>>> --Honghzi
>>>
>>>
>>
>>
>



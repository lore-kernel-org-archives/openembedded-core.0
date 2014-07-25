Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D904570714
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:36:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6P3a9nc008205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 20:36:09 -0700 (PDT)
Received: from server.local (128.224.20.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Jul 2014 20:36:08 -0700
Message-ID: <53D1D0A6.6050201@windriver.com>
Date: Thu, 24 Jul 2014 23:36:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<a2203c27a84c25e8e62fde8b24e5c829ca212fe2.1406234258.git.bruce.ashfield@windriver.com>
	<53D1D077.5020009@linux.intel.com>
In-Reply-To: <53D1D077.5020009@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] linux-yocto-dev: bump to v3.16+
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
X-List-Received-Date: Fri, 25 Jul 2014 03:36:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-24, 11:35 PM, Saul Wold wrote:
> On 07/24/2014 01:41 PM, Bruce Ashfield wrote:
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> index 9b49eee87651..10f3d234ed25 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
>> @@ -36,7 +36,7 @@ SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${K
>>   SRCREV_machine ?=
>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>> "linux-yocto-dev", "${AUTOREV}",
>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>   SRCREV_meta ?=
>> '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel",
>> "linux-yocto-dev", "${AUTOREV}",
>> "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>>
>> -LINUX_VERSION ?= "3.14+"
>> +LINUX_VERSION ?= "3.16+"
>>   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>
>
> So far the Autobuilder has found 1 issue with this and the x32 build
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/182/steps/BuildImages/logs/stdio
>

Adding Tom, Darren and Nitin .. since this is something they need to handle

Bruce

>
> I will send more failures as I see them.
>
> Sau!
>



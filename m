Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD77A606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 00:59:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4M0xFWS022411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 17:59:15 -0700 (PDT)
Received: from server.local (128.224.23.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 May 2015 17:59:15 -0700
Message-ID: <555E7F62.8070107@windriver.com>
Date: Thu, 21 May 2015 20:59:14 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>	<8d68ee8847de2535cb31b5941da95adf4862e977.1432235097.git.bruce.ashfield@windriver.com>
	<CAJ86T=X9o3vCfuDx6V1_TJOMhObHVPX-NkpdcGgqijuvT8f7Uw@mail.gmail.com>
In-Reply-To: <CAJ86T=X9o3vCfuDx6V1_TJOMhObHVPX-NkpdcGgqijuvT8f7Uw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] linux-yocto-custom: clarify bbappend versus copy in comments
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
X-List-Received-Date: Fri, 22 May 2015 00:59:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-21 5:55 PM, Andre McCurdy wrote:
> On Thu, May 21, 2015 at 12:08 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> The kernel development manual recommends making a copy of
>> linux-yocto-custom, while the comments in the recipe talk about
>> bbappends.
>>
>> To synchronize the two, we remove the bbappend references from the
>> recipe and instead indicate that a copy should be updated.
>>
>> [YOCTO: #6925]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> index 05463c026304..e38af19f827b 100644
>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> @@ -11,8 +11,8 @@
>>   #
>>   #   You must also provide a Linux kernel configuration. The most direct
>>   #   method is to copy your .config to files/defconfig in your layer,
>> -#   in the same directory as the bbappend and add file://defconfig to
>> -#   your SRC_URI.
>> +#   in the same directory as the copy (and rename) of this recipe and
>> +#   add file://defconfig to your SRC_URI.
>>   #
>>   #   To use the yocto kernel tooling to generate a BSP configuration
>>   #   using modular configuration fragments, see the yocto-bsp and
>> @@ -52,14 +52,14 @@
>>   inherit kernel
>>   require recipes-kernel/linux/linux-yocto.inc
>>
>> -# Override SRC_URI in a bbappend file to point at a different source
>> +# Override SRC_URI in a copy of this recipe to point at a different source
>>   # tree if you do not want to build from Linus' tree.
>
> Would "Update SRC_URI in your copy of this recipe..." make more sense here?

I avoided possessives on purpose, this could be one of many copies,
most may not be 'yours'.

>
>>   SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol=git;nocheckout=1;name=machine"
>>
>>   LINUX_VERSION ?= "3.4"
>>   LINUX_VERSION_EXTENSION ?= "-custom"
>>
>> -# Override SRCREV to point to a different commit in a bbappend file to
>> +# Override SRCREV to point to a different commit in a copy of this recipe
>>   # build a different release of the Linux kernel.
>>   # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
>
> Same comment, "Override" -> "Update" and "a copy" -> "your copy".

There's a default SRCREV in many configs, that's why I say override,
but update works too.

>
> Also, the word "to" seems to have gone missing from the end of the line.

Indeed. I'll add that back.

Bruce

>
>>   SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>> @@ -67,6 +67,6 @@ SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>>   PR = "r1"
>>   PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>> -# Override COMPATIBLE_MACHINE to include your machine in a bbappend
>> +# Override COMPATIBLE_MACHINE to include your machine in a copy of this recipe
>>   # file. Leaving it empty here ensures an early explicit build failure.
>>   COMPATIBLE_MACHINE = "(^$)"
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



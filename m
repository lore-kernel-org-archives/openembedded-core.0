Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 621B56A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 02:04:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5K24Kbc021746
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 19:04:20 -0700 (PDT)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 19 Jun 2013 19:04:19 -0700
Message-ID: <51C26322.1070902@windriver.com>
Date: Thu, 20 Jun 2013 10:04:18 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1371609581.git.hongxu.jia@windriver.com>
	<d144145e87b9f15189080665ce91db537522935f.1371609581.git.hongxu.jia@windriver.com>
	<1371629715.20823.163.camel@ted>
In-Reply-To: <1371629715.20823.163.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wget:fix do_configure failed
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
X-List-Received-Date: Thu, 20 Jun 2013 02:04:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your suggestion, I will correct this next time.

Thanks,
Hongxu

On 06/19/2013 04:15 PM, Richard Purdie wrote:
> On Wed, 2013-06-19 at 10:45 +0800, Hongxu Jia wrote:
>> Create a new build enviroment, build wget failed
>> ...
>> configure:34512: checking for libssl
>> configure:34542: i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/qemux86 -o conftest - O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c -ldl  -lssl /home/jiahongxu/yocto/build-  20130613-qemu/tmp/sysroots/qemux86/lib/libcrypto.so -lz >&5
>> /home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld: cannot find -lz collect2: error: ld returned 1 exit status
>> ...
>>
>>  From log as we known, the reason is link zlib failed, it isn't
>> explicitly in wget's DEPENDS. Add zlib to wget's DEPENDS.
>>
>> [YOCTO #4749]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-extended/wget/wget.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> I'll take this but the summary of this change should be something like
> "wget: Add missing DEPENDS on zlib" which explains more about what the
> change does. Fixing a configure failure doesn't tell us much when looked
> at in a history of changes. I'll tweak the summary this time.
>
> Cheers,
>
> Richard
>
>> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
>> index ba37a87..de9b620 100644
>> --- a/meta/recipes-extended/wget/wget.inc
>> +++ b/meta/recipes-extended/wget/wget.inc
>> @@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
>>   SECTION = "console/network"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>> -DEPENDS = "openssl"
>> +DEPENDS = "openssl zlib"
>>   
>>   INC_PR = "r16"
>>   
>



Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31FEC433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 22:30:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.66255.1656887451314098453
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 15:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id BCFA360004;
	Sun,  3 Jul 2022 22:30:47 +0000 (UTC)
Message-ID: <05860cb7-5044-d75d-0e1e-5ce6c6192f33@redrectangle.org>
Date: Sun, 3 Jul 2022 15:30:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [OE-core][PATCH v2] curl: Update to 7.84.0
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jose Quaresma <quaresma.jose@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
References: <20220701141831.101998-1-jose.quaresma@foundries.io>
 <dbb26d0b74ed65a993a72d33c6b8a9bfe667a2a5.camel@linuxfoundation.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: 
 <dbb26d0b74ed65a993a72d33c6b8a9bfe667a2a5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 22:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167593


On 7/2/2022 5:33 AM, Richard Purdie wrote:
> On Fri, 2022-07-01 at 15:18 +0100, Jose Quaresma wrote:
>> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> ---
>>   meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} (97%)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.84.0.bb
>> similarity index 97%
>> rename from meta/recipes-support/curl/curl_7.83.1.bb
>> rename to meta/recipes-support/curl/curl_7.84.0.bb
>> index 1d9de29a65..ade2846a64 100644
>> --- a/meta/recipes-support/curl/curl_7.83.1.bb
>> +++ b/meta/recipes-support/curl/curl_7.84.0.bb
>> @@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
>>   
>>   SRC_URI = "https://curl.se/download/${BP}.tar.xz"
>> -SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
>> +SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
>>   
>>   # Curl has used many names over the years...
>>   CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
> Fails on some platforms:
>
> | In file included from ../../curl-7.84.0/lib/easy.c:89:
> | ../../curl-7.84.0/lib/easy_lock.h: In function 'curl_simple_lock_lock':
> | ../../curl-7.84.0/lib/easy_lock.h:56:7: error: implicit declaration of function 'sched_yield' [-Werror=implicit-function-declaration]
> |    56 |       sched_yield();
> |       |       ^~~~~~~~~~~
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5476/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5447/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3228/steps/13/logs/stdio

Upstream had a bug in the latest release, I just sent a new patch with a 
fix backported.

Thanks,

Robert



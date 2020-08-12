Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.17038.1597245407355170486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 08:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=jGTmDS1F;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.65, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f65.google.com with SMTP id b11so1338121lfe.10
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=3emP8Ntvlr025ak32VDJH0yWawgbmx46nxpFf0m99gk=;
        b=jGTmDS1FyzHDrTCMidEN9FEbxNHSXIuR10XPSbH+U6XWksGT/YsGJO4A1PN+5xlM8Q
         5koPDwhXS4TFDENAbfypOxZNNi89iVhkAES2AmXamtSZC84ZTbu+1/pH3QF0FYb4rnv1
         3kEDk8tFBWtyS613Jyo6zHqItd1EbIkMUCLnNHnG1Z/00B0GtXsjro+KwJM1mgISmho/
         SQI0idJXZGRTg6s/Z0hcBcH4sKLl5gBAMljbZGpmkb8Q5X40hQeVNr3Z98DE0zx70D0q
         oejNePvwWJYT9+Ye3tCLoawktJGH9IIP+HneQQqQwCafKrvqKoRHCYvq80ecpLG4GH9p
         /iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3emP8Ntvlr025ak32VDJH0yWawgbmx46nxpFf0m99gk=;
        b=uUm6h/BmHJJijEpZ+kCD4/14efBCX7N32cwq0MTm2vG0PBVVo9fdr8H6VcFAgTkyHq
         uTTTCyc8zCzmwvpMx9ILYypeaL+0sCtZoOuPgO5sR7iLs6RaCiR4FsK32GrIPH0MAwv7
         AbstqgvQtp2m6qJ9TNE8rsCs3KUbtHwQTTW0utwp2kji326yTtt3e72MqHN2VhBAUU2j
         H6ZLgd2qXOuUEuEF9b86oKewU55QHtVIo1Nh5f/H4MIqiBYA9CKzRo6u+ITMzZhYVfRj
         HuMdb2msfFG1yExsjrBIF6tP4gBpL5DprnstQ+grQNRQPpOC07Y4Qmk7Ru8itAP19A3I
         BSMw==
X-Gm-Message-State: AOAM531QSJof428WSPEHL4Xeopj3OHjHHVvTKDBHUp8k2nHnxQFhs8cX
	IX9y7Wa5KPDJVJ3lsfkQzUQPNUg3cUA=
X-Google-Smtp-Source: ABdhPJyVFRqzy4KnNj+LVNi1Kn9dGRM3NU20jfWT0n4etS9YnrPemeWPA2j86hYxtlgYpBdBSncACg==
X-Received: by 2002:a19:c206:: with SMTP id l6mr5832500lfc.152.1597245404846;
        Wed, 12 Aug 2020 08:16:44 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 12sm494862ljv.49.2020.08.12.08.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 08:16:44 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] iproute2: update to 5.8.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200812001018.554194-1-open.source@oleksandr-kravchuk.com>
 <caae9f9f867092660daf0dc8c667763af76c6996.camel@linuxfoundation.org>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <a2b19816-16bc-41fe-753e-2c5194242815@oleksandr-kravchuk.com>
Date: Wed, 12 Aug 2020 17:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <caae9f9f867092660daf0dc8c667763af76c6996.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 12/08/2020 16:49, Richard Purdie wrote:
> On Wed, 2020-08-12 at 02:10 +0200, Oleksandr Kravchuk wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   .../0001-devlink.c-add-missing-include.patch  | 23 -------------------
>>   ...01-libc-compat.h-add-musl-workaround.patch | 10 ++++----
>>   .../{iproute2_5.7.0.bb => iproute2_5.8.0.bb}  |  2 +-
>>   3 files changed, 5 insertions(+), 30 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
>>   rename meta/recipes-connectivity/iproute2/{iproute2_5.7.0.bb => iproute2_5.8.0.bb} (79%)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
>> deleted file mode 100644
>> index f9580b7d44..0000000000
>> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
>> -From: Alexander Kanavin <alex.kanavin@gmail.com>
>> -Date: Sat, 6 Jun 2020 18:00:13 +0000
>> -Subject: [PATCH] devlink.c: add missing include
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ----
>> - devlink/devlink.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/devlink/devlink.c b/devlink/devlink.c
>> -index 16602ab..c278e6d 100644
>> ---- a/devlink/devlink.c
>> -+++ b/devlink/devlink.c
>> -@@ -26,6 +26,7 @@
>> - #include <libmnl/libmnl.h>
>> - #include <netinet/ether.h>
>> - #include <sys/types.h>
>> -+#include <signal.h>
>> -
>> - #include "SNAPSHOT.h"
>> - #include "list.h"
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
>> index 50c4bfb0f2..60f31db9a2 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
>> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
>> @@ -1,4 +1,4 @@
>> -From b7d96340c55afb7023ded0041107c63dbd886196 Mon Sep 17 00:00:00 2001
>> +From c6109138e9e13c7e40313aacc3ea582c52ffd61f Mon Sep 17 00:00:00 2001
>>   From: Baruch Siach <baruch@tkos.co.il>
>>   Date: Thu, 22 Dec 2016 15:26:30 +0200
>>   Subject: [PATCH] libc-compat.h: add musl workaround
>> @@ -14,15 +14,16 @@ https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-work
>>   
>>   Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>   Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> +
>>   ---
>>    include/uapi/linux/libc-compat.h | 4 +++-
>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>   
>>   diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
>> -index f38571d..30f0b67 100644
>> +index a159991..22198fa 100644
>>   --- a/include/uapi/linux/libc-compat.h
>>   +++ b/include/uapi/linux/libc-compat.h
>> -@@ -49,10 +49,12 @@
>> +@@ -50,10 +50,12 @@
>>    #define _LIBC_COMPAT_H
>>    
>>    /* We have included glibc headers... */
>> @@ -36,6 +37,3 @@ index f38571d..30f0b67 100644
>>    
>>    /* GLIBC headers included first so don't define anything
>>     * that would already be defined. */
>> ---
>> -2.4.0
>> -
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
>> similarity index 79%
>> rename from meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
>> rename to meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
>> index 276afeab11..3a590f9122 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
>> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb
>> @@ -5,7 +5,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>>              file://0001-devlink.c-add-missing-include.patch \
>>              "
> The patch mentioned above in SRC_URI is deleted above?
>
> Cheers,
>
> Richard

Yes, it was a backport. It is part of this release.



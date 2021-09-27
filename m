Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC5FC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 15:40:40 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.856.1632757239190613172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zk6IdReD;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id w14so16244238pfu.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=SewDQBIIJy88e4OYHNlF3C1o9MiQ5GKzFhckxhAd9UA=;
        b=Zk6IdReDj5qeFsyeOTz6WB76vNSh+Ur4LCVF25/YHhTPweDITTg7VggbWtFvZ8zCmx
         Kq0qkFdLEREexdEtVkYfWFZDvZfT16U+I2mFyZuXbO6QFFOwPiaSvqC6PmqLpUUjaylG
         uJdlKATttAi9AWbyBdlT+OP3Er5UC48EoPo6rLExNoGTVQpFMIiUqr9dAka0LAKnDSjP
         TIT/TMfwROD9xtIQlekoQgHlRAy+IcgBNqLXJfnfgMyi9OtVoFdPixWIl9MM01WS1BKK
         D6T6EbSLYJ5TIoc5olH/G3p1RMP+iSjjv/w9IYp5C/8g7V36lGQqOkWBixa3aDZfXCrV
         YUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=SewDQBIIJy88e4OYHNlF3C1o9MiQ5GKzFhckxhAd9UA=;
        b=6rNnObwCifHCUZLPVJKXA0B6H1tHLlLEaM5+/QyOapPnnlgwrwONsbvvsrmCWB/irK
         T5hhU+3nb7OWOwC+2jwMayoy9bsJ32UaeJqc7ZARFaa9WqTQ53Fq6VM3l7w7FTbjx9Bo
         lAxh3GQCcwMSHMN5gvAXmVL/p7oV6awieVrGyXjl+Ljm5HluA0QGSFkHBGT4TV1h97uV
         PAUbi5MkCViXUpqHMTXR0GzIux8QSzRB4jdBC0RDKxABwKMkNQOffCb8KxoxG3fB5x3l
         yrErTiNuAVm55nO//D9nO//hd0k3Jap3owU64xSA94Rup5+uw1t7Dg8zDLP2tI0XaWe7
         OLwQ==
X-Gm-Message-State: AOAM5310NHgpRZM+uD5Fsx/XMR5kIrYR9/MHv4cJK3igW85vmfszpF8/
	wsmtrD/QzAlL5fo+xDTOdb3ra7azJo06Wg==
X-Google-Smtp-Source: 
 ABdhPJxt6le2gXRmEKi6+NyrbgGWQPfxH0xs1C7bmQEnrNcGGJRqhFwRMJ0I9Z7m0HgnIaSI2OEHmg==
X-Received: by 2002:a63:de41:: with SMTP id y1mr283298pgi.93.1632757238615;
        Mon, 27 Sep 2021 08:40:38 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:15c7:3503:63b:40fb?
 ([2601:646:9200:a0f0:15c7:3503:63b:40fb])
        by smtp.gmail.com with ESMTPSA id
 r206sm3842667pfc.218.2021.09.27.08.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:40:38 -0700 (PDT)
Message-ID: <468523a0-30d0-afb1-75dd-3a27a051bd49@gmail.com>
Date: Mon, 27 Sep 2021 08:40:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH] libsamplerate0: Set correct soname for 0.1.9
Content-Language: en-US
To: Tom Pollard <tom.pollard@codethink.co.uk>,
 openembedded-core@lists.openembedded.org
References: <20210924124757.86731-1-tom.pollard@codethink.co.uk>
 <a7ef7af8-6a70-4396-89c0-e84dc5d01a5b@gmail.com>
 <2433fb0b-99af-5c4f-7170-7fbe6f40dc75@codethink.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <2433fb0b-99af-5c4f-7170-7fbe6f40dc75@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 15:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156387



On 9/27/21 4:10 AM, Tom Pollard wrote:
> Hi Khem,
> 
> On 24/09/2021 17:15, Khem Raj wrote:
>>
>>
>> On 9/24/21 5:47 AM, Tom Pollard wrote:
>>> Manually patch SHARED_VERSION_INFO, which was missed in
>>> the 0.1.9 release and later incorrectly fixed until 0.2.1
>>>
>>> Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
>>> ---
>>>    .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
>>>    .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
>>>    2 files changed, 14 insertions(+)
>>>    create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>>>
>>> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>>> new file mode 100644
>>> index 0000000000..b42d564b4b
>>> --- /dev/null
>>> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
>>> @@ -0,0 +1,13 @@
>>> +Index: libsamplerate-0.1.8/configure.ac
>>> +===================================================================
>>> +--- libsamplerate-0.1.8.orig/configure.ac
>>> ++++ libsamplerate-0.1.8/configure.ac
>>> +@@ -53,7 +53,7 @@ AC_PROG_LN_S
>>> + #  6. If any interfaces have been removed since the last public release, then set age
>>> + #     to 0.
>>> +
>>> +-SHARED_VERSION_INFO="1:8:1"
>>> ++SHARED_VERSION_INFO="1:9:1"
>>> +
>>
>> it can be synthesized from PV, that will be better, since we dont have
>> to change it manually everytime version upgrade is done.
> 
> This patch is only required for this specific 0.1.9 release, it was
> incorrectly 'fixed' across a number of commits going into the following
> release 0.2.0, which is marked as do not use because of the issue:
> 
> https://github.com/libsndfile/libsamplerate/releases/tag/0.2.0
> 
> Once the recipe is bumped to the next release 0.2.1 and thus targets
> github releases it the patch be dropped.


I see thanks for update. This is fine interim fix then.

> 
>>
>>> +
>>> +
>>> diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>>> index 6dfc42b436..8345d6880f 100644
>>> --- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>>> +++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
>>> @@ -10,6 +10,7 @@ PR = "r1"
>>>    
>>>    SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
>>>               file://0001-configure.ac-improve-alsa-handling.patch \
>>> +           file://shared_version_info.patch \
>>>    "
>>>    
>>>    SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#156333): https://lists.openembedded.org/g/openembedded-core/message/156333
>>> Mute This Topic: https://lists.openembedded.org/mt/85838060/2167528
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tom.pollard@codethink.co.uk]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
> 


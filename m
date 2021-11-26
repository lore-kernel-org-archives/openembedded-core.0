Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A80C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 09:13:20 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.21635.1637917999944251560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 01:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RjVcQad8;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id r26so22622064lfn.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 01:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dTstwstj81HmSqgf9J7uTYQza2o1fk/Q/DU+EWpBh5A=;
        b=RjVcQad8tyYkSTzO0E40SPuNWLHEVv2w/e1ymYjlqCYSuJYUWWrLCph8uG0y9/mC4y
         8gvbgPwINv0DE2TeTBu2M2DG12YjI9hU/vLInlG3RKhUEFafxk8uWbsbiffVss6w37t7
         AfGtmjnW/oUHGtITfdFbTAiWYzqOCi+BIYkLGhfdvjXV23ccu/5fUPXXGw9UHp8dtOJw
         rbOFKA+0QY5/GeEalM3BStk8qpfIUU99ppmOydXyu5y9+F5hA0Zrfby0TJpLUbFLhCBs
         HsnS9n4aKx3mThp7YxTe8IQdRW0eYvNhpVU3mzrCWAq0xPwzxeToaQOuaDoBTgJu+1ln
         dj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dTstwstj81HmSqgf9J7uTYQza2o1fk/Q/DU+EWpBh5A=;
        b=3GLc24SnF9xwGDa6IjQcBkIaOwVEQZXpHfQ0VI8S8p/xDsdYPkyGzFwikZrF7SPPez
         5d695sG6SuUO/nHHBvw4glqVrKRXRSfCflEhgzMZ8W86xjwJlr+h8NPzE92dJ3EgC571
         PbDwIPrvXvonoDNtK2lj9Il3tKW20oytjHZnURnnG1v1E3ieNvAKOJ/yR07ynR0+c9hL
         fYyvrxFk3dlyZ/slkGxFFpH8nKWmkqwSK7aaDUGguL4c2iCpIKUDpAHUzdcKaqA0JVdc
         STuajtZxZPfcpwwId7VBULClFln0ICwBF9QEHWgmpgQUtn5b+Ka9kyqsEdXEC7cltLe4
         gmBQ==
X-Gm-Message-State: AOAM531HwJ2RCrwlxcrlNcs0+m/j5fJLmd9FdBQOjpTQA0yU1y5fj9ZQ
	hY0PcpjVIejyNbg/0SjmawE=
X-Google-Smtp-Source: 
 ABdhPJxl9yDItc7d/t84ArkTNIIAjLIry5/wVL5tnKqNH7c4QcDslZxdPw0VFcYAp+nctTDATAnsUQ==
X-Received: by 2002:a05:6512:114a:: with SMTP id
 m10mr29451673lfg.54.1637917997795;
        Fri, 26 Nov 2021 01:13:17 -0800 (PST)
Received: from [10.135.92.11] ([45.92.33.28])
        by smtp.gmail.com with ESMTPSA id
 h24sm429500ljg.106.2021.11.26.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 01:13:17 -0800 (PST)
Message-ID: <9f19c2c7-0852-013a-4568-e8af7cf60910@gmail.com>
Date: Fri, 26 Nov 2021 10:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [docs] [PATCH] dev-manual: how to purge duplicate sstate cache
 files
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <16B8C24F834E3318.24748@lists.openembedded.org>
 <16B8FE3872AB92F9.32206@lists.yoctoproject.org>
 <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1731b51b-da96-50b2-923b-3ae95b8911d6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 09:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158827

Hi Michael

On 23.11.2021 10:14, Michael Opdenacker wrote:
> Greetings,
>
> On 11/19/21 5:06 PM, Michael Opdenacker wrote:
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> ---
>>   documentation/dev-manual/common-tasks.rst | 25 ++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index 3eead147a3..37612c84b7 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -6242,8 +6242,11 @@ Changing the listed common targets is as easy as editing your version of
>>   ``conf-notes.txt`` in your custom template configuration directory and
>>   making sure you have ``TEMPLATECONF`` set to your directory.
>>   
>> +Conserving Disk Space
>> +=====================
>> +
>>   Conserving Disk Space During Builds
>> -===================================
>> +-----------------------------------
>>   
>>   To help conserve disk space during builds, you can add the following
>>   statement to your project's ``local.conf`` configuration file found in
>> @@ -6257,6 +6260,26 @@ building a recipe once the recipe is built. For more information on
>>   :ref:`rm_work <ref-classes-rm-work>` class in the
>>   Yocto Project Reference Manual.
>>   
>> +Purging Duplicate Shared State Cache Files
>> +-------------------------------------------
>> +
>> +After multiple build iterations, the Shared State (sstate) cache can contain
>> +duplicate cache files for a given package, while only the most recent one
>> +is likely to be reusable. The following command purges all but the
>> +newest sstate cache file for each package::
>> +
>> +   sstate-cache-management.sh --remove-duplicated --cache-dir=build/sstate-cache
>> +
>> +This command will ask you to confirm the deletions it identifies.
>> +
>> +Note::
>> +
>> +   The duplicated sstate cache files of one package must have the same
>> +   architecture, which means that sstate cache files with multiple
>> +   architectures are not considered as duplicate.
>> +
>> +Run ``sstate-cache-management.sh`` for more details about this script.
>> +
>>   Working with Packages
>>   =====================
>>   
> Did anyone have time to have a look at what I wrote ? There may be
> better ways to purge the sstate cache files.
> Thanks in advance
> Michael.

The description looks good to me. By other ways you mean other usage 
scenarios of sstate-cache-management.sh script or by means of something 
else?

Vyacheslav



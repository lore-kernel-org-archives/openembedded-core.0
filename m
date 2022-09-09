Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A094ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 17:05:37 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.366.1662743128823167560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 10:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gk7r4uEd;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id o2so1603397lfc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 10:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kAfUjQGm4D3w779caZ08vxUFNJIriSinoi5DmfHMvhM=;
        b=Gk7r4uEdvTc4J6Dfg/KmhbgpkDLy+Aixh6GOhHoWw2Bpqir0U8qzJL4k1sPo4NgG5Y
         ATZxdTxJp5WNcumRo31Gfaekk/R6Zyo699o5YXmhyQUCtXIyrWAc0HlCZZGsbAyblGZS
         JGKwLLGgUaDURYB9PhySFxHgXvy1UDaQheqDw6v96D+FPH9zHbfdoUNEYL5Mqeb+Z0aq
         Qp41oqMzoddUA4uWWCHQUZGoxo46zoMjGYK1dSJfuHgBRQsxM318CMLy4I/BzqQzuyQH
         lYCXo6YVS6xQDBPECjBVpNz3+Toya/ONQ7nNSOd2i7otVR950ick1f+GMclTbryA7ee+
         433Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kAfUjQGm4D3w779caZ08vxUFNJIriSinoi5DmfHMvhM=;
        b=33knQ/V/kk3bgB7fx/U5QbdM2RPFRjUW/CG3LcEC19yLmF+w3mcpUOjdf7ry1+BYHv
         E95fCvYBaY84em/r/i4HE8bu15X/kjQpNd/LEERuElQAyuJVi1TKWIf3Km8szuxoBQgI
         CGMjjsIHQRcRkTbzSgCXeEG4L/43b2xlIdbjVE0ESSkkvmX0Y+m74GoUaU4q7z/gNHy4
         MerCKutggIogKnHBHrXvoz2SdZOBmLu5iOgDU8bLr6fpnmpuvqyDJxJ5wHaYxeqpuLcT
         21JH9itKD27CqT9Uewkgby+n6yfA3fL1kA+PlW4ohjNkodmlcjc+eFaqZ6m9yjv1YNx1
         EDPA==
X-Gm-Message-State: ACgBeo2IYsu2UttN/pm//N7IwLC9Vl7O3/PtxVVfXCWBIDQXLOWE7xgo
	5AlggTX+Y+TPOUVeDftMYa4=
X-Google-Smtp-Source: 
 AA6agR5CpwpX6sxbjrju+fvi+cU00Jm2lhHJCruf3olQlYv/mMO1jDV9DSY3mfZ1AZMrz7vPM1L/9A==
X-Received: by 2002:a05:6512:31d6:b0:498:f7be:aee6 with SMTP id
 j22-20020a05651231d600b00498f7beaee6mr1470702lfe.667.1662743126845;
        Fri, 09 Sep 2022 10:05:26 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 y10-20020ac2420a000000b0048b23c609c9sm152802lfh.102.2022.09.09.10.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:05:25 -0700 (PDT)
Message-ID: <890e5f59-6541-8e87-c57e-f448f444d631@gmail.com>
Date: Fri, 9 Sep 2022 19:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>
References: <20220909163640.1985612-1-ross.burton@arm.com>
 <aec9d2b3-bb3a-cae0-ebab-d5b4f5481f96@gmail.com>
 <8B8690ED-C7A3-4CC4-9D37-1BC5397DCA4C@arm.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <8B8690ED-C7A3-4CC4-9D37-1BC5397DCA4C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 17:05:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170503

On 9/9/22 19:00, Ross Burton wrote:
>>>   -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=${sysconfdir}/xml/catalog
>>> +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=${XML_CATALOG_FILES:-${sysconfdir}/xml/catalog}'
>>
>> That ...:-${sysconfdir}/... looks odd. Is that hyphen intentional ?
> 
> Yes:
> 
>       ${parameter:-word}    Use Default Values.  If parameter is unset or null, the expansion of word is substituted; otherwise, the value of
>                             parameter is substituted.
> 
> Ross
> 

Aha, very nice, sorry for the noise.

Jacob


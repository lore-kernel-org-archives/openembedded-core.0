Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE750C25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 21:04:15 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web12.197.1659647046568579921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 14:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jRKoGZGC;
 spf=pass (domain: gmail.com, ip: 209.85.160.42,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-10e6bdbe218so883290fac.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 14:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XSRCE79D1Olu5HAcEArNJ2BVdxIuRvxQ+rVlzil91AY=;
        b=jRKoGZGCiXdqoQAFLjt1sddgJSxgOZ/W2gCMR751HhOfHKLKwKjIATrjftaDOiZcjC
         mQ0WJSfYKl9WFlRH2u17jCM5xt97Nt2IQBZPH2xjJaA5uEKKSMNPYw1gus0qati2soeV
         bQtdSMv40DCa6dzGLkLcpt2e66pcwrYfav1aeVHqmL96yAcIbjev+gzEdbkixj3BkZKR
         Yt6R4lOfsNYwb3I/ERHCGoj7JLM+RF28aePxyLh9Tf3nGOS+0RJ3LqFoVhvAHmojqzO3
         O2q31/RFTmH+rf3272gzdiuschkICizid0MTxMwptEw/zo1kM5KM0Vw23WuF9epdBV4x
         vVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XSRCE79D1Olu5HAcEArNJ2BVdxIuRvxQ+rVlzil91AY=;
        b=Uu0yEP6QN9u60rNWq2DX7Rms4MP2ytMiil0/thkvBSEc8d4GzcT/rs14ZAndB87a3A
         0bgiet4C4J3VsBV3rXcp22MSinMWa0jz000TnUFDWoag/gbuPqexQlZtvvC1BmsrwojY
         TrpcV1LjzxUiq4BdYgSEISiWtDVx70RmMaFaKL4uG8PgRl2mQQS9rXLB1A7uVPgn5yS1
         ur6FgRvujQkPgkwqPbJZt5YBazVOpD5u2YB6N+xbPGPg3xUBRKvqQqykmXFj0IZsOxb9
         M3mO5N3iFd36BkOrcx9AyK8kGr4hDCkUBA3a4MAR0Iv2NLzHk16EJbfB9LKCQ/rQSRVp
         JUzw==
X-Gm-Message-State: ACgBeo26yah+FIqw3LZYUFpQtsyiX7PT/9kX85/dzBx5UnHRx2GqW894
	DYBBb57SnVMj6grGbJZmqQqGcwspE4E=
X-Google-Smtp-Source: 
 AA6agR5sjEIOOw6P200DJqxMzyrP4NbRdsXBgd1J08iHSY/jWRBXdHX9gUuaqY6UVVl+9uDBGsyTfg==
X-Received: by 2002:a05:6870:d1d0:b0:101:ec40:69ef with SMTP id
 b16-20020a056870d1d000b00101ec4069efmr5389546oac.187.1659647045856;
        Thu, 04 Aug 2022 14:04:05 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056830128500b006369299f514sm312814otp.76.2022.08.04.14.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 14:04:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <8f5b1055-c76c-1996-626d-9ef996368efe@gmail.com>
Date: Thu, 4 Aug 2022 16:04:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH] classes/sanity: Add comment about github &
 gitlab archives
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220804145831.1545698-1-JPEWhacker@gmail.com>
 <20220804225814.61baffe2@booty>
In-Reply-To: <20220804225814.61baffe2@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 21:04:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168863


On 8/4/22 15:58, Luca Ceresoli wrote:
> Hi Joshua,
>
> On Thu,  4 Aug 2022 09:58:31 -0500
> "Joshua Watt" <JPEWhacker@gmail.com> wrote:
>
>> Add a comment so that users grepping for "github" or "gitlab" will find
>> this code (since the regex wont).
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/classes/insane.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 37e10ad850..c8b434bb54 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -1335,6 +1335,7 @@ def unpack_check_src_uri(pn, d):
>>           oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>>   
>>       for url in d.getVar("SRC_URI").split():
>> +        # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
>>           if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
> I think the regexp is unnecessarily baroque and it could become just a
> more readable (github|gitlab). And that would add only 4 chars! :-)
Ya that would be better. I assumed someone was trying to win regex golf ;)
>


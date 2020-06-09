Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.1901.1591718461420368870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 09:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JrVF/CBz;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id l1so16784810ede.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Wk6+P8VjzVH19BrMfdfuuFRbAlpCnQ9NcjaSQOidV/E=;
        b=JrVF/CBz08IxiPmKvNF1dYFd4atsRDB3p+kKpaoId/ia5mGm23/1/1CjASdC3FCPvt
         tpGrbrV7Yn8ESnpgwhGqHPL1Qh9hkuGomuQSdB2L7uHFRS0LtiMzBcdfwv8KAiIh1bN9
         UXbihCaMsTcGS+73PldmncXF2+IUnWVcwz2v/rrez4rv0bQQQ6P1oW3q3M6CpWtW7bxT
         1vXS+Io39ZPMd8T7W4/29uzlIRJ7/EQPQ8T/kc3bgE/5fXWRvThHKvA4doTe5T8ccz/n
         Lbr2tH4+ueVNl97CRv4EpcaPlbrNDQbQ/LK+Hj8T+/diQC6RhSxHHvr/kF9O7fhImTxa
         ZUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wk6+P8VjzVH19BrMfdfuuFRbAlpCnQ9NcjaSQOidV/E=;
        b=t2Rb+Rq1G6MJHNEP8loXBMv1qLooRBmfNHGDJhdX6H9PCSEgWtdExQE/mXflWMpcCs
         jABUDgORcDi1xX6GgGtlPSsR0R9FFXNj/qX70U5uDo/8NVFEt2RXIS5in0zUpFybggre
         MOBkpeniq9YAwsE3xxhJITBSunkSjggG+QG5UVtmFmZyg6Yq8MpGwnyXQHY/yVdJx0P4
         X0B3/h48LPpvwlAeBPhQ6q+Xnvmou7F7Yy1Y6LX1IpB1/JA+1zTXxFY3mGq1kb0c3XEe
         SFeNej6Q8hzjdO83PUaGAfCKatWne8R72Q9wIRn+AZh4WVnrrOkATipx8BIf9W8cjyBO
         2EwA==
X-Gm-Message-State: AOAM531Q/sdnNA43z8az/NL/Ynkzi4+PkDlzifZWpfkvnaxeNH0Rjl8i
	+vYep762wl0hZ2sTaoS01mf2FivW
X-Google-Smtp-Source: ABdhPJxxe6vg5TlYoVawRUrz2xBi9pb13TO3pUYNkCd9zvbY/3x/4a7gOmWHaWeBGJu1u/vjlQWk5w==
X-Received: by 2002:a50:da83:: with SMTP id q3mr4899514edj.325.1591718458326;
        Tue, 09 Jun 2020 09:00:58 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id a8sm15197090edb.29.2020.06.09.09.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 09:00:57 -0700 (PDT)
Subject: Re: [OE-core] [RFC][PATCH 1/2] features_check: Warn if not used
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
 <ac946facf19b1d2b6c39d23a84c6eb1c5fbaca0e.camel@linuxfoundation.org>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <7d7b427e-5b4a-285c-c981-5c5763d0af06@gmail.com>
Date: Tue, 9 Jun 2020 18:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ac946facf19b1d2b6c39d23a84c6eb1c5fbaca0e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/9/20 5:44 PM, Richard Purdie wrote:
> On Tue, 2020-06-09 at 16:11 +0200, Jacob Kroon wrote:
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>   meta/classes/features_check.bbclass | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/features_check.bbclass
>> b/meta/classes/features_check.bbclass
>> index 4ba827d4ab..31ce600374 100644
>> --- a/meta/classes/features_check.bbclass
>> +++ b/meta/classes/features_check.bbclass
>> @@ -12,11 +12,25 @@
>>   # Copyright 2019 (C) Texas Instruments Inc.
>>   # Copyright 2013 (C) O.S. Systems Software LTDA.
>>   
>> +FEATURES_CHECK_INCLUDE_STACK := "${BBINCLUDESTACK}"
> 
> This looks like a rather heavy hit to want to take on every recipe
> being parsed everywhere (I also really don't like seeing := needing to
> be used).
> 

Maybe I misunderstood you, but the check is only done in recipes that 
inherit the class. If you are referring to the accompanied change in 
BitBake for keeping track of the include stack, yeah that might be worse.

The direct assignment is needed in order to suppress false positives, 
for instance when an .inc/.bbclass contains the inherit directive. Not 
sure how to work around that without this.

> I'd much rather this were some kind of test we could run periodically,
> maybe on the infrastructure rather than the hit being taken all the
> time.
> 
> Could we add something which just ran these tests? Maybe a class which
> the autobuilder could inherit to enable these kinds of tests?
> 

Maybe that is a better approach. autobuilder could send a summary report 
periodically to the ml so that the warnings would be visible.

Jacob

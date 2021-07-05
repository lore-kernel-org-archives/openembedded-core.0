Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.14907.1625512119783356996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 12:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t9oc1kh3;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id d12so19129528pgd.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=7JRBkqQr56ds7QNdvXdZSq6SbEvDZ2ysDY4sHY3hH9E=;
        b=t9oc1kh3/aCbeMZY1MXmC/qG/eLfKjT9/znfGIhxbgwZl2SqqGpjSyCyn7HO+DoD37
         +688a7+uy9KuAQPFdcOAsVZ/SWXvvPxfZIvLCC4FxhgiIHUBx73c3W2VYE2Ljcv372Wi
         Zzfsnru1dBThvgyHKF+4e7SmtnCvXCaV34HzwAdAOpYyIFstEqmniqtY1Yj4vABj5CTa
         AcwCQzSaL4xy+Z6ARg4CC0dE75gAXi1+belpfR+Ky4gkTviixWcb+kqi23N5/EKHP57/
         nqDFIPohChLj8/EJ5JaO3lSwlYDmWGdo14urUmjSA2aL3ANwel8d2w3lPhDHarA1tksT
         NGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7JRBkqQr56ds7QNdvXdZSq6SbEvDZ2ysDY4sHY3hH9E=;
        b=muHwaJmC+08nxF1pJ9sIeZ1OAf+DNmgKnjfkXQRx7+OjRjAnWWRm5tAHP+9RA4Fv/m
         EsdznJvoILm3JHT3+goN0gNB8/qQFCq8zSjqKEcA7gxBmc1DCJ6jtnPhUKbUUwCDSnr+
         lH8+kckjcDzmWBrBzYVYs6hqzknsAKicW+jvgMVli0AUvQAmQHTazn5oq7rHWwh38h5a
         ST4vDly7xbpbigJnBjgMS8+X2q+V8yfPr8WFcowXbCPjyx20HBkQECbD2w40VLoWqDXj
         /dhzgijRm/sFS4BX8dkAKiXwbWJG2gsonleP56PW3qL7Sc/ENJuIIn+o5DRH49CvwVzp
         DW+w==
X-Gm-Message-State: AOAM530WVBuVMmgE0c1fMxHTC8WEZyy2jkNNfryGg7b6tVqExIdKGEFP
	olfaTVF8ytQeYMCyANZrRFiVwbz9cQTbqg==
X-Google-Smtp-Source: ABdhPJz/0vvywhzJr5UWynKlJDBX2jOhLBgeIumd4KmR6M622YUE7ZpxdTjbhpQGFDT3rIJGJCKj6Q==
X-Received: by 2002:a63:4302:: with SMTP id q2mr16954828pga.428.1625512119020;
        Mon, 05 Jul 2021 12:08:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:37df:273f:1e4f:b167? ([2601:202:4180:a5c0:37df:273f:1e4f:b167])
        by smtp.gmail.com with ESMTPSA id d20sm13555028pfn.219.2021.07.05.12.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 12:08:38 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>,
 openembedded-core@lists.openembedded.org
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
 <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <7ddffb54-dbc6-e221-fa69-5dff83ef5983@gmail.com>
Date: Mon, 5 Jul 2021 12:08:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/26/21 3:04 AM, Richard Purdie wrote:
> On Wed, 2021-06-23 at 17:56 +0900, ito-yuichi@fujitsu.com wrote:
>> The Linux team plan to removed references to racially-charged jargon from
>> their code for more neutral and inclusive language.
>> So replace use of "whitelist" with "allowlist" in cve-check.
>>
>> First, we add CVE_CHECK_ALLOWLIST and it is considered patched as well as
>> CVE_CHECK_WHITELIST.
>> We plan to replace about other word later and eventualy, replace all
>> "whitelist" to "allowlist".
>>
>> Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> The TSC did discuss this and proposed a plan on how we should go about 
> addressing these issues:
>
> https://lists.openembedded.org/g/openembedded-architecture/topic/inclusive_language_summary/75821819
>
> I appreciate this patch has good intent but I would really like to
> see a wider plan on how we address this rather than changing single 
> variables piecemeal. 
>
> For example we may want to standardise on the term "IGNORE" rather than
> "ALLOW" or even "FILTER" or "VERIFIED" or something more specific to the meaning
> of CVEs and CVE checking.
>
> There is an opportunity to try and make the metadata and variable names
> more consistent and understandable but if we just change single things at
> a time this opportunity would be missed.

I have created a wiki page to collate our thoughts and agreements to
help us move foreword in a coherent manner to address renaming some
troubling variable names.
https://wiki.yoctoproject.org/wiki/Inclusive_language

I logged some variable names along with a few renaming examples. Maybe
this can turn into a plan???

Since it's a wiki, please edit accordingly.

- armin


Cheers,
> Richard
>
>
> 
>


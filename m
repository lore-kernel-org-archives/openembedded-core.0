Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.13866.1619798631735114623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 09:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FGHqfNkl;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v20so9572869plo.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xf6+hPr/dNC89m+mcWrh5vDIBGInmmV+tCevoaAwmAA=;
        b=FGHqfNklyMgg8UuFotHOlHVfzTH4gWNG0i7K+PG/JTj4+axU5E/lSLTlDGLRB430z8
         cJi9W14oBr+pvHQ8ng4ZVtUWTFL/xzmO6yPE8E6x7P+H5UA+NaJc0HHQtIQulmuvQ3Ea
         wW8IYTYdd7i2WV9+TABEcKldufn6X7aCAhAwSkYz4KhA07rrzVB0+Xnv4IAkqx5LLQxb
         hLOazTWo4IaV2JEjbGTYNQw8W65C7/yFptHnC7bbZLxLs+3DdDrmCv2qworloQk9565d
         pVHKLn0UEaBaOu7Wnbl6H/vowaqszumao+s+1GaRrSAJVzrm6DTmKqS3FdimWg/t24oZ
         W0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xf6+hPr/dNC89m+mcWrh5vDIBGInmmV+tCevoaAwmAA=;
        b=NAjX+kY9uQZt3/T3GlIxknV7+jTUCIWLKt5zrxMZJH+UNNSHjCCwf3wiTjCRcYiXlv
         nv0vENCrahVXIWj8jBNy8BISmQjlZLm87cJ11ec0J0t3Cj8gHqPcJWBQGWJdhW/f7106
         hLbZTGM6P06wdMYaYquCX/Ds4FSuWYH5nFzFWR52qIwXuIXAxOsAIEG9F6zUAoik7BPu
         T0GfKQhYFhZj+DPNvlON+3BsffAijIfvgIPVVe33Rf8FHkC/Qk8CmcWkhSTlk5loX6hg
         H0wvTe2MqG0RAy/CWJ6v+PhJgKt2+YeMUT5u2V4uwuyn1m0SCIKx/WkIyO7JDSG/uV7C
         dzgg==
X-Gm-Message-State: AOAM530lqyfABiw0QG37P/ITnW8J2/rgV3oEJfonpRNK79r2p2tcGnhV
	QB5QsYrvj2aMe1+pEPJTJUfyhSRrRX+8Sg==
X-Google-Smtp-Source: ABdhPJxfrXaQQeaY2KddMhgu08CnZuOHP8zsAUlG6JQJFDzN16moHNFImHocA1pR46tc8Q6hURionA==
X-Received: by 2002:a17:90a:31ce:: with SMTP id j14mr5818355pjf.98.1619798630790;
        Fri, 30 Apr 2021 09:03:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:ad3a:b4d3:a3e6:bf70? ([2601:646:9200:a0f0:ad3a:b4d3:a3e6:bf70])
        by smtp.gmail.com with ESMTPSA id q8sm2490905pfk.137.2021.04.30.09.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 09:03:50 -0700 (PDT)
Subject: Re: [OE-core][dunfell 07/12] go: Use dl.google.com for SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1619796615.git.steve@sakoman.com>
 <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
 <01250a308dc7b262963fae41d95c0f1d68b455e6.camel@linuxfoundation.org>
 <CAOSpxdZpcGXGP_yFzCaneJHwQ+B9_J36c_xoYEeoCKhEigk3FQ@mail.gmail.com>
 <27e726bde79ae49abcb12b0d028b8d38d2cf77a8.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e128327f-643b-f16e-e6b5-81cd8d8f6d5c@gmail.com>
Date: Fri, 30 Apr 2021 09:03:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <27e726bde79ae49abcb12b0d028b8d38d2cf77a8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/30/21 8:58 AM, Richard Purdie wrote:
> On Fri, 2021-04-30 at 05:53 -1000, Steve Sakoman wrote:
>> On Fri, Apr 30, 2021 at 5:44 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Fri, 2021-04-30 at 05:33 -1000, Steve Sakoman wrote:
>>>> From: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> golang.org/dl is resolving to this anyway
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> (cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> ---
>>>>   meta/recipes-devtools/go/go-common.inc | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
>>>> index 39a681a712..c368b95b69 100644
>>>> --- a/meta/recipes-devtools/go/go-common.inc
>>>> +++ b/meta/recipes-devtools/go/go-common.inc
>>>> @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
>>>>
>>>>
>>>>
>>>>
>>>>   inherit goarch
>>>>
>>>>
>>>>
>>>>
>>>> -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
>>>> +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
>>>>   S = "${WORKDIR}/go"
>>>>   B = "${S}"
>>>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
>>>
>>>
>>> We are seeing autobuilder issues with some go downloads which we may want to
>>> resolve before merging this.
>>
>> OK, haven't seen those with dunfell but will drop this patch from the
>> pull request and monitor master for resolution.
> 
> It is this and the https change earlier in your series. It could just be
> some corrupt files in DL_DIR but I'd be happier we get this resolved there first.
> 

https change is still good, but this change perhaps is not required. for 
master/hardknott we will get it fixed once we cleanup downloads mirror.

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.59032.1595865928805232571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgWtxNab;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id m16so8254394pls.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 09:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3z4sgZIxSiXSAcldBe4xJ7NadW+li7vrtXjlzjiASXc=;
        b=AgWtxNab4iFOIAaPx3+DjHQNSFJx/9xSTuFYFyIJ9zJergSL32Kk0uqQiz7s5i6eBY
         2QaLYl4gR/6kz5Xnj/dwa0MhJ0TKHlD2LEzrr9xYl0IGT1aJyycxvhJK9KZ5cZ/RCnZp
         wewaEuDBzBsT4GYtROywGH1CcDS8qn90Ns/tRHJzvb7u6W/9pCxRixWJlJaiIpo1GEXq
         dyoXlNvVz5SZ5DasluZtk+Z0mb/gmmO0s7/mTBwHan9CGOFaplzmCMY5ktaKhSCG6ixK
         D4TB/pSrWDZvShFHsPBWISQRBuYuZCaUeK7P0wnuHYctzSNGh0rlB+VUb4oraltA6+JJ
         /vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3z4sgZIxSiXSAcldBe4xJ7NadW+li7vrtXjlzjiASXc=;
        b=VOmpKsfHzxu52YtCEzkd6Da5hySQiGKBP4mSxiG37UEKTdZSjhnqPCInzce7zMxwg9
         HyyEjhiMHjXBg4mYPCPiBuMHmssWEBJqcSnS0lHTPkKhekUUEpholUIkwdbBT9l3GzcJ
         MBt8gzhMcsLYzfzhqnLzXkbS2oneiXjP1z5AKCYVRYl5wINg4+VfRFKE+pgX8Si+FlTL
         4zQx0I1OKn/1jTeUv+XSxrUKC9Etw7yjAOmuMTdPt8L0DLIUqe0iEl7ML39TV+tWl1GZ
         GlMidCf0odwUz+mz195tuNUh+qIN0Cc8FUdS16KRBiAntdPbG4ysGjuRbRQSOBxQffKY
         YVFg==
X-Gm-Message-State: AOAM530jO2I49z2zn9W9b/+ujjdFHfs3mSMeT7UmCDv1huGuquhn+2mb
	w43Jg1YyEG3u5mFo31k/FQqxteeQJAM=
X-Google-Smtp-Source: ABdhPJymf1Cy4IFEyvgBfBvXWKMe9cprzjk8E9CNP0OG7iqdxntu7JfCfBReifGQjmjTl4276WoDqw==
X-Received: by 2002:a17:90a:d086:: with SMTP id k6mr19739434pju.171.1595865927981;
        Mon, 27 Jul 2020 09:05:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8df1:f28:d14a:8296? ([2601:202:4180:a5c0:8df1:f28:d14a:8296])
        by smtp.gmail.com with ESMTPSA id m6sm36107pjb.34.2020.07.27.09.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 09:05:27 -0700 (PDT)
Subject: Re: [OE-core] [v2][PATCH] cve-check: print warning if file is missing
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200727025231.24418-1-akuster808@gmail.com>
 <d60c82f476989c46864b9d50a7f6fce3ae9eb189.camel@linuxfoundation.org>
 <f5995aa5-dedb-167e-cbfb-00886de6ca64@gmail.com>
 <5d6b233e209d6ea0a3c3047c0d63feea0543b647.camel@linuxfoundation.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <edd3e796-d21c-61fc-61fa-d3903ce40831@gmail.com>
Date: Mon, 27 Jul 2020 09:05:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d6b233e209d6ea0a3c3047c0d63feea0543b647.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/27/20 7:47 AM, Richard Purdie wrote:
> On Mon, 2020-07-27 at 06:57 -0700, akuster808 wrote:
>> On 7/27/20 2:39 AM, Richard Purdie wrote:
>>> On Sun, 2020-07-26 at 19:52 -0700, akuster wrote:
>>>> If the "tmp/cve_check" file was not create as in the case for -c
>>>> populate_sdk, just print a
>>>> warning instead of dumping a trace back
>>>>
>>>> ---
>>>> v2] lets include the missing part of the patch
>>>>
>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>> ---
>>>>  meta/classes/cve-check.bbclass | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
>>>> check.bbclass
>>>> index 0889e7544aa..b16da9890af 100644
>>>> --- a/meta/classes/cve-check.bbclass
>>>> +++ b/meta/classes/cve-check.bbclass
>>>> @@ -55,6 +55,10 @@ python cve_save_summary_handler () {
>>>>  
>>>>      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>>>>  
>>>> +    if not os.path.isfile(cve_tmp_file):
>>>> +        bb.warn("File Not found: %s" % cve_tmp_file)
>>>> +        return
>>>> +
>>> A warning is something the user really needs to fix or take some
>>> action
>>> about. Is this a warning?
>> Its actually an error in certail conditions. Do we want this to be
>> silent or fail on 'populate_sdk'?
> What are the "certain conditions"?

populate_sdk

>
> Should it not detect those conditions and error if they occur?
if INHERIT += "cve-check' is included and -c populate_sdk, the file is
not generated.

>
> Showing a warning and asking the user to guess is not a good user
> experience. I have no idea whether I should worry about the warning
> above or not for example, so I doubt anyone else does either.

I am fine with not sending any warning.

- armin
>
> Cheers,
>
> Richard
>


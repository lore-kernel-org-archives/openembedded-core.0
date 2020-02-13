Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01A6560C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:49:43 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so8200585wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 11:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=LJPUTuN25M44kj5CkwdHb+HbF5qO5+Lw0RWDnBxXvkE=;
	b=HmT2GKQNILXhN0gI5IFc2YOI2BeX/8um+7sSfjcTTILx2Grd9kSrX2+kxmtm+wyN8m
	gEaCs6WJwdZWUbU/YpsGg78lNjIP5e84/s3zSb35a5s2udP3aNVZW9nekfTit86seqRp
	1qyVIhg6CiIDLDpM8iGBb0dRP9clZkdqY0dQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LJPUTuN25M44kj5CkwdHb+HbF5qO5+Lw0RWDnBxXvkE=;
	b=RcDcAjUCtaDJTNBG42McDG3C7WP12voVuaP8g5gIqW2AVsQeJng1TEHCyXv16GrMac
	2E6BRkIxEyz8YqchJsiOX1mk81a0DV6aL+9eZg3fKg+59e0ONSrvQRaTIqwesx9J6qAr
	pvuo6+k0dpBM9VGi1kpz72+Fnlx38++T/rWmF7OgnrBsWgSCvN0LN24u5M381z56M7/t
	VmpqckgGCcUHk05UQTohqu/f0p5LTa5LcfsMH7khQ/RbKoeI84N4TsKx9XaR8dDolsf2
	S64ohk1PrNKEmPINoVy0Gv0+khID8PuD2+klRvE0BYqyAft+wXgHG2cK7Wh+jDd9zQy0
	TurA==
X-Gm-Message-State: APjAAAUQCiwPXy+Z+TKHJOS9xznybptXtDLXm9bnHPAbkhoCo3qGmgnA
	Y9hEuPesomr1Z/TFaSiPtmhStOPhQemEEyG78kpJHg2gxKZQA79cPZBlSh8+paYxNfnx/6UQgy4
	VbOrAurujiVpB3W6ZYL0Q39rosf8THumiUkPGmYGRyr+AUweopmCBBkr8pSS+ffFJWU6bmvFMWL
	Tcka84iJ8tlkpCdmTuzPjcUz1/LeY=
X-Google-Smtp-Source: APXvYqz4zE9tHD8EwbiHT+F9kxqM9bnBhQkiXKEfejdvxolT+mdDTARJ1HiiI0ZodJoEVVhCv4q0kA==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr24615051wrk.53.1581623384336; 
	Thu, 13 Feb 2020 11:49:44 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	b13sm4351927wrq.48.2020.02.13.11.49.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Feb 2020 11:49:43 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>, He Zhe <zhe.he@windriver.com>
References: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4PW0AOzNNUi3wn2appucVFEDLn-eiGtMzOWw--dfP_Xpg@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <d3ac21d3-897d-b8d2-0b7b-3f01be1a9053@broadcom.com>
Date: Thu, 13 Feb 2020 11:49:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4PW0AOzNNUi3wn2appucVFEDLn-eiGtMzOWw--dfP_Xpg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Correct the substitution of python shebangs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2020 19:49:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2020-02-13 11:45 a.m., Bruce Ashfield wrote:
> On Thu, Feb 13, 2020 at 1:39 PM <zhe.he@windriver.com> wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> To make the native python3 are always used,
>>
> FWIW, a very similar patch was sent 10 days ago. Did you confirm that it isn't
> in master-next already ?
It's not in master-next as far as I can tell.
>
> see: "[OE-core] [PATCH] perf: Additional fixes for 5.5+"
>
> Bruce
>
>> - Move the substitution of /usr/bin/python3 to first, otherwise the
>>    possible original /usr/bin/python3 would be changed to
>>    /usr/bin/env python33.
>> - Add substitution for ${S}/scripts/
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 6d1b066..14a9090 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -240,10 +240,17 @@ do_configure_prepend () {
>>
>>       # use /usr/bin/env instead of version specific python
>>       for s in `find ${S}/tools/perf/ -name '*.py'`; do
>> +        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>>           sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>>           sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>>           sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>> +    done
>> +
>> +    for s in `find ${S}/scripts/ -name '*.py'`; do
>>           sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>>       done
>>
>>       # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>



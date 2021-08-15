Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.6791.1628991236877044600
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Aug 2021 18:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HeePSuuY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d17so16650823plr.12
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Aug 2021 18:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fvbRnFWQ9M7pL1IcSTUtqF5x/cTur/7YBIyJOLWTirk=;
        b=HeePSuuY2wLCCf22CbikHKHEOiNCMaITHr3KsdfL4GrMyM6w2qz+R7TQQKRsaicSvF
         52RGF3TkNi+bjBZB7h44aBwXxg6nDqd81M4mwigRBk8+7ttS/sCQpx8VVEn7Yn8T9O/M
         Pvgm/tss5zJ1FBWAIEWNM2wq6nH048rxpRHXaFjEJnLYyhFEv4fXMIYm/uW/k/SxQCni
         iglXFDfk7nLkLP+Kwg6g9Zbp/YSRtcZPS9/YE/aajS4d/fRGGgI+FqRhNz4fn290t4s7
         Cf8oDVBK2rN8kIdgvY1zTPkUhpCKjlo6ZEQ7DfeS3GEY4FeSEJAEUX4Gn8Xznv8Bh2Jy
         lAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fvbRnFWQ9M7pL1IcSTUtqF5x/cTur/7YBIyJOLWTirk=;
        b=ZS0VSiJY6bSoljVJLz+j/8Cx+tT17lYWckGjTJeG7+jaKh6+VkDtPAiNM/ElMpKMP2
         XwLlF7uLkPiHHB9B2rq6nPcDUZKxnOiYg4t4NA/jtMUJ4E0EBFFTir40atCOD/F4ofHw
         j00ZQUmfQZOJ2NJDzSe265V/Fk6AV78CZq4N9fn5TLWOw7uCi68WAr6/erixJkX8ljG7
         Q2a9ySFcVhpT9Supo+xTlkSogd4b7OWYNqDYyC1HJ3B15pID3jQkB+nUKiPvkV9IbMCq
         a4vkyIj+QUnKOtl3XUSIv6YE+HeRt9N719wmt1hvIcC/ougHtMoTOF6WZj7Dua/AGwM7
         ZPxg==
X-Gm-Message-State: AOAM530FcQqBYXplz7i3hkdUVEVXNMzIL7Q3ndMU3IfOoHPTGr+GrPkO
	c31RpLiXsFP2n6rKI0xWZXFLNUZQ5N2pHw==
X-Google-Smtp-Source: ABdhPJw0h9QD23Ow+gzSWu4p66EaUnZwvKx15BnJpX/Mk59QwHesnmLIF/iGIfreZeGo1fWiJnyLPw==
X-Received: by 2002:a63:5ec2:: with SMTP id s185mr8874634pgb.221.1628991236026;
        Sat, 14 Aug 2021 18:33:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::f40b? ([2601:646:9200:a0f0::f40b])
        by smtp.gmail.com with ESMTPSA id z1sm7326833pfg.18.2021.08.14.18.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 18:33:55 -0700 (PDT)
Subject: Re: [oe-core][PATCH 1/1] blktrace: add rdepends
To: Randy MacLeod <randy.macleod@windriver.com>,
 Joe Slater <joe.slater@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20210813202416.138888-1-joe.slater@windriver.com>
 <827139a6-de73-ccf7-bbf8-a9097f5ac413@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9cf777d5-5798-8a6f-607b-7418e8dd57d0@gmail.com>
Date: Sat, 14 Aug 2021 18:33:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <827139a6-de73-ccf7-bbf8-a9097f5ac413@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 8/13/21 4:34 PM, Randy MacLeod wrote:
> On 2021-08-13 4:24 p.m., Joe Slater wrote:
>> bno_plot.py uses gnuplot.  Also change shebangs to
>> python3 because we do not support python2.
> 
> We need to get agreement about what 'python' is.
> That's not something i follow and it's already late on Friday so
> I'm CCing Trevor, Mr meta-python and pointing you to:
> 
> https://www.python.org/dev/peps/pep-0394/
> 
> which from a brief review seems to say that it's up to the
> distribution! Fun!!
> 
> 
> My preference without knowing what other distros have done
> is to have the build system make a soft link:
>    python -> python3
> 

Its better to be explicit, making softlink will silently try to run
python scripts which assume python = python2 and do unexpected things


> 
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   meta/recipes-kernel/blktrace/blktrace_git.bb  |  6 +++-
>>   .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
>>   2 files changed, 35 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> meta/recipes-kernel/blktrace/files/python3-shebangs.patch
>>
>> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb 
>> b/meta/recipes-kernel/blktrace/blktrace_git.bb
>> index d00b1bd0be..36ce282481 100644
>> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
>> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
>> @@ -10,11 +10,15 @@ LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>   DEPENDS = "libaio"
>> +RDEPENDS:${PN} += "gnuplot"
> 
> As the DESCRIPTION says:
> 
> There are three major components:
>    a kernel component,
>    a utility to record the i/o trace information for
>      the kernel to user space,
> and
>    utilities to analyse and view the trace information.
> 
> so shouldn't we split the userspace part up so that the utilities are
> packaged separately and people who want to collect data on
> target and analyze it elsewhere don't pull in gnuplot and maybe more?
> 
> 
> 
> ../Randy
> 
>> +
>>   SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>>   PV = "1.3.0+git${SRCPV}"
>> -SRC_URI = "git://git.kernel.dk/blktrace.git"
>> +SRC_URI = "git://git.kernel.dk/blktrace.git \
>> +           file://python3-shebangs.patch \
>> +          "
>>   S = "${WORKDIR}/git"
>> diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch 
>> b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
>> new file mode 100644
>> index 0000000000..70a35c2c3a
>> --- /dev/null
>> +++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
>> @@ -0,0 +1,30 @@
>> +blktrace: Use python3 shebangs
>> +
>> +blktrace can use either python2 or python3, but we really want
>> +python3, so modify the shebangs.
>> +
>> +Upstream-Status: pending
>> +
>> +Signed-off-by: Joe Slater <joe.slater@windriver.com.
>> +
>> +
>> +diff --git a/btt/bno_plot.py b/btt/bno_plot.py
>> +index 3aa4e19..d7d7159 100644
>> +--- a/btt/bno_plot.py
>> ++++ b/btt/bno_plot.py
>> +@@ -1,4 +1,4 @@
>> +-#! /usr/bin/env python
>> ++#! /usr/bin/env python3
>> + #
>> + # btt blkno plotting interface
>> + #
>> +diff --git a/btt/btt_plot.py b/btt/btt_plot.py
>> +index 40bc71f..8620d31 100755
>> +--- a/btt/btt_plot.py
>> ++++ b/btt/btt_plot.py
>> +@@ -1,4 +1,4 @@
>> +-#! /usr/bin/env python
>> ++#! /usr/bin/env python3
>> + #
>> + # btt_plot.py: Generate matplotlib plots for BTT generate data files
>> + #
>>
> 
> 
> 
> 
> 
> 

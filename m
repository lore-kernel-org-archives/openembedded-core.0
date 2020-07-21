Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.2626.1595358077527108265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 12:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rTcRW65r;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id e8so12366373pgc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vfEFtlHf3r8cUO3psFGMQMGZPlksuE/zLutKe959zUY=;
        b=rTcRW65rHuDmzo+S0hVqVzjfvsh52tSLpLepjn0Q4EFNtjSibrrIw9NpI45cZ8aa8W
         ljL7wLhj4Rr3agt2oUkfdZWLg+4CNwhZlEcNFhyY0WjeSrC/26hX3Q/XPXwFBJEMuo0E
         HiVvnzzcO8lp06XpcdnM1q2bArkNnUXxUBp/bpeW5BqT7EZvHHEACPKLtrNz/uZkKPvj
         JGsAZOokxrHBQn394F2GJ40bfkW9g9JvTXhHQZNtk7FryeZKtXicBmEdwf2hnNY6CDoN
         DwDCcg82yAxHdrxLU+3v/lwysMPcvbNdj/3it/dKRsW0noHIAtEGZj6aYZNkSkMBSLkD
         wqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vfEFtlHf3r8cUO3psFGMQMGZPlksuE/zLutKe959zUY=;
        b=bNWuQwN3opqh5uXvYCv2HZLweI8maTOIirw2RX6w0xrm0fRfh9nOlCieij+cxFTwrP
         Biki9m0ugJvBLehp+exRHSJbqiipttWQh71egjhgW4CpBrijzQJ+XSsIYg4XxxKcqLkj
         QeM7crkF+kXKQSNvE5kkAvqSsMLitA7xAVW8nVi4YZUZtixxmpOUS7kxmdsZTW7+nfvq
         fXJJjS0HB7sjRRXZJbrdX52Z7Nw1YUc29LwhGxVw/bq5ZFRk7+JJCzNcrSHQoiN6QUrI
         5Un8p9nLNQuxXZ/04taJDN02QJ3FAULXJGkqnp/MAnHnGRigAcXJSRInRciYKADDUGpb
         2YtA==
X-Gm-Message-State: AOAM530+ewfmCQFvLeEq9qi+SJP9djgRGrkhs4ebSBjZ55HNIBN2Ga8+
	Zc2Cl6Id6yJB+hwBO6aCAR6ROGg+okA=
X-Google-Smtp-Source: ABdhPJzvflyCe6ri7p1Q13KTq4LygvT4zpuPEOt+FA3YxAtUQxesYz2sTV24BLlZwjBHzC7TKKw/hw==
X-Received: by 2002:a63:d446:: with SMTP id i6mr22757787pgj.438.1595358076503;
        Tue, 21 Jul 2020 12:01:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6651? ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id v11sm22301174pfc.108.2020.07.21.12.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 12:01:15 -0700 (PDT)
Subject: Re: [OE-core] [dunfell][PATCH] busybox: make hwclock compatible with glibc 2.31
To: Sakib Sajal <sakib.sajal@windriver.com>,
 Randy MacLeod <rwmacleod@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20200721180054.38185-1-sakib.sajal@windriver.com>
 <CAK6=ix5bcxMfGME1jnf3hKFUMRFmHjaigCrxR-zOSjpad_LyhA@mail.gmail.com>
 <e38a0f69-f72f-3826-7105-70dd41b06431@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0ebff3d6-7325-5263-9ebe-760bc25e8e3b@gmail.com>
Date: Tue, 21 Jul 2020 12:01:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e38a0f69-f72f-3826-7105-70dd41b06431@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 7/21/20 11:54 AM, Sakib Sajal wrote:
> 
> On 2020-07-21 2:11 p.m., Randy MacLeod wrote:
>> Hi Sakib,
>>
>> Did you check this busybox fix against musl? I forgot to ask you this 
>> when
>> you showed me this patch yesterday.
>>
>> Randy
> 
> Yes, I built core-image-minimal with musl and everything was fine.
> 

build alone would not be sufficient, runtime testing would be required 
too. The patch however seems ok to me. Also send it upstream to bb ml as 
well for review

> Sakib
> 
>>
>> On Tue., Jul. 21, 2020, 14:01 Sakib Sajal, <sakib.sajal@windriver.com>
>> wrote:
>>
>>> settimeofday(2) has been deprecated as of glibc 2.31
>>> which hwclock makes use of. This patch makes hwclock
>>> compatible with glibc v2.31
>>> See patch for more details:
>>>    busybox/0001-hwclock-make-glibc-2.31-compatible.patch
>>>
>>> Fixes [YOCTO #13981]
>>>
>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> ---
>>>   ...1-hwclock-make-glibc-2.31-compatible.patch | 83 +++++++++++++++++++
>>>   meta/recipes-core/busybox/busybox_1.32.0.bb   |  1 +
>>>   2 files changed, 84 insertions(+)
>>>   create mode 100644
>>> meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch 
>>>
>>>
>>> diff --git
>>> a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch 
>>>
>>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch 
>>>
>>> new file mode 100644
>>> index 0000000000..8d1f272120
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch 
>>>
>>> @@ -0,0 +1,83 @@
>>> +From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
>>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>>> +Date: Fri, 17 Jul 2020 17:27:21 +0000
>>> +Subject: [PATCH] hwclock: make glibc 2.31 compatible
>>> +
>>> +NEWS for glibc version 2.31
>>> +===========================
>>> +
>>> +Deprecated and removed features, and other changes affecting
>>> compatibility:
>>> +
>>> +* The settimeofday function can still be used to set a system-wide
>>> +  time zone when the operating system supports it.  This is because
>>> +  the Linux kernel reused the API, on some architectures, to describe
>>> +  a system-wide time-zone-like offset between the software clock
>>> +  maintained by the kernel, and the "RTC" clock that keeps time when
>>> +  the system is shut down.
>>> +
>>> +  However, to reduce the odds of this offset being set by accident,
>>> +  settimeofday can no longer be used to set the time and the offset
>>> +  simultaneously.  If both of its two arguments are non-null, the call
>>> +  will fail (setting errno to EINVAL).
>>> +
>>> +  Callers attempting to set this offset should also be prepared for
>>> +  the call to fail and set errno to ENOSYS; this already happens on
>>> +  the Hurd and on some Linux architectures.  The Linux kernel
>>> +  maintainers are discussing a more principled replacement for the
>>> +  reused API.  After a replacement becomes available, we will change
>>> +  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
>>> +  argument is not a null pointer.
>>> +
>>> +  settimeofday itself is obsolescent according to POSIX.  Programs
>>> +  that set the system time should use clock_settime and/or the adjtime
>>> +  family of functions instead.  We may cease to make settimeofday
>>> +  available to newly linked binaries after there is a replacement for
>>> +  Linux's time-zone-like offset API.
>>> +
>>> +hwclock had two calls to settimeofday, in functions to_sys_clock and
>>> +set_system_clock_timezone, where both the arguments to settimeofday
>>> +were valid (non-null).
>>> +Therefore, split the call, once for timezone and once for timeval.
>>> +
>>> +Fixes #12756
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> +---
>>> + util-linux/hwclock.c | 12 ++++++++----
>>> + 1 file changed, 8 insertions(+), 4 deletions(-)
>>> +
>>> +diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
>>> +index dc97d8f..cf346e8 100644
>>> +--- a/util-linux/hwclock.c
>>> ++++ b/util-linux/hwclock.c
>>> +@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname,
>>> int utc)
>>> +
>>> +       tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
>>> +       tv.tv_usec = 0;
>>> +-      if (settimeofday(&tv, &tz))
>>> +-              bb_simple_perror_msg_and_die("settimeofday");
>>> ++      if (settimeofday(NULL, &tz))
>>> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
>>> ++      if (settimeofday(&tv, NULL))
>>> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
>>> + }
>>> +
>>> + static void from_sys_clock(const char **pp_rtcname, int utc)
>>> +@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
>>> +       gettimeofday(&tv, NULL);
>>> +       if (!utc)
>>> +               tv.tv_sec += tz.tz_minuteswest * 60;
>>> +-      if (settimeofday(&tv, &tz))
>>> +-              bb_simple_perror_msg_and_die("settimeofday");
>>> ++      if (settimeofday(NULL, &tz))
>>> ++              bb_simple_perror_msg_and_die("settimeofday: timezone");
>>> ++      if (settimeofday(&tv, NULL))
>>> ++              bb_simple_perror_msg_and_die("settimeofday: timeval");
>>> + }
>>> +
>>> + //usage:#define hwclock_trivial_usage
>>> +--
>>> +2.24.1
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb
>>> b/meta/recipes-core/busybox/busybox_1.32.0.bb
>>> index 0dfdfdb549..aeea40fbc1 100644
>>> --- a/meta/recipes-core/busybox/busybox_1.32.0.bb
>>> +++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
>>> @@ -43,6 +43,7 @@ SRC_URI = "
>>> https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>>
>>> file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
>>>              
>>> file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
>>>
>>> file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
>>> +           file://0001-hwclock-make-glibc-2.31-compatible.patch \
>>>   "
>>>   SRC_URI_append_libc-musl = " file://musl.cfg "
>>>
>>> -- 
>>> 2.27.0
>>>
>>>
>>>
> 
> 
> 

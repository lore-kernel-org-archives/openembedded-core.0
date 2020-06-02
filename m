Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.725.1591111270012546439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 08:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CIABkMJ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id n11so12861240qkn.8
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1InpnBUlvduo/vWYekHJmDDabq1dOu3GPRm8D9JvePU=;
        b=CIABkMJ/cJ4/qizSR1X6pA1eTcx3GZ8UYHAv5cW7+dxnARis06GyC5hhBJvUlcZqkU
         kjfaHUQcj6N6jn16qQM1ad23fGuF8m3d4YaeWzUfI4R0fwnISGmkkZKR+ZvENM5DJM4m
         prra0d3X5GjPocesiaELNYzdnAaYqOdAXfPSKNkmOKZdER6bbAXltMwbNYfuW9yoSV01
         Drd83E4famHFvzXChN79YkUQ98FFQu2GYCgpDBX/eIkaS5xNiWIehfL96CVZRhkZRv76
         Jh9Ph1hnTT8v9TQGkBuwUqUEwo6HjKPgE2kTKEZpTQl61a9IdXMzmxcwRq7Phw5bDVKl
         v+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1InpnBUlvduo/vWYekHJmDDabq1dOu3GPRm8D9JvePU=;
        b=HZvPRsKBjdCZ14GdTHMd1CoNPnrLLzmgaSUGyCCXCR5NrWwQyGxwrN09HZzmnkhZnR
         xzB/ztU4uDVRWjeSE86QE7pP42FEMevEHKcMAWH5LdAKcDa+sVdNtwP9K2u0yGEOOFgD
         wvM5mg+5rynVHc50h2z0TJMEVEC+Vi/vc4XUOXe0O+T0K/mGiKwNdt1+S9K0T2J8Tbns
         v5vbXmiMyj6xtH/WoqMqB8aQSEycVB4KGUC+klMnSSDn1rCqDsEE+RnvBbT7ycEkVDUH
         C6xCq8iGt5MS/IgMOE4BrGZ46W0HQ5p7MOoN/GFSj6w7rlWEL+DaxSvF6m1HfSXuMGVE
         TSZQ==
X-Gm-Message-State: AOAM530S72cHIaNQwhKVRFheUfIwMUKawkHyU0CVxqcvXatTbMqKmV4Q
	eHHCC490oQYynhqFWRRa3I4sWdL2QRirzC7amrM=
X-Google-Smtp-Source: ABdhPJyLhFpue/2vbpk+6YIAsEeinbxVutYACMHgKqV27NtfHac7lFwfFu4Pvzq9W6CUTpkJifNpX/QMs2oWD9jl9uQ=
X-Received: by 2002:a37:6610:: with SMTP id a16mr10563845qkc.17.1591111268481;
 Tue, 02 Jun 2020 08:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-17-alex.kanavin@gmail.com> <CAMKF1sry+bdb+JF9o74GfgERR0=fKwC4ZT34B5pZKN5to+Z=hQ@mail.gmail.com>
 <CANNYZj8=wbp_xL53mwW--cZ5d7yMCNHMRFtj9T09mmrZsfzwZQ@mail.gmail.com>
In-Reply-To: <CANNYZj8=wbp_xL53mwW--cZ5d7yMCNHMRFtj9T09mmrZsfzwZQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Jun 2020 08:20:42 -0700
Message-ID: <CAMKF1sqtNLvgruehuOnmva9PePcx-ETc9kX5kvdbMX+3Dr7NsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/70] strace: upgrade 5.5 -> 5.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 12:17 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Upstream builds with -Werror by default, which this switch disables.
>

I gathered as much, However, it will be good to document the errors or
even better
let upstream know about them since they maybe interested to fix them.

> Alex
>
> On Tue, 2 Jun 2020 at 04:27, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> ---
>>>  .../strace/{strace_5.5.bb => strace_5.6.bb}                 | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>  rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb} (90%)
>>>
>>> diff --git a/meta/recipes-devtools/strace/strace_5.5.bb b/meta/recipes-devtools/strace/strace_5.6.bb
>>> similarity index 90%
>>> rename from meta/recipes-devtools/strace/strace_5.5.bb
>>> rename to meta/recipes-devtools/strace/strace_5.6.bb
>>> index ae552da028..53679cd0d2 100644
>>> --- a/meta/recipes-devtools/strace/strace_5.5.bb
>>> +++ b/meta/recipes-devtools/strace/strace_5.6.bb
>>> @@ -15,8 +15,8 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>>>             file://uintptr_t.patch \
>>>             file://0001-strace-fix-reproducibilty-issues.patch \
>>>             "
>>> -SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
>>> -SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
>>> +SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
>>> +SRC_URI[sha256sum] = "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
>>>
>>>  inherit autotools ptest
>>>
>>> @@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??= "\
>>>  PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
>>>  PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
>>>
>>> -EXTRA_OECONF += "--enable-mpers=no"
>>> +EXTRA_OECONF += "--enable-mpers=no --disable-gcc-Werror"
>>
>>
>> Why is this needed ? Perhaps description in comment will help
>>
>>>
>>>
>>>  CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
>>>
>>> --
>>> 2.26.2
>>>
>>> 

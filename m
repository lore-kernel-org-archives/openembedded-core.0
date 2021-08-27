Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.8867.1630074688907926434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 07:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=swZwoP1z;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id j2so4064697pll.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FqSBrKlsdHpJrEOTwoqzFbnY1v/GHxWwSIoPxLu9TZI=;
        b=swZwoP1zAF+XnJtjJakxP+X+jr+EAFxTO+92z2vgxMljyGjuRHjk9Wo0kUML1q/QB9
         /348J9H2iurqsdOiwXxdTM0BuS3la04v5fSyieTV/LBqq8Ss7UsII71grj0keKn1DRM7
         Ram05R081U5UwqqfuB3yxExzYMF3mYK9H+wmLLE+VzBHnSs0wqs+D9Tb4v0NfnR3w+iE
         yJm083t8L+Hhc1EHaXN58+hCbdoR2L3+pvuBq9pn6o69H2JBrlLhHJrLQmObicfb+U0+
         7WW2XwOUZV4muWINNA2Wi8t0NQU8V4KQw38ITRPVTwKowFd3dtoKSontRy8Jhh7U9TfO
         cWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FqSBrKlsdHpJrEOTwoqzFbnY1v/GHxWwSIoPxLu9TZI=;
        b=LodcIjSBkyNtFp4dKK86vvR35bEJIVqkyXLw0R2CLLF7gMyUkUo2IKCsybY9A+wKjl
         StE8ZSswVE1jN3ecXTWoVxj0JCUiyOCPxJ0e3X22nC7Mg9Czf/bn853ocj/RAm53hiXy
         mxZJtQ3AIXT+RvS9VNXl7fpAz7LwZiFK1K5yjp87HGlIruWdURDwvjMyNnFZLX1bTuci
         ZzmfMSaNKakRP+C1UBV8KTX9gUIiKkEZhNUy5RMK7g+tuZw5SzzXUnupxtZ2FeTyUFUJ
         rCyAtq2wS+l+DtS/W3FDJBtw1yXFsF+0o7x7e8veGvPH45jqAzDtE7Qb7TIipU6+gDmb
         UL+g==
X-Gm-Message-State: AOAM531HgCJbG3Kz04t45JdOJgW3+Y2eHxSpxeJnylL2agiroXfsaBBO
	I33aogcoWttmHOLUruYRNAk=
X-Google-Smtp-Source: ABdhPJze5OVRLRzCRlusahBh0FdFHU8iH2lIQ09HLEdUnF0a4X4LuFPU+Pb9B0+iXYVgb2lpkh7MZQ==
X-Received: by 2002:a17:90b:3b82:: with SMTP id pc2mr11075783pjb.224.1630074688240;
        Fri, 27 Aug 2021 07:31:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:6d42:ed7e:4699:884f? ([2601:202:4180:a5c0:6d42:ed7e:4699:884f])
        by smtp.gmail.com with ESMTPSA id w9sm12692723pjc.14.2021.08.27.07.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 07:31:27 -0700 (PDT)
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
To: Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io,
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com,
 Khem Raj <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com, martin.jansa@gmail.com, paul@pbarker.dev,
 Trevor Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com,
 Vinay Kumar <vinay.m.engg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Orling, Timothy T" <timothy.t.orling@intel.com>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
 <20210813151947.55142-1-vinay.m.engg@gmail.com>
 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
 <169C1FA457B99CA0.23238@lists.openembedded.org>
 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
 <169D3274AAECC435.19323@lists.openembedded.org>
 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
 <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
 <169E4C0C80951608.1595@lists.openembedded.org>
 <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <37520c3b-162a-9067-a54c-5b35d46e0d4b@gmail.com>
Date: Fri, 27 Aug 2021 07:31:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/26/21 9:05 PM, Randy MacLeod wrote:
> On 2021-08-24 12:48 p.m., Randy MacLeod wrote:
>> Add Steven Walter in hopes that he or someone else
>> who uses meta-rust will help out.
>>
>> On 2021-08-23 5:21 a.m., Richard Purdie wrote:
>>> On Sun, 2021-08-22 at 08:45 -0400, Randy MacLeod wrote:
>>>> On 2021-08-22 7:19 a.m., Richard Purdie wrote:
>>>>> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
>>>>>> On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
>>>>>> With a patch from Richard, and the http_proxy check removed,
>>>>>> $ git diff | grep "^[+-]"
>>>>>>    --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>>>    +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>>>    -http_proxy = "http://example.com/"
>>>>>>    +http_proxy = ""
>>>>>> we have fixed the oe-selftest that was failing.
>>>>>>    Any volunteers to stub out the http[s]_proxy code in cargo ?
>>>>>> I've written up a commit log that could use some review and
>>>>>> pushed an update
>>>>>> to:
>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a
>>>>>>
>>>>>>
>>>>>
>>>>> I'm not sure you need to change cargo, I think if you remove the
>>>>> bit in the
>>>>> bbclass that injects http_proxy, the tests are ok. That will
>>>>> perhaps break
>>>>> anyone using proxies but for now, I think that is a reasonable
>>>>> step of getting
>>>>> this moved forward?
>>>> That's what I hoped for as well but not what my testing showed.
>>>>
>>>> I removed (commented out actually) the http_proxy injection here:
>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-redo-aug-17-2021-a&id=a4808f787caf8d0b44cf3946cf204164f24f91d4
>>>>
>>>>
>>>> but the test still fails unless I mangle the test:
>>>>
>>>>      meta/lib/oeqa/selftest/cases/sstatetests.py
>>>>
>>>>
>>>>      -http_proxy = "http://example.com/"
>>>>
>>>>
>>>>      +http_proxy = ""
>>> Right, my point is that doesn't remove it. You need to delete it,
>>> not comment it
>>> out.
>>>
>>> The issue is that bitbake does variable expansion on the scripts
>>> before running
>>> them.
>>>
>>> It can't tell that this is a comment, just that the script differs
>>> after
>>> variable expansion.
>>>

Thanks all for getting Rust in Core.

- Armin
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>> Richard has fixed several new issues and is testing this in master-next:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=master-next
>>
>> using the YP autobuilder.
>>
>> We're seeing some odd intermittent build failures especially when using
>> the uninative class (used by default in poky) perhaps on older hosts but
>> we're not 100% sure of that correlation yet. See below and:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/581/steps/13/logs/stdio
>>
>>
>> If we can't get this fixed in the next day or two, we'll miss the
>> fall release.
>>
>> ../Randy
>
>
> Thanks to Richard's dogged determination and Herculean efforts,
> the Rust recipes are now merged to the oe-core master branch.
>
>    https://git.openembedded.org/openembedded-core/log/?qt=range&q=master
>
>
> There are still some known problems, such as:
>
> 1. Tim Orling finding that Rust fails to build python-cryptography:
>
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/rust_python3-cryptography
>
>
> Tim says that this change helps:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/rustc-print-cfg-fix
>
>
>
> and:
>
> 2. a reproducible build failure on CentOS-7:
>
>    https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
>
> where, we see:
>    = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
>    not found (required by \
>    /home/pokybuild/yocto-worker/reproducible-centos/build/\
>    build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>    1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
>
>
>
>
>
>    error: linking with `\
>    /home/pokybuild/yocto-worker/reproducible-centos/build/\
>    build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>    1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
>
>
> ---
>
>
> Please test, send patches and/or let me know about any other problems by
> email or by opening  a defect in the YP bugzilla:
>    https://bugzilla.yoctoproject.org/
>
>
> I'll work on a commit for meta-rust to remove the components
> that have been moved to oe-core. I'm not sure what the
> meta-rust developers and users want to do as far as what will
> remain in meta-rust but the short list that I have so far is:
> 1. scripts
> 2. Jenkins tests
> 3. Rust version 1.51.0 ?
>
>
> ../Randy
>
>>
>>
>> error: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not
>> found (required by
>> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproducibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/build/bootstrap/debug/deps/libproc_macro_error_attr-9c7a09885c50c72e.so)
>>
>>      -->
>> /home/pokybuild/yocto-worker/reproducible-debian/build/build-st/reproducibleA/tmp/work/x86_64-linux/rust-native/1.54.0-r0/rustc-1.54.0-src/vendor/proc-macro-error/src/lib.rs:284:9
>>
>>   284 | pub use proc_macro_error_attr::proc_macro_error;
>>       |         ^^^^^^^^^^^^^^^^^^^^^
>>
>>   error: aborting due to previous error
>>   error: could not compile `proc-macro-error`
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>
>
>
> 
>


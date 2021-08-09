Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.25981.1628529502577673272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 10:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TtvvQi4o;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id k2so17122306plk.13;
        Mon, 09 Aug 2021 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3EI6I0Z5OG8sou0HrFNolIa6Bi6zw/pZaRqbDNMypdU=;
        b=TtvvQi4o5MXCwqKD/Xt6d2AayqD/3DuROpchAvVDcja3aJ41asClPOZGwQPNME4ng4
         AOJ6sj+OWhE3EXCQrkJibQlZ4xBduakAfYLsxUfl/giRl809Z8zRWeYtO5M87VDzeNId
         P92n+T2U0dVaSNRfqGuHIV6J1ffLWdugFKAWQjRObgZ6Ea5axrg7mwrvONBNXtKamC84
         0yjQZdtGCZV8SLbf2EvEPQFsZv8ShQ5JY2jrGZLCjJl+h4V9v2ybGZXDc0Z3D31pdFYz
         SbI/aC/V6BYoVn4dbACJrpvAWLLIQJTrpnxWWLrClZ87sK3IblSxey1fyyB1loW3Qo1w
         aOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3EI6I0Z5OG8sou0HrFNolIa6Bi6zw/pZaRqbDNMypdU=;
        b=F80jj0DURW5s74GGksDDYw5zx5okQ+pLbSl9UOmRNC9wspMsfllMEqD3vQXc8PNQSJ
         e6HmXp5z3vkfohz9KexJUw/f9ZVLomKNNGKRxisKTflACxmUoBslbmm+kzxFP4QSglLe
         DtPUD0tJPIwkU0pWd/Hnz9hMjuNwWCDoX1b7PirLUffmQt9e+Hr6Atn5OsKT94ApdiBv
         gC0liIH687/WnIvvoaqWAvHvp0n1il+198WtsX/DZSWYXMMjtf4S2zm1ynI+j4DOnluC
         bWGBhoBVQ7cuGua1CkC5qiE4+C9LmI1j+NXS5Px8rC14CsgF7deLnvmxVdakUp+GJZzK
         +5Jg==
X-Gm-Message-State: AOAM533WcXiGF4DdpZvlZv0psa1VvVyoACvFxFHbJg8hNhldYZWIe+Rc
	TI5uulM7kedbs8s7qXiwbNso9Me1gZ571w==
X-Google-Smtp-Source: ABdhPJwcOiZM2GidFXB6ekl2NXyZ8FvaKf5B4yzjMe1yMHW/XVqPC/N36mRY8TNKdDWIcZJd+lqzNw==
X-Received: by 2002:a17:90a:bf16:: with SMTP id c22mr174578pjs.33.1628529501401;
        Mon, 09 Aug 2021 10:18:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:841d:b7c:509a:a9d6? ([2601:646:9200:a0f0:841d:b7c:509a:a9d6])
        by smtp.gmail.com with ESMTPSA id j187sm20616170pfb.132.2021.08.09.10.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 10:18:20 -0700 (PDT)
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
 <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
 <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
 <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
 <17ef7e32-fe38-6e02-8d65-ee1518a38e82@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ead673c1-a9dd-613e-1d7c-6fcc6cf96eca@gmail.com>
Date: Mon, 9 Aug 2021 10:18:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <17ef7e32-fe38-6e02-8d65-ee1518a38e82@cybernetics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/9/21 7:39 AM, Tony Battersby wrote:
> On 8/6/21 10:19 PM, Khem Raj wrote:
>> I am seeing bunch of failures on meta-oe and meta-atmel
>>
>> https://errors.yoctoproject.org/Errors/Details/600064/
>> https://errors.yoctoproject.org/Errors/Details/600065/
>> https://errors.yoctoproject.org/Errors/Details/600071/
>>
>>
> I sent patches for meta-openembedded, but I am not sure how to build
> meta-atmel:
> 
> bitbake libegl
> ERROR: Layer atmel is not compatible with the core layer which only
> supports these series: honister (layer is compatible with hardknott)

you can use my branch which has fixes for override problem

https://github.com/YoeDistro/meta-atmel/tree/yoe/mut


> 
> But the fix is probably the same as the ones I sent for the other
> packages (which I copied from
> meta-openembedded/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb).
> 
> Tony Battersby
> 
> 
>> On Fri, Aug 6, 2021 at 2:04 PM Tony Battersby <tonyb@cybernetics.com> wrote:
>>> On 8/6/21 12:44 PM, Tony Battersby wrote:
>>>> On 8/6/21 1:33 AM, Richard Purdie wrote:
>>>>> On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
>>>>>> On 8/5/21 6:21 AM, Richard Purdie wrote:
>>>>>>> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
>>>>>>>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
>>>>>>>>> Currently, enabling Link Time Optimization via:
>>>>>>>>>
>>>>>>>>> require conf/distro/include/lto.inc
>>>>>>>>> DISTRO_FEATURES_append = " lto"
>>>>>>>>>
>>>>>>>>> makes the build non-reproducible (as in
>>>>>>>>> https://reproducible-builds.org/).  This patch set fixes some of the
>>>>>>>>> problems, but is not yet a complete solution.
>>>>>>>>>
>>>>>>>>> This patch set addresses the following bugs:
>>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
>>>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14490
>>>>>>>>>
>>>>>>>>> openembedded-core patches
>>>>>>>>> 1/4: lto.inc: disable LTO for grub
>>>>>>>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
>>>>>>>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
>>>>>>>>>
>>>>>>>>> openembedded-devel patches
>>>>>>>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
>>>>>>>>>
>>>>>>>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
>>>>>>>>> TARGET_CFLAGS).  This could possibly be done differently, such as by
>>>>>>>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
>>>>>>>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.  Let me know
>>>>>>>>> if there is a better/preferred way to do it.
>>>>>>>>>
>>>>>>>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
>>>>>>>>> included a patch to fix that.  Other packages might have been broken as
>>>>>>>>> well, although I haven't found any others.
>>>>>>>>>
>>>>>>>>> With all these patches, there are still many shared libraries in /lib
>>>>>>>>> and /usr/lib that are still not reproducible with LTO enabled because
>>>>>>>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
>>>>>>>>> patch 3 when linking shared libraries.  /usr/lib/libbz2.so.1.0.6 from
>>>>>>>>> the libbz2 package from the bzip2 recipe is a good example.  I do not
>>>>>>>>> have a patch for that problem.  I will leave that to someone else.
>>>>>>>>>
>>>>>>>>> So this is what we need to achieve reproducible LTO builds:
>>>>>>>>> *) This patch set
>>>>>>>>> *) A fix for libtool
>>>>>>>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
>>>>>>>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
>>>>>>>>> *) Fixes for individual packages, if needed
>>>>>>>>> *) Once everything works, update the documentation again (I previously
>>>>>>>>> requested a documentation change for this bug, which will eventually
>>>>>>>>> show up at
>>>>>>>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
>>>>>>>> This is certainly a few steps in the right direction with a good outline
>>>>>>>> of what's next.
>>>>>>>>
>>>>>>>> I suspect that Richard has been busy with other things like overrides
>>>>>>>> and the update to glibc-2.34.
>>>>>>>>
>>>>>>>> Do you have any suggestions or questions about what we should do
>>>>>>>> with this patch series Richard?
>>>>>>> Thanks for the reminder, I've been meaning to queue/test this which I will
>>>>>>> do. The gcc version has been bumped but I ported the patch forward to it
>>>>>>> and the patches are in master-next for testing. It is great to see this
>>>>>>> support moving forward.
>>>>>>>
>>>>>>> Much as it pains me to admit having any libtool knowledge, I may be able to
>>>>>>> help with that bit. There is an untested patch below which may address that
>>>>>>> issue, or at least give a good hint on how to do it if it doesn't work. I
>>>>>>> don't have an environment to test easily right now.
>>>>>>>
>>>>>>> Cheers,
>>>>>>>
>>>>>>> Richard
>>>>>> I tested your libtool patch in master-next with the bzip2 recipe.  It
>>>>>> works as intended; libbz2.so.1.0.6 and all the other output files are
>>>>>> now reproducible with LTO enabled.  I also verified that libtool is
>>>>>> passing the -f*-prefix-map flags to the link command in log.do_compile
>>>>>> as intended.
>>>>>>
>>>>>> I also verified that core-image-minimal builds successfully with the
>>>>>> libtool patch.
>>>>> Thanks for testing that, sounds like it helps that issue. I'll queue that patch.
>>>>>
>>>>> Unfortunately even with the ruby fix I queued, we still see reproduciblity
>>>>> issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and ruby-dbg
>>>>> packages:
>>>>>
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/515/steps/12/logs/stdio
>>>>>
>>>>> We'll need to resolve those before I can merge the flags change.
>>>>>
>>>>> Diffoscope output:
>>>>>
>>>>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210805-8jfd55ki/packages/diff-html/
>>>>>
>>>>> Basically LDFLAGS get encoded into a couple of scripts and the ruby binary.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>> It looks like the ruby problem is being caused by MJIT_DLDFLAGS in
>>>> build/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/build/mjit_config.h.
>>>> There is already a patch
>>>> poky/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
>>>> that removes some of these items for the sake of reproducibiltiy.  But I
>>>> do not know ruby, so I do not know the implications of doing the same
>>>> thing for MJIT_DLDFLAGS.
>>>>
>>>> Tony Battersby
>>>>
>>>>
>>>>
>>> Richard,
>>>
>>> I noticed that you already fixed the problems in curl and gettext in
>>> master-next.  Here is a patch for ruby if you haven't fixed that already.
>>>
>>> Tony Battersby
>>>
>>>  From 9cfb9777ff6ef95a27ed6a03719c807365d0f116 Mon Sep 17 00:00:00 2001
>>> From: Tony Battersby <tonyb@cybernetics.com>
>>> Date: Fri, 6 Aug 2021 16:47:14 -0400
>>> Subject: [PATCH] ruby: Fix reproducibility issue with LDFLAGS
>>>
>>> If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no
>>> longer reproducible.  Fix this.
>>>
>>> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
>>> ---
>>>   ...-Makefile.in-filter-out-f-prefix-map.patch | 42 +++++++++++++++++++
>>>   meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  1 +
>>>   2 files changed, 43 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
>>>
>>> diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
>>> new file mode 100644
>>> index 0000000000..9387506c26
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-out-f-prefix-map.patch
>>> @@ -0,0 +1,42 @@
>>> +Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
>>> +
>>> +If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
>>> +reproducible.  Fix this.
>>> +
>>> +Upstream-Status: Inapproppriate [oe-core specific]
>>> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
>>> +---
>>> +--- a/tool/mjit_archflag.sh
>>> ++++ b/tool/mjit_archflag.sh
>>> +@@ -7,6 +7,20 @@ quote() {
>>> +     echo
>>> + }
>>> +
>>> ++quote_filtered() {
>>> ++    printf "#${indent}define $1"
>>> ++    while shift && [ "$#" -gt 0 ]; do
>>> ++      case "$1" in
>>> ++          -ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*)
>>> ++              ;;
>>> ++          *)
>>> ++              printf ' "%s"'$sep "$1"
>>> ++              ;;
>>> ++      esac
>>> ++    done
>>> ++    echo
>>> ++}
>>> ++
>>> + archs=""
>>> + arch_flag=""
>>> +
>>> +--- a/template/Makefile.in
>>> ++++ b/template/Makefile.in
>>> +@@ -666,7 +666,7 @@ mjit_config.h:
>>> +       quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
>>> +       quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
>>> +       quote "MJIT_LDSHARED   " ; \
>>> +-      quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
>>> ++      quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
>>> +       quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
>>> +       quote 'PRELOADENV       "@PRELOADENV@"'; \
>>> +       indent=$${archs:+'  '}; \
>>> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
>>> index 0b9c342def..38e594a59e 100644
>>> --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
>>> +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
>>> @@ -6,6 +6,7 @@ SRC_URI += " \
>>>              file://remove_has_include_macros.patch \
>>>              file://run-ptest \
>>>              file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
>>> +           file://0002-template-Makefile.in-filter-out-f-prefix-map.patch \
>>>              "
>>>
>>>   SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
>>> --
>>> 2.25.1
>>>
> 

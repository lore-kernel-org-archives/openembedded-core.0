Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31C1ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 19:40:39 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.1767.1666899630244327810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 12:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RbAhQr6R;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id bj12so7547198ejb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYw6kuSIEJpQikwvf1JGXKDgtlol7OGIwJ+P4boM4r8=;
        b=RbAhQr6R1NQHJSair0xNoNhByN7Xx+pVHAk+SrOjNmo4HU9DUIrpRQwhogNcSXLV8Y
         umVVCbgIPge9ksuuC8m5TEzwrYn2r1T0SyfyDuEvADJ2WCzyOduj8ZEa3iTyFtkOylRg
         w0MDpbPwwBtONMNyh4+z2M58epkHwmxuADOIiRXYJJtXHqx26jfqft+44SJSacLxGhg3
         DEJl7L20rWOHyEr+V+uanJCcp82KSA3rgTdRBCIJwtrdNZyMF67XtUHhImKb/Se/3e0+
         lm2eeXInhYGz3lX50fiO8/GzPZ8rIubgWLfrLmGEXIpL7d8ovp0aPBbd4TdNOl9IQ9U+
         BYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYw6kuSIEJpQikwvf1JGXKDgtlol7OGIwJ+P4boM4r8=;
        b=qRRFgNHP3fM9djv6n0ghCg48T+4qkFfuYjkNEGldR6rp9yjtD5oQtpUS4heTHUMYg9
         B5vtPQM0V+5aE0sUCpCM55uMPcHAr7DNdcX3ID3OXLsWbo9DF/mE/NtQQwqOiq6Gqnik
         Imrkef3xQGtc/NSfFoNCAmHycu9YZ3q1IytyPic7gapAPK56mG5v0PgHGJh7diFsl+r/
         9HNQwlEPSz0B4vDakuoMXWwdvWxJVZvqCf56/6xKaDf6lqHvGupHDJVDjLkEIhVdyXwY
         6iyghSmr2JVMpq1LUhzErtLCc76+x/ImRIGxYX5OLvDseLvmioEMjnC5dX0TNdrd3GNz
         gPyQ==
X-Gm-Message-State: ACrzQf33ut9gq61/GIA2DZ+7tkrAIa6sluTMBvhd19POvswZDTyUpr04
	VFOHNe+vpJQ5ZVMEAWXYkvRRZSo/wXfy/9TG1hy9OQ==
X-Google-Smtp-Source: AMsMyM4L8bI4xx5GeeFfengRmfES6QeR7NRIWmwhkJiSQ1uamSn9GZAofguLk3qoD/biugqGx9Y6WPjxtegfNN6nNug=
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id
 dr13-20020a170907720d00b007a9b7e68612mr18388757ejc.435.1666899628365; Thu, 27
 Oct 2022 12:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221025091832.535612-1-yashinde145@gmail.com>
 <be23f9e3-1527-df63-938f-6611de6b242f@windriver.com> <CALDccsE8H+vjnkyi87zXXtPFDR2KyRAcBzCkzCFEg8T8MRrv9g@mail.gmail.com>
In-Reply-To: <CALDccsE8H+vjnkyi87zXXtPFDR2KyRAcBzCkzCFEg8T8MRrv9g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Oct 2022 09:40:17 -1000
Message-ID: <CAOSpxdbFw4zVE4-X7KfNZubaoK0Au5GL8VndyUyjPRwsn6zOxg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc: stable 2.35 branch updates.
To: Yash Shinde <yashinde145@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, 
	shivams@gmail.com, sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172202

On Thu, Oct 27, 2022 at 8:32 AM Yash Shinde <yashinde145@gmail.com> wrote:
>
> Please keep updating us about the timeline of the upcoming updates.

The Yocto project status reports that come out each week have the
current timeline for all branches.

Steve

> On Thu, 27 Oct 2022, 10:50 pm Randy MacLeod, <randy.macleod@windriver.com> wrote:
>>
>> On 2022-10-25 05:18, Yash Shinde wrote:
>>
>> Below commits on glibc-2.35 stable branch are updated.
>> 8d125a1f91 (HEAD -> release/2.35/master, origin/release/2.35/master) elf: Do not completely clear reused namespace in dlmopen (bug 29600)
>> f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
>> 135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 24816)
>> 767c99850b nss: Implement --no-addrconfig option for getent
>> bca80a916e nscd: Drop local address tuple variable [BZ #29607]
>> 20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implementations
>> 02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
>> c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
>> 1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
>> 7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
>> 6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
>> 0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
>> 97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
>> a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
>> 562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
>> e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
>> 4f3c6dcd20 sysdeps: Add 'get_fast_jitter' interace in fast-jitter.h
>> a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
>> dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
>> 6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C standards
>> 649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfaces
>> 4a214c7448 resolv: Add new tst-resolv-invalid-cname
>> 519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 12154)
>> ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, bug 29305)
>> 692fc980eb nss_dns: Remove remnants of IPv6 address mapping
>> def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
>> 51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
>> 492d259ebc resolv: Add DNS packet parsing helpers geared towards wire format
>> a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
>> d7c22ec359 resolv: Add the __ns_samebinaryname function
>> 83b09a8e86 resolv: Add internal __res_binary_hnok function
>> 6e56f918a8 resolv: Add tst-resolv-aliases
>> fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
>> d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28937)
>> c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
>> ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependencies
>> f4687bb416 elf: Fix hwcaps string size overestimation
>> 55a636430b Use __ehdr_start rather than _begin in _dl_start_final
>> 61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere
>>
>> Thanks Yash.
>>
>> There are more commits that I expected but what can you do!
>> I think this will go into the 4.0.6 since it's only a few days to 4.0.5 build.
>>
>> YP 4.0.5 build date 2022/10/31
>> YP 4.0.5 Release date 2022/11/11
>> YP 4.0.6 build date 2022/12/12
>> YP 4.0.6 Release date 2022/12/23
>>
>> Next time, we do the update try to send it 2 weeks before the build date
>> so on or before Nov 28th.
>>
>>
>> What test results for this update do you have to show Steve?
>>
>> Please present the results and put them in context by comparing
>> them to the previous tests without this update and summarizing
>> what you think of any new failures.
>>
>> Thanks,
>>
>> ../Randy
>>
>>
>>
>> Signed-off-by: Yash Shinde <yashinde145@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
>> index d3cea19f9c..7d7db46c2f 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>  SRCBRANCH ?= "release/2.35/master"
>>  PV = "2.35"
>> -SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
>> +SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
>>  SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
>>
>>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172125): https://lists.openembedded.org/g/openembedded-core/message/172125
>> Mute This Topic: https://lists.openembedded.org/mt/94554674/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


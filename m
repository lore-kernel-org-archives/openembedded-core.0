Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.1162.1588085092135105700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SWlk0cMs;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id b18so20531730ilf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pH0cqJ1k8zb1GOSLwG71I9Y6IYCpGDg34hfTuRlYb8o=;
        b=SWlk0cMskN1zWTiN8C55nhnlLy+Fq44ZoyPhBknGG1G7Jjqlu6T9pT0tWfxdB0c2rM
         sUtx+h4OAxY0B2CM9NoLae6kecFvyki9m2Ike3p6F7w9uH6rlr1zH1igMxV5s2yYoh8V
         zu1ETGEuEgQQIlrJQDmhTjBOeyU59DfVPYHhsebRT6AROGpAEthYL2qm4yO7H97tHeBk
         eeh9dr1RO0QGiZIqaD8XRjvIdn6ciWWLxhtAk1PrTX2TcCUq6skJsVju66P+ENHnt5Kc
         A3bNWzVyROZPEepsFaLz4Aihzfk9x9RTaX8K6z95bdOXfR/kxVI0VtU8dbAahoNZtPzo
         9EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pH0cqJ1k8zb1GOSLwG71I9Y6IYCpGDg34hfTuRlYb8o=;
        b=NVTmPiXTEgXOpZGW8fo3BI6yibPcsy9oGSo+7/9ShV6kvV0Awq43Sxi/HsfgnSY6ow
         ZSeFDB28Xn70aufzj2ojZ28xdUIR7HKFhhoWrax+r7cXmiVjc4s5Mk5ALzSK0ho7CnkK
         T4zI8JOHeXhTpcs+VSHSvoayAqkG1/2zN197dkG/AHZxaAIfOAqomMiZRT9QG0+yO6XZ
         wtEaNGeG31Z9YXpmFNGxxCcZvDe3241N2nzk1mrQ6xJscIFL+d3jDh/Ljo66Y38uAayu
         pPH0yyBaZ7CGO0T86gm/v0Vrtriozua/QPSHmWY1pmXFNZcEIX+CjGGRacPOQ3rOBX/J
         1Uhw==
X-Gm-Message-State: AGi0PubIb4CGE8SHvBIwYDtt1uI0werOFWSBW10/gLelvowzHrVzWvEC
	9YGqcgMpgEqCbHHUsmo47/Oin9/P
X-Google-Smtp-Source: APiQypL2RD9S2SFVRbltZTOL9YqpMnv39W7yqG8V9a6JkE7cUfy2Bwnrpl39XHUEY9EvKgziwa70MA==
X-Received: by 2002:a92:d44b:: with SMTP id r11mr26056887ilm.120.1588085090230;
        Tue, 28 Apr 2020 07:44:50 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:c83f:601b:6d46:7b46? ([2605:a601:ac3d:c100:c83f:601b:6d46:7b46])
        by smtp.gmail.com with ESMTPSA id n64sm4011506ild.85.2020.04.28.07.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 07:44:49 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Samuli Piippo <samuli.piippo@qt.io>, openembedded-core@lists.openembedded.org
References: <20200427131328.12044-1-samuli.piippo@qt.io>
 <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
 <CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com>
 <a7b33d1d-49ef-c20d-c8e8-32e9d155ec1b@gmail.com>
 <CABXoSoXSoaY5dg9p=CNaSmnMWNSOJHzG+PpXjZjqzpEPXrrA9Q@mail.gmail.com>
Message-ID: <1121befc-3920-92bd-c229-50c6729d2716@gmail.com>
Date: Tue, 28 Apr 2020 09:44:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABXoSoXSoaY5dg9p=CNaSmnMWNSOJHzG+PpXjZjqzpEPXrrA9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/27/20 11:33 PM, Samuli Piippo wrote:
> On Mon, 27 Apr 2020 at 23:20, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> On 4/27/20 12:35 PM, Samuli Piippo wrote:
>>
>> On Mon, 27 Apr 2020 at 17:51, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
>>
>> meta-mingw is using Mingw-w64 but the host triplet does not match
>> the expected pattern. config/os/mingw32-w64 enables more features
>> that were not working with mingw32.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>>   meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
>>   ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
>>   2 files changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
>> index b0411078d3..4c8275bf2a 100644
>> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
>> @@ -67,6 +67,7 @@ SRC_URI = "\
>>              file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
>>              file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>>              file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
>> +           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch \
>>   "
>>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>   SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
>> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>> new file mode 100644
>> index 0000000000..5a167f252c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>> @@ -0,0 +1,36 @@
>> +From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
>> +From: Samuli Piippo <samuli.piippo@qt.io>
>> +Date: Fri, 23 Aug 2019 10:10:43 +0300
>> +Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
>> +
>> +Make sure we use the w64 version of the configs, since that's what
>> +meta-mingw is using.
>> +
>> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> +---
>> + libstdc++-v3/configure.host | 12 ++----------
>> + 1 file changed, 2 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
>> +index 155a3cdea..adbda8784 100644
>> +--- a/libstdc++-v3/configure.host
>> ++++ b/libstdc++-v3/configure.host
>> +@@ -277,16 +277,8 @@ case "${host_os}" in
>> +     os_include_dir="os/hpux"
>> +     ;;
>> +   mingw32*)
>> +-    case "$host" in
>> +-      *-w64-*)
>> +-        os_include_dir="os/mingw32-w64"
>> +-        error_constants_dir="os/mingw32-w64"
>> +-        ;;
>> +-      *)
>> +-        os_include_dir="os/mingw32"
>> +-        error_constants_dir="os/mingw32"
>> +-        ;;
>> +-    esac
>> ++    os_include_dir="os/mingw32-w64"
>> ++    error_constants_dir="os/mingw32-w64"
>> +     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"
>>
>> It might make things a bit more obvious and upstreamable to just change
>>        *-w64-*)
>> to
>>        *-w64*)
>> if I understand correct?
>>
>> With meta-mingw, the host triplet is actually either
>> i686-pokysdk-mingw32 or x86_64-pokysdk-mingw32, depending on bitness
>> in the SDKMACHINE value.
>>
>> Hmm, it does indeed look like we are not correctly setting the host in a way it can be detected by GCC. It's a little surprising this hasn't caused any actual problems (at least up to this point)... is this something new to gcc 9.3, and do we have any idea why the AB MinGW tests aren't seeing any problems?
>>
>> Either way, it would probably be better to figure out a way to make the host look correct in meta-mingw if at all possible.
>>
>> Your commit message is also a little confusing because the first few times I read it, I thought we were configuring for 64-bit when 32-bit is desired, but based on the current GCC code being replaced and the value of the host-triplets, it would seem to be the opposite (we are getting 32-bit when 64-bit is desired).
> It's not actually the bitness that GCC is looking for here but the
> version of the MinGW. The MingGW-w64 is a fork of the original MinGW
> and can be used for both 32- and 64-bit builds. With the os/mingw32
> config, GCC is using subset of the features that are available in
> os/mingw32-w64, so builds still work although perhaps not always
> optimally.
>
> I don't see clear way to change the host value in meta-mingw without
> breaking other layers and recipes. Only part that could be changed is
> the -mingw32 part (HOST_OS), but recipes that do mingw specific things
> already rely on that for the overrides.


Ah, OK you've jogged my memory now, I remember. The mingw32-64 project 
is compatible with both 32-bit and 64-bit Windows. However, this makes 
me think even more that we a better way to fix this, because GCC might 
not be the only one doing this check and I don't want to add patches 
like this that can't be upstreamed to a bunch of recipes to force them 
to use mingw32-64.



Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.10287.1626284171128096869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 10:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RmRirsNd;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id u14so3187746pga.11
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:from:organization:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W4U89g5clUxp3B5Yg37Rs1PaN1oJzLvU3P+QhU3cwF8=;
        b=RmRirsNdTPaRsJbvUIJ5JAaJ2kh4G1reW1WE7sbtz0PtHtXr70kMRUQ1Sx+/saxgv3
         9OOUO/FhyWX522HL2HiA+YHogxdq054SdVYST8re/kdp9XduMIGb/Zbr8XtFEY+TSbjh
         oN/lnYjePQU/nMTCu2zhzw2m203qQnu5jl/GR2UyEDiAW6OBSS6XYaXSRU4IaVvGAthc
         1SuIuTzMhDEBUVzhtpZPlhv/jzrEyRBJknenPNojq67NRhCI4KLhfqOXLl6IlqSq4/Wu
         AGZ3bCWVRyztHqUIrNzBVrroBZQLAiGqBhd+sVPWKmic/9KnkvXJSLwg5xHYl2T/irds
         ZjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=W4U89g5clUxp3B5Yg37Rs1PaN1oJzLvU3P+QhU3cwF8=;
        b=qQulLq1oNXDiU30LKZSjlZNgaxg4/WqAcL5JuU04LcvZmwby+X2PoqiFiWz2/70tyT
         bps712SPpQzLaWDtkBCbxF2zrZWVQLcPc2KnhV3lYaKwfl+LZKQ124owDDxRQLLsnrWN
         EFsTtsa07PlsVt/YdLD3/zo1qbP6AK3kzySuWbir33GgQTDvERSl5uT3FK99yr4k+sNR
         ASUM3uuyDiX9CRhw5faJFKOfG/buIQyKqbEs22UbEYlOreTjck/XJObjHwQW6Zp9yNUB
         0keg40Chfn2u7fYFQxCuhpDcCJDd3qMwMXFgZO7JGLvwaPrEKWwydJ9h5sTlRLJVkkux
         uVuw==
X-Gm-Message-State: AOAM531wWiCazY9cw19HEA6I6IYw+J9SxWGwf9RJqXyULeg2RZ4RR+9H
	YPsMlm2XfdPScw3H+Gj3XemMTJczqzJFLQ==
X-Google-Smtp-Source: ABdhPJxFq6d5sEyNM58m6PN8BICCLy8nVaiVEgdZfByNX8IpVzI6gj/40UZRT4wUAB6BmwzN4BhR3w==
X-Received: by 2002:a63:470b:: with SMTP id u11mr10741303pga.340.1626284170310;
        Wed, 14 Jul 2021 10:36:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:9c22:5530:e06f:dd43? ([2601:646:9200:a0f0:9c22:5530:e06f:dd43])
        by smtp.gmail.com with ESMTPSA id p3sm3872859pgi.20.2021.07.14.10.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 10:36:09 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210714141432.610106-1-alex.kanavin@gmail.com>
 <bd224e1b93a24ec261502e4311ac4cb7252ed27e.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH v3] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
Message-ID: <fe6b791f-77e6-c756-4c21-84a469fc3744@gmail.com>
Date: Wed, 14 Jul 2021 10:36:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bd224e1b93a24ec261502e4311ac4cb7252ed27e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/14/21 9:26 AM, Richard Purdie wrote:
> On Wed, 2021-07-14 at 16:14 +0200, Alexander Kanavin wrote:
>> oe-core has not been providing multiple versions for any of these items
>> for a long time, it's not likely to change anytime soon, and it makes
>> automated (or semi-automated) versions updates with devtool impossible,
>> as PREFERRED_VERSION masks the updated recipe in devtool workspace.
>>
>> Specifically, this was prompted by investigating why automated llvm update
>> doesn't work; it does now.
>>
>> v2: GCC is excluded as overriding the version through GCCVERSION is used
>> across several layers, and the list of things to override is large.
>>
>> v3: exclude linux-libc-headers too, as that is using a separate update
>> process without involving devtool.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>   meta/conf/distro/include/tcmode-default.inc | 36 ---------------------
>>   1 file changed, 36 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>> index 1d4aa1e11f..e655bd85ce 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -18,12 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>>   
>>
>>
>>
>>   GCCVERSION ?= "11.%"
>>   SDKGCCVERSION ?= "${GCCVERSION}"
>> -BINUVERSION ?= "2.36%"
>> -GDBVERSION ?= "10.%"
>> -GLIBCVERSION ?= "2.33"
>>   LINUXLIBCVERSION ?= "5.13%"
>> -QEMUVERSION ?= "6.0%"
>> -GOVERSION ?= "1.16%"
>>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>>   # llvm version being used, so always bump it with llvm recipe version bump
>>   LLVMVERSION ?= "12.0.1"
>> @@ -42,42 +37,11 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
>>   PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
>>   PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
>>   PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
>> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
>> -PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
>> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
>> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
>>   
>>
>>
>>
>>   PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
>>   PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
>> -PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
>> -PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
>> -PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
>> -PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
>> -PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
>> -PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
>> -
>> -PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>> -PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>> -PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>>   
>>
>>
>>
>>   # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
>>   # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
>>   # go-native.
>>   PREFERRED_PROVIDER_go-native ?= "go-binary-native"
>> -PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go-native ?= "${GOVERSION}"
>> -PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
>> -PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
>> -PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
>> -
>> -PREFERRED_VERSION_llvm = "${LLVMVERSION}"
>> -PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
>> -PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
> 
> $ grep LLVMVERSION * -R
> classes/meson.bbclass.orig:llvm-config = 'llvm-config${LLVMVERSION}'
> classes/meson.bbclass:llvm-config = 'llvm-config${LLVMVERSION}'
> 
> which is why we have LLVMVERSION. I'm sure some other layer breaks if we
> don't do this.
> 
> To be honest I think this starts to look like we can drop qemu and
> not much else, the rest have many different related providers and
> are pretty toolchain like where it is hard to guess what the form the
> variables should take. That was the design purpose of the tcmode
> include file. Most of those components wouldn't likely work with
> devtool upgrade anyway and would need more careful handling.
> 

honestly, this will cause more pain than what it is solving, eg. 
meta-clang also uses LLVMVERSION to override oe-core provided version 
and mesa depends on it too. The purpose of these variables was to let 
users swap out toolchains which are consisting of multiple different 
components/recipes and they may not know the whole chain that needs to 
be replaced. This patch takes us back to where we were few years ago. I 
would like to understand what issue does this patch solve that we are 
willing to break external layers for.

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

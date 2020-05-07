Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.2588.1588880658331343394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 12:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LtLHqGPg;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id l25so3271398pgc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4Q1pX4eVTwjtGKQQYrlr0NpK39dEe7Z1xtECzomImbc=;
        b=LtLHqGPgO37xgnrFoOT0A+O+LCL5Tu1XFpZWqw93a7uAVsuliNBaAY3jsiGqpEHUBf
         C45ePw93Q6Gn4Egx1H1A+A7EYS7g1BU/FYKJxs3LLNhC65LHcVAA7Q7dGorwc64CThcS
         2N8R3qvRtPX9hjO5HK1MN85hI65LPEkL2XTlFzbaISW50HzHBahW4fjTwMCxqTV/HA6t
         n/Jb7PF4e6GpWVUpfQ9ro9cbk1yoUDMcm/vzeDixcnIubY25/OjhUp5gKDbch9xocNhk
         2QZbmGw/B4Qh5vi5YNy/quXGDMdJIV+cW801qlL2bBiwfTNHF3+G99kYtf/700w3dLH2
         SLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Q1pX4eVTwjtGKQQYrlr0NpK39dEe7Z1xtECzomImbc=;
        b=VGZOvmqfKXWkxKTMEsRj+ped0kC7bEQ2XS3bBHcLOZNnFdYmLq4k0YncTqKxphCnjZ
         IaRSVzMi28eOS6viuqwFhhtbBqvikBmnY7mRQcG+sQhrS5ynNEaogRiomC5Rja2ZMx8V
         0PZWWQkmYTopGrzrrT4AvV8YHVvCh3cpO4yzOLkQ5r/Wai1sYOrO0tR2aMAHmhcXufXW
         jLmuZ2rBsT50bORtHgeKR56rzaxYxTbPiNYbOEN/P5K0SElwT+jvuIXM/bYGmyyauIgn
         bno56Cr2PryPBhKK0qYqhQRLhxDtxc5XHYYSvQPN2yMhaZgvOxqXgazbRNITDZm+Woo5
         /TVw==
X-Gm-Message-State: AGi0PuYyLMdACTJjfKdLPhMPLIW/SOc3O4E1T+7Ad9Q14QOtVISZt4qu
	wFQUJSor8oL3u0ctG6YKS9o=
X-Google-Smtp-Source: APiQypJmvF1NPeaflWtxd2lecMYR/wmljpdS2w0m4ntRGLP3ZZXrOSTGRq2oV6ZWmfxuSo4e/W9L5w==
X-Received: by 2002:a63:a351:: with SMTP id v17mr12442741pgn.343.1588880657608;
        Thu, 07 May 2020 12:44:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2691? ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id y2sm5702947pfq.16.2020.05.07.12.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 12:44:17 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
To: openembedded-core@lists.openembedded.org,
 Ovidiu Panait <ovidiu.panait@windriver.com>
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com>
Date: Thu, 7 May 2020 12:44:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/3/20 3:51 PM, Steve Sakoman wrote:
> Should I consider these two patches for dunfell LTS?
> 

Yes I think they are fixing a problem and are safe.

> Thanks!
> 
> Steve
> 
> On Tue, Apr 28, 2020 at 2:59 AM Ovidiu Panait
> <ovidiu.panait@windriver.com> wrote:
>>
>> Extend the functionality provided by commit [1] to the SDK as well. This way we
>> can make sure that nativesdk-binutils finds SDK libraries first rather than
>> host ones.
>>
>> This is useful for example when trying to build the linux kernel using
>> nativesdk-gcc. This scenario currently fails because it tries to link to host
>> libraries rather than SDK host ones:
>>
>> make x86_64_defconfig
>> make bzImage
>> ...
>> error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel
>> Makefile:1101: recipe for target 'prepare-objtool' failed
>> make: *** [prepare-objtool] Error 1
>> ....
>> /../../../../x86_64-wrlinuxsdk-linux/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to `__libc_vfork@GLIBC_PRIVATE'
>> ...
>>
>> [1] 15049c610b [buildtools-tarball: Add an ld.so.conf for nativesdk-binutils]
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass       | 5 +++++
>>  meta/recipes-core/meta/buildtools-tarball.bb | 4 ----
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index ef0d8bef58..6a1ebc8c02 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -185,6 +185,11 @@ fakeroot create_sdk_files() {
>>         # Escape special characters like '+' and '.' in the SDKPATH
>>         escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
>>         sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
>> +
>> +       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
>> +       echo '${SDKPATHNATIVE}${libdir}
>> +${SDKPATHNATIVE}${base_libdir}
>> +include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
>>  }
>>
>>  python check_sdk_sysroots() {
>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
>> index 977b6a5e1d..c49802eef8 100644
>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>> @@ -76,10 +76,6 @@ create_sdk_files_append () {
>>         echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
>>         echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
>>
>> -       mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
>> -       echo '${SDKPATHNATIVE}${libdir}
>> -${SDKPATHNATIVE}${base_libdir}
>> -include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
>>         if [ "${SDKMACHINE}" = "i686" ]; then
>>                 echo 'export NO32LIBS="0"' >>$script
>>                 echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
>> --
>> 2.17.1
>>
>>
>>
>> 

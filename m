Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD16C3ABAA
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 14:45:58 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.51944.1746456350253014280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 07:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYpHGfpL;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so2984325a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746456349; x=1747061149; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGG7642sC6ftrEzIC2cCGBnZ5kfq5bKe2j5gc/NX/Hw=;
        b=bYpHGfpLk03csM7eQehBupZM9ZvxdXbyfqL5YLbd6UeWaG85Bdz8ZDQEKE4Rkn/7Tn
         Apt4/jilWtBQyXDAIwgudCIvNm+l/Xefts+J59F5XxIZMyNFijDUXGy+EDJBYpuIuu67
         MnUlYT7y92Kok8GgG1pBdJT6khZ3gT2e1i5ke+AAtz6BluoYzGy2jVfpkuiSl7zvhDdk
         DORE2oO80IZ99rz1RobH2vBTYWfw9scWyB09qD96/pdYUL7XY7Euw2SwnGmW0WUqTtGF
         /Gp8ikhA++ttqk8Ky5am3f+5UldtbQvPO9LyrX8qDmTv5KSFoVSZwss9CSFrzBaU2ZUK
         zChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746456349; x=1747061149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGG7642sC6ftrEzIC2cCGBnZ5kfq5bKe2j5gc/NX/Hw=;
        b=nFdYEwnK/PxbMpHva73TAaa+pQoJwAx04AWo22yfpBE9DjQT+DJmTHfgyKHxEQYJpE
         7V3enA/0N9y+Q/Gp1qZ7NummuLaCc4RixNg3NzRuM+hW5r/hYDn4+Ll+8Sc4UOWkaEyU
         POxEVGhadzj3s6z4Q8LjUViitRfhJO1/8V64SCt/hoVhwyCWbSHUMMZjkQ8l5S6HUPY2
         n84L2H/Tda2CHLcbmCJ9zM+ljJjg5c07M7DmqbzFJJc9N/xQWinJsxNzTyp8MK23HgtW
         kzw9s49c4TRs//EM5LdZ5FPYGIc7kzH56OrbRA0q0TdbnDOLfl8tyx7GmRYWJ6GUVScy
         W2XA==
X-Forwarded-Encrypted: i=1; AJvYcCVtSMjbwqRSKWmDMVd7bFpIiOlEsuvbm+Tu2OKkyIQshTgjfQIVNzQ6X3smMGK0eAKBlL//nLU2FLeQ+AtEkaXv5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywl4MJz3L8TfTjbEciQ00G3vXvHbBkN2uIfXQJliF5sCNWKYT8m
	uTXCsxnRwMRsJtH0BOIECLmnO7t0jn1jGvmLKiiTSMelQAejiDXd
X-Gm-Gg: ASbGnctv+15kUG9cetO/fKByl5+Vy4oRFd/aqJmTWFrhtxrvX7IlKVPYC7wGtdlObnW
	5VGXK4NPWCKesF5maDVAurjK2GZxoy+cixgXz4xUoBsZPFJTQHmtFLAx2Bps25CgCU7YhFs3bV0
	P1XycKFYD71VrwM9k2obGLyE3DnV678K4iYX2cIGM8Y8M0vJoreVvBu1LFr+52TB8zsLU1Uo5iS
	3ZLcRsl48ouxDeIMyPAmNo3tMkOGp5XbkwM2VXR2Q5mC18+q4GK5GC7LIxuVkiQpu0TNUtmZmbG
	bUQC5E1JHBhOyhSLh//itHzNE2X1beK85FZrpI2nky6YkQ/2qmCupK4DxRB4WjkEi0VpplexInU
	hzatbSAJudK7HdSywK/Mt4XrUSbCr
X-Google-Smtp-Source: AGHT+IFEpXajfDpxbEUUfki0vLcHJWvZPSL/+WrCvoYfqBcDD3fqZrN8B/hXw0qCZwWNY8yRlcVoQw==
X-Received: by 2002:a17:90b:5201:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-30a61983851mr12487630a91.11.1746456349307;
        Mon, 05 May 2025 07:45:49 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:10a3:c7ea:a7a0:8c0d? ([2601:646:8201:fd20:10a3:c7ea:a7a0:8c0d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625aeasm8956233a91.36.2025.05.05.07.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:45:48 -0700 (PDT)
Message-ID: <85e96179-18ba-4dbf-8f94-c05210588de2@gmail.com>
Date: Mon, 5 May 2025 07:45:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Max Krummenacher <max.oss.09@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
References: <aBilFkr4HF-MSBd6@toolbox>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <aBilFkr4HF-MSBd6@toolbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 14:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216015



On 5/5/25 4:46 AM, Max Krummenacher wrote:
> Hello
> 
> I'm seeing a strange warning resulting in a failed build when building
> systemd with tpm2 in DISTRO_FEATURES.
> 
> GCS seems to be a new feature supported with GCC 15 and friends
> targeting the AARCH64 architecture. Whatever it does ;-).
> 
> Ways to reproduce:
> 
> Add the needed layers for tpm2, add tpm2 to distro features and build
> systemd.
> E.g.
> bblayers.conf additions:
> 
>    ${TOPDIR}/../meta-security/meta-tpm \
>    ${TOPDIR}/../meta-openembedded/meta-oe \
>    ${TOPDIR}/../meta-openembedded/meta-python \
> 
> local.conf additions:
> 
> DISTRO_FEATURES:append = " tpm2"
> INIT_MANAGER = "systemd"
> 
> MACHINE=qemuarm64 bitbake systemd
> 
> Results in:
> 
> | FAILED: src/shared/libsystemd-shared-257.so
> | aarch64-poky-linux-gcc -mcpu=cortex-a57+crc -mbranch-protection=standard -fstack-protector-strong
>    -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=...systemd/257.5/recipe-sysroot
>    -o src/shared/libsystemd-shared-257.so -Wl,--as-needed -Wl,--no-undefined -shared -fPIC
>    -Wl,-soname,libsystemd-shared-257.so -Wl,--whole-archive -Wl,--start-group src/shared/libsystemd-shared-257.a
>    src/basic/libbasic.a src/libsystemd/libsystemd_static.a -Wl,--no-whole-archive -fstack-protector
>    -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -ffile-prefix-map=...systemd/257.5/git=/usr/src/debug/systemd/257.5
>    -ffile-prefix-map...systemd/257.5/build=/usr/src/debug/systemd/257.5 -ffile-prefix-map=...systemd/257.5/recipe-sysroot=
>    -ffile-prefix-map=...systemd/257.5/recipe-sysroot-native= -Wl,-z,relro,-z,now -shared
>    -Wl,--version-script=...systemd/257.5/git/src/shared/libshared.sym -pthread ...systemd/257.5/recipe-sysroot/usr/lib/libacl.so
>    ...systemd/257.5/recipe-sysroot/usr/lib/libblkid.so ...systemd/257.5/recipe-sysroot/usr/lib/libcap.so
>    ...systemd/257.5/recipe-sysroot/usr/lib/libcrypt.so -ldl ...systemd/257.5/recipe-sysroot/usr/lib/libmount.so
>    ...systemd/257.5/recipe-sysroot/usr/lib/libssl.so ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so -lrt
>    ...systemd/257.5/recipe-sysroot/usr/lib/libseccomp.so -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common
>    -Wl,--gc-sections -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections -lm
>    -Wl,--end-group -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
>    -Wl,--fatal-warnings -Wl,-z,now -Wl,-z,relro -Wl,--warn-common -Wl,--gc-sections
> | ...systemd/257.5/recipe-sysroot/usr/lib/libcrypto.so: warning: GCS is required by -z gcs,
>    but this shared library lacks the necessary property note. The dynamic loader might not enable GCS
>    or refuse to load the program unless all the shared library dependencies have the GCS marking.
> | collect2: error: ld returned 1 exit status
> 
> 

This error means that systems is being not only compiled but also linked 
with -mbranch-protection=standard, however libcrypto.so which it is 
linking to is not linked with -mbranch-protection=standard. One reason 
could be that openssl linking process does not respect the 
-mbranch-protection=standard flag or omits it somehow. Look into build 
logs of openssl and see how libcrypto.so is being linked and maybe if we can
pass the -mbranch-protection=standard to linker ( if gcc driver is used 
for linking ) or -Wl,-z,gcs to linker cmdline could fix the problem

second option might be to relax GCS Compliance Checking in systemd build 
by using -Wl,-z,gcs-compliant=all in linker flags



> I already found that adding to the systemd recipe
> 
> 'CFLAGS:append = " -Wl,-z,gcs-report-dynamic=none"'
> 
> prevents the build error. However I'm not sure if that would be a good
> way forward and if there are other recipes / configurations which would
> result in similar build errors.
> 
> Any comments? Thanks.
> 
> Regards
> Max



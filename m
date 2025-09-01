Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2181CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 07:57:28 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.46176.1756713439350629652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 00:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKDpbp9d;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afede1b3d05so684252766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756713437; x=1757318237; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9dfIVJghYLK/GKUZ1N6aO6DOFJmki5JNQSgNA7LPxA=;
        b=AKDpbp9d/LvIJCo15MQmXCtRDyAsYK0YeAk5EH9wZAGjz7QICJv/HUZOs/P7mnHlwG
         qaNuIEllXMTbgNjAQFRf7YVKQJFXC1TBWm8eaSj5Yiptg7DWLYEdmmbzeitqTM+iYTdM
         stcuEtgkprcgiWC++KZdUFwYIiVNfSr87LVCuMinRlKkuHhM/oFwr/6uqGNT5OehKzf9
         bMpeEAVf0M1ezDGDAy6KYIKnZ7j7G2mgVDQJ3JSrge/KePEvyvP/AROhSPR8L+90zyJB
         Js8/344KXuhZpaVlG9nrQkBwwZB/ucLl19C4T7a9iEHtU82xsSC6Rd0qk1XIV85PMVWa
         YUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713437; x=1757318237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9dfIVJghYLK/GKUZ1N6aO6DOFJmki5JNQSgNA7LPxA=;
        b=f1jgVIU1JBvKmAoBjqgwzId4xUq9ZOCC0bgrHT4sr8HLzPW9fIA+iccA9G8m/Ho6WB
         Pi4U7FX9Bw7et19Qatuqz6QpU6LJyYU8z/BZJxeVycR4LpajyilAyTFNW1f722wVWg/h
         u23sqa3ORkeadwb3Ko7E/TUWJhA2S11KlrYYCekAuQ/m939QDQuTRTQ9Gs5FZhh3u0Ju
         3thwbtjKGd+B9ieynGwmSOcRRvw34Qv8C4zOAt+UgFc1o3vwwUCHgx3igwEmOhhWjY9l
         FO1qhwJmEiNbzWBU4kyGOV+Me/XICUOng035fe7kY1UBJpW5iHjjoTNh/DWJoi0tWs0f
         8ibg==
X-Forwarded-Encrypted: i=1; AJvYcCUmG1ma1lQKhDXN9squTxmUk419IUL9z5gVVv26UIv9egDbaglgJxDISVqMYLZV94QSmYGQK3jzH9NU1x1BbEFDdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHrnR+PrKCGVRHRchG3eHI6WPaNim/N4oKh3YldDycU2EP2+xS
	IB7Aa9xYoG0bNTx7RR3aXnT5dudppoN0KezKL6sZ8NsyNBRjaUuSbFFP
X-Gm-Gg: ASbGnctYyuxLwiJg9UY0wafV755iUqLnHoBsgHzXaHKioJGR41+BjtG3a+gMsKNBhVr
	RCU7X1X2/i1gHEA/0B5b6KjDIKhaP62nuvP4JmlUrB+wojLZ9h8PahAReJKqCl42m1qtovlJYTB
	lJVTTZWJohHgSTSOipm4WreFJi1hg5MdZSX0hiLr3aoRmzWFQ+TgVfrrr5QEGJNMy6QMu7tLNMQ
	ZvCZFlcLWzJCTClYOrxFk/Nq+kdEyduLOoWETx/TU7JfOw1OHgF06Lk7JI4Se2puVsUiTNkdd1c
	znBcJ8cBS3/eG/wlje5WH5kGMoPZZVInablEDSNBeNLns0JdJFtcv6OREZUeRTUJysaRq0MJYxW
	6epEP4tL0QDWrdoqSfZgLyD0YF14Igp0BqWiaaC9QXg==
X-Google-Smtp-Source: AGHT+IEErL7gtPXiavuYb9f4LnSn8EidwDAd/c1F7JBFxjs81qydx5TUJFLvhABtwlAbjw3ss73uQw==
X-Received: by 2002:a17:907:94c9:b0:b04:2f81:5c35 with SMTP id a640c23a62f3a-b042f817f8cmr207915666b.34.1756713437151;
        Mon, 01 Sep 2025 00:57:17 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04129eccbfsm393252866b.7.2025.09.01.00.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 00:57:16 -0700 (PDT)
Message-ID: <ccc997f8-b7f2-4dbe-a8fb-699fc5975f63@gmail.com>
Date: Mon, 1 Sep 2025 09:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] apt: upgrade 2.6.1 -> 3.0.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250828190032.1681715-1-skandigraun@gmail.com>
 <DCH8LQDR3JGJ.2MH1CYU3GQDRM@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DCH8LQDR3JGJ.2MH1CYU3GQDRM@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 07:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222643

On 9/1/25 08:07, Mathieu Dubois-Briand wrote:
> On Thu Aug 28, 2025 at 9:00 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Changelog:
>> https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.3_changelog
>>
>> Dropped patches which are included in this release, or became obsolete:
>> 0001-Fix-compilation-error-with-clang-libc-18.patch - included in this release
>> 0001-Fix-musl-build.patch - included in this release
>> 0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - included in this release
>> 0001-Remove-using-std-binary_function.patch - became obsolete, fixed upstream
>> 0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed upstream
>> 0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in this release
>>
>> Added a new patch to avoid compilation error with musl:
>> error: 'basename' was not declared in this scope; did you mean 'rename'?
>>
>> Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped in favor of openssl
>> in version 2.9.19.
>>
>> Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warning if the system
>> isn't a usrmerge system during package installation.
>>
>> Added new COMMON_ARCH CMake argument - if it is not defined, CMake is trying to
>> determine the value of this variable by running dpkg, which is usually a futile
>> endeavour. It is used in config creation, and to print some system info.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for your patch.
>
> It looks like this is breaking a selftest:
>
> 2025-08-29 15:00:24,710 - oe-selftest - INFO - runtime_test.TestImage.test_testimage_apt (subunit.RemotedTestCase)
> 2025-08-29 15:00:24,711 - oe-selftest - INFO -  ... FAIL
> ...
> Traceback (most recent call last):
> ...
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/runtime/cases/apt.py", line 76, in test_apt_install_from_repo
>     self.pkg('update')
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/runtime/cases/apt.py", line 19, in pkg
>     self.assertEqual(status, expected, message)
> AssertionError: 100 != 0 : apt-get update
> Ign:1 http://192.168.7.1:37141/all ./ InRelease
> Ign:2 http://192.168.7.1:37141/cortexa57 ./ InRelease
> Ign:3 http://192.168.7.1:37141/qemuarm64 ./ InRelease
> Get:4 http://192.168.7.1:37141/all ./ Release [1215 B]
> Get:5 http://192.168.7.1:37141/cortexa57 ./ Release [1221 B]
> Get:6 http://192.168.7.1:37141/qemuarm64 ./ Release [1221 B]
> Get:7 http://192.168.7.1:37141/all ./ Release.gpg [520 B]
> Get:8 http://192.168.7.1:37141/cortexa57 ./ Release.gpg [520 B]
> Get:9 http://192.168.7.1:37141/qemuarm64 ./ Release.gpg [520 B]
> Ign:7 http://192.168.7.1:37141/all ./ Release.gpg
> Ign:8 http://192.168.7.1:37141/cortexa57 ./ Release.gpg
> Ign:9 http://192.168.7.1:37141/qemuarm64 ./ Release.gpg
> Reading package lists...
> W: OpenPGP signature verification failed: http://192.168.7.1:37141/all ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:37141/all ./ Release' is not signed.
> W: OpenPGP signature verification failed: http://192.168.7.1:37141/cortexa57 ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:37141/cortexa57 ./ Release' is not signed.
> W: OpenPGP signature verification failed: http://192.168.7.1:37141/qemuarm64 ./ Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 7B31316B5D64AD52
> E: The repository 'http://192.168.7.1:37141/qemuarm64 ./ Release' is not signed.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2384
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2234
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2167
>
> Can you have a look at the issue please?

Thanks, apparently I stumble upon everything with this patch...
Will check what I broke.

> Thanks,
> Mathieu
>



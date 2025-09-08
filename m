Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E671CAC581
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 19:17:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.3535.1757359051029764712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 12:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/Nu7rA6;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62598fcf41aso3270470a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 12:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757359049; x=1757963849; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr0vFF3uNRfTzTiIoi8jzHtgAqr1dqlay3ukMWexQrI=;
        b=B/Nu7rA6Qh3z6Dd0Rr1Xp2QahafqC1RWwcm+6DmBb7BGvl1Wc08SlS3SKboh1TY8k9
         166eXD/0gxihSFqw5lK2xd+sxaOIkA9eAZrY2bC6nQAJ0C5/wJBXXxg6EDELuLv5sgRy
         rSE5YAs+4oh/8r85oCIcWeSZremJpICD4dIzc05Sp/cNGCV30ojKotoes4iXUqUvcgtQ
         trv12mCwG0mD11LUsUoQcsiAaxGBLFkQGZvREYldA2DBv5O8aQn6LXwWN1UI7l2TzkUt
         V7FeFQflUIGfHcpPv6BRw+6gIHs5+ukVap/amiGBDvIxPVYLG0Ecg9VVz+Nr74xcbst0
         U9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359049; x=1757963849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr0vFF3uNRfTzTiIoi8jzHtgAqr1dqlay3ukMWexQrI=;
        b=r6Hoe1hThrTzQt/MbT3PPSZ6Y8pZCnr/62BGJS/K0+rQFkxa5weoTfbaySPLZQOKX4
         42me/OTzyAoDEKz+wbNM9hu6sY79SyJF4imRnQkC1U3HuX0jkfNDxESPgUljRyZAhsx4
         U5V04PYQY5Jx1YDAvmSOtQAcUQoMcmGaUmuvupKf0Th8OLhHb6dC5tjyW4qYBlXedUhY
         mEcTfehfzKzR/XRCOLSZl4z7FFfPey444PLg0TkEFRyJgAyrOotYOFHkAitR/2LHk/MB
         1E5BcAPM9UMeyPQYqX+HJsrTlSTTzd+NM34V6aoJNnVsKM3uyrIcUdomfaovWI3hHllL
         Y4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLqFBJUoiJ99r9WHHreqyxL7nELcYgbacOqM9Jtvc6KlAn0gHBNcSl/+hmJrpwed8TSJKpsHecyx4l/TUhR+g1xw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3d6/Z1egEz1xZc5ftWVq7lDB9bkW8SjpcCxr2JGxDnmBW+dYo
	w6WMP/qxEWSgk1x6pEsv2LCDnIslvZQ57e5F73NacKBOmnUg8YWLIq7c
X-Gm-Gg: ASbGnct9A2UjBArE7uKnx8FveHvOkzc1sf1wVsX+MwxkaX7Z7zTH4aNrdFefUbQoKAA
	JGpBGqxWP+gUOMzihZ1aa8Z4XjZexSquPFatbqR4/f169PUqqUfUwwSXgS+ijKW7BxfppYLfGKM
	ga/syZOqWkwHrfV1v/kXwdalrWofZjwWhIGevWLO9EtpbIdg7lKhplnr9+kREGRfZZ5UZMoLCSO
	Bsx4Uvq1zmSnZ7bqJNLBoMrFK7gcq9OxszjDgXE/y4m79Rq3J7fb06jWFXiW7vxrQBScz5Ey3vO
	wmcvpNFyjScJ8kMFDg4ax3kwm/zkpqPBlkCG7A4ZgP1qo21k7qjUdIdT70hCxwnXt+bAe6QmzRO
	YNuvcyhGqsceTSonBJxiVN/G4p6+6IxYPK7BQG2gVkA==
X-Google-Smtp-Source: AGHT+IHDgLKYmPRWd5hqsia2JL3F52xkxbuuvyHbA9esEjUCxcVKh04+YkLo94q2qGAIVGPH97Y2AQ==
X-Received: by 2002:a05:6402:354a:b0:62a:91d5:8848 with SMTP id 4fb4d7f45d1cf-62a91e4cf8dmr2060936a12.36.1757359049110;
        Mon, 08 Sep 2025 12:17:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4e58aesm22187404a12.36.2025.09.08.12.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 12:17:27 -0700 (PDT)
Message-ID: <541cd1ea-7136-4f0c-9548-4d340a06e4bb@gmail.com>
Date: Mon, 8 Sep 2025 21:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] librsvg: add ptest support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250904112140.2762452-1-skandigraun@gmail.com>
 <DCKTHPPY024Z.VPM4BWNDVWIG@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DCKTHPPY024Z.VPM4BWNDVWIG@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 19:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223077

On 9/5/25 13:07, Mathieu Dubois-Briand wrote:
> On Thu Sep 4, 2025 at 1:21 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> The suite is quick, it takes ~5 seconds on my machine to execute.
>>
>> The tests consist of 2 or 3 parts, depending on how one counts them.
>>
>> The apitest PACKAGACONFIG compiles tests for the c-interface, as part of
>> the main meson build. This apitest expects test data to be present in
>> a folder relative the test binary: ../../rsvg/tests folder.
>>
>> ptest-cargo compiles two sets of test: rsvg-convert tests, and generic assorted
>> tests for the library, in multiple binaries.
>>
>> The rsvg-convert tests expect test data to be present in a "tests" folder,
>> in the same folder where the test binaries are.
>>
>> The library tests expect the tests to be in a folder called "tests", that's
>> location is specified by the CARGO_MANIFEST_DIR environment variable.
>>
>> As part of compiling the cargo tests, rsvg-convert is also compiled specifically
>> for the tests, however it is not supposed to be different from the actual binary.
>> It is deleted from the test set, because of two reasons:
>> 1. It is not bit-identical to the actually installed rsvg-convert (it is compiled differently,
>>    with cargo only, without meson)
>> 2. ptest-cargo class treated it as a test binary, and tried to execute it, which resulted
>>    in failing/hanging test.
>>
>> It is avoided by not installing this binary, but rather use the real rsvg package
>> as a runtime dependency, and create a symlink to it in the run-ptest script.
>>
>> Added liberation-fonts as a runtime dependency to the tests - the rsvg-convert
>> tests require some fonts to be available to be able to render during some
>> svg->pdf conversion tests.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for your patch.
>
> I believe we see two issues on the autobuilder.
>
> First, we do have a reproducibility error:
>
> AssertionError: The following deb packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/deb/./x86-64-v3/librsvg-2-ptest_2.61.0-r0_amd64.deb
> The following ipk packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/ipk/./x86-64-v3/librsvg-2-ptest_2.61.0-r0_x86-64-v3.ipk
> The following rpm packages are different and not in exclusion list:
> /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-extended/tmp/deploy/rpm/./x86_64_v3/librsvg-2-ptest-2.61.0-r0.x86_64_v3.rpm
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2422
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250905-lgqh2ddp/packages/diff-html/
>
> Also, there is some build error. This one only appears on some platforms
> and seems a bit intermittent.
>
> ERROR: librsvg-2.61.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/build/tmp/work/cortexa57-poky-linux/librsvg/2.61.0/temp/run.do_configure.3967314' failed with exit code 1
> ...
> | ../sources/librsvg-2.61.0/meson.build:357:4: ERROR: Problem encountered: error: error loading target specification: could not find specification for target "aarch64-poky-linux-gnu"
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2191
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2417
>
> Can you have a look, please?

The reproducibility issue should be fixed by [1], and [2] should take
care of the intermittent build failure - both of them are in master now.
Could you please retry this librsvg patch?

[1]: https://lists.openembedded.org/g/openembedded-core/message/223009
[2]: https://lists.openembedded.org/g/openembedded-core/message/223039


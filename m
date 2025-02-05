Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8734FC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:22:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.14577.1738768920474142771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cGXPbss9;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso47702715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738768919; x=1739373719; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3QzrcF3D64QqMYREWcfflqwyBCvINLBho0kzH1NbPc=;
        b=cGXPbss9oMPnN/fATJ1dwVYEyMYIhsWhG7q+GSj8hb7jKkS8i3gi0yMGnwSvGqNtfs
         TRjYeW4qcOnuC0G0Uxqybsvd5B52i8D6KwLMJ7h5yNr90001T0BR5v5+x7bTe+tiXde0
         8dFy1iT/G8u8fVNfM8j7+xDiZgK3SUxL+4gajn72HcJvCE/w2g/bFFoLx5S8Cz4Zb8jQ
         xzKxOHY1exy2UpO+kQu769B14q3iY2fD6xYR4DLN/quqj5qU4AonrfF+bnhXudE5lvDC
         uBCD+HNN5IuKgnfLwRiLan8y2m5jBXNKgStI+BvxUhlLFZl7ZJTZ9ENgN+3JMs0dBiCM
         NK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768919; x=1739373719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3QzrcF3D64QqMYREWcfflqwyBCvINLBho0kzH1NbPc=;
        b=FhiuN1ZXqrOFlpP8LdzchOoY5zPd8xrUKiEYTH9nWIvNWuEn0ssC1crCrvEcDDmo1Y
         Li0AOqKLaMt0KQgCvrttGopWzt2Pu+8QLTc3KEQjYk7idWLXPblbBqbGYSq48FjwOOBy
         lfqtLivlkKFjGsIbhoraOY8rrHpJIaoCZrDgihhbqiD2vqv3N5Iyuyj35DnPBgAShp+K
         l6BUU5lmCkEb+IcEfHf6YUI/v7n3TGeFiObowRMNRODmdEdPvU1hRYjpJpc12aNYuatA
         0lXoqKBn1rOvFySvZH3jklA2MAKA57CeG1mLNrJ4lyJw4E+m8irZ+4/EQeg0tlL/Y9BN
         Srtw==
X-Gm-Message-State: AOJu0Yy+/n9Jt1uiF9efETkcm1OW6+dapDtl18GXaBKoSsKbR9DE0LdB
	+v+1IH9uxNId4v6Hzh/FVPbWGO118FxsgNV/G2vp11t2zZGiCbLUVyJ50w==
X-Gm-Gg: ASbGncsmGqz+5oY1wohcNz4SMgBe4SJ8/6kA9Mzer+c8eNMydobUQvdFOOFQV7ENm1v
	Mv+5oQ/EyEHhGQ5diz83JwzOvgtvyNhFjV35loKyc9CEhbclc7t/pU0t/7/0jwR75TWAxakoxaq
	RYmNxtPcjitpaPIT+2+6+/FghlcsECeRuj85duPHiHQvgtK+kiVT3vnDBZrlYeKzCIof2tXZ3dg
	BlsfNVExrcr5tjiKqDaINkuiF/UBCzr2ws4V/06Kc1d3/LqIX/53w6NyM1kJpYNzUxUoH4OrcD7
	bIo+/TLNecnAn/fKEndvQ+z4onCO6MwjT27ElBIkawUmu1OV
X-Google-Smtp-Source: AGHT+IE3s5ZRgh2/cNnXiiIskwBgXve0DNxOyvx+entIyf03iKCWdHqSj4ej5uTXu3XYeldNinCB3A==
X-Received: by 2002:a05:600c:3107:b0:434:a29d:6c71 with SMTP id 5b1f17b1804b1-4390d56e5b4mr25877685e9.27.1738768918823;
        Wed, 05 Feb 2025 07:21:58 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db65884easm1774194f8f.23.2025.02.05.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 07:21:58 -0800 (PST)
Message-ID: <2cf08e42-f322-4d29-9867-85d1723480c4@gmail.com>
Date: Wed, 5 Feb 2025 16:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v6 1/3] rpm-sequoia: New recipe for version 1.7.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250205043637.2649428-1-zboszor@gmail.com>
 <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210860

2025. 02. 05. 11:56 keltezéssel, Alexander Kanavin írta:
> On Wed, 5 Feb 2025 at 05:36, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> Also ship a crypto policy file which is used to validate
>> signing keys.
>>   .../rpm-sequoia/rpm-sequoia.config            |  51 ++
>> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia/rpm-sequoia.config
>> @@ -0,0 +1,51 @@
>> +[hash_algorithms]
>> +md5.collision_resistance = "never"
>> +md5.second_preimage_resistance = "never"
>> +sha1.collision_resistance = "always"
>> +sha1.second_preimage_resistance = "always"
>> +ripemd160.collision_resistance = "never"
>> +ripemd160.second_preimage_resistance = "never"
>> +sha224.collision_resistance = "always"
>> +sha224.second_preimage_resistance = "always"
>> +sha256.collision_resistance = "always"
>> +sha256.second_preimage_resistance = "always"
>> +sha384.collision_resistance = "always"
>> +sha384.second_preimage_resistance = "always"
>> +sha512.collision_resistance = "always"
>> +sha512.second_preimage_resistance = "always"
>> +default_disposition = "never"
>> +
>> +[symmetric_algorithms]
>> +idea = "never"
>> +tripledes = "never"
>> +cast5 = "never"
>> +blowfish = "never"
>> +aes128 = "always"
>> +aes192 = "never"
>> +aes256 = "always"
>> +twofish = "never"
>> +camellia128 = "always"
>> +camellia192 = "never"
>> +camellia256 = "always"
>> +default_disposition = "never"
>> +
>> +[asymmetric_algorithms]
>> +rsa1024 = "never"
>> +rsa2048 = "always"
>> +rsa3072 = "always"
>> +rsa4096 = "always"
>> +dsa1024 = "always"
>> +dsa2048 = "always"
>> +dsa3072 = "always"
>> +dsa4096 = "always"
>> +nistp256 = "always"
>> +nistp384 = "always"
>> +nistp521 = "always"
>> +cv25519 = "always"
>> +elgamal1024 = "never"
>> +elgamal2048 = "never"
>> +elgamal3072 = "never"
>> +elgamal4096 = "never"
>> +brainpoolp256 = "never"
>> +brainpoolp512 = "never"
>> +default_disposition = "never"
> You need to very clearly explain how this was created (or where it was
> copied from), and how it should be kept up to date. Either in the file
> itself, or in the recipe that includes it. Otherwise it's a 'magic
> file' that no one knows how to maintain. Hardcoded lists of crypto
> algorithms are notoriously prone to becoming outdated, insecure, or
> both.

Okay, how about using a git:// SRC_URI entry for fedora-crypto-policies?
That should be self explanatory and no "magic file".

However, I had to do this abomination of a workaround to
exclude the directory from being manhandled by "cargo build":

# This is a workaround for the lack of excluding directories
# in cargo_common.bbclass: a git:// or gitsm:// SRC_URI is
# added to cargo_home/config as a [patch."..."] if both
# name= and destsuffix= are set, but the second git:// repo
# is not Rust based.
#
# The main source has name=sequoia set, but no destsuffix=.
#
# The crypto policy file for rpm-sequoia is generated from
# fedora-crypto-policies, for which the SRC_URI entry
# has destsuffix= set but name= isn't.

SRCREV_FORMAT = "sequoia"
SRC_URI = " \
git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main;name=sequoia 
\
git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master;destsuffix=fedora-crypto-policies 
\
"

SRCREV_sequoia = "0667e04ae7fb8cf0490919978d69883d16400e41"

# SRCREV for fedora-crypto-policies
SRCREV = "4d262e79be1cd15c84cad55ad88c53a2d7712e85"



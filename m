Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C90BC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:20:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9000.1738142418372613488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kuG/mMK4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f796586so72781215e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142417; x=1738747217; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMNtbtTgZsxIj/dCTFTnPcLcFezC9Ih9ZGcv0oThHVg=;
        b=kuG/mMK4RvPJPpAkDAI2ByOzcLqTkdytPJqJEiuWqdSbiIyXKn8xz3yqNmMf+kvX7F
         MQSRmvLPqXCVd7Czi3DZNQznRgj0hRVQoZFb3uNXkvrOybkA4wBoNtuHpcDY2sBkF2Kc
         8bznttoqqYg+Kxycb9czH3R8FDQ4VGasBDyCybUUC91zxS4Zbn79zrzcBe+VT/2aFDNz
         +OSVcKHSOovz7e/twKp+puCE16v2YXFXM5mb7ToVzpX911DflXfhyEEctML5nii8uqpu
         O/g4y25YApq9EchrJKtQgZRVWy3jHOsCY82XpZ1HpouPJcmviCQE0PpHLEOimmh8DRui
         twFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142417; x=1738747217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMNtbtTgZsxIj/dCTFTnPcLcFezC9Ih9ZGcv0oThHVg=;
        b=NR+0+zmQAWCAJs4NceYT5cNBRY++NbUuXYlplu2t3b2Z1dKrHxtcr3EAdiv6F3Gpgk
         5dY25FPITiyUX9cNnqEFiNRlMSyp7iwWx40EmHe37X8PU1837k6R61YRken4GLowfTz7
         WSVsIBpzDQToF6a2fxSt1CMU71DjY3sbnS2qSomHwVX6XNi7HQYOT8p8n+AU1QicRx0y
         wol46/o5y6BWeTv6V9wLAY5EQV6BFPXHMdONNsKBBxCg72cgk994EWKeoyJX2BJdwZD7
         A7zCtqUMUt+EX1dfzayvDG7OUOrcoW2cmMrwRz8++XdU0ul082zLM22Ao0Uq4P2jJk5J
         uLXA==
X-Gm-Message-State: AOJu0YyYGXq3Yw973je56xQqMV63W9iPg2KjrvOeA2gFiDUYwd+5Edoq
	vvGlNTzFQXxbbEQHroh0u2LcmSc+mCf5h5jUXyq9WUnfjsGdrcuXCiOSwg==
X-Gm-Gg: ASbGnctbyphcgjKMxCI8+Z+nxTFppGfVIyqLhdNFHniQSXYsik7M/rJAXFfWyyUn4AM
	spkGJ1H9Wgyq4DGLPQzvCYmV/YnzJTJKT+6oOa5bZUGZ+iaI7YFPJeUqT4eqYpbu7P4Qb/LULqm
	uM9ecbZUc9nqtRLpCSwjmieF1SBYdWUOCsp8ExEDoGgEppUJlUDnNDR3PomE4TVsw8OS8wYFGfR
	8nCWFoNs3DyF54b8N6MSLXiaQ2gTwh+DTdXOT5c6zxFhDg+cpwzEKfGo4ntzZ9c1Bd5pMynmFe8
	bjsaRFPRR9Pd4ne9sfd/hDRTA83JNLqu+Fd+tWuCZ8rY+TFCCtNDK5Q0N4I=
X-Google-Smtp-Source: AGHT+IFKBzS2hTRVQ2XGKo7PV4pFlb35igazRCIsSRtQG92tZkwkZR139cvHVdQnjxaHX2sBnv9mDg==
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr24304775e9.11.1738142416374;
        Wed, 29 Jan 2025 01:20:16 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6besm16451836f8f.27.2025.01.29.01.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:20:15 -0800 (PST)
Message-ID: <1b6439a8-3688-4d45-90ab-0eef473eb347@gmail.com>
Date: Wed, 29 Jan 2025 10:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
 <20250129080902.1863054-2-zboszor@gmail.com>
 <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210357

2025. 01. 29. 10:05 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 09:09, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> +Subject: [PATCH 1/2] Make openssl the default signing crypto
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Idea taken from the Fedora 41 rpm specfile, extended to build.rs
>> +to make it actually build. Give credit where credit is due: the
>> +Cargo.toml part of this patch is identical to the Fedora version.
>> +
>> +Signed-off-by: Fabio Valentini <decathorpe@gmail.com>
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Upstream-Status: Inappropriate [Yocto specific]
>> +---
>> + Cargo.toml | 5 +----
>> + build.rs   | 8 +-------
>> + 2 files changed, 2 insertions(+), 11 deletions(-)
>> +
>> +diff --git a/Cargo.toml b/Cargo.toml
>> +index 7832878..1024cad 100644
>> +--- a/Cargo.toml
>> ++++ b/Cargo.toml
>> +@@ -43,11 +43,8 @@ crate-type = ["cdylib"]
>> +
>> + # We explicitly do not want to enable Sequoia's decompression support.
>> + # Hence we only select a crypto backend.
>> +-default = ["crypto-nettle"]
>> ++default = ["crypto-openssl"]
>> + crypto-nettle = ["sequoia-openpgp/crypto-nettle"]
>> + crypto-rust = ["sequoia-openpgp/crypto-rust"]
>> +-crypto-cng = ["sequoia-openpgp/crypto-cng"]
>> + crypto-openssl = ["sequoia-openpgp/crypto-openssl"]
>> +-crypto-botan = ["sequoia-openpgp/crypto-botan"]
>> +-crypto-botan2 = ["sequoia-openpgp/crypto-botan2"]
>> +
>> +diff --git a/build.rs b/build.rs
>> +index 1fdef4e..cdbbe88 100644
>> +--- a/build.rs
>> ++++ b/build.rs
>> +@@ -30,16 +30,10 @@ impl PkgConfigTemplate {
>> +             ("VERSION".to_string(), env!("CARGO_PKG_VERSION").to_string()),
>> +             ("HOMEPAGE".to_string(), env!("CARGO_PKG_HOMEPAGE").to_string()),
>> +             ("REQUIRES".to_string(),
>> +-             if cfg!(feature = "crypto-botan") {
>> +-                 "botan-3"
>> +-             } else if cfg!(feature = "crypto-botan2") {
>> +-                 "botan-2"
>> +-             } else if cfg!(feature = "crypto-nettle") {
>> ++             if cfg!(feature = "crypto-nettle") {
>> +                  "nettle"
>> +              } else if cfg!(feature = "crypto-openssl") {
>> +                  "libssl"
>> +-             } else if cfg!(feature = "crypto-cng") {
>> +-                 ""
>> +              } else if cfg!(feature = "crypto-rust") {
>> +                  ""
>> +              } else {
> I don't understand. It seems like this changes the default crypto
> choice, but why not simply pass openssl selection as a parameter from
> the recipe?
>
>> + Cargo.lock | 1049 +++++++++++++++++++++++++++++++---------------------
> If this is updated correctly, then the change to cargo class in
> another patch should not be necessary.
>
> Also, this file is going to be a royal pain to keep updated with
> sequoia version updates. Another reason not to patch rust sources when
> it can be avoided.

Agreed, I will try another round.

>> +++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.6.0.bb
>> @@ -0,0 +1,40 @@
>> +SUMMARY = "An OpenPGP backend for rpm using Sequoia PGP"
>> +HOMEPAGE = "https://sequoia-pgp.org/"
>> +LICENSE = "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | MIT)"
> This is very elaborate, how was it determined? How to ensure it remains correct?

It was taken from the Fedora specfile license line verbatim.
IIRC, they (Red Hat) have a large contingent of lawyers

>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
>> +
>> +DEPENDS = "openssl"
>> +
>> +inherit pkgconfig rust cargo cargo-update-recipe-crates
>> +
>> +CARGO_USE_OFFLINE_FLAG = "1"
> As explained above, this should not be needed if Cargo.lock is correct.

I'll try another round with less patching.

>
>> +export CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG = "true"
> Why? Things like this need a comment in the recipe.

Accidentally left in because of previous build errors.

>
>> +do_compile:prepend () {
>> +       mkdir -p ${S}/target/release
>> +}
> Why?

I answered it in the previous mail, but pressed "send" too early.

>> +do_install () {
>> +       mkdir -p ${D}${libdir}
>> +       install -m0755 ${B}/target/${RUST_TARGET_SYS}/release/librpm_sequoia.so ${D}${libdir}/librpm_sequoia.so.1
>> +       ln -s librpm_sequoia.so.1 ${D}${libdir}/librpm_sequoia.so
>> +
>> +       mkdir -p ${D}${libdir}/pkgconfig
>> +       install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
>> +}
> Why can't we use upstream's standard install procedure? Also,
> cargo.bbclass has an install function, why is it completely replaced?

Because it fails with:

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| ERROR: Did not find anything to install




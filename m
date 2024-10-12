Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F641CF256B
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.12629.1728745383980396310
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 08:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g6JRuP0S;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so32931105e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728745382; x=1729350182; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jM2kceNp5qwDYVF0VSkjJR0uUJuwQSrJwSPuP6rLGzw=;
        b=g6JRuP0S4efjfWi+/YcYWlvXvVje3tra18/s9elo47gpDHRkX5nzN6f63u8WDAhF0R
         REhmtORtaOVGvesXgv7JP1qhARgouir+QZWN0gjPd3Arnjz5rxgWX2CdN8mBlxG49a3m
         P/rSTh30oLZJBI0NNIQjWx3y8FJXrOAuz7X7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745382; x=1729350182;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM2kceNp5qwDYVF0VSkjJR0uUJuwQSrJwSPuP6rLGzw=;
        b=RcZ+GwgQ3Zn9BZa/d4g6J8PDvEPK15FD+b0Boy0uQYl0q0FDu7u9pCDiF/dBGpaUDN
         r7/juGVJfivpzaPNyjW6mFdS24NjF9htzX1ZMyHT9Y0VaE+ZoGTCJHCmADHhBOs4iQzk
         PVQZFBYp+3vUHn9/B64/erLceHrom2tQb0QVtCzQLqKXKY98jdjwNaD9d/G/6J+NI/Eo
         QB7QNk3NpXPgj+zNWsfhi98Cft7mt2gdLJmruRtc/0wIJRzmQehnyn+MW5YytQAMkP3F
         Mx42te6Km7om3g0kcYQPMlnmQ/kIwIiSc2tIqnel7JZU0HjnWOH1TN8h/699s6FQW1Zs
         jUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD72EmABcRWzCLGk4WjtqovtYyPjTM1SEzeAeug5oJqdN80LduRKxn4dC3TrweBNvA2PPdN9Hbp7ecNjW+peB/mQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvkEQ9BfTQ9YXM/+mSTdPActD/IgOdVptqZRsZ2cfvmd1XajdS
	xjNUZTbS+35v9iZvDa+yAp/AyvzbCLVPdkdVCqj6orMvFjAdZvPIa4cCNMKroUk=
X-Google-Smtp-Source: AGHT+IGaZsgpuUssoCWMUdmr6V3NbsnDaP8SV3P/3VYiQoBB8kIFDzbG9U/pEdR/g+egyhSpUdR8Iw==
X-Received: by 2002:a05:600c:a16:b0:430:57c9:f885 with SMTP id 5b1f17b1804b1-43125616451mr29175595e9.31.1728745374327;
        Sat, 12 Oct 2024 08:02:54 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b91823esm6515636f8f.117.2024.10.12.08.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:02:53 -0700 (PDT)
Message-ID: <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr>
Date: Sat, 12 Oct 2024 17:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: ticotimo@gmail.com, alex.kanavin@gmail.com
Cc: Tom Geelen <t.f.g.geelen@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 15:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205707



Le 11/10/2024 à 19:28, Tim Orling via lists.openembedded.org a écrit :
> The ptests are not passing on core-image-ptest-python3-cryptography
> (which only has the recipe dependencies and not full python3 and all the
> modules).
> 
> https://snips.sh/f/9C7acm_o35 <https://snips.sh/f/9C7acm_o35>
> ModuleNotFoundError: No module named '__pypy__'
> ModuleNotFoundError: No module named 'timeit'
> 
> I tested this by:
> bitbake core-image-ptest-python3-cryptography
> runqemu nographic kvm
> pytest-runner 2>&1 | tee ptest-runner.log
> 
> The __pypy__ test case should arguably be disabled.
> 'timeit' it provided by python3, but is currently not split out into a
> sub-package (so it would be in the ugly catchall python3-misc).
> 
> Reproducible builds are
> documented: https://docs.yoctoproject.org/test-manual/reproducible-builds.html#reproducible-builds <https://docs.yoctoproject.org/test-manual/reproducible-builds.html#reproducible-builds>
> 
> OEQA_REPRODUCIBLE_TEST_TARGET = "python3-cryptography"
> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS = "python3-cryptography"
> oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds

Beware, this config will not build but grab python3-cryptography from
sstate *twice*. OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS is the list of
targets that the reproducibility test is allowed to grab from sstate.

To quickly test the reproducibility of a singular package, I put only
its dependencies in OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS. In this case,
I would use:

OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS = "pkgconfig-native \
virtual/x86_64-poky-linux-gcc virtual/x86_64-poky-linux-compilerlibs \
virtual/libc cargo-native  python3-setuptools-native \
python3-wheel-native python3-setuptools-rust-native      \
python3-cffi-native  python3-native  rust-native libstd-rs \
python3-native python3 python3 python3-build-native \
python3-installer-native"

(list taken from "bitbake-getvar -r python3-cryptography DEPENDS")
  
> The good news is that command passed.
> 
> On Fri, Oct 11, 2024 at 1:24 AM Alexander Kanavin via
> lists.openembedded.org <http://lists.openembedded.org>
> <alex.kanavin=gmail.com@lists.openembedded.org
> <mailto:gmail.com@lists.openembedded.org>> wrote:
> 
>     You need to build the recipe twice in two different build directories
>     (you can reuse the sstate for everything else except the recipe
>     itself), and compare the output.
> 
>     And no, it wasn't caused by other 3.13 issues, in fact it was made
>     clear that 3.13 was not relevant (I first thought it was fixing the
>     issues, then retracted that).
> 
>     Alex
> 
>     On Fri, 11 Oct 2024 at 09:03, Tom Geelen <t.f.g.geelen@gmail.com
>     <mailto:t.f.g.geelen@gmail.com>> wrote:
>     >
>     > I have checked the report of the issues that were encountered on the
>     > previous upgrade try and if I understand correctly those were likely
>     > caused by other Python 3.13 issues.
>     > So to address your question, do I wait for the autobuilder output for
>     > an answer or is there a way on how I can test the issues locally.
>     >
>     > Regards,
>     > Tom
>     >
>     >
>     > On Fri, Oct 11, 2024 at 7:17 AM Alexander Kanavin
>     > <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>     > >
>     > > Does this address the reproducibility issues Tim mentioned?
>     > >
>     > > Alex
>     > >
>     > > On Thu 10. Oct 2024 at 23.51, Tom Geelen via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <t.f.g.geelen=gmail.com@lists.openembedded.org
>     <mailto:gmail.com@lists.openembedded.org>> wrote:
>     > >>
>     > >> python3-cryptography-vectors: upgrade 42.0.8 -> 43.0.1
>     > >>
>     > >> Changelog:
>     > >> - https://cryptography.io/en/latest/changelog/#v43-0-0
>     <https://cryptography.io/en/latest/changelog/#v43-0-0>
>     > >> - https://cryptography.io/en/latest/changelog/#v43-0-1
>     <https://cryptography.io/en/latest/changelog/#v43-0-1>
>     > >>
>     > >> Change build tool to use python3-maturin-native as specified in
>     pyproject.toml file.
>     > >> Performed linting on the recipe and removed packages from the
>     ptest which are not required according to the included pyproject.toml.
>     > >>
>     > >> Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com
>     <mailto:t.f.g.geelen@gmail.com>>
>     > >>
>     > >> ---
>     > >> Tested on x86 architecture, all tests pass
>     > >>
>     > >>  .../python/python3-cryptography-crates.inc    | 130
>     +++++++-----------
>     > >>  ...=> python3-cryptography-vectors_43.0.1.bb
>     <http://python3-cryptography-vectors_43.0.1.bb>} |   8 +-
>     > >>  ...toml-remove-benchmark-disable-option.patch |   8 +-
>     > >>  ....0.8.bb <http://0.8.bb> => python3-cryptography_43.0.1.bb
>     <http://python3-cryptography_43.0.1.bb>} |  63 +++++----
>     > >>  4 files changed, 89 insertions(+), 120 deletions(-)
>     > >>  rename
>     meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.8.bb
>     <http://python3-cryptography-vectors_42.0.8.bb> =>
>     python3-cryptography-vectors_43.0.1.bb
>     <http://python3-cryptography-vectors_43.0.1.bb>} (75%)
>     > >>  rename
>     meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb
>     <http://python3-cryptography_42.0.8.bb> =>
>     python3-cryptography_43.0.1.bb
>     <http://python3-cryptography_43.0.1.bb>} (72%)
>     > >>
>     > >> diff --git
>     a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>     b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>     > >> index dbeda05dc4..319a47dabd 100644
>     > >> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
>     > >> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
>     > >> @@ -2,101 +2,71 @@
>     > >>
>     > >>  # from src/rust/Cargo.lock
>     > >>  SRC_URI += " \
>     > >> -    crate://crates.io/asn1/0.15.5 <http://crates.io/asn1/0.15.5> \
>     > >> -    crate://crates.io/asn1_derive/0.15.5
>     <http://crates.io/asn1_derive/0.15.5> \
>     > >> -    crate://crates.io/autocfg/1.1.0
>     <http://crates.io/autocfg/1.1.0> \
>     > >> -    crate://crates.io/base64/0.21.7
>     <http://crates.io/base64/0.21.7> \
>     > >> -    crate://crates.io/bitflags/1.3.2
>     <http://crates.io/bitflags/1.3.2> \
>     > >> -    crate://crates.io/bitflags/2.4.2
>     <http://crates.io/bitflags/2.4.2> \
>     > >> -    crate://crates.io/cc/1.0.83 <http://crates.io/cc/1.0.83> \
>     > >> +    crate://crates.io/asn1/0.16.2 <http://crates.io/asn1/0.16.2> \
>     > >> +    crate://crates.io/asn1_derive/0.16.2
>     <http://crates.io/asn1_derive/0.16.2> \
>     > >> +    crate://crates.io/autocfg/1.3.0
>     <http://crates.io/autocfg/1.3.0> \
>     > >> +    crate://crates.io/base64/0.22.1
>     <http://crates.io/base64/0.22.1> \
>     > >> +    crate://crates.io/bitflags/2.6.0
>     <http://crates.io/bitflags/2.6.0> \
>     > >> +    crate://crates.io/cc/1.1.6 <http://crates.io/cc/1.1.6> \
>     > >>      crate://crates.io/cfg-if/1.0.0
>     <http://crates.io/cfg-if/1.0.0> \
>     > >>      crate://crates.io/foreign-types/0.3.2
>     <http://crates.io/foreign-types/0.3.2> \
>     > >>      crate://crates.io/foreign-types-shared/0.1.1
>     <http://crates.io/foreign-types-shared/0.1.1> \
>     > >> -    crate://crates.io/heck/0.4.1 <http://crates.io/heck/0.4.1> \
>     > >> -    crate://crates.io/indoc/2.0.4 <http://crates.io/indoc/2.0.4> \
>     > >> -    crate://crates.io/libc/0.2.152
>     <http://crates.io/libc/0.2.152> \
>     > >> -    crate://crates.io/lock_api/0.4.11
>     <http://crates.io/lock_api/0.4.11> \
>     > >> -    crate://crates.io/memoffset/0.9.0
>     <http://crates.io/memoffset/0.9.0> \
>     > >> +    crate://crates.io/heck/0.5.0 <http://crates.io/heck/0.5.0> \
>     > >> +    crate://crates.io/indoc/2.0.5 <http://crates.io/indoc/2.0.5> \
>     > >> +    crate://crates.io/libc/0.2.155
>     <http://crates.io/libc/0.2.155> \
>     > >> +    crate://crates.io/memoffset/0.9.1
>     <http://crates.io/memoffset/0.9.1> \
>     > >>      crate://crates.io/once_cell/1.19.0
>     <http://crates.io/once_cell/1.19.0> \
>     > >> -    crate://crates.io/openssl/0.10.64
>     <http://crates.io/openssl/0.10.64> \
>     > >> +    crate://crates.io/openssl/0.10.66
>     <http://crates.io/openssl/0.10.66> \
>     > >>      crate://crates.io/openssl-macros/0.1.1
>     <http://crates.io/openssl-macros/0.1.1> \
>     > >> -    crate://crates.io/openssl-sys/0.9.102
>     <http://crates.io/openssl-sys/0.9.102> \
>     > >> -    crate://crates.io/parking_lot/0.12.1
>     <http://crates.io/parking_lot/0.12.1> \
>     > >> -    crate://crates.io/parking_lot_core/0.9.9
>     <http://crates.io/parking_lot_core/0.9.9> \
>     > >> -    crate://crates.io/pem/3.0.3 <http://crates.io/pem/3.0.3> \
>     > >> -    crate://crates.io/pkg-config/0.3.29
>     <http://crates.io/pkg-config/0.3.29> \
>     > >> -    crate://crates.io/portable-atomic/1.6.0
>     <http://crates.io/portable-atomic/1.6.0> \
>     > >> -    crate://crates.io/proc-macro2/1.0.78
>     <http://crates.io/proc-macro2/1.0.78> \
>     > >> -    crate://crates.io/pyo3/0.20.3 <http://crates.io/pyo3/0.20.3> \
>     > >> -    crate://crates.io/pyo3-build-config/0.20.3
>     <http://crates.io/pyo3-build-config/0.20.3> \
>     > >> -    crate://crates.io/pyo3-ffi/0.20.3
>     <http://crates.io/pyo3-ffi/0.20.3> \
>     > >> -    crate://crates.io/pyo3-macros/0.20.3
>     <http://crates.io/pyo3-macros/0.20.3> \
>     > >> -    crate://crates.io/pyo3-macros-backend/0.20.3
>     <http://crates.io/pyo3-macros-backend/0.20.3> \
>     > >> -    crate://crates.io/quote/1.0.35
>     <http://crates.io/quote/1.0.35> \
>     > >> -    crate://crates.io/redox_syscall/0.4.1
>     <http://crates.io/redox_syscall/0.4.1> \
>     > >> -    crate://crates.io/scopeguard/1.2.0
>     <http://crates.io/scopeguard/1.2.0> \
>     > >> -    crate://crates.io/self_cell/1.0.3
>     <http://crates.io/self_cell/1.0.3> \
>     > >> -    crate://crates.io/smallvec/1.13.1
>     <http://crates.io/smallvec/1.13.1> \
>     > >> -    crate://crates.io/syn/2.0.48 <http://crates.io/syn/2.0.48> \
>     > >> -    crate://crates.io/target-lexicon/0.12.13
>     <http://crates.io/target-lexicon/0.12.13> \
>     > >> +    crate://crates.io/openssl-sys/0.9.103
>     <http://crates.io/openssl-sys/0.9.103> \
>     > >> +    crate://crates.io/pem/3.0.4 <http://crates.io/pem/3.0.4> \
>     > >> +    crate://crates.io/pkg-config/0.3.30
>     <http://crates.io/pkg-config/0.3.30> \
>     > >> +    crate://crates.io/portable-atomic/1.7.0
>     <http://crates.io/portable-atomic/1.7.0> \
>     > >> +    crate://crates.io/proc-macro2/1.0.86
>     <http://crates.io/proc-macro2/1.0.86> \
>     > >> +    crate://crates.io/pyo3/0.22.2 <http://crates.io/pyo3/0.22.2> \
>     > >> +    crate://crates.io/pyo3-build-config/0.22.2
>     <http://crates.io/pyo3-build-config/0.22.2> \
>     > >> +    crate://crates.io/pyo3-ffi/0.22.2
>     <http://crates.io/pyo3-ffi/0.22.2> \
>     > >> +    crate://crates.io/pyo3-macros/0.22.2
>     <http://crates.io/pyo3-macros/0.22.2> \
>     > >> +    crate://crates.io/pyo3-macros-backend/0.22.2
>     <http://crates.io/pyo3-macros-backend/0.22.2> \
>     > >> +    crate://crates.io/quote/1.0.36
>     <http://crates.io/quote/1.0.36> \
>     > >> +    crate://crates.io/self_cell/1.0.4
>     <http://crates.io/self_cell/1.0.4> \
>     > >> +    crate://crates.io/syn/2.0.71 <http://crates.io/syn/2.0.71> \
>     > >> +    crate://crates.io/target-lexicon/0.12.15
>     <http://crates.io/target-lexicon/0.12.15> \
>     > >>      crate://crates.io/unicode-ident/1.0.12
>     <http://crates.io/unicode-ident/1.0.12> \
>     > >>      crate://crates.io/unindent/0.2.3
>     <http://crates.io/unindent/0.2.3> \
>     > >>      crate://crates.io/vcpkg/0.2.15
>     <http://crates.io/vcpkg/0.2.15> \
>     > >> -    crate://crates.io/windows-targets/0.48.5
>     <http://crates.io/windows-targets/0.48.5> \
>     > >> -    crate://crates.io/windows_aarch64_gnullvm/0.48.5
>     <http://crates.io/windows_aarch64_gnullvm/0.48.5> \
>     > >> -    crate://crates.io/windows_aarch64_msvc/0.48.5
>     <http://crates.io/windows_aarch64_msvc/0.48.5> \
>     > >> -    crate://crates.io/windows_i686_gnu/0.48.5
>     <http://crates.io/windows_i686_gnu/0.48.5> \
>     > >> -    crate://crates.io/windows_i686_msvc/0.48.5
>     <http://crates.io/windows_i686_msvc/0.48.5> \
>     > >> -    crate://crates.io/windows_x86_64_gnu/0.48.5
>     <http://crates.io/windows_x86_64_gnu/0.48.5> \
>     > >> -    crate://crates.io/windows_x86_64_gnullvm/0.48.5
>     <http://crates.io/windows_x86_64_gnullvm/0.48.5> \
>     > >> -    crate://crates.io/windows_x86_64_msvc/0.48.5
>     <http://crates.io/windows_x86_64_msvc/0.48.5> \
>     > >>  "
>     > >>
>     > >> -SRC_URI[asn1-0.15.5.sha256sum] =
>     "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
>     > >> -SRC_URI[asn1_derive-0.15.5.sha256sum] =
>     "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
>     > >> -SRC_URI[autocfg-1.1.0.sha256sum] =
>     "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
>     > >> -SRC_URI[base64-0.21.7.sha256sum] =
>     "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
>     > >> -SRC_URI[bitflags-1.3.2.sha256sum] =
>     "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
>     > >> -SRC_URI[bitflags-2.4.2.sha256sum] =
>     "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
>     > >> -SRC_URI[cc-1.0.83.sha256sum] =
>     "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
>     > >> +SRC_URI[asn1-0.16.2.sha256sum] =
>     "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
>     > >> +SRC_URI[asn1_derive-0.16.2.sha256sum] =
>     "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
>     > >> +SRC_URI[autocfg-1.3.0.sha256sum] =
>     "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
>     > >> +SRC_URI[base64-0.22.1.sha256sum] =
>     "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
>     > >> +SRC_URI[bitflags-2.6.0.sha256sum] =
>     "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
>     > >> +SRC_URI[cc-1.1.6.sha256sum] =
>     "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
>     > >>  SRC_URI[cfg-if-1.0.0.sha256sum] =
>     "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>     > >>  SRC_URI[foreign-types-0.3.2.sha256sum] =
>     "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
>     > >>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =
>     "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
>     > >> -SRC_URI[heck-0.4.1.sha256sum] =
>     "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
>     > >> -SRC_URI[indoc-2.0.4.sha256sum] =
>     "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
>     > >> -SRC_URI[libc-0.2.152.sha256sum] =
>     "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
>     > >> -SRC_URI[lock_api-0.4.11.sha256sum] =
>     "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
>     > >> -SRC_URI[memoffset-0.9.0.sha256sum] =
>     "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
>     > >> +SRC_URI[heck-0.5.0.sha256sum] =
>     "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
>     > >> +SRC_URI[indoc-2.0.5.sha256sum] =
>     "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
>     > >> +SRC_URI[libc-0.2.155.sha256sum] =
>     "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
>     > >> +SRC_URI[memoffset-0.9.1.sha256sum] =
>     "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
>     > >>  SRC_URI[once_cell-1.19.0.sha256sum] =
>     "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
>     > >> -SRC_URI[openssl-0.10.64.sha256sum] =
>     "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
>     > >> +SRC_URI[openssl-0.10.66.sha256sum] =
>     "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
>     > >>  SRC_URI[openssl-macros-0.1.1.sha256sum] =
>     "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
>     > >> -SRC_URI[openssl-sys-0.9.102.sha256sum] =
>     "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
>     > >> -SRC_URI[parking_lot-0.12.1.sha256sum] =
>     "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
>     > >> -SRC_URI[parking_lot_core-0.9.9.sha256sum] =
>     "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
>     > >> -SRC_URI[pem-3.0.3.sha256sum] =
>     "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
>     > >> -SRC_URI[pkg-config-0.3.29.sha256sum] =
>     "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
>     > >> -SRC_URI[portable-atomic-1.6.0.sha256sum] =
>     "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>     > >> -SRC_URI[proc-macro2-1.0.78.sha256sum] =
>     "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
>     > >> -SRC_URI[pyo3-0.20.3.sha256sum] =
>     "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
>     > >> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =
>     "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
>     > >> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =
>     "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
>     > >> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =
>     "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
>     > >> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =
>     "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>     > >> -SRC_URI[quote-1.0.35.sha256sum] =
>     "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>     > >> -SRC_URI[redox_syscall-0.4.1.sha256sum] =
>     "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
>     > >> -SRC_URI[scopeguard-1.2.0.sha256sum] =
>     "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
>     > >> -SRC_URI[self_cell-1.0.3.sha256sum] =
>     "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
>     > >> -SRC_URI[smallvec-1.13.1.sha256sum] =
>     "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
>     > >> -SRC_URI[syn-2.0.48.sha256sum] =
>     "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
>     > >> -SRC_URI[target-lexicon-0.12.13.sha256sum] =
>     "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
>     > >> +SRC_URI[openssl-sys-0.9.103.sha256sum] =
>     "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
>     > >> +SRC_URI[pem-3.0.4.sha256sum] =
>     "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
>     > >> +SRC_URI[pkg-config-0.3.30.sha256sum] =
>     "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
>     > >> +SRC_URI[portable-atomic-1.7.0.sha256sum] =
>     "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
>     > >> +SRC_URI[proc-macro2-1.0.86.sha256sum] =
>     "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
>     > >> +SRC_URI[pyo3-0.22.2.sha256sum] =
>     "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
>     > >> +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =
>     "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
>     > >> +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =
>     "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
>     > >> +SRC_URI[pyo3-macros-0.22.2.sha256sum] =
>     "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
>     > >> +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =
>     "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
>     > >> +SRC_URI[quote-1.0.36.sha256sum] =
>     "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
>     > >> +SRC_URI[self_cell-1.0.4.sha256sum] =
>     "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
>     > >> +SRC_URI[syn-2.0.71.sha256sum] =
>     "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
>     > >> +SRC_URI[target-lexicon-0.12.15.sha256sum] =
>     "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
>     > >>  SRC_URI[unicode-ident-1.0.12.sha256sum] =
>     "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
>     > >>  SRC_URI[unindent-0.2.3.sha256sum] =
>     "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
>     > >>  SRC_URI[vcpkg-0.2.15.sha256sum] =
>     "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
>     > >> -SRC_URI[windows-targets-0.48.5.sha256sum] =
>     "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
>     > >> -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =
>     "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
>     > >> -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =
>     "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
>     > >> -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =
>     "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
>     > >> -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =
>     "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
>     > >> -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =
>     "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
>     > >> -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =
>     "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
>     > >> -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =
>     "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
>     > >> diff --git
>     a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb <http://python3-cryptography-vectors_42.0.8.bb> b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb <http://python3-cryptography-vectors_43.0.1.bb>
>     > >> similarity index 75%
>     > >> rename from
>     meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb
>     <http://python3-cryptography-vectors_42.0.8.bb>
>     > >> rename to
>     meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
>     <http://python3-cryptography-vectors_43.0.1.bb>
>     > >> index 1256e75c47..7b8216b05e 100644
>     > >> ---
>     a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb <http://python3-cryptography-vectors_42.0.8.bb>
>     > >> +++
>     b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb <http://python3-cryptography-vectors_43.0.1.bb>
>     > >> @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>     > >>  # NOTE: Make sure to keep this recipe at the same version as
>     python3-cryptography
>     > >>  #       Upgrade both recipes at the same time
>     > >>
>     > >> -SRC_URI[sha256sum] =
>     "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
>     > >> +SRC_URI[sha256sum] =
>     "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
>     > >>
>     > >>  PYPI_PACKAGE = "cryptography_vectors"
>     > >>
>     > >>  inherit pypi python_setuptools_build_meta
>     > >>
>     > >> -DEPENDS += " \
>     > >> +DEPENDS += "\
>     > >>      python3-cryptography \
>     > >>  "
>     > >>
>     > >>  do_install:append () {
>     > >> -       # Remove the sha256 checksum lines for pycache files
>     > >> -       sed
>     ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECORD -e '/__pycache__/d' -i
>     > >> +    # Remove the sha256 checksum lines for pycache files
>     > >> +    sed
>     ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECORD -e '/__pycache__/d' -i
>     > >>  }
>     > >>
>     > >>  BBCLASSEXTEND = "native nativesdk"
>     > >> diff --git
>     a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
>     > >> index 3eed171ffe..907e462653 100644
>     > >> ---
>     a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
>     > >> +++
>     b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
>     > >> @@ -1,4 +1,4 @@
>     > >> -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17
>     00:00:00 2001
>     > >> +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17
>     00:00:00 2001
>     > >>  From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     > >>  Date: Tue, 17 May 2022 17:22:48 +0800
>     > >>  Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
>     > >> @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling
>     <tim.orling@konsulko.com <mailto:tim.orling@konsulko.com>>
>     > >>   1 file changed, 1 insertion(+), 1 deletion(-)
>     > >>
>     > >>  diff --git a/pyproject.toml b/pyproject.toml
>     > >> -index d2e304f..10aabcf 100644
>     > >> +index e5b801d..985fc8c 100644
>     > >>  --- a/pyproject.toml
>     > >>  +++ b/pyproject.toml
>     > >> -@@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
>     > >> -
>     > >> +@@ -117,7 +117,7 @@ exclude = [
>     > >> + ]
>     > >>
>     > >>   [tool.pytest.ini_options]
>     > >>  -addopts = "-r s --capture=no --strict-markers
>     --benchmark-disable"
>     > >> diff --git
>     a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>     <http://python3-cryptography_42.0.8.bb>
>     b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>     <http://python3-cryptography_43.0.1.bb>
>     > >> similarity index 72%
>     > >> rename from
>     meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>     <http://python3-cryptography_42.0.8.bb>
>     > >> rename to
>     meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>     <http://python3-cryptography_43.0.1.bb>
>     > >> index 3f70f910d4..4a97f33736 100644
>     > >> ---
>     a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
>     <http://python3-cryptography_42.0.8.bb>
>     > >> +++
>     b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
>     <http://python3-cryptography_43.0.1.bb>
>     > >> @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>     > >>                     "
>     > >>  LDSHARED += "-pthread"
>     > >>
>     > >> -SRC_URI[sha256sum] =
>     "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
>     > >> -
>     > >> -SRC_URI +=
>     "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>     > >> -            file://check-memfree.py \
>     > >> -            file://run-ptest \
>     > >> -           "
>     > >> -
>     > >> -require ${BPN}-crates.inc
>     > >> -
>     > >> -inherit pypi python_setuptools3_rust
>     cargo-update-recipe-crates pkgconfig
>     > >> -
>     > >> -DEPENDS += " \
>     > >> +DEPENDS += "\
>     > >>      python3-cffi-native \
>     > >>  "
>     > >>
>     > >> -RDEPENDS:${PN} += " \
>     > >> -    python3-cffi \
>     > >> -"
>     > >> +SRC_URI[sha256sum] =
>     "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
>     > >>
>     > >> -RDEPENDS:${PN}:append:class-target = " \
>     > >> -    python3-numbers \
>     > >> -    python3-threading \
>     > >> +SRC_URI:append = " \
>     > >> +   
>     file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
>     > >> +    file://check-memfree.py \
>     > >> +    file://run-ptest \
>     > >>  "
>     > >>
>     > >> -RDEPENDS:${PN}-ptest += " \
>     > >> -    python3-bcrypt \
>     > >> -    python3-cryptography-vectors (= ${PV}) \
>     > >> -    python3-hypothesis \
>     > >> -    python3-iso8601 \
>     > >> -    python3-mmap \
>     > >> -    python3-pretend \
>     > >> -    python3-psutil \
>     > >> -    python3-pytest \
>     > >> -    python3-unittest-automake-output \
>     > >> -    python3-pytest-subtests \
>     > >> -    python3-pytz \
>     > >> -"
>     > >> +require ${BPN}-crates.inc
>     > >> +
>     > >> +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
>     > >>
>     > >>  inherit ptest
>     > >>
>     > >> @@ -60,8 +38,29 @@ do_install_ptest() {
>     > >>      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
>     > >>  }
>     > >>
>     > >> -FILES:${PN}-dbg += " \
>     > >> +FILES:${PN}-dbg += "\
>     > >>      ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
>     > >>  "
>     > >>
>     > >> +RDEPENDS:${PN} += "\
>     > >> +    python3-cffi \
>     > >> +"
>     > >> +
>     > >> +RDEPENDS:${PN}:append:class-target = " \
>     > >> +    python3-numbers \
>     > >> +    python3-threading \
>     > >> +"
>     > >> +
>     > >> +RDEPENDS:${PN}-ptest += "\
>     > >> +    python3-certifi \
>     > >> +    python3-cryptography-vectors (= ${PV}) \
>     > >> +    python3-pretend \
>     > >> +    python3-pytest \
>     > >> +    python3-pytest-benchmark \
>     > >> +    python3-pytest-cov \
>     > >> +    python3-pytest-subtests \
>     > >> +    python3-pytest-xdist \
>     > >> +    python3-unittest-automake-output \
>     > >> +"
>     > >> +
>     > >>  BBCLASSEXTEND = "native nativesdk"
>     > >> --
>     > >> 2.43.0
>     > >>
>     > >>
>     > >>
>     > >>
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205695): https://lists.openembedded.org/g/openembedded-core/message/205695
> Mute This Topic: https://lists.openembedded.org/mt/108938651/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert


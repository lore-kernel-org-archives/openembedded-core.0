Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC007ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 13:34:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.13225.1662298486375103469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WMHYBq+X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso4339776wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=oUq+11IAp31Ek3NkjOa3POby9Msj3RPzStPkswxPKPk=;
        b=WMHYBq+XInIvEzRKGoCqOS0X+XUKIMVupZSgOfB/4VBFPfQecMeVt4RVrcBq6TWpkE
         jlRIPiQnz3EiQ35fV/cR3doQZCNOUlMnaIs5aJSw+SAxwnDZfE+3QkiFNTEK/Ia9KhAG
         a+FryC8hreLV/Z+DvoxJrDrURe4C+OPi3uDoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=oUq+11IAp31Ek3NkjOa3POby9Msj3RPzStPkswxPKPk=;
        b=0p+RqrcXw66Kdlr+gHaH7mzxZFexg4U2CnZT72KHoQocGGJ5aO9mZWITIT1XIavxUt
         ATOYZD5AQL5cYN7q7onolEEIlnaWTuiQJ8113klvjjpgc2Yh+RvD2W430kGV6qmyIPnU
         kbpsYNHWw0n3+2d0l9+hkAcArMv1AwbA4X4Kk7hXHfJDMJVqF5miaaLTSmNiUkLPYblg
         AYNR0tVExEpECC8PgZFnecOnUWxuIzPPxIm12YC03/hv2W1FqOd6yvNKLZwfYBsBIQjv
         vhR96fcZIWMmR62kLqtJjHKzmRr6+xwCaoJ3Ed4dnbK0wkg/HqkLe4alYeJ91p8FRpCP
         DzPQ==
X-Gm-Message-State: ACgBeo3jJwFh3hq3O6SlFSZFfw4+uHdlFCJrvC0l0YxDRXo5NVWIECZJ
	0TBOx5bpbYZqOfo9rcZTEW/tYQ==
X-Google-Smtp-Source: 
 AA6agR5oDRZ/rVzwspKXOA3DLmZTBRO46+qJ4TJPIh50mOaWJh/PQv/32tU0eJUNy6Iulrb442OEZQ==
X-Received: by 2002:a05:600c:4e52:b0:3a6:d89:4d1b with SMTP id
 e18-20020a05600c4e5200b003a60d894d1bmr8509896wmq.150.1662298484433;
        Sun, 04 Sep 2022 06:34:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:df52:563:aee3:2030?
 ([2001:8b0:aba:5f3c:df52:563:aee3:2030])
        by smtp.gmail.com with ESMTPSA id
 n9-20020adffe09000000b00226f2ab6e2asm6214765wrr.68.2022.09.04.06.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 06:34:43 -0700 (PDT)
Message-ID: 
 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
Subject: Re: [PATCH v10] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Naveen <naveen.gowda@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, vinay.m.engg@gmail.com
Date: Sun, 04 Sep 2022 14:34:43 +0100
In-Reply-To: <20220904063331.82988-1-naveen.gowda@windriver.com>
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 13:34:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170286

On Sat, 2022-09-03 at 23:33 -0700, Naveen wrote:
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test.
> It tests many functionalities of Rust distribution like tools,
> documentation, libraries, packages, tools, Cargo, Crater etc.
> Please refer the following link for detailed description of Rust
> testing:-
> https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
>=20
> To support the rust tests in oe-core, the following functions were
> added:-
> setup_cargo_environment(): Build bootstrap and some early stage tools.
> do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> do_configure(): To generate config.toml
> do_compile(): To build "remote-test-server" for qemu target image.
>=20
> Approximate Number of Tests Run in the Rust Testsuite :- 18000
> Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> Normally majority of the testcases are present in major folder "test/"
> It contributes to more than 80% of the testcases present in Rust test
> framework. These tests pass as expected on any Rust versions without
> much fuss. The tests that fail are of less important and contribute to
> less than 2% of the total testcases. These minor tests are observed to
> work on some versions and fail on others. They have to be added, ignored
> or excluded for different versions as per the behavior.
> These tests have been ignored or excluded in the Rust selftest
> environment to generate success of completing the testsuite.
>=20
> These tests work in parallel mode even in the skipped test mode as
> expected. Although the patch to disable tests is large, it is very simple
> in that it only disables tests. When updating to a newer version of Rust,
> the patch can usually be ported in a day.


This is getting better. See comments inline below. Running it locally I
got:

   Compiling lint-docs v0.1.0 (/media/build1/poky/build-st/tmp/work/core2-6=
4-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/src/tools/lint-docs)
    Finished release [optimized] target(s) in 6.32s
Building stage0 tool rustbook (x86_64-unknown-linux-gnu)
   Compiling autocfg v1.1.0
   Compiling proc-macro2 v1.0.37
   Compiling unicode-xid v0.2.2
   Compiling cfg-if v0.1.10
   Compiling syn v1.0.91
   Compiling ppv-lite86 v0.2.8
   Compiling serde v1.0.125
   Compiling memchr v2.4.1
   Compiling siphasher v0.3.3
   Compiling log v0.4.14
   Compiling parking_lot_core v0.8.5
   Compiling lazy_static v1.4.0
   Compiling scopeguard v1.1.0
   Compiling bitflags v1.2.1
   Compiling smallvec v1.8.1
   Compiling new_debug_unreachable v1.0.4
   Compiling mac v0.1.1
   Compiling matches v0.1.8
   Compiling ucd-trie v0.1.3
   Compiling utf-8 v0.7.5
   Compiling precomputed-hash v0.1.1
   Compiling maplit v1.0.2
   Compiling tinyvec v0.3.4
   Compiling version_check v0.9.3
   Compiling serde_derive v1.0.125
   Compiling once_cell v1.12.0
   Compiling termcolor v1.1.2
   Compiling hashbrown v0.12.3
   Compiling unicode-segmentation v1.9.0
   Compiling percent-encoding v2.1.0
   Compiling regex-syntax v0.6.25
   Compiling os_str_bytes v6.0.0
   Compiling pulldown-cmark v0.9.1
   Compiling strsim v0.10.0
   Compiling quick-error v1.2.3
   Compiling anyhow v1.0.51
   Compiling regex-automata v0.1.10
   Compiling textwrap v0.15.0
   Compiling strum v0.18.0
   Compiling unicode-width v0.1.8
   Compiling quick-error v2.0.0
   Compiling vec_map v0.8.2
   Compiling strsim v0.8.0
   Compiling shlex v1.0.0
   Compiling topological-sort v0.1.0
   Compiling ansi_term v0.12.1
   Compiling libc v0.2.126
   Compiling getrandom v0.2.0
   Compiling instant v0.1.12
   Compiling atty v0.2.14
   Compiling time v0.1.43
   Compiling rand v0.8.5
   Compiling unicode-bidi v0.3.4
   Compiling futf v0.1.5
   Compiling phf_shared v0.10.0
   Compiling textwrap v0.11.0
   Compiling humantime v1.3.0
   Compiling pest v2.1.3
   Compiling form_urlencoded v1.0.1
   Compiling tendril v0.4.3
   Compiling clap_lex v0.2.2
   Compiling lock_api v0.4.7
   Compiling num-traits v0.2.12
   Compiling indexmap v1.9.1
   Compiling num-integer v0.1.43
   Compiling phf v0.10.1
   Compiling clap v2.34.0
   Compiling unicode-normalization v0.1.13
   Compiling unicase v2.6.0
   Compiling heck v0.3.1
   Compiling aho-corasick v0.7.18
   Compiling bstr v0.2.13
   Compiling parking_lot v0.11.2
   Compiling quote v1.0.18
   Compiling tempfile v3.2.0
   Compiling rand_core v0.6.2
   Compiling rand_chacha v0.3.0
   Compiling idna v0.2.0
   Compiling pest_meta v2.1.3
   Compiling clap v3.2.5
   Compiling opener v0.5.0
   Compiling url v2.2.2
   Compiling chrono v0.4.19
   Compiling phf_generator v0.10.0
   Compiling regex v1.5.5
   Compiling phf_codegen v0.10.0
   Compiling string_cache_codegen v0.5.2
   Compiling markup5ever v0.11.0
   Compiling env_logger v0.7.1
   Compiling clap_complete v3.1.1
   Compiling string_cache v0.8.3Compiling lint-docs v0.1.0 (/media/build1/p=
oky/build-st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/s=
rc/tools/lint-docs)
    Finished release [optimized] target(s) in 6.32s
Building stage0 tool rustbook (x86_64-unknown-linux-gnu)
   Compiling autocfg v1.1.0
   Compiling proc-macro2 v1.0.37
   Compiling unicode-xid v0.2.2
   Compiling cfg-if v0.1.10
   Compiling syn v1.0.91
   Compiling ppv-lite86 v0.2.8
   Compiling serde v1.0.125
   Compiling memchr v2.4.1
   Compiling siphasher v0.3.3
   Compiling log v0.4.14
   Compiling parking_lot_core v0.8.5
   Compiling lazy_static v1.4.0
   Compiling scopeguard v1.1.0
   Compiling bitflags v1.2.1
   Compiling smallvec v1.8.1
   Compiling new_debug_unreachable v1.0.4
   Compiling mac v0.1.1
   Compiling matches v0.1.8
   Compiling ucd-trie v0.1.3
   Compiling utf-8 v0.7.5
   Compiling precomputed-hash v0.1.1
   Compiling maplit v1.0.2
   Compiling tinyvec v0.3.4
   Compiling version_check v0.9.3
   Compiling serde_derive v1.0.125
   Compiling once_cell v1.12.0
   Compiling termcolor v1.1.2
   Compiling hashbrown v0.12.3
   Compiling unicode-segmentation v1.9.0
   Compiling percent-encoding v2.1.0
   Compiling regex-syntax v0.6.25
   Compiling os_str_bytes v6.0.0
   Compiling pulldown-cmark v0.9.1
   Compiling strsim v0.10.0
   Compiling quick-error v1.2.3
   Compiling anyhow v1.0.51
   Compiling regex-automata v0.1.10
   Compiling textwrap v0.15.0
   Compiling strum v0.18.0
   Compiling unicode-width v0.1.8
   Compiling quick-error v2.0.0
   Compiling vec_map v0.8.2
   Compiling strsim v0.8.0
   Compiling shlex v1.0.0
   Compiling topological-sort v0.1.0
   Compiling ansi_term v0.12.1
   Compiling libc v0.2.126
   Compiling getrandom v0.2.0
   Compiling instant v0.1.12
   Compiling atty v0.2.14
   Compiling time v0.1.43
   Compiling rand v0.8.5
   Compiling unicode-bidi v0.3.4
   Compiling futf v0.1.5
   Compiling phf_shared v0.10.0
   Compiling textwrap v0.11.0
   Compiling humantime v1.3.0
   Compiling pest v2.1.3
   Compiling form_urlencoded v1.0.1
   Compiling tendril v0.4.3
   Compiling clap_lex v0.2.2
   Compiling lock_api v0.4.7
   Compiling num-traits v0.2.12
   Compiling indexmap v1.9.1
   Compiling num-integer v0.1.43
   Compiling phf v0.10.1
   Compiling clap v2.34.0
   Compiling unicode-normalization v0.1.13
   Compiling unicase v2.6.0
   Compiling heck v0.3.1
   Compiling aho-corasick v0.7.18
   Compiling bstr v0.2.13
   Compiling parking_lot v0.11.2
   Compiling quote v1.0.18
   Compiling tempfile v3.2.0
   Compiling rand_core v0.6.2
   Compiling rand_chacha v0.3.0
   Compiling idna v0.2.0
   Compiling pest_meta v2.1.3
   Compiling clap v3.2.5
   Compiling opener v0.5.0
   Compiling url v2.2.2
   Compiling chrono v0.4.19
   Compiling phf_generator v0.10.0
   Compiling regex v1.5.5
   Compiling phf_codegen v0.10.0
   Compiling string_cache_codegen v0.5.2
   Compiling markup5ever v0.11.0
   Compiling env_logger v0.7.1
   Compiling clap_complete v3.1.1
   Compiling string_cache v0.8.3
   Compiling serde_json v1.0.59
   Compiling toml v0.5.7
   Compiling pest_generator v2.1.3
   Compiling html5ever v0.26.0
   Compiling pest_derive v2.1.0
   Compiling strum_macros v0.18.0
   Compiling handlebars v4.1.0
   Compiling ammonia v3.2.0
   Compiling elasticlunr-rs v2.3.9
   Compiling mdbook v0.4.18
   Compiling rustbook v0.1.0 (/media/build1/poky/build-
st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-
src/src/tools/rustbook)
    Finished release [optimized] target(s) in 17.73s
Rustbook (x86_64-poky-linux-gnu) - rustc
Documenting stage1 std (x86_64-poky-linux-gnu)
 Documenting core v0.0.0 (/media/build1/poky/build-st/tmp/work/core2-
64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/library/core)
thread 'main' panicked at 'RUSTDOC_LIBDIR was not set',
src/bootstrap/bin/rustdoc.rs:15:48
note: run with `RUST_BACKTRACE=3D1` environment variable to display a
backtrace
error: could not document `core`

Caused by:
  process didn't exit successfully: `/media/build1/poky/build-
st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-
src/build/bootstrap/debug/rustdoc --edition=3D2021 --crate-type lib --
crate-name core library/core/src/lib.rs --target x86_64-poky-linux-gnu
-o /media/build1/poky/build-st/tmp/work/core2-64-poky-
linux/rust/1.63.0-r0/rustc-1.63.0-src/build/x86_64-unknown-linux-
gnu/stage1-std/x86_64-poky-linux-gnu/doc -Zunstable-options --check-cfg
'names()' --check-cfg 'values()' --error-format=3Djson --json=3Ddiagnostic-
rendered-ansi,artifacts,future-incompat --markdown-css rust.css --
markdown-no-toc -Z unstable-options --resource-suffix 1.63.0 --index-
page /media/build1/poky/build-st/tmp/work/core2-64-poky-
linux/rust/1.63.0-r0/rustc-1.63.0-src/src/doc/index.md -C
metadata=3Daf344c1b4dc223ee -L dependency=3D/media/build1/poky/build-
st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-
src/build/x86_64-unknown-linux-gnu/stage1-std/x86_64-poky-linux-
gnu/release/deps -L dependency=3D/media/build1/poky/build-
st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-
src/build/x86_64-unknown-linux-gnu/stage1-std/release/deps -Csymbol-
mangling-version=3Dlegacy -Zunstable-options -Zunstable-options '--check-
cfg=3Dvalues(bootstrap)' '--check-cfg=3Dvalues(stdarch_intel_sde)' '--
check-cfg=3Dvalues(no_fp_fmt_parse)' '--check-
cfg=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(freebsd12)' '--
check-cfg=3Dvalues(backtrace_in_libstd)' '--check-
cfg=3Dvalues(target_env,"libnx")' '--check-
cfg=3Dvalues(target_os,"watchos")' '--check-
cfg=3Dvalues(target_arch,"asmjs","spirv","nvptx","nvptx64","le32","xtensa
")' '--check-cfg=3Dvalues(dont_compile_me)' -Dwarnings '-
Wrustdoc::invalid_codeblock_attributes' --crate-version 1.63.0 '-
Zcrate-attr=3Ddoc(html_root_url=3D"https://doc.rust-lang.org/1.63.0/")'`
(exit status: 101)
   Compiling serde_json v1.0.59
   Compiling toml v0.5.7
   Compiling pest_generator v2.1.3
   Compiling html5ever v0.26.0
   Compiling pest_derive v2.1.0
   Compiling strum_macros v0.18.0
   Compiling handlebars v4.1.0
   Compiling ammonia v3.2.0
   Compiling elasticlunr-rs v2.3.9
   Compiling mdbook v0.4.18
   Compiling rustbook v0.1.0 (/media/build1/poky/build-st/tmp/work/core2-64=
-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/src/tools/rustbook)
    Finished release [optimized] target(s) in 17.73s
Rustbook (x86_64-poky-linux-gnu) - rustc
Documenting stage1 std (x86_64-poky-linux-gnu)
 Documenting core v0.0.0 (/media/build1/poky/build-st/tmp/work/core2-64-pok=
y-linux/rust/1.63.0-r0/rustc-1.63.0-src/library/core)
thread 'main' panicked at 'RUSTDOC_LIBDIR was not set', src/bootstrap/bin/r=
ustdoc.rs:15:48
note: run with `RUST_BACKTRACE=3D1` environment variable to display a backt=
race
error: could not document `core`

Caused by:
  process didn't exit successfully: `/media/build1/poky/build-st/tmp/work/c=
ore2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/build/bootstrap/debug/ru=
stdoc --edition=3D2021 --crate-type lib --crate-name core library/core/src/=
lib.rs --target x86_64-poky-linux-gnu -o /media/build1/poky/build-st/tmp/wo=
rk/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/build/x86_64-unknown=
-linux-gnu/stage1-std/x86_64-poky-linux-gnu/doc -Zunstable-options --check-=
cfg 'names()' --check-cfg 'values()' --error-format=3Djson --json=3Ddiagnos=
tic-rendered-ansi,artifacts,future-incompat --markdown-css rust.css --markd=
own-no-toc -Z unstable-options --resource-suffix 1.63.0 --index-page /media=
/build1/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-1.6=
3.0-src/src/doc/index.md -C metadata=3Daf344c1b4dc223ee -L dependency=3D/me=
dia/build1/poky/build-st/tmp/work/core2-64-poky-linux/rust/1.63.0-r0/rustc-=
1.63.0-src/build/x86_64-unknown-linux-gnu/stage1-std/x86_64-poky-linux-gnu/=
release/deps -L dependency=3D/media/build1/poky/build-st/tmp/work/core2-64-=
poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/build/x86_64-unknown-linux-gnu/s=
tage1-std/release/deps -Csymbol-mangling-version=3Dlegacy -Zunstable-option=
s -Zunstable-options '--check-cfg=3Dvalues(bootstrap)' '--check-cfg=3Dvalue=
s(stdarch_intel_sde)' '--check-cfg=3Dvalues(no_fp_fmt_parse)' '--check-cfg=
=3Dvalues(no_global_oom_handling)' '--check-cfg=3Dvalues(freebsd12)' '--che=
ck-cfg=3Dvalues(backtrace_in_libstd)' '--check-cfg=3Dvalues(target_env,"lib=
nx")' '--check-cfg=3Dvalues(target_os,"watchos")' '--check-cfg=3Dvalues(tar=
get_arch,"asmjs","spirv","nvptx","nvptx64","le32","xtensa")' '--check-cfg=
=3Dvalues(dont_compile_me)' -Dwarnings '-Wrustdoc::invalid_codeblock_attrib=
utes' --crate-version 1.63.0 '-Zcrate-attr=3Ddoc(html_root_url=3D"https://d=
oc.rust-lang.org/1.63.0/")'` (exit status: 101)

> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
> new file mode 100644
> index 0000000000..274bfc144a
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: MIT
> +import os
> +import subprocess
> +from oeqa.core.decorator import OETestTag
> +from oeqa.core.case import OEPTestResultTestCase
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars=
, runqemu, Command
> +from oeqa.utils.sshcontrol import SSHControl
> +
> +# Total time taken for testing is of about 2hr 20min, with PARALLEL_MAKE=
 set to 40 number of jobs.
> +class RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
> +
> +	def run_check_emulated(self, *args, **kwargs):
> +		# build remote-test-server before image build
> +		recipe =3D "rust"
> +		bitbake("{} -c test_compile".format(recipe))
> +		builddir =3D get_bb_var("RUSTSRC", "rust")


Something is mangling spaces in your patch. There shouldn't be tabs
here.


> +		# build core-image-minimal with required packages
> +		default_installed_packages =3D ["libgcc", "libstdc++", "libatomic", "l=
ibgomp"]
> +		features =3D []
> +		features.append('IMAGE_FEATURES +=3D "ssh-server-openssh"')
> +		features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.format(" ".join(=
default_installed_packages)))
> +		self.write_config("\n".join(features))
> +		bitbake("core-image-minimal")
> +		# wrap the execution with a qemu instance.
> +                # Tests are run with 512 tasks in parallel to execute al=
l tests very quickly
> +		with runqemu("core-image-minimal", runqemuparams =3D "nographic", qemu=
params =3D "-m 512") as qemu:
> +			# Copy remote-test-server to image through scp
> +			ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D"root"=
)
> +			ssh.copy_to(builddir + "/" + "build/x86_64-unknown-linux-gnu/stage1-t=
ools-bin/remote-test-server","~/")
> +			# Execute remote-test-server on image through background ssh
> +			command =3D '~/remote-test-server -v remote'
> +			sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=3D/dev/n=
ull', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qemu.ip, comma=
nd),
> +                                shell=3DFalse,
> +                                stdout=3Dsubprocess.PIPE,
> +                                stderr=3Dsubprocess.PIPE)
> +			# Get the values of variables.
> +			tcpath =3D get_bb_var("TARGET_SYS", "rust")
> +			targetsys =3D get_bb_var("RUST_TARGET_SYS", "rust")
> +			rustlibpath =3D get_bb_var("WORKDIR", "rust")
> +			tmpdir =3D get_bb_var("TMPDIR", "rust")
> +
> +			# Exclude the test folders that error out while building
> +                        # TODO: Fix the errors and include them for test=
ing
> +                        # no-fail-fast: Run all tests regardless of fail=
ure.
> +                        # bless: First runs rustfmt to format the codeba=
se,
> +                        # then runs tidy checks.
> +			testargs =3D "--exclude src/test/rustdoc --exclude src/test/rustdoc-j=
son  --exclude src/test/run-make-fulldeps --exclude src/tools/tidy --exclud=
e src/tools/rustdoc-themes --exclude src/rustdoc-json-types --exclude src/l=
ibrustdoc --exclude src/doc/unstable-book --exclude src/doc/rustdoc --exclu=
de src/doc/rustc --exclude compiler/rustc --exclude library/panic_abort --e=
xclude library/panic_unwind --exclude src/test/rustdoc --no-doc --no-fail-f=
ast --bless"
> +
> +			# Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
> +			cmd =3D " export PATH=3D%s/recipe-sysroot-native/usr/bin:$PATH;" % ru=
stlibpath
> +			cmd =3D cmd + " export TARGET_VENDOR=3D\"-poky\";"
> +			cmd =3D cmd + " export PATH=3D%s/recipe-sysroot-native/usr/bin/%s:%s/=
hosttools:$PATH;" % (rustlibpath, tcpath, tmpdir)
> +			cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targets;" % rustlib=
path
> +			# Trigger testing.
> +			cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % qemu.ip
> +			cmd =3D cmd + " cd %s;  python3 src/bootstrap/bootstrap.py test %s --=
target %s ;" % (builddir, testargs, targetsys)
> +			result =3D runCmd(cmd)
> +
> +@OETestTag("toolchain-system")
> +class RustSelfTestSystemEmulated(RustSelfTestBase):
> +	def test_rust(self):
> +		self.run_check_emulated("rust")

I think this can be merged with the RustSelfTestBase class as I don't
really see why it is separate?


> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index ce6c983fc0..7386d7a3ea 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -4,7 +4,8 @@ SRC_URI[rust.sha256sum] =3D "8f44af6dc44cc4146634a4dd5e4c=
c5470b3052a2337019b870c0e
>  SRC_URI:append:class-target:pn-rust =3D " \
>      file://hardcodepaths.patch \
>      file://crossbeam_atomic.patch \
> -    file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch"
> +    file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch \
> +    file://rust-oe-selftest.patch;striplevel=3D1"
>  SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepa=
ths.patch"
> =20
>  RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 284347dedc..70f4d01808 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -18,7 +18,7 @@ export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
>  RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
>  RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-rust/b=
in/llvm-config"
> =20
> -# We don't want to use bitbakes vendoring because the rust sources do th=
eir
> +# We don't want to use bitbake's vendoring because the rust sources do t=
heir
>  # own vendoring.
>  CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
> =20

If we want to change grammar, it should be in a separate patch.


> @@ -55,6 +55,7 @@ do_rust_setup_snapshot () {
>  addtask rust_setup_snapshot after do_unpack before do_configure
>  do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>  do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
> +addtask do_test_compile after do_configure do_rust_gen_targets
>=20


Please put that alongside the task definition.


Cheers,

Richard


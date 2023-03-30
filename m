Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D51CC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 09:48:11 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.21192.1680169688145384538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 02:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KqNuGeR7;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id a44so327000ljr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 02:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680169686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b054rumXXMVNBtvcbeCE0upm6BT9cuAFcQmT2LsvwIA=;
        b=KqNuGeR7tBDjv9n6JZ1bm7G5+NCzhD4Dcv74hYVhTFVo8Tn6sSuJe6WAIkFU5H851b
         bGlx4wGs/z3SNGtYajSr05GpDwbjNyosi+XvkriBBe/8Nn/17LqPWxXVhk7Mrke6xRJN
         LSR9oA4kf3yAw17OcRyg7Ha1FTKjs6Slg+iGQK/JixIYlWtmu+CiIF9JeOCbX+JmXpY0
         PKuegfZbYYtdcwsh6NGTvh+e+QICmD8BaSVMFymTotL+/bQxCARFBhEp//dkTzaxfuMc
         kFWte5J4Y9v3405Dez+VCjb4PBsXnLVqsLz76piB0XqbPyCTPRzm/DIVLs3Gkf2KKwTB
         KgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b054rumXXMVNBtvcbeCE0upm6BT9cuAFcQmT2LsvwIA=;
        b=sl59+gnYETd+WG/sDQKOp60ftl1+bh4LZrElwm2sEROe4blYCyE5VYZdADIij0nX/3
         OG5EJefOMYsrkSfZYYXhkr1J/C3XCfCtdoamc1WDDBTZiewfTQxZbBJhlDm+rKG0tzRK
         pNgnf7IzH8DTuBAZT5D0KV18I3zWecC3CBEl8qsu1+i8pK4bUYYFLLD5gHAwQhct81WG
         +g039t77gH/chjrnn1MTGSYuVY6ZOv0+X+qG4OUj/CyAMnPJ41YhvC6+o3pswPd9kmQr
         m+Fc3Bik+9TLUIXkw8tmmW9S1Yqd/yPmHp654a9qL7HP+ksgnL4GKE3ipFfl92UgPjlA
         2o2w==
X-Gm-Message-State: AAQBX9eLeCl+N1axlwYH55ovpwZbMvjEH/LboEEEWXXkl8G7p0EkPq+M
	iKv8n0Ssm3fErEqYUJbh0xvB89JNCrpLLjcRut8=
X-Google-Smtp-Source: AKy350bgaJNT5HTeq+WRtsIgIeMMSvl/zVnaqsKthyE5T4X65lwetQI6UlwK/sLUbJ8bNS1Fdmdtg7Q67jqJSHDGfsM=
X-Received: by 2002:a2e:8257:0:b0:29b:d21c:e859 with SMTP id
 j23-20020a2e8257000000b0029bd21ce859mr6988510ljh.3.1680169685341; Thu, 30 Mar
 2023 02:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
 <8d69fe1e3f390a7e8fa568abdc20e5d0ee634fc1.1680103647.git.frederic.martinsons@gmail.com>
 <20230330090324705e693e@mail.local> <2023033009145701b67168@mail.local>
In-Reply-To: <2023033009145701b67168@mail.local>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 11:47:53 +0200
Message-ID: <CA+cAker5pJUBoOSEVZtk++394xGgXqcDDD9eFJpu07+Ai5PaWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 5/5] meta-selftest: provide a recipe for zvariant
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Content-Type: multipart/alternative; boundary="00000000000041d97605f81afd49"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 09:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179311

--00000000000041d97605f81afd49
Content-Type: text/plain; charset="UTF-8"

What version of bitbake you had pulled ?
Because "mandatory checksum on crates" is a patch I submitted two weeks ago
(
https://patchwork.yoctoproject.org/project/bitbake/patch/20230317081916.1857201-2-frederic.martinsons@gmail.com/
))
and it is not yet merged in bitbake master nor in poky master.

So I construct the present series without these patches in mind since it is
not related.
I you plan to merge the previous series, I can update the zvariant for this
recipe of course
it can be done by issuing "bitbake -c update_crates zvariant" if this patch
(
https://patchwork.yoctoproject.org/project/bitbake/patch/20230316121249.28209-1-frederic.martinsons@gmail.com/)
is present

I'm sorry, I must admit that I'm kinda lost with the patch submission
process when it impacts multiple different
projects.
Can you advise on the way of doing this?


On Thu, 30 Mar 2023 at 11:14, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 30/03/2023 11:03:25+0200, Alexandre Belloni wrote:
> > Hello,
> >
> > Because I4m carrying your other series, this fails with:
> >
> > ERROR: zvariant-3.12.0-r0 do_fetch: No checksum specified for
> '/srv/autobuilder/autobuilder.yocto.io/current_sources/anes-0.1.6.crate',
> please add at least one to the recipe:
> > SRC_URI[anes.sha256sum] =
> "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> > ERROR: zvariant-3.12.0-r0 do_fetch: Bitbake Fetcher Error:
> NoChecksumError('Missing SRC_URI checksum', '
> https://crates.io/api/v1/crates/anes/0.1.6/download')
> >
> > I think I'll fix it locally but we'll need to come up with a plan when
> > merging.
>
> Actually, could you handle the list of checksum? It is quite long.
>
> >
> > On 29/03/2023 17:30:34+0200, Frederic Martinsons wrote:
> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >
> > > This recipe is for showing a "real world" example of
> > > a crate that depends on some git repositories.
> > >
> > > Usually, this kind of crate is built within a global
> > > workspace (here it is the zbus project) and so
> > > doesn't need a Cargo.lock on its own.
> > >
> > > For the sake of the demonstration, I had to tweak things
> > > a little to be able to compile zvariant in standalone
> > > (no relative path in dependency, no symlink to LICENSE
> > > provide a Cargo.lock)
> > >
> > > The use case where the crate had some git repository
> > > in dependency is very common for "private" crate that
> > > are not aimed to be published on crates.io.
> > > When the project grow bigger, it is common to have
> > > a bin and multiple lib developped in parallel, and these
> > > libs are surely on a git repostitory.
> > >
> > > A test case have been also added to check for:
> > >   - the previous patch about git subpath parameter and devtool
> > >   - the correctness of overriding dependencies (first patch of the
> > > series)
> > >
> > > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > ---
> > >  .../zvariant/zvariant-crates.inc              |  140 ++
> > >  .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
> > >  .../zvariant/zvariant_3.12.0.bb               |   26 +
> > >  meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
> > >  4 files changed, 1551 insertions(+)
> > >  create mode 100644
> meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> > >  create mode 100644
> meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> > >  create mode 100644 meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb
> > >
> > > diff --git
> a/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> > > new file mode 100644
> > > index 0000000000..41f50b1b0c
> > > --- /dev/null
> > > +++ b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> > > @@ -0,0 +1,140 @@
> > > +SRC_URI += " \
> > > +    crate://crates.io/anes/0.1.6 \
> > > +    crate://crates.io/anyhow/1.0.70 \
> > > +    crate://crates.io/arrayvec/0.7.2 \
> > > +    crate://crates.io/atty/0.2.14 \
> > > +    crate://crates.io/autocfg/1.1.0 \
> > > +    crate://crates.io/bitflags/1.3.2 \
> > > +    crate://crates.io/bumpalo/3.12.0 \
> > > +    crate://crates.io/byteorder/1.4.3 \
> > > +    crate://crates.io/cast/0.3.0 \
> > > +    crate://crates.io/cfg-if/1.0.0 \
> > > +    crate://crates.io/chrono/0.4.24 \
> > > +    crate://crates.io/ciborium-io/0.2.0 \
> > > +    crate://crates.io/ciborium-ll/0.2.0 \
> > > +    crate://crates.io/ciborium/0.2.0 \
> > > +    crate://crates.io/clap/3.2.23 \
> > > +    crate://crates.io/clap_lex/0.2.4 \
> > > +    crate://crates.io/criterion-plot/0.5.0 \
> > > +    crate://crates.io/criterion/0.4.0 \
> > > +    crate://crates.io/crossbeam-channel/0.5.7 \
> > > +    crate://crates.io/crossbeam-deque/0.8.3 \
> > > +    crate://crates.io/crossbeam-epoch/0.9.14 \
> > > +    crate://crates.io/crossbeam-utils/0.8.15 \
> > > +    crate://crates.io/either/1.8.1 \
> > > +    crate://crates.io/enumflags2/0.7.5 \
> > > +    crate://crates.io/enumflags2_derive/0.7.4 \
> > > +    crate://crates.io/form_urlencoded/1.1.0 \
> > > +    crate://crates.io/futures-channel/0.3.27 \
> > > +    crate://crates.io/futures-core/0.3.27 \
> > > +    crate://crates.io/futures-executor/0.3.27 \
> > > +    crate://crates.io/futures-macro/0.3.27 \
> > > +    crate://crates.io/futures-task/0.3.27 \
> > > +    crate://crates.io/futures-util/0.3.27 \
> > > +    crate://crates.io/getrandom/0.2.8 \
> > > +    crate://crates.io/half/1.8.2 \
> > > +    crate://crates.io/hashbrown/0.12.3 \
> > > +    crate://crates.io/heck/0.3.3 \
> > > +    crate://crates.io/hermit-abi/0.1.19 \
> > > +    crate://crates.io/hermit-abi/0.2.6 \
> > > +    crate://crates.io/idna/0.3.0 \
> > > +    crate://crates.io/indexmap/1.9.2 \
> > > +    crate://crates.io/itertools/0.10.5 \
> > > +    crate://crates.io/itertools/0.9.0 \
> > > +    crate://crates.io/itoa/1.0.6 \
> > > +    crate://crates.io/js-sys/0.3.61 \
> > > +    crate://crates.io/lazy_static/1.4.0 \
> > > +    crate://crates.io/libc/0.2.140 \
> > > +    crate://crates.io/log/0.4.17 \
> > > +    crate://crates.io/memchr/2.5.0 \
> > > +    crate://crates.io/memoffset/0.8.0 \
> > > +    crate://crates.io/num-integer/0.1.45 \
> > > +    crate://crates.io/num-traits/0.2.15 \
> > > +    crate://crates.io/num_cpus/1.15.0 \
> > > +    crate://crates.io/once_cell/1.17.1 \
> > > +    crate://crates.io/oorandom/11.1.3 \
> > > +    crate://crates.io/os_str_bytes/6.5.0 \
> > > +    crate://crates.io/percent-encoding/2.2.0 \
> > > +    crate://crates.io/pin-project-lite/0.2.9 \
> > > +    crate://crates.io/pin-utils/0.1.0 \
> > > +    crate://crates.io/pkg-config/0.3.26 \
> > > +    crate://crates.io/plotters-backend/0.3.4 \
> > > +    crate://crates.io/plotters-svg/0.3.3 \
> > > +    crate://crates.io/plotters/0.3.4 \
> > > +    crate://crates.io/ppv-lite86/0.2.17 \
> > > +    crate://crates.io/proc-macro-crate/0.1.5 \
> > > +    crate://crates.io/proc-macro-crate/1.3.1 \
> > > +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> > > +    crate://crates.io/proc-macro-error/1.0.4 \
> > > +    crate://crates.io/proc-macro2/1.0.53 \
> > > +    crate://crates.io/quote/1.0.26 \
> > > +    crate://crates.io/rand/0.8.5 \
> > > +    crate://crates.io/rand_chacha/0.3.1 \
> > > +    crate://crates.io/rand_core/0.6.4 \
> > > +    crate://crates.io/rayon-core/1.11.0 \
> > > +    crate://crates.io/rayon/1.7.0 \
> > > +    crate://crates.io/regex-syntax/0.6.29 \
> > > +    crate://crates.io/regex/1.7.2 \
> > > +    crate://crates.io/ryu/1.0.13 \
> > > +    crate://crates.io/same-file/1.0.6 \
> > > +    crate://crates.io/scopeguard/1.1.0 \
> > > +    crate://crates.io/serde/1.0.158 \
> > > +    crate://crates.io/serde_bytes/0.11.9 \
> > > +    crate://crates.io/serde_derive/1.0.158 \
> > > +    crate://crates.io/serde_json/1.0.94 \
> > > +    crate://crates.io/serde_repr/0.1.12 \
> > > +    crate://crates.io/slab/0.4.8 \
> > > +    crate://crates.io/static_assertions/1.1.0 \
> > > +    crate://crates.io/strum/0.18.0 \
> > > +    crate://crates.io/strum_macros/0.18.0 \
> > > +    crate://crates.io/syn/1.0.109 \
> > > +    crate://crates.io/syn/2.0.8 \
> > > +    crate://crates.io/system-deps/1.3.2 \
> > > +    crate://crates.io/textwrap/0.16.0 \
> > > +    crate://crates.io/thiserror-impl/1.0.40 \
> > > +    crate://crates.io/thiserror/1.0.40 \
> > > +    crate://crates.io/time-core/0.1.0 \
> > > +    crate://crates.io/time-macros/0.2.8 \
> > > +    crate://crates.io/time/0.3.20 \
> > > +    crate://crates.io/tinytemplate/1.2.1 \
> > > +    crate://crates.io/tinyvec/1.6.0 \
> > > +    crate://crates.io/tinyvec_macros/0.1.1 \
> > > +    crate://crates.io/toml/0.5.11 \
> > > +    crate://crates.io/toml_datetime/0.6.1 \
> > > +    crate://crates.io/toml_edit/0.19.8 \
> > > +    crate://crates.io/unicode-bidi/0.3.13 \
> > > +    crate://crates.io/unicode-ident/1.0.8 \
> > > +    crate://crates.io/unicode-normalization/0.1.22 \
> > > +    crate://crates.io/unicode-segmentation/1.10.1 \
> > > +    crate://crates.io/url/2.3.1 \
> > > +    crate://crates.io/uuid/1.3.0 \
> > > +    crate://crates.io/version-compare/0.0.10 \
> > > +    crate://crates.io/version_check/0.9.4 \
> > > +    crate://crates.io/walkdir/2.3.3 \
> > > +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > > +    crate://crates.io/wasm-bindgen-backend/0.2.84 \
> > > +    crate://crates.io/wasm-bindgen-macro-support/0.2.84 \
> > > +    crate://crates.io/wasm-bindgen-macro/0.2.84 \
> > > +    crate://crates.io/wasm-bindgen-shared/0.2.84 \
> > > +    crate://crates.io/wasm-bindgen/0.2.84 \
> > > +    crate://crates.io/web-sys/0.3.61 \
> > > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > > +    crate://crates.io/winapi-util/0.1.5 \
> > > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > > +    crate://crates.io/winapi/0.3.9 \
> > > +    crate://crates.io/winnow/0.4.0 \
> > > +    crate://crates.io/zvariant_derive/3.12.0 \
> > > +    crate://crates.io/zvariant_utils/1.0.0 \
> > > +    git://
> github.com/gtk-rs/glib;protocol=https;nobranch=1;name=glib;destsuffix=glib;type=git-dependency
> \
> > > +    git://
> github.com/gtk-rs/sys;protocol=https;nobranch=1;name=glib-sys;destsuffix=glib-sys;subpath=glib-sys;type=git-dependency
> \
> > > +    git://
> github.com/gtk-rs/sys;protocol=https;nobranch=1;name=gobject-sys;destsuffix=gobject-sys;subpath=gobject-sys;type=git-dependency
> \
> > > +"
> > > +
> > > +SRCREV_FORMAT .= "_glib"
> > > +SRCREV_glib = "c9ee583cea07830c099cdcccd33eda9ef705ea93"
> > > +
> > > +SRCREV_FORMAT .= "_glib-sys"
> > > +SRCREV_glib-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > > +
> > > +SRCREV_FORMAT .= "_gobject-sys"
> > > +SRCREV_gobject-sys = "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > > diff --git
> a/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> > > new file mode 100644
> > > index 0000000000..ac6c5117bb
> > > --- /dev/null
> > > +++
> b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvariant-crate-config.patch
> > > @@ -0,0 +1,1292 @@
> > > +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 2001
> > > +From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > +Date: Thu, 23 Mar 2023 07:12:37 +0100
> > > +Subject: [PATCH] Tweak zvariant crate config
> > > +
> > > +This library crate is a part of zbus project, and is aimed to
> > > +be published amongst the whole project.
> > > +
> > > +Nevertheless, this recipe is for showing example of real
> > > +code which uses a local registry via git url inside yocto
> > > +environment.
> > > +
> > > +I didn't find a real example of binary crate that uses git
> > > +dependency but it seems to me a very common use case
> > > +when we are working on multiple local crates that are not
> > > +aimed to be published on public registry.
> > > +
> > > +Long story short, this patch add a modified Cargo.toml
> > > +to use the zvariant_derive dependency from crates.io instead
> > > +of zbus local one and a pre generated Cargo.lock in order
> > > +to make cargo patch process inside cargo_common.bbclass work
> > > +
> > > +It also copied the LICENCE file from zbus project instead
> > > +of symlink to it.
> > > +
> > > +Upstream-Status: Inappropriate
> > > +Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > +---
> > > + zvariant/Cargo.lock | 1198
> +++++++++++++++++++++++++++++++++++++++++++
> > > + zvariant/Cargo.toml |    2 +-
> > > + zvariant/LICENSE    |   24 +-
> > > + 3 files changed, 1222 insertions(+), 2 deletions(-)
> > > + create mode 100644 zvariant/Cargo.lock
> > > + mode change 120000 => 100644 zvariant/LICENSE
> > > +
> > > +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
> > > +new file mode 100644
> > > +index 00000000..02a83d42
> > > +--- /dev/null
> > > ++++ b/zvariant/Cargo.lock
> > > +@@ -0,0 +1,1198 @@
> > > ++# This file is automatically @generated by Cargo.
> > > ++# It is not intended for manual editing.
> > > ++version = 3
> > > ++
> > > ++[[package]]
> > > ++name = "anes"
> > > ++version = "0.1.6"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> > > ++
> > > ++[[package]]
> > > ++name = "anyhow"
> > > ++version = "1.0.70"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
> > > ++
> > > ++[[package]]
> > > ++name = "arrayvec"
> > > ++version = "0.7.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "atty"
> > > ++version = "0.2.14"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
> > > ++dependencies = [
> > > ++ "hermit-abi 0.1.19",
> > > ++ "libc",
> > > ++ "winapi",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "autocfg"
> > > ++version = "1.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > > ++
> > > ++[[package]]
> > > ++name = "bitflags"
> > > ++version = "1.3.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > > ++
> > > ++[[package]]
> > > ++name = "bumpalo"
> > > ++version = "3.12.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
> > > ++
> > > ++[[package]]
> > > ++name = "byteorder"
> > > ++version = "1.4.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
> > > ++
> > > ++[[package]]
> > > ++name = "cast"
> > > ++version = "0.3.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
> > > ++
> > > ++[[package]]
> > > ++name = "cfg-if"
> > > ++version = "1.0.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > > ++
> > > ++[[package]]
> > > ++name = "chrono"
> > > ++version = "0.4.24"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
> > > ++dependencies = [
> > > ++ "num-integer",
> > > ++ "num-traits",
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "ciborium"
> > > ++version = "0.2.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
> > > ++dependencies = [
> > > ++ "ciborium-io",
> > > ++ "ciborium-ll",
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "ciborium-io"
> > > ++version = "0.2.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
> > > ++
> > > ++[[package]]
> > > ++name = "ciborium-ll"
> > > ++version = "0.2.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
> > > ++dependencies = [
> > > ++ "ciborium-io",
> > > ++ "half",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "clap"
> > > ++version = "3.2.23"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
> > > ++dependencies = [
> > > ++ "bitflags",
> > > ++ "clap_lex",
> > > ++ "indexmap",
> > > ++ "textwrap",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "clap_lex"
> > > ++version = "0.2.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
> > > ++dependencies = [
> > > ++ "os_str_bytes",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "criterion"
> > > ++version = "0.4.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
> > > ++dependencies = [
> > > ++ "anes",
> > > ++ "atty",
> > > ++ "cast",
> > > ++ "ciborium",
> > > ++ "clap",
> > > ++ "criterion-plot",
> > > ++ "itertools 0.10.5",
> > > ++ "lazy_static",
> > > ++ "num-traits",
> > > ++ "oorandom",
> > > ++ "plotters",
> > > ++ "rayon",
> > > ++ "regex",
> > > ++ "serde",
> > > ++ "serde_derive",
> > > ++ "serde_json",
> > > ++ "tinytemplate",
> > > ++ "walkdir",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "criterion-plot"
> > > ++version = "0.5.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
> > > ++dependencies = [
> > > ++ "cast",
> > > ++ "itertools 0.10.5",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "crossbeam-channel"
> > > ++version = "0.5.7"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++ "crossbeam-utils",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "crossbeam-deque"
> > > ++version = "0.8.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++ "crossbeam-epoch",
> > > ++ "crossbeam-utils",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "crossbeam-epoch"
> > > ++version = "0.9.14"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++ "cfg-if",
> > > ++ "crossbeam-utils",
> > > ++ "memoffset",
> > > ++ "scopeguard",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "crossbeam-utils"
> > > ++version = "0.8.15"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "either"
> > > ++version = "1.8.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
> > > ++
> > > ++[[package]]
> > > ++name = "enumflags2"
> > > ++version = "0.7.5"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
> > > ++dependencies = [
> > > ++ "enumflags2_derive",
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "enumflags2_derive"
> > > ++version = "0.7.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "form_urlencoded"
> > > ++version = "1.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
> > > ++dependencies = [
> > > ++ "percent-encoding",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "futures-channel"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
> > > ++dependencies = [
> > > ++ "futures-core",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "futures-core"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
> > > ++
> > > ++[[package]]
> > > ++name = "futures-executor"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
> > > ++dependencies = [
> > > ++ "futures-core",
> > > ++ "futures-task",
> > > ++ "futures-util",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "futures-macro"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "futures-task"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
> > > ++
> > > ++[[package]]
> > > ++name = "futures-util"
> > > ++version = "0.3.27"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
> > > ++dependencies = [
> > > ++ "futures-core",
> > > ++ "futures-macro",
> > > ++ "futures-task",
> > > ++ "pin-project-lite",
> > > ++ "pin-utils",
> > > ++ "slab",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "getrandom"
> > > ++version = "0.2.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++ "libc",
> > > ++ "wasi",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "glib"
> > > ++version = "0.10.0"
> > > ++source = "git+
> https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93
> "
> > > ++dependencies = [
> > > ++ "bitflags",
> > > ++ "futures-channel",
> > > ++ "futures-core",
> > > ++ "futures-executor",
> > > ++ "futures-task",
> > > ++ "futures-util",
> > > ++ "glib-macros",
> > > ++ "glib-sys",
> > > ++ "gobject-sys",
> > > ++ "libc",
> > > ++ "once_cell",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "glib-macros"
> > > ++version = "0.10.0"
> > > ++source = "git+
> https://github.com/gtk-rs/glib?rev=c9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93
> "
> > > ++dependencies = [
> > > ++ "anyhow",
> > > ++ "heck",
> > > ++ "itertools 0.9.0",
> > > ++ "proc-macro-crate 0.1.5",
> > > ++ "proc-macro-error",
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "glib-sys"
> > > ++version = "0.10.0"
> > > ++source = "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > > ++dependencies = [
> > > ++ "libc",
> > > ++ "system-deps",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "gobject-sys"
> > > ++version = "0.10.0"
> > > ++source = "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > > ++dependencies = [
> > > ++ "glib-sys",
> > > ++ "libc",
> > > ++ "system-deps",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "half"
> > > ++version = "1.8.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
> > > ++
> > > ++[[package]]
> > > ++name = "hashbrown"
> > > ++version = "0.12.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> > > ++
> > > ++[[package]]
> > > ++name = "heck"
> > > ++version = "0.3.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
> > > ++dependencies = [
> > > ++ "unicode-segmentation",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "hermit-abi"
> > > ++version = "0.1.19"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
> > > ++dependencies = [
> > > ++ "libc",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "hermit-abi"
> > > ++version = "0.2.6"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
> > > ++dependencies = [
> > > ++ "libc",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "idna"
> > > ++version = "0.3.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
> > > ++dependencies = [
> > > ++ "unicode-bidi",
> > > ++ "unicode-normalization",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "indexmap"
> > > ++version = "1.9.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++ "hashbrown",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "itertools"
> > > ++version = "0.9.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
> > > ++dependencies = [
> > > ++ "either",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "itertools"
> > > ++version = "0.10.5"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
> > > ++dependencies = [
> > > ++ "either",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "itoa"
> > > ++version = "1.0.6"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
> > > ++
> > > ++[[package]]
> > > ++name = "js-sys"
> > > ++version = "0.3.61"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
> > > ++dependencies = [
> > > ++ "wasm-bindgen",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "lazy_static"
> > > ++version = "1.4.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
> > > ++
> > > ++[[package]]
> > > ++name = "libc"
> > > ++version = "0.2.140"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
> > > ++
> > > ++[[package]]
> > > ++name = "log"
> > > ++version = "0.4.17"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "memchr"
> > > ++version = "2.5.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
> > > ++
> > > ++[[package]]
> > > ++name = "memoffset"
> > > ++version = "0.8.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "num-integer"
> > > ++version = "0.1.45"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++ "num-traits",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "num-traits"
> > > ++version = "0.2.15"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "num_cpus"
> > > ++version = "1.15.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
> > > ++dependencies = [
> > > ++ "hermit-abi 0.2.6",
> > > ++ "libc",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "once_cell"
> > > ++version = "1.17.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
> > > ++
> > > ++[[package]]
> > > ++name = "oorandom"
> > > ++version = "11.1.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
> > > ++
> > > ++[[package]]
> > > ++name = "os_str_bytes"
> > > ++version = "6.5.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
> > > ++
> > > ++[[package]]
> > > ++name = "percent-encoding"
> > > ++version = "2.2.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
> > > ++
> > > ++[[package]]
> > > ++name = "pin-project-lite"
> > > ++version = "0.2.9"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
> > > ++
> > > ++[[package]]
> > > ++name = "pin-utils"
> > > ++version = "0.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> > > ++
> > > ++[[package]]
> > > ++name = "pkg-config"
> > > ++version = "0.3.26"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
> > > ++
> > > ++[[package]]
> > > ++name = "plotters"
> > > ++version = "0.3.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
> > > ++dependencies = [
> > > ++ "num-traits",
> > > ++ "plotters-backend",
> > > ++ "plotters-svg",
> > > ++ "wasm-bindgen",
> > > ++ "web-sys",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "plotters-backend"
> > > ++version = "0.3.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
> > > ++
> > > ++[[package]]
> > > ++name = "plotters-svg"
> > > ++version = "0.3.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
> > > ++dependencies = [
> > > ++ "plotters-backend",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "ppv-lite86"
> > > ++version = "0.2.17"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
> > > ++
> > > ++[[package]]
> > > ++name = "proc-macro-crate"
> > > ++version = "0.1.5"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
> > > ++dependencies = [
> > > ++ "toml",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "proc-macro-crate"
> > > ++version = "1.3.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
> > > ++dependencies = [
> > > ++ "once_cell",
> > > ++ "toml_edit",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "proc-macro-error"
> > > ++version = "1.0.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> > > ++dependencies = [
> > > ++ "proc-macro-error-attr",
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++ "version_check",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "proc-macro-error-attr"
> > > ++version = "1.0.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "version_check",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "proc-macro2"
> > > ++version = "1.0.53"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
> > > ++dependencies = [
> > > ++ "unicode-ident",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "quote"
> > > ++version = "1.0.26"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "rand"
> > > ++version = "0.8.5"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> > > ++dependencies = [
> > > ++ "libc",
> > > ++ "rand_chacha",
> > > ++ "rand_core",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "rand_chacha"
> > > ++version = "0.3.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> > > ++dependencies = [
> > > ++ "ppv-lite86",
> > > ++ "rand_core",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "rand_core"
> > > ++version = "0.6.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> > > ++dependencies = [
> > > ++ "getrandom",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "rayon"
> > > ++version = "1.7.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
> > > ++dependencies = [
> > > ++ "either",
> > > ++ "rayon-core",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "rayon-core"
> > > ++version = "1.11.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
> > > ++dependencies = [
> > > ++ "crossbeam-channel",
> > > ++ "crossbeam-deque",
> > > ++ "crossbeam-utils",
> > > ++ "num_cpus",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "regex"
> > > ++version = "1.7.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
> > > ++dependencies = [
> > > ++ "regex-syntax",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "regex-syntax"
> > > ++version = "0.6.29"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
> > > ++
> > > ++[[package]]
> > > ++name = "ryu"
> > > ++version = "1.0.13"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
> > > ++
> > > ++[[package]]
> > > ++name = "same-file"
> > > ++version = "1.0.6"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> > > ++dependencies = [
> > > ++ "winapi-util",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "scopeguard"
> > > ++version = "1.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> > > ++
> > > ++[[package]]
> > > ++name = "serde"
> > > ++version = "1.0.158"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
> > > ++dependencies = [
> > > ++ "serde_derive",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "serde_bytes"
> > > ++version = "0.11.9"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "serde_derive"
> > > ++version = "1.0.158"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 2.0.8",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "serde_json"
> > > ++version = "1.0.94"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
> > > ++dependencies = [
> > > ++ "itoa",
> > > ++ "ryu",
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "serde_repr"
> > > ++version = "0.1.12"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 2.0.8",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "slab"
> > > ++version = "0.4.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
> > > ++dependencies = [
> > > ++ "autocfg",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "static_assertions"
> > > ++version = "1.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> > > ++
> > > ++[[package]]
> > > ++name = "strum"
> > > ++version = "0.18.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
> > > ++
> > > ++[[package]]
> > > ++name = "strum_macros"
> > > ++version = "0.18.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
> > > ++dependencies = [
> > > ++ "heck",
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "syn"
> > > ++version = "1.0.109"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "unicode-ident",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "syn"
> > > ++version = "2.0.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "unicode-ident",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "system-deps"
> > > ++version = "1.3.2"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
> > > ++dependencies = [
> > > ++ "heck",
> > > ++ "pkg-config",
> > > ++ "strum",
> > > ++ "strum_macros",
> > > ++ "thiserror",
> > > ++ "toml",
> > > ++ "version-compare",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "textwrap"
> > > ++version = "0.16.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
> > > ++
> > > ++[[package]]
> > > ++name = "thiserror"
> > > ++version = "1.0.40"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
> > > ++dependencies = [
> > > ++ "thiserror-impl",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "thiserror-impl"
> > > ++version = "1.0.40"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 2.0.8",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "time"
> > > ++version = "0.3.20"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++ "time-core",
> > > ++ "time-macros",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "time-core"
> > > ++version = "0.1.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
> > > ++
> > > ++[[package]]
> > > ++name = "time-macros"
> > > ++version = "0.2.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
> > > ++dependencies = [
> > > ++ "time-core",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "tinytemplate"
> > > ++version = "1.2.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++ "serde_json",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "tinyvec"
> > > ++version = "1.6.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> > > ++dependencies = [
> > > ++ "tinyvec_macros",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "tinyvec_macros"
> > > ++version = "0.1.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> > > ++
> > > ++[[package]]
> > > ++name = "toml"
> > > ++version = "0.5.11"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "toml_datetime"
> > > ++version = "0.6.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
> > > ++
> > > ++[[package]]
> > > ++name = "toml_edit"
> > > ++version = "0.19.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
> > > ++dependencies = [
> > > ++ "indexmap",
> > > ++ "toml_datetime",
> > > ++ "winnow",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "unicode-bidi"
> > > ++version = "0.3.13"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
> > > ++
> > > ++[[package]]
> > > ++name = "unicode-ident"
> > > ++version = "1.0.8"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
> > > ++
> > > ++[[package]]
> > > ++name = "unicode-normalization"
> > > ++version = "0.1.22"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> > > ++dependencies = [
> > > ++ "tinyvec",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "unicode-segmentation"
> > > ++version = "1.10.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
> > > ++
> > > ++[[package]]
> > > ++name = "url"
> > > ++version = "2.3.1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
> > > ++dependencies = [
> > > ++ "form_urlencoded",
> > > ++ "idna",
> > > ++ "percent-encoding",
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "uuid"
> > > ++version = "1.3.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
> > > ++dependencies = [
> > > ++ "serde",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "version-compare"
> > > ++version = "0.0.10"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
> > > ++
> > > ++[[package]]
> > > ++name = "version_check"
> > > ++version = "0.9.4"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> > > ++
> > > ++[[package]]
> > > ++name = "walkdir"
> > > ++version = "2.3.3"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
> > > ++dependencies = [
> > > ++ "same-file",
> > > ++ "winapi-util",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "wasi"
> > > ++version = "0.11.0+wasi-snapshot-preview1"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> > > ++
> > > ++[[package]]
> > > ++name = "wasm-bindgen"
> > > ++version = "0.2.84"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
> > > ++dependencies = [
> > > ++ "cfg-if",
> > > ++ "wasm-bindgen-macro",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "wasm-bindgen-backend"
> > > ++version = "0.2.84"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
> > > ++dependencies = [
> > > ++ "bumpalo",
> > > ++ "log",
> > > ++ "once_cell",
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++ "wasm-bindgen-shared",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "wasm-bindgen-macro"
> > > ++version = "0.2.84"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
> > > ++dependencies = [
> > > ++ "quote",
> > > ++ "wasm-bindgen-macro-support",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "wasm-bindgen-macro-support"
> > > ++version = "0.2.84"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++ "wasm-bindgen-backend",
> > > ++ "wasm-bindgen-shared",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "wasm-bindgen-shared"
> > > ++version = "0.2.84"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
> > > ++
> > > ++[[package]]
> > > ++name = "web-sys"
> > > ++version = "0.3.61"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
> > > ++dependencies = [
> > > ++ "js-sys",
> > > ++ "wasm-bindgen",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "winapi"
> > > ++version = "0.3.9"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> > > ++dependencies = [
> > > ++ "winapi-i686-pc-windows-gnu",
> > > ++ "winapi-x86_64-pc-windows-gnu",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "winapi-i686-pc-windows-gnu"
> > > ++version = "0.4.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> > > ++
> > > ++[[package]]
> > > ++name = "winapi-util"
> > > ++version = "0.1.5"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
> > > ++dependencies = [
> > > ++ "winapi",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "winapi-x86_64-pc-windows-gnu"
> > > ++version = "0.4.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> > > ++
> > > ++[[package]]
> > > ++name = "winnow"
> > > ++version = "0.4.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
> > > ++dependencies = [
> > > ++ "memchr",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "zvariant"
> > > ++version = "3.12.0"
> > > ++dependencies = [
> > > ++ "arrayvec",
> > > ++ "byteorder",
> > > ++ "chrono",
> > > ++ "criterion",
> > > ++ "enumflags2",
> > > ++ "glib",
> > > ++ "libc",
> > > ++ "rand",
> > > ++ "serde",
> > > ++ "serde_bytes",
> > > ++ "serde_json",
> > > ++ "serde_repr",
> > > ++ "static_assertions",
> > > ++ "time",
> > > ++ "url",
> > > ++ "uuid",
> > > ++ "zvariant_derive",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "zvariant_derive"
> > > ++version = "3.12.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
> > > ++dependencies = [
> > > ++ "proc-macro-crate 1.3.1",
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++ "zvariant_utils",
> > > ++]
> > > ++
> > > ++[[package]]
> > > ++name = "zvariant_utils"
> > > ++version = "1.0.0"
> > > ++source = "registry+https://github.com/rust-lang/crates.io-index"
> > > ++checksum =
> "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
> > > ++dependencies = [
> > > ++ "proc-macro2",
> > > ++ "quote",
> > > ++ "syn 1.0.109",
> > > ++]
> > > +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
> > > +index 45367729..6981862a 100644
> > > +--- a/zvariant/Cargo.toml
> > > ++++ b/zvariant/Cargo.toml
> > > +@@ -27,7 +27,7 @@ byteorder = "1.4.3"
> > > + serde = { version = "1.0", features = ["derive"] }
> > > + arrayvec = { version = "0.7.2", features = ["serde"], optional =
> true }
> > > + enumflags2 = { version = "0.7.5", features = ["serde"], optional =
> true }
> > > +-zvariant_derive = { version = "=3.12.0", path = "../zvariant_derive"
> }
> > > ++zvariant_derive = "3.12.0"
> > > + serde_bytes = { version = "0.11", optional = true }
> > > + static_assertions = "1.1.0"
> > > + libc = "0.2.137"
> > > +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> > > +deleted file mode 120000
> > > +index ea5b6064..00000000
> > > +--- a/zvariant/LICENSE
> > > ++++ /dev/null
> > > +@@ -1 +0,0 @@
> > > +-../LICENSE
> > > +\ No newline at end of file
> > > +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> > > +new file mode 100644
> > > +index 00000000..31aa7938
> > > +--- /dev/null
> > > ++++ b/zvariant/LICENSE
> > > +@@ -0,0 +1,23 @@
> > > ++Permission is hereby granted, free of charge, to any
> > > ++person obtaining a copy of this software and associated
> > > ++documentation files (the "Software"), to deal in the
> > > ++Software without restriction, including without
> > > ++limitation the rights to use, copy, modify, merge,
> > > ++publish, distribute, sublicense, and/or sell copies of
> > > ++the Software, and to permit persons to whom the Software
> > > ++is furnished to do so, subject to the following
> > > ++conditions:
> > > ++
> > > ++The above copyright notice and this permission notice
> > > ++shall be included in all copies or substantial portions
> > > ++of the Software.
> > > ++
> > > ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
> > > ++ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
> > > ++TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
> > > ++PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> > > ++SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > > ++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> > > ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
> > > ++IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > > ++DEALINGS IN THE SOFTWARE.
> > > +--
> > > +2.34.1
> > > +
> > > diff --git a/meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb b/meta-selftest/recipes-extended/zvariant/
> zvariant_3.12.0.bb
> > > new file mode 100644
> > > index 0000000000..4fe327ae07
> > > --- /dev/null
> > > +++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> > > @@ -0,0 +1,26 @@
> > > +SUMMARY = "Provides API for encoding/decoding of data to/from D-Bus
> wire format"
> > > +DESCRIPTION = "This crate provides API for encoding/decoding of data
> to/from D-Bus wire format.\
> > > +This binary wire format is simple and very efficient and hence useful
> outside of D-Bus context as well.\
> > > +A modified form of this format, GVariant is very commonly used for
> efficient storage of arbitrary \
> > > +data and is also supported by this crate."
> > > +HOMEPAGE = "https://gitlab.freedesktop.org/dbus/zbus/"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=b377b220f43d747efdec40d69fcaa69d"
> > > +
> > > +SRC_URI = " \
> > > +    git://
> gitlab.freedesktop.org/dbus/zbus;protocol=https;branch=main;subpath=zvariant
> \
> > > +    file://0001-Tweak-zvariant-crate-config.patch;striplevel=2 \
> > > +"
> > > +
> > > +SRCREV = "07506776fab5f58e029760bb4b288f670c7eecd6"
> > > +S = "${WORKDIR}/zvariant"
> > > +
> > > +python do_clean_lic_file_symlink() {
> > > +    bb.utils.remove("LICENCE")
> > > +}
> > > +
> > > +addtask clean_lic_file_symlink after do_unpack before do_patch
> > > +
> > > +inherit cargo cargo-update-recipe-crates
> > > +
> > > +require ${BPN}-crates.inc
> > > diff --git a/meta/lib/oeqa/selftest/cases/devtool.py
> b/meta/lib/oeqa/selftest/cases/devtool.py
> > > index 81d02017c1..94873fd19f 100644
> > > --- a/meta/lib/oeqa/selftest/cases/devtool.py
> > > +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> > > @@ -848,6 +848,99 @@ class DevtoolModifyTests(DevtoolBase):
> > >          # Try building
> > >          bitbake(testrecipe)
> > >
> > > +    def test_devtool_modify_git_crates_subpath(self):
> > > +        # This tests two things in devtool context:
> > > +        #   - that we support local git dependencies for cargo based
> recipe
> > > +        #   - that we support patches in SRC_URI when git url
> contains subpath parameter
> > > +
> > > +        # Check preconditions:
> > > +        #    recipe inherits cargo
> > > +        #    git:// uri with a subpath as the main package
> > > +        #    some crate:// in SRC_URI
> > > +        #    others git:// in SRC_URI
> > > +        #    cointains a patch
> > > +        testrecipe = 'zvariant'
> > > +        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR',
> 'CARGO_HOME'], testrecipe)
> > > +        recipefile = bb_vars['FILE']
> > > +        workdir = bb_vars['WORKDIR']
> > > +        cargo_home = bb_vars['CARGO_HOME']
> > > +        src_uri = bb_vars['SRC_URI'].split()
> > > +        self.assertTrue(src_uri[0].startswith('git://'),
> > > +                        'This test expects the %s recipe to have a
> git repo has its main uri' % testrecipe)
> > > +        self.assertIn(';subpath=', src_uri[0],
> > > +                      'This test expects the %s recipe to have a git
> uri with subpath' % testrecipe)
> > > +        self.assertTrue(any([uri.startswith('crate://') for uri in
> src_uri]),
> > > +                        'This test expects the %s recipe to have some
> crates in its src uris' % testrecipe)
> > > +        self.assertGreater(sum(map(lambda x:x.startswith('git://'),
> src_uri)), 2,
> > > +                           'This test expects the %s recipe to have
> several git:// uris' % testrecipe)
> > > +        self.assertTrue(any([uri.startswith('file://') and '.patch'
> in uri for uri in src_uri]),
> > > +                        'This test expects the %s recipe to have a
> patch in its src uris' % testrecipe)
> > > +
> > > +        self._test_recipe_contents(recipefile, {}, ['cargo'])
> > > +
> > > +        # Clean up anything in the workdir/sysroot/sstate cache
> > > +        bitbake('%s -c cleansstate' % testrecipe)
> > > +        # Try modifying a recipe
> > > +        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
> > > +        self.track_for_cleanup(tempdir)
> > > +        self.track_for_cleanup(self.workspacedir)
> > > +        self.add_command_to_tearDown('bitbake -c clean %s' %
> testrecipe)
> > > +        self.add_command_to_tearDown('bitbake-layers remove-layer
> */workspace')
> > > +        result = runCmd('devtool modify %s -x %s' % (testrecipe,
> tempdir))
> > > +        self.assertExists(os.path.join(tempdir, 'Cargo.toml'),
> 'Extracted source could not be found')
> > > +        self.assertExists(os.path.join(self.workspacedir, 'conf',
> 'layer.conf'), 'Workspace directory not created. devtool output: %s' %
> result.output)
> > > +        matches = glob.glob(os.path.join(self.workspacedir,
> 'appends', 'zvariant_*.bbappend'))
> > > +        self.assertTrue(matches, 'bbappend not created')
> > > +        # Test devtool status
> > > +        result = runCmd('devtool status')
> > > +        self.assertIn(testrecipe, result.output)
> > > +        self.assertIn(tempdir, result.output)
> > > +        # Check git repo
> > > +        self._check_src_repo(tempdir)
> > > +        # Check that the patch is correctly applied
> > > +        # last commit message in the tree must contain
> > > +        # %% original patch: <patchname>
> > > +        # ..
> > > +        patchname = None
> > > +        for uri in src_uri:
> > > +            if uri.startswith('file://') and '.patch' in uri:
> > > +                patchname = uri.replace("file://",
> "").partition('.patch')[0] + '.patch'
> > > +        self.assertIsNotNone(patchname)
> > > +        result = runCmd('git -C %s log -1' % tempdir)
> > > +        self.assertIn("%%%% original patch: %s" % patchname,
> result.output)
> > > +
> > > +        # Configure the recipe to check that the git dependencies are
> correctly patched in cargo config
> > > +        bitbake('-c configure %s' % testrecipe)
> > > +
> > > +        cargo_config_path = os.path.join(cargo_home, 'config')
> > > +        with open(cargo_config_path, "r") as f:
> > > +            cargo_config_contents = [line.strip('\n') for line in
> f.readlines()]
> > > +
> > > +        # Get back git dependencies of the recipe (ignoring the main
> one)
> > > +        # and check that they are all correctly patched to be fetched
> locally
> > > +        git_deps = [uri for uri in src_uri if
> uri.startswith("git://")][1:]
> > > +        for git_dep in git_deps:
> > > +            raw_url, _, raw_parms = git_dep.partition(";")
> > > +            parms = {}
> > > +            for parm in raw_parms.split(";"):
> > > +                name_parm, _, value_parm = parm.partition('=')
> > > +                parms[name_parm]=value_parm
> > > +            self.assertIn('protocol', parms, 'git dependencies uri
> should contain the "protocol" parameter')
> > > +            self.assertIn('name', parms, 'git dependencies uri should
> contain the "name" parameter')
> > > +            self.assertIn('destsuffix', parms, 'git dependencies uri
> should contain the "destsuffix" parameter')
> > > +            self.assertIn('type', parms, 'git dependencies uri should
> contain the "type" parameter')
> > > +            self.assertEqual(parms['type'], 'git-dependency', 'git
> dependencies uri should have "type=git-dependency"')
> > > +            raw_url = raw_url.replace("git://", '%s://' %
> parms['protocol'])
> > > +            patch_line = '[patch."%s"]' % raw_url
> > > +            path_patched = os.path.join(workdir, parms['destsuffix'])
> > > +            path_override_line = '%s = { path = "%s" }' %
> (parms['name'], path_patched)
> > > +            # Would have been better to use tomllib to read this file
> :/
> > > +            self.assertIn(patch_line, cargo_config_contents)
> > > +            self.assertIn(path_override_line, cargo_config_contents)
> > > +
> > > +        # Try to package the recipe
> > > +        bitbake('-c package_qa %s' % testrecipe)
> > > +
> > >      def test_devtool_modify_localfiles(self):
> > >          # Check preconditions
> > >          testrecipe = 'lighttpd'
> > > --
> > > 2.34.1
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#179290):
> https://lists.openembedded.org/g/openembedded-core/message/179290
> > > Mute This Topic: https://lists.openembedded.org/mt/97931116/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000041d97605f81afd49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What version of bitbake you had pulled ?<div>Because &quot=
;mandatory checksum on crates&quot; is a patch I submitted two weeks ago (<=
a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/20230317=
081916.1857201-2-frederic.martinsons@gmail.com/">https://patchwork.yoctopro=
ject.org/project/bitbake/patch/20230317081916.1857201-2-frederic.martinsons=
@gmail.com/</a>))</div><div>and it is not yet merged in bitbake master nor =
in poky master.</div><div><br></div><div>So I construct the present series =
without these patches in mind since it is not related.</div><div>I you plan=
 to merge the previous series, I can update the zvariant for this recipe of=
 course</div><div>it can be done by issuing &quot;bitbake -c update_crates =
zvariant&quot; if this patch (<a href=3D"https://patchwork.yoctoproject.org=
/project/bitbake/patch/20230316121249.28209-1-frederic.martinsons@gmail.com=
/">https://patchwork.yoctoproject.org/project/bitbake/patch/20230316121249.=
28209-1-frederic.martinsons@gmail.com/</a>) is present</div><div><br></div>=
<div>I&#39;m sorry, I must admit that I&#39;m kinda lost with the patch sub=
mission process when it impacts multiple different</div><div>projects.</div=
><div>Can you advise on the way of doing this?</div><div><br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
30 Mar 2023 at 11:14, Alexandre Belloni &lt;<a href=3D"mailto:alexandre.bel=
loni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 30/03/2023 11:03:25+0200,=
 Alexandre Belloni wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; Because I4m carrying your other series, this fails with:<br>
&gt; <br>
&gt; ERROR: zvariant-3.12.0-r0 do_fetch: No checksum specified for &#39;/sr=
v/autobuilder/<a href=3D"http://autobuilder.yocto.io/current_sources/anes-0=
.1.6.crate" rel=3D"noreferrer" target=3D"_blank">autobuilder.yocto.io/curre=
nt_sources/anes-0.1.6.crate</a>&#39;, please add at least one to the recipe=
:<br>
&gt; SRC_URI[anes.sha256sum] =3D &quot;4b46cbb362ab8752921c97e041f5e366ee62=
97bd428a31275b9fcf1e380f7299&quot;<br>
&gt; ERROR: zvariant-3.12.0-r0 do_fetch: Bitbake Fetcher Error: NoChecksumE=
rror(&#39;Missing SRC_URI checksum&#39;, &#39;<a href=3D"https://crates.io/=
api/v1/crates/anes/0.1.6/download" rel=3D"noreferrer" target=3D"_blank">htt=
ps://crates.io/api/v1/crates/anes/0.1.6/download</a>&#39;)<br>
&gt; <br>
&gt; I think I&#39;ll fix it locally but we&#39;ll need to come up with a p=
lan when<br>
&gt; merging.<br>
<br>
Actually, could you handle the list of checksum? It is quite long.<br>
<br>
&gt; <br>
&gt; On 29/03/2023 17:30:34+0200, Frederic Martinsons wrote:<br>
&gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinso=
ns@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; This recipe is for showing a &quot;real world&quot; example of<br=
>
&gt; &gt; a crate that depends on some git repositories.<br>
&gt; &gt; <br>
&gt; &gt; Usually, this kind of crate is built within a global<br>
&gt; &gt; workspace (here it is the zbus project) and so<br>
&gt; &gt; doesn&#39;t need a Cargo.lock on its own.<br>
&gt; &gt; <br>
&gt; &gt; For the sake of the demonstration, I had to tweak things<br>
&gt; &gt; a little to be able to compile zvariant in standalone<br>
&gt; &gt; (no relative path in dependency, no symlink to LICENSE<br>
&gt; &gt; provide a Cargo.lock)<br>
&gt; &gt; <br>
&gt; &gt; The use case where the crate had some git repository<br>
&gt; &gt; in dependency is very common for &quot;private&quot; crate that<b=
r>
&gt; &gt; are not aimed to be published on <a href=3D"http://crates.io" rel=
=3D"noreferrer" target=3D"_blank">crates.io</a>.<br>
&gt; &gt; When the project grow bigger, it is common to have<br>
&gt; &gt; a bin and multiple lib developped in parallel, and these<br>
&gt; &gt; libs are surely on a git repostitory.<br>
&gt; &gt; <br>
&gt; &gt; A test case have been also added to check for:<br>
&gt; &gt;=C2=A0 =C2=A0- the previous patch about git subpath parameter and =
devtool<br>
&gt; &gt;=C2=A0 =C2=A0- the correctness of overriding dependencies (first p=
atch of the<br>
&gt; &gt; series)<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic=
.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&=
gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../zvariant/zvariant-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 140 ++<br>
&gt; &gt;=C2=A0 .../0001-Tweak-zvariant-crate-config.patch=C2=A0 =C2=A0 | 1=
292 +++++++++++++++++<br>
&gt; &gt;=C2=A0 .../zvariant/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
&gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A093 ++<br>
&gt; &gt;=C2=A0 4 files changed, 1551 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-selftest/recipes-extended/zvariant/=
zvariant-crates.inc<br>
&gt; &gt;=C2=A0 create mode 100644 meta-selftest/recipes-extended/zvariant/=
zvariant/0001-Tweak-zvariant-crate-config.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta-selftest/recipes-extended/zvariant/=
<a href=3D"http://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">=
zvariant_3.12.0.bb</a><br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-cra=
tes.inc b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..41f50b1b0c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc=
<br>
&gt; &gt; @@ -0,0 +1,140 @@<br>
&gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anes/0.1.6" re=
l=3D"noreferrer" target=3D"_blank">crates.io/anes/0.1.6</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.70"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/anyhow/1.0.70</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/arrayvec/0.7.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/arrayvec/0.7.2</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.14" r=
el=3D"noreferrer" target=3D"_blank">crates.io/atty/0.2.14</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.12.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/bumpalo/3.12.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/1.4.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/byteorder/1.4.3</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cast/0.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/cast/0.3.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.24"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/chrono/0.4.24</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium-io/0.=
2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ciborium-io/0.2.0</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium-ll/0.=
2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ciborium-ll/0.2.0</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium/0.2.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/ciborium/0.2.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/3.2.23" r=
el=3D"noreferrer" target=3D"_blank">crates.io/clap/3.2.23</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_lex/0.2.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/clap_lex/0.2.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/criterion-plot=
/0.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/criterion-plot/0.5.0=
</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/criterion/0.4.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/criterion/0.4.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-chan=
nel/0.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel=
/0.5.7</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-dequ=
e/0.8.3" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8=
.3</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoc=
h/0.9.14" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.=
9.14</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-util=
s/0.8.15" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.=
8.15</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.8.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/either/1.8.1</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2/0.7=
.5" rel=3D"noreferrer" target=3D"_blank">crates.io/enumflags2/0.7.5</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2_der=
ive/0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/enumflags2_derive=
/0.7.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencode=
d/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/form_urlencoded/1.1=
.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-channe=
l/0.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-channel/0.=
3.27</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-core/0=
.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-core/0.3.27</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-execut=
or/0.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-executor/=
0.3.27</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-macro/=
0.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-macro/0.3.27=
</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-task/0=
.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-task/0.3.27</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-util/0=
.3.27" rel=3D"noreferrer" target=3D"_blank">crates.io/futures-util/0.3.27</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.=
8" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.8</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/half/1.8.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/half/1.8.2</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.12=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/hashbrown/0.12.3</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.3.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/heck/0.3.3</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.1=
.19" rel=3D"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.1.19</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.2=
.6" rel=3D"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.2.6</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/0.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/idna/0.3.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/1.9.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/indexmap/1.9.2</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.10=
.5" rel=3D"noreferrer" target=3D"_blank">crates.io/itertools/0.10.5</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.9.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/itertools/0.9.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.6" re=
l=3D"noreferrer" target=3D"_blank">crates.io/itoa/1.0.6</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.61"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/js-sys/0.3.61</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.=
4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.140" =
rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.140</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.17" re=
l=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.17</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.5.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.5.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.8.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.8.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.=
1.45" rel=3D"noreferrer" target=3D"_blank">crates.io/num-integer/0.1.45</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2=
.15" rel=3D"noreferrer" target=3D"_blank">crates.io/num-traits/0.2.15</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.15.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/num_cpus/1.15.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.17=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.17.1</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/oorandom/11.1.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/oorandom/11.1.3</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/os_str_bytes/6=
.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/os_str_bytes/6.5.0</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encodi=
ng/2.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/percent-encoding/2=
.2.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-project-li=
te/0.2.9" rel=3D"noreferrer" target=3D"_blank">crates.io/pin-project-lite/0=
.2.9</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-utils/0.1.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/pin-utils/0.1.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3=
.26" rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.26</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters-backe=
nd/0.3.4" rel=3D"noreferrer" target=3D"_blank">crates.io/plotters-backend/0=
.3.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters-svg/0=
.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/plotters-svg/0.3.3</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters/0.3.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/plotters/0.3.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2=
.17" rel=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.17</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-cra=
te/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-crate/0=
.1.5</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-cra=
te/1.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-crate/1=
.3.1</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-err=
or-attr/1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-er=
ror-attr/1.0.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-err=
or/1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-error/1=
.0.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.=
0.53" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.53</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.26" =
rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.26</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.5" re=
l=3D"noreferrer" target=3D"_blank">crates.io/rand/0.8.5</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.=
3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.=
4" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.6.4</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon-core/1.1=
1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rayon-core/1.11.0</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon/1.7.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/rayon/1.7.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0=
.6.29" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-syntax/0.6.29</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.7.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/regex/1.7.2</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.13" re=
l=3D"noreferrer" target=3D"_blank">crates.io/ryu/1.0.13</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.=
6" rel=3D"noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.158"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.158</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_bytes/0.=
11.9" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_bytes/0.11.9</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1=
.0.158" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.158=
</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0=
.94" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.94</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_repr/0.1=
.12" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_repr/0.1.12</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/slab/0.4.8" re=
l=3D"noreferrer" target=3D"_blank">crates.io/slab/0.4.8</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/static_asserti=
ons/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/static_assertions=
/1.1.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum/0.18.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/strum/0.18.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum_macros/0=
.18.0" rel=3D"noreferrer" target=3D"_blank">crates.io/strum_macros/0.18.0</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.109" r=
el=3D"noreferrer" target=3D"_blank">crates.io/syn/1.0.109</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.8" rel=
=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.8</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/system-deps/1.=
3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/system-deps/1.3.2</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/textwrap/0.16.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/textwrap/0.16.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl=
/1.0.40" rel=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.=
40</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.=
40" rel=3D"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.40</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time-core/0.1.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/time-core/0.1.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time-macros/0.=
2.8" rel=3D"noreferrer" target=3D"_blank">crates.io/time-macros/0.2.8</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.3.20" r=
el=3D"noreferrer" target=3D"_blank">crates.io/time/0.3.20</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinytemplate/1=
.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/tinytemplate/1.2.1</a>=
 \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec/1.6.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/tinyvec/1.6.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec_macros=
/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/tinyvec_macros/0.1.1=
</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.5.11" r=
el=3D"noreferrer" target=3D"_blank">crates.io/toml/0.5.11</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_datetime/=
0.6.1" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_datetime/0.6.1</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_edit/0.19=
.8" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_edit/0.19.8</a> \<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-bidi/0=
.3.13" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-bidi/0.3.13</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/=
1.0.8" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.8</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-normal=
ization/0.1.22" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-norm=
alization/0.1.22</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-segmen=
tation/1.10.1" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-segme=
ntation/1.10.1</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.3.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/url/2.3.1</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/uuid/1.3.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version-compar=
e/0.0.10" rel=3D"noreferrer" target=3D"_blank">crates.io/version-compare/0.=
0.10</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/=
0.9.4" rel=3D"noreferrer" target=3D"_blank">crates.io/version_check/0.9.4</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.3.3"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/walkdir/2.3.3</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.0+wa=
si-snapshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0=
.11.0+wasi-snapshot-preview1</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-b=
ackend/0.2.84" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-=
backend/0.2.84</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-m=
acro-support/0.2.84" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bi=
ndgen-macro-support/0.2.84</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-m=
acro/0.2.84" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-ma=
cro/0.2.84</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-s=
hared/0.2.84" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-s=
hared/0.2.84</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0=
.2.84" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2.84</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/web-sys/0.3.61=
" rel=3D"noreferrer" target=3D"_blank">crates.io/web-sys/0.3.61</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc=
-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i=
686-pc-windows-gnu/0.4.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.=
1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.5</a> \=
<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-=
pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi=
-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" =
rel=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winnow/0.4.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/winnow/0.4.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_deriv=
e/3.12.0" rel=3D"noreferrer" target=3D"_blank">crates.io/zvariant_derive/3.=
12.0</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_utils=
/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/zvariant_utils/1.0.0=
</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/glib;pro=
tocol=3Dhttps;nobranch=3D1;name=3Dglib;destsuffix=3Dglib;type=3Dgit-depende=
ncy" rel=3D"noreferrer" target=3D"_blank">github.com/gtk-rs/glib;protocol=
=3Dhttps;nobranch=3D1;name=3Dglib;destsuffix=3Dglib;type=3Dgit-dependency</=
a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/sys;prot=
ocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsuffix=3Dglib-sys;subpath=3Dg=
lib-sys;type=3Dgit-dependency" rel=3D"noreferrer" target=3D"_blank">github.=
com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsuffix=3Dg=
lib-sys;subpath=3Dglib-sys;type=3Dgit-dependency</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/sys;prot=
ocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;destsuffix=3Dgobject-sys;subpa=
th=3Dgobject-sys;type=3Dgit-dependency" rel=3D"noreferrer" target=3D"_blank=
">github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;de=
stsuffix=3Dgobject-sys;subpath=3Dgobject-sys;type=3Dgit-dependency</a> \<br=
>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV_FORMAT .=3D &quot;_glib&quot;<br>
&gt; &gt; +SRCREV_glib =3D &quot;c9ee583cea07830c099cdcccd33eda9ef705ea93&q=
uot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV_FORMAT .=3D &quot;_glib-sys&quot;<br>
&gt; &gt; +SRCREV_glib-sys =3D &quot;5f35e26c65d24f8f018f643218de0f5807ba5f=
01&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV_FORMAT .=3D &quot;_gobject-sys&quot;<br>
&gt; &gt; +SRCREV_gobject-sys =3D &quot;5f35e26c65d24f8f018f643218de0f5807b=
a5f01&quot;<br>
&gt; &gt; diff --git a/meta-selftest/recipes-extended/zvariant/zvariant/000=
1-Tweak-zvariant-crate-config.patch b/meta-selftest/recipes-extended/zvaria=
nt/zvariant/0001-Tweak-zvariant-crate-config.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..ac6c5117bb<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak=
-zvariant-crate-config.patch<br>
&gt; &gt; @@ -0,0 +1,1292 @@<br>
&gt; &gt; +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martins=
ons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Thu, 23 Mar 2023 07:12:37 +0100<br>
&gt; &gt; +Subject: [PATCH] Tweak zvariant crate config<br>
&gt; &gt; +<br>
&gt; &gt; +This library crate is a part of zbus project, and is aimed to<br=
>
&gt; &gt; +be published amongst the whole project.<br>
&gt; &gt; +<br>
&gt; &gt; +Nevertheless, this recipe is for showing example of real<br>
&gt; &gt; +code which uses a local registry via git url inside yocto<br>
&gt; &gt; +environment.<br>
&gt; &gt; +<br>
&gt; &gt; +I didn&#39;t find a real example of binary crate that uses git<b=
r>
&gt; &gt; +dependency but it seems to me a very common use case<br>
&gt; &gt; +when we are working on multiple local crates that are not<br>
&gt; &gt; +aimed to be published on public registry.<br>
&gt; &gt; +<br>
&gt; &gt; +Long story short, this patch add a modified Cargo.toml<br>
&gt; &gt; +to use the zvariant_derive dependency from <a href=3D"http://cra=
tes.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a> instead<br>
&gt; &gt; +of zbus local one and a pre generated Cargo.lock in order<br>
&gt; &gt; +to make cargo patch process inside cargo_common.bbclass work<br>
&gt; &gt; +<br>
&gt; &gt; +It also copied the LICENCE file from zbus project instead<br>
&gt; &gt; +of symlink to it.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Inappropriate<br>
&gt; &gt; +Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederi=
c.martinsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>=
&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + zvariant/Cargo.lock | 1198 ++++++++++++++++++++++++++++++++++++=
+++++++<br>
&gt; &gt; + zvariant/Cargo.toml |=C2=A0 =C2=A0 2 +-<br>
&gt; &gt; + zvariant/LICENSE=C2=A0 =C2=A0 |=C2=A0 =C2=A024 +-<br>
&gt; &gt; + 3 files changed, 1222 insertions(+), 2 deletions(-)<br>
&gt; &gt; + create mode 100644 zvariant/Cargo.lock<br>
&gt; &gt; + mode change 120000 =3D&gt; 100644 zvariant/LICENSE<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock<br>
&gt; &gt; +new file mode 100644<br>
&gt; &gt; +index 00000000..02a83d42<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/zvariant/Cargo.lock<br>
&gt; &gt; +@@ -0,0 +1,1198 @@<br>
&gt; &gt; ++# This file is automatically @generated by Cargo.<br>
&gt; &gt; ++# It is not intended for manual editing.<br>
&gt; &gt; ++version =3D 3<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;anes&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.6&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;4b46cbb362ab8752921c97e041f5e366ee6297bd428a=
31275b9fcf1e380f7299&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;anyhow&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.70&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;7de8ce5e0f9f8d88245311066a578d72b7af3e7088f3=
2783804676302df237e4&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;arrayvec&quot;<br>
&gt; &gt; ++version =3D &quot;0.7.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b2=
54f5e980de8ea54454d6&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;atty&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.14&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;d9b39be18770d11421cdb1b9947a45dd3f37e93092cb=
f377614828a319d5fee8&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;hermit-abi 0.1.19&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;winapi&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;autocfg&quot;<br>
&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f=
55e3529ffa43161b97fa&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;bitflags&quot;<br>
&gt; &gt; ++version =3D &quot;1.3.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8=
f4fdc18d06fb1037718a&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;bumpalo&quot;<br>
&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0d261e256854913907f67ed06efbc3338dfe6179796d=
eefc1ff763fc1aee5535&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;byteorder&quot;<br>
&gt; &gt; ++version =3D &quot;1.4.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;14c189c53d098945499cdfa7ecc63567cf3886b3332b=
312a5b4585d8d3a6a610&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;cast&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b=
612598138befd7b37eb5&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;cfg-if&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53=
b4efbf79117bd2da40fd&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;chrono&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.24&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;4e3c5919066adf22df73762e50cffcde3a758f2a848b=
113b586d1f86728b673b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;num-integer&quot;,<br>
&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;ciborium&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;b0c137568cc60b904a7724001b35ce2630fd00d5d848=
05fbb608ab89509d788f&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;ciborium-io&quot;,<br>
&gt; &gt; ++ &quot;ciborium-ll&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;ciborium-io&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;346de753af073cc87b52b2083a506b38ac176a44cfb0=
5497b622e27be899b369&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;ciborium-ll&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;213030a2b5a4e0c0892b6652260cf6ccac84827b83a8=
5a534e178e3906c4cf1b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;ciborium-io&quot;,<br>
&gt; &gt; ++ &quot;half&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;clap&quot;<br>
&gt; &gt; ++version =3D &quot;3.2.23&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f=
7023ad47c144e4e473a5&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;bitflags&quot;,<br>
&gt; &gt; ++ &quot;clap_lex&quot;,<br>
&gt; &gt; ++ &quot;indexmap&quot;,<br>
&gt; &gt; ++ &quot;textwrap&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;clap_lex&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d0=
10345776f952765261c5&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;os_str_bytes&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;criterion&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1=
b8a49fd70de6412654cb&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;anes&quot;,<br>
&gt; &gt; ++ &quot;atty&quot;,<br>
&gt; &gt; ++ &quot;cast&quot;,<br>
&gt; &gt; ++ &quot;ciborium&quot;,<br>
&gt; &gt; ++ &quot;clap&quot;,<br>
&gt; &gt; ++ &quot;criterion-plot&quot;,<br>
&gt; &gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt; &gt; ++ &quot;lazy_static&quot;,<br>
&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt; &gt; ++ &quot;oorandom&quot;,<br>
&gt; &gt; ++ &quot;plotters&quot;,<br>
&gt; &gt; ++ &quot;rayon&quot;,<br>
&gt; &gt; ++ &quot;regex&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++ &quot;serde_derive&quot;,<br>
&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt; &gt; ++ &quot;tinytemplate&quot;,<br>
&gt; &gt; ++ &quot;walkdir&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;criterion-plot&quot;<br>
&gt; &gt; ++version =3D &quot;0.5.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;6b50826342786a51a89e2da3a28f1c32b06e387201bc=
2d19791f622c673706b1&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cast&quot;,<br>
&gt; &gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;crossbeam-channel&quot;<br>
&gt; &gt; ++version =3D &quot;0.5.7&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;cf2b3e8478797446514c91ef04bafcb59faba183e621=
ad488df88983cc14128c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;crossbeam-deque&quot;<br>
&gt; &gt; ++version =3D &quot;0.8.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ce6fd6f855243022dcecf8702fef0c297d4338e22684=
5fe067f6341ad9fa0cef&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-epoch&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;crossbeam-epoch&quot;<br>
&gt; &gt; ++version =3D &quot;0.9.14&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295=
c4a9edb08e819dcf5695&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; &gt; ++ &quot;memoffset&quot;,<br>
&gt; &gt; ++ &quot;scopeguard&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;crossbeam-utils&quot;<br>
&gt; &gt; ++version =3D &quot;0.8.15&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e=
8470c29b3359b346984b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;either&quot;<br>
&gt; &gt; ++version =3D &quot;1.8.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c=
230ca9d6d1ae31f16d91&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;enumflags2&quot;<br>
&gt; &gt; ++version =3D &quot;0.7.5&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e75d4cd21b95383444831539909fbb14b9dc3fdceb2a=
6f5d36577329a1f55ccb&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;enumflags2_derive&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;enumflags2_derive&quot;<br>
&gt; &gt; ++version =3D &quot;0.7.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f58dc3c5e468259f19f2d46304a6b28f1c3d034442e1=
4b322d2b850e36f6d5ae&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;form_urlencoded&quot;<br>
&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;a9c384f161156f5260c24a097c56119f9be8c798586a=
ecc13afbcbe7b7e26bf8&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;percent-encoding&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-channel&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f93=
39346e8daf15963cf7ac&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-core&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;86d7a0c1aa76363dac491de0ee99faf6941128376f1c=
f96f07db7603b7de69dd&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-executor&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1997dd9df74cdac935c76252744c1ed5794fac083242=
ea4fe77ef3ed60ba0f83&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt; &gt; ++ &quot;futures-util&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-macro&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;3eb14ed937631bd8b8b8977f2c198443447a8355b6e3=
ca599f38c975e5a963b6&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-task&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;fd65540d33b37b16542a0438c12e6aeead10d4ac5d05=
bd3f805b8f35ab592879&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;futures-util&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;3ef6b17e481503ec85211fed8f39d1970f128935ca1f=
814cd32ac4a6842e84ab&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt; &gt; ++ &quot;futures-macro&quot;,<br>
&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt; &gt; ++ &quot;pin-project-lite&quot;,<br>
&gt; &gt; ++ &quot;pin-utils&quot;,<br>
&gt; &gt; ++ &quot;slab&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;getrandom&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;c05aeb6a22b8f62540c194aac980f2115af067bfe15a=
0734d7277a768d396b31&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;wasi&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;glib&quot;<br>
&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; &gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/glib?=
rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee=
583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;bitflags&quot;,<br>
&gt; &gt; ++ &quot;futures-channel&quot;,<br>
&gt; &gt; ++ &quot;futures-core&quot;,<br>
&gt; &gt; ++ &quot;futures-executor&quot;,<br>
&gt; &gt; ++ &quot;futures-task&quot;,<br>
&gt; &gt; ++ &quot;futures-util&quot;,<br>
&gt; &gt; ++ &quot;glib-macros&quot;,<br>
&gt; &gt; ++ &quot;glib-sys&quot;,<br>
&gt; &gt; ++ &quot;gobject-sys&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;glib-macros&quot;<br>
&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; &gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/glib?=
rev=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee=
583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;anyhow&quot;,<br>
&gt; &gt; ++ &quot;heck&quot;,<br>
&gt; &gt; ++ &quot;itertools 0.9.0&quot;,<br>
&gt; &gt; ++ &quot;proc-macro-crate 0.1.5&quot;,<br>
&gt; &gt; ++ &quot;proc-macro-error&quot;,<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;glib-sys&quot;<br>
&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; &gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/sys#5=
f35e26c65d24f8f018f643218de0f5807ba5f01" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01</=
a>&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;system-deps&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;gobject-sys&quot;<br>
&gt; &gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; &gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/sys#5=
f35e26c65d24f8f018f643218de0f5807ba5f01" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01</=
a>&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;glib-sys&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;system-deps&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;half&quot;<br>
&gt; &gt; ++version =3D &quot;1.8.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;eabb4a44450da02c90444cf74558da904edde8fb4e90=
35a9a6a4e15445af0bd7&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;hashbrown&quot;<br>
&gt; &gt; ++version =3D &quot;0.12.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;8a9ee70c43aaf417c914396645a0fa852624801b24eb=
b7ae78fe8272889ac888&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;heck&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;6d621efb26863f0e9924c6ac577e8275e5e6b77455db=
64ffa6c65c904e9e132c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;unicode-segmentation&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.19&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;62b467343b94ba476dcb2500d242dadbb39557df8893=
10ac77c5d99100aaac33&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.6&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e3=
9b601ef3e3f47d1ae4c7&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;idna&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e14ddfc70884202db2244c223200c204c2bda1bc6e09=
98d11b5e024d657209e6&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;unicode-bidi&quot;,<br>
&gt; &gt; ++ &quot;unicode-normalization&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;indexmap&quot;<br>
&gt; &gt; ++version =3D &quot;1.9.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1885e79c1fc4b10f0e172c475f458b7f7b93061064d9=
8c3293e98c5ba0c8b399&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++ &quot;hashbrown&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;itertools&quot;<br>
&gt; &gt; ++version =3D &quot;0.9.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;284f18f85651fe11e8a991b2adb42cb078325c996ed0=
26d994719efcfca1d54b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;either&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;itertools&quot;<br>
&gt; &gt; ++version =3D &quot;0.10.5&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;b0fd2260e829bddf4cb6ea802289de2f86d6a7a69019=
2fbe91b3f46e0f2c8473&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;either&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;itoa&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.6&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf=
077f12ac6d3e94164ca6&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;js-sys&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.61&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;445dde2150c55e483f3d8416706b97ec8e8237c307e5=
b7b4b8dd15e6af2a0730&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;lazy_static&quot;<br>
&gt; &gt; ++version =3D &quot;1.4.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e2abad23fbc42b3700f2f279844dc832adb2b2eb069b=
2df918f455c4e18cc646&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;libc&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.140&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e1=
6fb6fb3ea2ed6095f80c&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;log&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.17&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;abb12e687cfb44aa40f41fc3978ef76448f9b6038cad=
6aef4259d3c095a2382e&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;memchr&quot;<br>
&gt; &gt; ++version =3D &quot;2.5.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;2dffe52ecf27772e601905b7522cb4ef790d2cc20348=
8bbd0e2fe85fcb74566d&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;memoffset&quot;<br>
&gt; &gt; ++version =3D &quot;0.8.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3e=
a7ae39fcc186108b8de1&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;num-integer&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.45&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;225d3389fb3509a24c93f5c29eb6bde2586b98d9f016=
636dff58d7c6f7569cd9&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;num-traits&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.15&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;578ede34cf02f8924ab9447f50c28075b4d3e5b26997=
2345e7e0372b38c6cdcd&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;num_cpus&quot;<br>
&gt; &gt; ++version =3D &quot;1.15.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781=
bf03a16cd9ac8697593b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;hermit-abi 0.2.6&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;once_cell&quot;<br>
&gt; &gt; ++version =3D &quot;1.17.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;b7e5500299e16ebb147ae15a00a942af264cf3688f47=
923b8fc2cd5858f23ad3&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;oorandom&quot;<br>
&gt; &gt; ++version =3D &quot;11.1.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb=
1e66b63caa84da26b575&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;os_str_bytes&quot;<br>
&gt; &gt; ++version =3D &quot;6.5.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ceedf44fb00f2d1984b0bc98102627ce622e083e49a5=
bacdb3e514fa4238e267&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;percent-encoding&quot;<br>
&gt; &gt; ++version =3D &quot;2.2.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;478c572c3d73181ff3c2539045f6eb99e5491218eae9=
19370993b890cdbdd98e&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;pin-project-lite&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.9&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e0a7ae3ac2f1173085d398531c705756c94a4c568437=
85df85a60c1a0afac116&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;pin-utils&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e=
7c54f8826aaaf7c9f184&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;pkg-config&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.26&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;6ac9a59f73473f1b8d852421e59e64809f025994837e=
f743615c6d0c5b305160&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;plotters&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;2538b639e642295546c50fcd545198c9d64ee2a38620=
a628724a3b266d5fbf97&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;num-traits&quot;,<br>
&gt; &gt; ++ &quot;plotters-backend&quot;,<br>
&gt; &gt; ++ &quot;plotters-svg&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; &gt; ++ &quot;web-sys&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;plotters-backend&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;193228616381fecdc1224c62e96946dfbc73ff4384fb=
a576e052ff8c1bea8142&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;plotters-svg&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f9a81d2759aae1dae668f783c308bc5c8ebd191ff418=
4aaa1b37f65a6ae5a56f&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;plotters-backend&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;ppv-lite86&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.17&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;5b40af805b3121feab8a3c29f04d8ad262fa8e056188=
3e7653e024ae4479e6de&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;proc-macro-crate&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.5&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1d6ea3c4595b96363c13943497db34af4460fb474a95=
c43f4446ad341b8c9785&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;toml&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;proc-macro-crate&quot;<br>
&gt; &gt; ++version =3D &quot;1.3.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;7f4c021e1093a56626774e81216a4ce732a735e5bad4=
868a03f3ed65ca0c3919&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt; &gt; ++ &quot;toml_edit&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;proc-macro-error&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9=
f9517bea02a73a5ce38c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro-error-attr&quot;,<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++ &quot;version_check&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;proc-macro-error-attr&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;a1be40180e52ecc98ad80b184934baf3d0d29f979574=
e439af5a55274b35f869&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;version_check&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;proc-macro2&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.53&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ba466839c78239c09faf015484e5cc04860f88242cff=
4d03eb038f04b4699b73&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;quote&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.26&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;4424af4bf778aae2051a77b60283332f386554255d72=
2233d09fbfc7e30da2fc&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;rand&quot;<br>
&gt; &gt; ++version =3D &quot;0.8.5&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c=
39049bef581b46327404&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;rand_chacha&quot;,<br>
&gt; &gt; ++ &quot;rand_core&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;rand_chacha&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2d=
bce1eaa8141b9b127d88&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;ppv-lite86&quot;,<br>
&gt; &gt; ++ &quot;rand_core&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;rand_core&quot;<br>
&gt; &gt; ++version =3D &quot;0.6.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a=
7dc3547996c5c816922c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;getrandom&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;rayon&quot;<br>
&gt; &gt; ++version =3D &quot;1.7.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1d2df5196e37bcc87abebc0053e20787d73847bb3313=
4a69841207dd0a47f03b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;either&quot;,<br>
&gt; &gt; ++ &quot;rayon-core&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;rayon-core&quot;<br>
&gt; &gt; ++version =3D &quot;1.11.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab=
01ddba9fc60661aebe8d&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;crossbeam-channel&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-deque&quot;,<br>
&gt; &gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; &gt; ++ &quot;num_cpus&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;regex&quot;<br>
&gt; &gt; ++version =3D &quot;1.7.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;cce168fea28d3e05f158bda4576cf0c844d5045bc2cc=
3620fa0292ed5bb5814c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;regex-syntax&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;regex-syntax&quot;<br>
&gt; &gt; ++version =3D &quot;0.6.29&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f162c6dd7b008981e4d40210aca20b4bd0f9b60ca927=
1061b07f78537722f2e1&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;ryu&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.13&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f91339c0467de62360649f8d3e185ca8de4224ff281f=
66000de5eb2a77a79041&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;same-file&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.6&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1=
b4d7b6b0b68378900502&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;winapi-util&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;scopeguard&quot;<br>
&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1=
d3b748380fb20baa78cd&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;serde&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.158&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;771d4d9c4163ee138805e12c710dd365e4f44be8be05=
03cb1bb9eb989425d9c9&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde_derive&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;serde_bytes&quot;<br>
&gt; &gt; ++version =3D &quot;0.11.9&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;416bda436f9aab92e02c8e10d49a15ddd339cea90b6e=
340fe51ed97abb548294&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;serde_derive&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.158&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e801c1712f48475582b7696ac71e0ca34ebb30e09338=
425384269d9717c62cad&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;serde_json&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.94&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434=
804029839884765d04ea&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;itoa&quot;,<br>
&gt; &gt; ++ &quot;ryu&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;serde_repr&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.12&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;bcec881020c684085e55a25f7fd888954d56609ef363=
479dc5a1305eb0d40cab&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;slab&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;6528351c9bc8ab22353f9d776db39a20288e8d6c37ef=
8cfe3317cf875eecfc2d&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;autocfg&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;static_assertions&quot;<br>
&gt; &gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;a2eb9349b6444b326872e140eb1cf5e7c522154d69e7=
a0ffb0fb81c06b37543f&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;strum&quot;<br>
&gt; &gt; ++version =3D &quot;0.18.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;57bd81eb48f4c437cadc685403cad539345bf703d78e=
63707418431cecd4522b&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;strum_macros&quot;<br>
&gt; &gt; ++version =3D &quot;0.18.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6a=
a9ad04002306f6e2774c&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;heck&quot;,<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;syn&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.109&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;72b64191b275b66ffe2469e8af2c1cfe3bafa67b529e=
ad792a6d0160888b4237&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;syn&quot;<br>
&gt; &gt; ++version =3D &quot;2.0.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba=
4f96c4d1687bdf704ad9&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;unicode-ident&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;system-deps&quot;<br>
&gt; &gt; ++version =3D &quot;1.3.2&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0f3ecc17269a19353b3558b313bba738b25d82993e30=
d62a18406a24aba4649b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;heck&quot;,<br>
&gt; &gt; ++ &quot;pkg-config&quot;,<br>
&gt; &gt; ++ &quot;strum&quot;,<br>
&gt; &gt; ++ &quot;strum_macros&quot;,<br>
&gt; &gt; ++ &quot;thiserror&quot;,<br>
&gt; &gt; ++ &quot;toml&quot;,<br>
&gt; &gt; ++ &quot;version-compare&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;textwrap&quot;<br>
&gt; &gt; ++version =3D &quot;0.16.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e4=
99451fd7d0129c9c7c3d&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;thiserror&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.40&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;978c9a314bd8dc99be594bc3c175faaa9794be04a5a5=
e153caba6915336cebac&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;thiserror-impl&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;thiserror-impl&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.40&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a=
3550d286d5e86720569f&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;time&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.20&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c=
3b92017ebdf4999a5890&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++ &quot;time-core&quot;,<br>
&gt; &gt; ++ &quot;time-macros&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;time-core&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;2e153e1f1acaef8acc537e68b44906d2db6436e2b35a=
c2c6b42640fff91f00fd&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;time-macros&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;fd80a657e71da814b8e5d60d3374fc6d35045062245d=
80224748ae522dd76f36&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;time-core&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;tinytemplate&quot;<br>
&gt; &gt; ++version =3D &quot;1.2.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b5=
5f8e8709b689d939b6bc&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;tinyvec&quot;<br>
&gt; &gt; ++version =3D &quot;1.6.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;87cc5ceb3875bb20c2890005a4e226a4651264a5c75e=
db2421b52861a0a0cb50&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;tinyvec_macros&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;tinyvec_macros&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1f3ccbac311fea05f86f61904b462b55fb3df8837a36=
6dfc601a0161d0532f20&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;toml&quot;<br>
&gt; &gt; ++version =3D &quot;0.5.11&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;f4f7f0dd8d50a853a531c426359045b1998f04219d88=
799810762cd4ad314234&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;toml_datetime&quot;<br>
&gt; &gt; ++version =3D &quot;0.6.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;3ab8ed2edee10b50132aed5f331333428b011c99402b=
5a534154ed15746f9622&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;toml_edit&quot;<br>
&gt; &gt; ++version =3D &quot;0.19.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;239410c8609e8125456927e6707163a3b1fdb40561e4=
b803bc041f466ccfdc13&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;indexmap&quot;,<br>
&gt; &gt; ++ &quot;toml_datetime&quot;,<br>
&gt; &gt; ++ &quot;winnow&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;unicode-bidi&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.13&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;92888ba5573ff080736b3648696b70cafad7d2505511=
75acbaa4e0385b3e1460&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;unicode-ident&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.8&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e5464a87b239f13a63a501f2701565754bae92d243d4=
bb7eb12f6d57d2269bf4&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;unicode-normalization&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.22&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047=
b1d0292cc7b0ce2ba921&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;tinyvec&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;unicode-segmentation&quot;<br>
&gt; &gt; ++version =3D &quot;1.10.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1dd624098567895118886609431a7c3b8f516e41d30e=
0643f03d94592a147e36&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;url&quot;<br>
&gt; &gt; ++version =3D &quot;2.3.1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0d68c799ae75762b8c3fe375feb6600ef5602c883c5d=
21eb51c09f22b83c4643&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;form_urlencoded&quot;,<br>
&gt; &gt; ++ &quot;idna&quot;,<br>
&gt; &gt; ++ &quot;percent-encoding&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;uuid&quot;<br>
&gt; &gt; ++version =3D &quot;1.3.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;1674845326ee10d37ca60470760d4288a6f80f304007=
d92e5c53bab78c9cfd79&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;version-compare&quot;<br>
&gt; &gt; ++version =3D &quot;0.0.10&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb6=
00013837a3d0b3994ca1&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;version_check&quot;<br>
&gt; &gt; ++version =3D &quot;0.9.4&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;49874b5167b65d7193b8aba1567f5c7d93d001cafc34=
600cee003eda787e483f&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;walkdir&quot;<br>
&gt; &gt; ++version =3D &quot;2.3.3&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;36df944cda56c7d8d8b7496af378e6b16de928459191=
7d307c9b4d313c44e698&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;same-file&quot;,<br>
&gt; &gt; ++ &quot;winapi-util&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasi&quot;<br>
&gt; &gt; ++version =3D &quot;0.11.0+wasi-snapshot-preview1&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;9c8d87e72b64a3b4db28d11ce29237c246188f4f5105=
7d65a7eab63b7987e423&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasm-bindgen&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d3=
3594b3df58b2007ca53b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;cfg-if&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen-macro&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasm-bindgen-backend&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;95ce90fd5bcc06af55a641a86428ee4229e44e070339=
63a2290a8e241607ccb9&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;bumpalo&quot;,<br>
&gt; &gt; ++ &quot;log&quot;,<br>
&gt; &gt; ++ &quot;once_cell&quot;,<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen-shared&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasm-bindgen-macro&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;4c21f77c0bedc37fd5dc21f897894a5ca01e7bb15988=
4559461862ae90c0b4c5&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen-macro-support&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasm-bindgen-macro-support&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4=
e32d823066102f35a5f6&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen-backend&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen-shared&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;wasm-bindgen-shared&quot;<br>
&gt; &gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;0046fef7e28c3804e5e38bfa31ea2a0f73905319b677=
e57ebe37e49358989b5d&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;web-sys&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.61&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;e33b99f4b23ba3eec1a53ac264e35a755f00e966e006=
5077d6027c0f575b0b97&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;js-sys&quot;,<br>
&gt; &gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;winapi&quot;<br>
&gt; &gt; ++version =3D &quot;0.3.9&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;5c839a674fcd7a98952e593242ea400abe9399274676=
1e38641405d28b00f419&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;winapi-i686-pc-windows-gnu&quot;,<br>
&gt; &gt; ++ &quot;winapi-x86_64-pc-windows-gnu&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;winapi-i686-pc-windows-gnu&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;ac3b87c63620426dd9b991e5ce0329eff545bccbbb34=
f3be09ff6fb6ab51b7b6&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;winapi-util&quot;<br>
&gt; &gt; ++version =3D &quot;0.1.5&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001=
223f33a334e3ce5de178&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;winapi&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;winapi-x86_64-pc-windows-gnu&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa=
2ca79ec42cfc1931183f&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;winnow&quot;<br>
&gt; &gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb08=
3a305ed5c0c10bb241d1&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;memchr&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;zvariant&quot;<br>
&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;arrayvec&quot;,<br>
&gt; &gt; ++ &quot;byteorder&quot;,<br>
&gt; &gt; ++ &quot;chrono&quot;,<br>
&gt; &gt; ++ &quot;criterion&quot;,<br>
&gt; &gt; ++ &quot;enumflags2&quot;,<br>
&gt; &gt; ++ &quot;glib&quot;,<br>
&gt; &gt; ++ &quot;libc&quot;,<br>
&gt; &gt; ++ &quot;rand&quot;,<br>
&gt; &gt; ++ &quot;serde&quot;,<br>
&gt; &gt; ++ &quot;serde_bytes&quot;,<br>
&gt; &gt; ++ &quot;serde_json&quot;,<br>
&gt; &gt; ++ &quot;serde_repr&quot;,<br>
&gt; &gt; ++ &quot;static_assertions&quot;,<br>
&gt; &gt; ++ &quot;time&quot;,<br>
&gt; &gt; ++ &quot;url&quot;,<br>
&gt; &gt; ++ &quot;uuid&quot;,<br>
&gt; &gt; ++ &quot;zvariant_derive&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;zvariant_derive&quot;<br>
&gt; &gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;34c20260af4b28b3275d6676c7e2a6be0d4332e8e0ab=
a4616d34007fd84e462a&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro-crate 1.3.1&quot;,<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++ &quot;zvariant_utils&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; ++<br>
&gt; &gt; ++[[package]]<br>
&gt; &gt; ++name =3D &quot;zvariant_utils&quot;<br>
&gt; &gt; ++version =3D &quot;1.0.0&quot;<br>
&gt; &gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-la=
ng/crates.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rust-lang/crates.io-index</a>&quot;<br>
&gt; &gt; ++checksum =3D &quot;53b22993dbc4d128a17a3b6c92f1c63872dd67198537=
ee728d8b5d7c40640a8b&quot;<br>
&gt; &gt; ++dependencies =3D [<br>
&gt; &gt; ++ &quot;proc-macro2&quot;,<br>
&gt; &gt; ++ &quot;quote&quot;,<br>
&gt; &gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; &gt; ++]<br>
&gt; &gt; +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml<br>
&gt; &gt; +index 45367729..6981862a 100644<br>
&gt; &gt; +--- a/zvariant/Cargo.toml<br>
&gt; &gt; ++++ b/zvariant/Cargo.toml<br>
&gt; &gt; +@@ -27,7 +27,7 @@ byteorder =3D &quot;1.4.3&quot;<br>
&gt; &gt; + serde =3D { version =3D &quot;1.0&quot;, features =3D [&quot;de=
rive&quot;] }<br>
&gt; &gt; + arrayvec =3D { version =3D &quot;0.7.2&quot;, features =3D [&qu=
ot;serde&quot;], optional =3D true }<br>
&gt; &gt; + enumflags2 =3D { version =3D &quot;0.7.5&quot;, features =3D [&=
quot;serde&quot;], optional =3D true }<br>
&gt; &gt; +-zvariant_derive =3D { version =3D &quot;=3D3.12.0&quot;, path =
=3D &quot;../zvariant_derive&quot; }<br>
&gt; &gt; ++zvariant_derive =3D &quot;3.12.0&quot;<br>
&gt; &gt; + serde_bytes =3D { version =3D &quot;0.11&quot;, optional =3D tr=
ue }<br>
&gt; &gt; + static_assertions =3D &quot;1.1.0&quot;<br>
&gt; &gt; + libc =3D &quot;0.2.137&quot;<br>
&gt; &gt; +diff --git a/zvariant/LICENSE b/zvariant/LICENSE<br>
&gt; &gt; +deleted file mode 120000<br>
&gt; &gt; +index ea5b6064..00000000<br>
&gt; &gt; +--- a/zvariant/LICENSE<br>
&gt; &gt; ++++ /dev/null<br>
&gt; &gt; +@@ -1 +0,0 @@<br>
&gt; &gt; +-../LICENSE<br>
&gt; &gt; +\ No newline at end of file<br>
&gt; &gt; +diff --git a/zvariant/LICENSE b/zvariant/LICENSE<br>
&gt; &gt; +new file mode 100644<br>
&gt; &gt; +index 00000000..31aa7938<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/zvariant/LICENSE<br>
&gt; &gt; +@@ -0,0 +1,23 @@<br>
&gt; &gt; ++Permission is hereby granted, free of charge, to any<br>
&gt; &gt; ++person obtaining a copy of this software and associated<br>
&gt; &gt; ++documentation files (the &quot;Software&quot;), to deal in the<=
br>
&gt; &gt; ++Software without restriction, including without<br>
&gt; &gt; ++limitation the rights to use, copy, modify, merge,<br>
&gt; &gt; ++publish, distribute, sublicense, and/or sell copies of<br>
&gt; &gt; ++the Software, and to permit persons to whom the Software<br>
&gt; &gt; ++is furnished to do so, subject to the following<br>
&gt; &gt; ++conditions:<br>
&gt; &gt; ++<br>
&gt; &gt; ++The above copyright notice and this permission notice<br>
&gt; &gt; ++shall be included in all copies or substantial portions<br>
&gt; &gt; ++of the Software.<br>
&gt; &gt; ++<br>
&gt; &gt; ++THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF=
<br>
&gt; &gt; ++ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED<br>
&gt; &gt; ++TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A<br>
&gt; &gt; ++PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT<br>
&gt; &gt; ++SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY<br>
&gt; &gt; ++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION<br>
&gt; &gt; ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR<br>
&gt; &gt; ++IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
&gt; &gt; ++DEALINGS IN THE SOFTWARE.<br>
&gt; &gt; +-- <br>
&gt; &gt; +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-selftest/recipes-extended/zvariant/<a href=3D"h=
ttp://zvariant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3.1=
2.0.bb</a> b/meta-selftest/recipes-extended/zvariant/<a href=3D"http://zvar=
iant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>=
<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..4fe327ae07<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-selftest/recipes-extended/zvariant/<a href=3D"http://z=
variant_3.12.0.bb" rel=3D"noreferrer" target=3D"_blank">zvariant_3.12.0.bb<=
/a><br>
&gt; &gt; @@ -0,0 +1,26 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Provides API for encoding/decoding of data to/=
from D-Bus wire format&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;This crate provides API for encoding/decod=
ing of data to/from D-Bus wire format.\<br>
&gt; &gt; +This binary wire format is simple and very efficient and hence u=
seful outside of D-Bus context as well.\<br>
&gt; &gt; +A modified form of this format, GVariant is very commonly used f=
or efficient storage of arbitrary \<br>
&gt; &gt; +data and is also supported by this crate.&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/dbu=
s/zbus/" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.or=
g/dbus/zbus/</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db377b220f43d747e=
fdec40d69fcaa69d&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.freedesktop.org/dbu=
s/zbus;protocol=3Dhttps;branch=3Dmain;subpath=3Dzvariant" rel=3D"noreferrer=
" target=3D"_blank">gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps;branc=
h=3Dmain;subpath=3Dzvariant</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://0001-Tweak-zvariant-crate-config.patch;stri=
plevel=3D2 \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV =3D &quot;07506776fab5f58e029760bb4b288f670c7eecd6&quot;<=
br>
&gt; &gt; +S =3D &quot;${WORKDIR}/zvariant&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +python do_clean_lic_file_symlink() {<br>
&gt; &gt; +=C2=A0 =C2=A0 bb.utils.remove(&quot;LICENCE&quot;)<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +addtask clean_lic_file_symlink after do_unpack before do_patch<b=
r>
&gt; &gt; +<br>
&gt; &gt; +inherit cargo cargo-update-recipe-crates<br>
&gt; &gt; +<br>
&gt; &gt; +require ${BPN}-crates.inc<br>
&gt; &gt; diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/o=
eqa/selftest/cases/devtool.py<br>
&gt; &gt; index 81d02017c1..94873fd19f 100644<br>
&gt; &gt; --- a/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; &gt; +++ b/meta/lib/oeqa/selftest/cases/devtool.py<br>
&gt; &gt; @@ -848,6 +848,99 @@ class DevtoolModifyTests(DevtoolBase):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Try building<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(testrecipe)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; +=C2=A0 =C2=A0 def test_devtool_modify_git_crates_subpath(self):<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This tests two things in devtool c=
ontext:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0- that we support loca=
l git dependencies for cargo based recipe<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0- that we support patc=
hes in SRC_URI when git url contains subpath parameter<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check preconditions:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 recipe inherits cargo=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 git:// uri with a sub=
path as the main package<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 some crate:// in SRC_=
URI<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 others git:// in SRC_=
URI<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 cointains a patch<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 testrecipe =3D &#39;zvariant&#39;<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb_vars =3D get_bb_vars([&#39;SRC_UR=
I&#39;, &#39;FILE&#39;, &#39;WORKDIR&#39;, &#39;CARGO_HOME&#39;], testrecip=
e)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipefile =3D bb_vars[&#39;FILE&#39=
;]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir =3D bb_vars[&#39;WORKDIR&#39=
;]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_home =3D bb_vars[&#39;CARGO_HO=
ME&#39;]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri =3D bb_vars[&#39;SRC_URI&#39=
;].split()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(src_uri[0].startswit=
h(&#39;git://&#39;),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;This test expects the %s recipe to have a git rep=
o has its main uri&#39; % testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;;subpath=3D&#39;,=
 src_uri[0],<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;This test expects the %s recipe to have a git uri with s=
ubpath&#39; % testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(any([uri.startswith(=
&#39;crate://&#39;) for uri in src_uri]),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;This test expects the %s recipe to have some crat=
es in its src uris&#39; % testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertGreater(sum(map(lambda x:=
x.startswith(&#39;git://&#39;), src_uri)), 2,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;This test expects the %s recipe to h=
ave several git:// uris&#39; % testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(any([uri.startswith(=
&#39;file://&#39;) and &#39;.patch&#39; in uri for uri in src_uri]),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;This test expects the %s recipe to have a patch i=
n its src uris&#39; % testrecipe)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._test_recipe_contents(recipefil=
e, {}, [&#39;cargo&#39;])<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Clean up anything in the workdir/s=
ysroot/sstate cache<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;%s -c cleansstate&#39; =
% testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Try modifying a recipe<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tempdir =3D tempfile.mkdtemp(prefix=
=3D&#39;devtoolqa&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(tempdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.workspac=
edir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_command_to_tearDown(&#39;bi=
tbake -c clean %s&#39; % testrecipe)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add_command_to_tearDown(&#39;bi=
tbake-layers remove-layer */workspace&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;devtool modif=
y %s -x %s&#39; % (testrecipe, tempdir))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(os.path.join(tempd=
ir, &#39;Cargo.toml&#39;), &#39;Extracted source could not be found&#39;)<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertExists(os.path.join(self.=
workspacedir, &#39;conf&#39;, &#39;layer.conf&#39;), &#39;Workspace directo=
ry not created. devtool output: %s&#39; % result.output)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 matches =3D glob.glob(os.path.join(s=
elf.workspacedir, &#39;appends&#39;, &#39;zvariant_*.bbappend&#39;))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(matches, &#39;bbappe=
nd not created&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test devtool status<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;devtool statu=
s&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(testrecipe, result.out=
put)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(tempdir, result.output=
)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check git repo<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._check_src_repo(tempdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the patch is correctly =
applied<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # last commit message in the tree mu=
st contain<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # %% original patch: &lt;patchname&g=
t;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ..<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 patchname =3D None<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for uri in src_uri:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if uri.startswith(&#39=
;file://&#39;) and &#39;.patch&#39; in uri:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patchnam=
e =3D uri.replace(&quot;file://&quot;, &quot;&quot;).partition(&#39;.patch&=
#39;)[0] + &#39;.patch&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIsNotNone(patchname)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;git -C %s log=
 -1&#39; % tempdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&quot;%%%% original pa=
tch: %s&quot; % patchname, result.output)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Configure the recipe to check that=
 the git dependencies are correctly patched in cargo config<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c configure %s&#39; % =
testrecipe)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_config_path =3D os.path.join(c=
argo_home, &#39;config&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(cargo_config_path, &quot;r=
&quot;) as f:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_config_contents =
=3D [line.strip(&#39;\n&#39;) for line in f.readlines()]<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get back git dependencies of the r=
ecipe (ignoring the main one)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and check that they are all correc=
tly patched to be fetched locally<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 git_deps =3D [uri for uri in src_uri=
 if uri.startswith(&quot;git://&quot;)][1:]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for git_dep in git_deps:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_url, _, raw_parms =
=3D git_dep.partition(&quot;;&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parms =3D {}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for parm in raw_parms.=
split(&quot;;&quot;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name_par=
m, _, value_parm =3D parm.partition(&#39;=3D&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parms[na=
me_parm]=3Dvalue_parm<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;pro=
tocol&#39;, parms, &#39;git dependencies uri should contain the &quot;proto=
col&quot; parameter&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;nam=
e&#39;, parms, &#39;git dependencies uri should contain the &quot;name&quot=
; parameter&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;des=
tsuffix&#39;, parms, &#39;git dependencies uri should contain the &quot;des=
tsuffix&quot; parameter&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&#39;typ=
e&#39;, parms, &#39;git dependencies uri should contain the &quot;type&quot=
; parameter&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(parms=
[&#39;type&#39;], &#39;git-dependency&#39;, &#39;git dependencies uri shoul=
d have &quot;type=3Dgit-dependency&quot;&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raw_url =3D raw_url.re=
place(&quot;git://&quot;, &#39;%s://&#39; % parms[&#39;protocol&#39;])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_line =3D &#39;[p=
atch.&quot;%s&quot;]&#39; % raw_url<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path_patched =3D os.pa=
th.join(workdir, parms[&#39;destsuffix&#39;])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path_override_line =3D=
 &#39;%s =3D { path =3D &quot;%s&quot; }&#39; % (parms[&#39;name&#39;], pat=
h_patched)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Would have been bett=
er to use tomllib to read this file :/<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(patch_li=
ne, cargo_config_contents)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(path_ove=
rride_line, cargo_config_contents)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Try to package the recipe<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c package_qa %s&#39; %=
 testrecipe)<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_devtool_modify_localfiles(self):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check preconditions<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 testrecipe =3D &#39;lighttpd&#3=
9;<br>
&gt; &gt; -- <br>
&gt; &gt; 2.34.1<br>
&gt; &gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#179290): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/179290" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/179290</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/979=
31116/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/97931116/3617179</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.bellon=
i@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000041d97605f81afd49--


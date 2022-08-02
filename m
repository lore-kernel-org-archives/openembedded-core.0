Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D33C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:08:11 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.4013.1659431287294785269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OQBdM6tV;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id f15so5542173uao.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=G/SCd5qBJjzxbAR1OcsHgTDgTQ76r/qhpGUYw9rpJSg=;
        b=OQBdM6tVPOly78GymtmLEg/4T+oE/hF3iiuSNbLi1zzh0XxxdFU663C/1lM0w5fG6P
         Cp3eSHwf55nZn9bAYc3Ml7Tt16YVovXUo97sx7NxHLIIRiUL1BkdS2lpQGSJIcsv49Wp
         gV9IskdxZiYkysaeslJ4m6QDIRwLUvUeABNavKhjgV3GYphsN7iOyIQ29TWfIBTQ/2rv
         nJFGTZPqac3fArAUb1FG8W8fe/9aULFG2RaAptKjBU/hA6YwtkCLshheaM1KMq0sZbpj
         LDKn/lIlFsKhXo20+wtSP7WgyF3GQo+X5+6J0Lv7idBTaj+DiYYW4H2YxwaRjNhypvbt
         DSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=G/SCd5qBJjzxbAR1OcsHgTDgTQ76r/qhpGUYw9rpJSg=;
        b=w6N2YSoZJHe5DQS4kgDTdeFeViRgwIFcWumMBRVXlqZVajXBd8OFhbiKbUxaYp01av
         T6XGPN2XdGkD7NCw1peKuDUJkpLXSnkw+KDN60CJ/g7p19cV50RdZWY4hYXgh3eX1EM3
         XALGnR6XbViSItoe4ur+LWBXdCb/FG2We+85UEaKgCqr+kzQdJOTTyvn37ZxKMh6JkGd
         7ul3ifd90AI1L1lt3hTrgiLwSzOjZEuEKeV4fMUzeueI/SHMYWYW5P8CqrgC9K0omP9B
         ZziN06Wk70hh/LFquZVZ/5kMJy262XwrApOze06SwMK3yyzQnfTFaRSAXlMlTu3XZu/U
         6MuQ==
X-Gm-Message-State: ACgBeo1dN0J6sl9Xmr6qskNn8SM3P/1H3iydsYCyUX1LKGHLVFT2uQbJ
	EXDhL/2600cs02iR9qBdwdTNpxbZYXUzLoZcNGc=
X-Google-Smtp-Source: 
 AA6agR65VOIwkDXy6hBwaSP7J2BgU10UGfbC/fKyil4ampAKKziyJUQ2Lvp6vnGQHtSsWFvVjW6PoemsICTImMIvvAY=
X-Received: by 2002:ab0:38c5:0:b0:383:eed8:dd45 with SMTP id
 l5-20020ab038c5000000b00383eed8dd45mr8747413uaw.11.1659431286294; Tue, 02 Aug
 2022 02:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220802035352.1497111-1-pgowda.cve@gmail.com>
 <20220802103833.0b32b669@booty>
In-Reply-To: <20220802103833.0b32b669@booty>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 2 Aug 2022 14:37:54 +0530
Message-ID: 
 <CALY4986e=cqifcHUNt0buU5+FtHjLju_29SwLhD14rwFd2zU_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 09:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168772

Hi Luca,

There were around 270 testcase failing when "has-elf-tls" has been
enabled while building llvm.
Hence, we had to remove the option to enable the proper working of these tests.
The patch has been tested on Ubuntu and also fedora (using docker image).

Thanks,
Pgowda

On Tue, Aug 2, 2022 at 2:08 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> On Tue,  2 Aug 2022 09:23:52 +0530
> "Pgowda" <pgowda.cve@gmail.com> wrote:
>
> > From: pgowda <pgowda.cve@gmail.com>
> >
> > The patch implements Rust testing framework similar to other selftest,
> > specifically the gcc selftest in OE. It uses the client and server
> > based method to test the binaries for cross-target on the image.
> > The test framework is a wrapper around the Rust build system as ./x.py
> > test.
> > It tests many functionalities of Rust distribution like tools,
> > documentation, libraries, packages, tools, Cargo, Crater etc.
> > Please refer the following link for detailed description of Rust
> > testing:-
> > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> >
> > To support the rust tests in oe-core, the following functions were
> > added:-
> > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> > do_configure(): To generate config.toml
> > do_compile(): To build "remote-test-server" for qemu target image.
> >
> > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> > Normally majority of the testcases are present in major folder "test/"
> > It contributes to more than 80% of the testcases present in Rust test
> > framework. These tests pass as expected on any Rust versions without
> > much fuss. The tests that fail are of less important and contribute to
> > less than 2% of the total testcases. These minor tests are observed to
> > work on some versions and fail on others. They have to be added, ignored
> > or excluded for different versions as per the behavior.
> > These tests have been ignored or excluded in the Rust selftest
> > environment to generate success of completing the testsuite.
> >
> > These tests work in parallel mode even in the skipped test mode as
> > expected. Although the patch to disable tests is large, it is very simple
> > in that it only disables tests. When updating to a newer version of Rust,
> > the patch can usually be ported in a day.
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > ---
> >  meta/classes/rust-target-config.bbclass       |   2 +-
> >  meta/lib/oeqa/selftest/cases/rust.py          |  57 +++
> >  meta/recipes-devtools/rust/rust-testsuite.inc | 164 ++++++
> >  .../rust-testsuite/rust-oe-selftest.patch     | 477 ++++++++++++++++++
> >  .../rust/rust-testsuite_1.62.0.bb             |   3 +
> >  5 files changed, 702 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
> >  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
> >  create mode 100644 meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> >  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.62.0.bb
> >
> > diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
> > index 87b7dee3ed..26dc931971 100644
> > --- a/meta/classes/rust-target-config.bbclass
> > +++ b/meta/classes/rust-target-config.bbclass
> > @@ -344,7 +344,7 @@ def rust_gen_target(d, thing, wd, arch):
> >      tspec['linker-is-gnu'] = True
> >      tspec['linker-flavor'] = "gcc"
> >      tspec['has-rpath'] = True
> > -    tspec['has-elf-tls'] = True
> > +#    tspec['has-elf-tls'] = True
>
> I'm not sure of the meaning of the above change, can you clarify that?
>
> Thanks.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


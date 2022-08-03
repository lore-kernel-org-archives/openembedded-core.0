Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87EEC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:28:43 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web09.9267.1659536921882897489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VXq1lPYb;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id n15so8734894vkk.8;
        Wed, 03 Aug 2022 07:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+nfqJlvxMfFo7eyqwjD0ygxdO/2AkOA+4cgjAIOhApE=;
        b=VXq1lPYbjP5qE1NjQLxa6lGaRn1cgR5aieI1Z+4D0CEhU3KmTnaxPki57TZ69em9hG
         WPwAO5n3EOIJzRFstk2Oi7TJWkV7n4DHiVraECG5sEuvOfKNn7QHABHVnnBODq8cB+yA
         QSf3Sq/IyqeoQ+EtP945ZX5+dg5WY2HIEXyNersxEULu0ccHSFLtD/svWHseMdk9kLiE
         lqVgZTFGEDRcQoaeGkK9Vp6fRvx26/5N32UvHgtnJwvsfjinEGfEuf/mTmVwElA2L9gS
         4Q3knQdDOu+2tKsbcJNvRw9FoEitX73rZHphjT5E5GZj0epIcK3pku6YpqSnK/ABPIOP
         M64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+nfqJlvxMfFo7eyqwjD0ygxdO/2AkOA+4cgjAIOhApE=;
        b=02HMv/HDzor4l0a02TVqcGeml1P7V/Nxn5Fyag+0ZSiQERQEojjXXzHofglQEaW2D+
         SjEwvF7wfruT6esfpJzpaB9IWUk0CpQijCgD3MGVtBufrel5E9sXgGFkiCqVDL/LrTx+
         1iTM1m1oqKvlTrlql6TYTCN6m/dXVOdAGf+DpNeoj/k0vAJl2LVBAvaMnW9fejr6fxQ+
         vYhlKAMPgz2B1cfKciQsxn3S9/xf90qp5jmu8vY2H4+SSonk0ZGs88Ou/Ecre2u/xZql
         YsilYEX5kGDsYN62c6HGav4zKiqm72J7EMGZ9zD32PtxWkSvS2d5e9u2FSn5DDeNaGCj
         1Lwg==
X-Gm-Message-State: ACgBeo3jSJBG2V4grrR5hJv8pNO1CTMrf99oxO/WBhMEWR9GQfDDFEu9
	P6eYrg0WhaDzkcjF+nbcxgDTzKvSvQqfX1VmSe8=
X-Google-Smtp-Source: 
 AA6agR7OE42AxW5FyiUM8RIGmijrVbKhpxeVvk1jizYHwgZcHL7diDVx0H/bA2bJ+Hz5/dMstHAlsLk5p4PmXMEXfZU=
X-Received: by 2002:a05:6122:169d:b0:377:7706:1d30 with SMTP id
 29-20020a056122169d00b0037777061d30mr5680908vkl.33.1659536920934; Wed, 03 Aug
 2022 07:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220802122005.31100-1-pgowda.cve@gmail.com>
 <1707D9665C148D1A.1831@lists.openembedded.org>
 <20220803154310.2cf9862c@booty>
In-Reply-To: <20220803154310.2cf9862c@booty>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 3 Aug 2022 19:58:30 +0530
Message-ID: 
 <CALY4984fqAjM=_D-N9VtPmgknvYNAjY-0NqNjxK3Ahuv9k8g_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org, richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 14:28:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168820

Hi Luca,

Updated the maintainers list and submitted the patch as:-
https://lists.openembedded.org/g/openembedded-core/message/168819

Thanks,
Pgowda

On Wed, Aug 3, 2022 at 7:13 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Pgowda,
>
> On Wed, 3 Aug 2022 15:40:15 +0200
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> > On Tue,  2 Aug 2022 17:50:05 +0530
> > "Pgowda" <pgowda.cve@gmail.com> wrote:
> >
> > > From: pgowda <pgowda.cve@gmail.com>
> > >
> > > The patch implements Rust testing framework similar to other selftest,
> > > specifically the gcc selftest in OE. It uses the client and server
> > > based method to test the binaries for cross-target on the image.
> > > The test framework is a wrapper around the Rust build system as ./x.py
> > > test.
> > > It tests many functionalities of Rust distribution like tools,
> > > documentation, libraries, packages, tools, Cargo, Crater etc.
> > > Please refer the following link for detailed description of Rust
> > > testing:-
> > > https://rustc-dev-guide.rust-lang.org/tests/intro.html#tool-tests
> > >
> > > To support the rust tests in oe-core, the following functions were
> > > added:-
> > > setup_cargo_environment(): Build bootstrap and some early stage tools.
> > > do_rust_setup_snapshot(): Install the snapshot version of rust binaries.
> > > do_configure(): To generate config.toml
> > > do_compile(): To build "remote-test-server" for qemu target image.
> > >
> > > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > > Approximate Number of Tests that FAIL in bitbake environment :- 100-150
> > > Normally majority of the testcases are present in major folder "test/"
> > > It contributes to more than 80% of the testcases present in Rust test
> > > framework. These tests pass as expected on any Rust versions without
> > > much fuss. The tests that fail are of less important and contribute to
> > > less than 2% of the total testcases. These minor tests are observed to
> > > work on some versions and fail on others. They have to be added, ignored
> > > or excluded for different versions as per the behavior.
> > > These tests have been ignored or excluded in the Rust selftest
> > > environment to generate success of completing the testsuite.
> > >
> > > These tests work in parallel mode even in the skipped test mode as
> > > expected. Although the patch to disable tests is large, it is very simple
> > > in that it only disables tests. When updating to a newer version of Rust,
> > > the patch can usually be ported in a day.
> > >
> > > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> >
> > This patch fails because of:
> >
> >   AssertionError:
> >   The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> >   rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.62.0.bb)
> >
> > Some logs:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3917/steps/15/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3866/steps/14/logs/stdio
>
> ...and there is another failure, this time it is an actual build error:
>
> | CMake Error at /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/recipe-sysroot-native/usr/share/cmake-3.23/Modules/CMakeTestCXXCompiler.cmake:62 (message):
> |   The C++ compiler
> |
> |     "/home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/work/core2-64-poky-linux/rust-testsuite/1.62.0-r0/wrapper/build-rust-cxx"
> |
> |   is not able to compile a simple test program.
> |
> |   It fails with the following output:
> |
> [...]
> |     /home/pokybuild/yocto-worker/qemux86-64/build/build-st-789666/tmp/hosttools/ld: cannot find -lstdc++
> |     collect2: error: ld returned 1 exit status
>
> Full log at:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5569/steps/19/logs/stdio
>
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


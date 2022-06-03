Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B0FC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 13:07:27 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.7025.1654261639673890116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 06:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QYsIlkv/;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id 63so7285872vsx.5;
        Fri, 03 Jun 2022 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIBdBTnqVV6Ono7OOkuF8ahKYOiAMjpbRWkJFwukVkU=;
        b=QYsIlkv/1V8mxGY7Sa7cOBX0a1sh8zbzBXpTDo1d8chLiv2fCZkE0uNmGQ7QS4J6f+
         gN7Chy0D2ORYMYcR1WRhXkTEuC2uL9G/YjzQI3kgfmuZfoLw1kYKAddJUvxcknrJGCl2
         XiizPjYVyEV7USm8abj49DmPigIdBWCUJBuS1eOVxZbeEsGErKGHMUihQFlBB2uGE/5L
         JkNP1LepeUVdY7Fg96s6nQENnfhPxkyns92fgdDIObprSIl2q47iQKRwcWF2QXjFAZjb
         SWOikbm6nkvw5IuCICoOMHkitjdnQ8hhhjWmM8nZQsQYYPwznbgA5VDlDr1RRNYQ0ZS7
         4uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIBdBTnqVV6Ono7OOkuF8ahKYOiAMjpbRWkJFwukVkU=;
        b=B96nZY4CCRVTiWX3MPMokyRY9p26SZ0/R/9GeD/COuOAqdviqd929zmUYO4y2egCpZ
         VdKrzPoh8cZ3nRx7EPe1UvZcqK7n2ADlxq8K2lB7jw+AzdhmHJ8pCBUjA6z3HUD3BsXu
         8w7YDjWrPDBpjeRZ4egJFFqxjeuvwQkyZSFM9ff2E3Cbl2ivEH8FEqhuGCD3h/6sr/Nm
         oNz0+dTdT+3FREAsXxjGX4tew2WihSpkqxUvUJ5B3MAzRqN7QAb34c9Xc0//Oyor71An
         5QPZAT2mfzvl56gmUuL9dmBGM3MxfU25XneKCgSM4b79uSw7Pr1UUUPkAZXQXLLq8vIw
         ojfA==
X-Gm-Message-State: AOAM53395VkL2OJJDvRZuinbZ4+SjXeX8Kb3EceSRMoY+DgG7/sZVwuW
	PRn9I7GnFsshGFSFA82nLKtpZguvaC7zxo3777E=
X-Google-Smtp-Source: 
 ABdhPJyMbXKsxntTVNKPNwzCGlFUGWrBuxv2sM1/EiB67x4a8opvLAV3/8+9Cw0xTzAC5YxWvfW7JPrqNxenJ9N93X4=
X-Received: by 2002:a05:6102:3562:b0:34b:9e99:1bfa with SMTP id
 bh2-20020a056102356200b0034b9e991bfamr75147vsb.51.1654261638764; Fri, 03 Jun
 2022 06:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220524225603.50d60963@melee>
 <20220525043258.8949-1-pgowda.cve@gmail.com>
 <16F24A16BC7F056F.12338@lists.openembedded.org>
 <20220531150529.705390b9@melee>
In-Reply-To: <20220531150529.705390b9@melee>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 3 Jun 2022 18:37:07 +0530
Message-ID: 
 <CALY4986aY-X5V2-fcOU+3bovF=kB9t7Uvrh8b_rcqH-pQE9J-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 13:07:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166520

Hi Luca,

Regarding the issue
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14818

I ran the Oe-Selftest for Rust as well as completed packages and did
not come across any issues.
a@yow-fedora-builder1 build]$ uname -a
Linux yow-fedora-builder1 5.16.18-200.fc35.x86_64 #1 SMP PREEMPT Mon
Mar 28 14:10:07 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

The log of tests can be seen as follows:-
The command used to run the test was as mentioned in the Bugzilla.
oe-selftest -a -t machine -t toolchain-system -j 15

test_libatomic: PASSED (113.76s)
2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
gcc.GccLibGompSelfTestSystemEmulated.test_libgomp: PASSED (637.21s)
2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
gcc.GccLibItmSelfTestSystemEmulated.test_libitm: PASSED (133.31s)
2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
gcc.GccLibStdCxxSelfTestSystemEmulated.test_libstdcxx: PASSED
(2546.63s)
2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
gcc.GxxCrossSelfTestSystemEmulated.test_cross_gxx: PASSED (744.56s)
2022-06-03 08:39:19,084 - oe-selftest - INFO - RESULTS -
glibc.GlibcSelfTestSystemEmulated.test_glibc: PASSED (1101.43s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: PASSED (54.33s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_can_compile_c_program: PASSED (0.19s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
meta_ide.MetaIDE.test_meta_ide_had_installed_meta_ide_support: PASSED
(0.01s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
runqemu.QemuTest.test_qemu_can_shutdown: PASSED (45.98s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
rust.RustSelfTestSystemEmulated.test_rust: PASSED (8381.70s)
2022-06-03 08:39:19,085 - oe-selftest - INFO - RESULTS -
gcc.GccLibSspSelfTestSystemEmulated.test_libssp: SKIPPED (3.92s)
2022-06-03 08:39:22,336 - oe-selftest - INFO - SUMMARY:
2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest () - Ran 16
tests in 19613.479s
2022-06-03 08:39:22,336 - oe-selftest - INFO - oe-selftest - OK - All
required tests passed (successes=15, skipped=1, failures=0, errors=0)

I also ran the Rust Oe-Selftest individually and did not find any issues.
Can you please share the environment file so that I can reproduce and
fix the issue?

Thanks,
Pgowda

On Tue, May 31, 2022 at 6:35 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Pgowda,
>
> Il giorno Wed, 25 May 2022 09:57:48 +0200
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=bootlin.com@lists.openembedded.org> ha scritto:
>
> > Pgowda,
> >
> > Il giorno Tue, 24 May 2022 21:32:58 -0700
> > "Pgowda" <pgowda.cve@gmail.com> ha scritto:
> >
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
> > > do_rust_setup_snapshot(): Install the snapshot version of rust
> > > binaries. do_configure(): To generate config.toml
> > > do_compile(): To build "remote-test-server" for qemu target image.
> > >
> > > Approximate Number of Tests Run in the Rust Testsuite :- 18000
> > > Approximate Number of Tests that FAIL in bitbake environment :-
> > > 100-150 Normally majority of the testcases are present in major
> > > folder "test/" It contributes to more than 80% of the testcases
> > > present in Rust test framework. These tests pass as expected on any
> > > Rust versions without much fuss. The tests that fail are of less
> > > important and contribute to less than 2% of the total testcases.
> > > These minor tests are observed to work on some versions and fail on
> > > others. They have to be added, ignored or excluded for different
> > > versions as per the behavior. These tests have been ignored or
> > > excluded in the Rust selftest environment to generate success of
> > > completing the testsuite.
> > >
> > > These tests work in parallel mode even in the skipped test mode as
> > > expected. Although the patch to disable tests is large, it is very
> > > simple in that it only disables tests. When updating to a newer
> > > version of Rust, the patch can usually be ported in a day.
> > >
> > > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > > Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc      |   1 +
> > >  meta/lib/oeqa/selftest/cases/rust.py          |  57 +++
> > >  meta/recipes-devtools/rust/rust-common.inc    |   1 -
> > >  meta/recipes-devtools/rust/rust-testsuite.inc | 163 +++++++
> > >  .../rust-testsuite/rust-oe-selftest.patch     | 417
> > > ++++++++++++++++++ .../rust/rust-testsuite_1.60.0.bb             |
> > > 3 + 6 files changed, 641 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
> > >  create mode 100644 meta/recipes-devtools/rust/rust-testsuite.inc
> > >  create mode 100644
> > > meta/recipes-devtools/rust/rust-testsuite/rust-oe-selftest.patch
> > > create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.60.0.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc
> > > b/meta/conf/distro/include/maintainers.inc index
> > > 3990d1d507..cecb02b1c6 100644 ---
> > > a/meta/conf/distro/include/maintainers.inc +++
> > > b/meta/conf/distro/include/maintainers.inc @@ -719,6 +719,7 @@
> > > RECIPE_MAINTAINER:pn-rust-crosssdk-${SDK_ARCH}-glibc = "Randy MacLeod
> > > <Randy.Mac
> > > RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> > > "Randy MacLeod <Randy.MacLeod@windriver.com>"
> > > RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod
> > > <Randy.MacLeod@windriver.com>" RECIPE_MAINTAINER:pn-rust-llvm =
> > > "Randy MacLeod <Randy.MacLeod@windriver.com>"
> > > +RECIPE_MAINTAINER:pn-rust-testsuite = "Randy MacLeod
> > > <Randy.MacLeod@windriver.com>"
> > > RECIPE_MAINTAINER:pn-rust-tools-cross-canadian-${TRANSLATED_TARGET_ARCH}
> > > = "Randy MacLeod <Randy.MacLeod@windriver.com>"
> > > RECIPE_MAINTAINER:pn-rxvt-unicode = "Unassigned
> > > <unassigned@yoctoproject.org>" RECIPE_MAINTAINER:pn-sato-screenshot =
> > > "Ross Burton <ross.burton@arm.com>" diff --git
> > > a/meta/lib/oeqa/selftest/cases/rust.py
> > > b/meta/lib/oeqa/selftest/cases/rust.py new file mode 100644 index
> > > 0000000000..a37e3e37c5 --- /dev/null +++
> > > b/meta/lib/oeqa/selftest/cases/rust.py @@ -0,0 +1,57 @@ +#
> > > SPDX-License-Identifier: MIT +import os +import subprocess +from
> > > oeqa.core.decorator import OETestTag +from oeqa.core.case import
> > > OEPTestResultTestCase +from oeqa.selftest.case import
> > > OESelftestTestCase +from oeqa.utils.commands import runCmd, bitbake,
> > > get_bb_var, get_bb_vars, runqemu, Command +from oeqa.utils.sshcontrol
> > > import SSHControl + +# Total time taken for testing is of about 2hr
> > > 20min, with PARALLEL_MAKE set to 40 number of jobs. +class
> > > RustSelfTestBase(OESelftestTestCase, OEPTestResultTestCase): +
> > > +       def run_check_emulated(self, *args, **kwargs):
> > > +               # build remote-test-server before image build
> >
> > Weird indentation here, 7 spaces for level 1, 15 for level 2... v5 had
> > a much cleaner tab-based indentation. Is it possible that you
> > manipulated the patch manually? It's a bad idea, I hurt myself a few
> > times when I used to do that! :) I recommend using plain 'git
> > format-patch' / 'git send-email'.
> >
> > You should resend with a 4-spaces indentation, which is the Python
> > standard. However I'm taking the patch anyway for testing, so it's
> > more efficient if you just wait for the test results before resending,
> > so you can also include any bugfixes (if needed) in your next iteration.
>
> In addition to the above comments, this patch is causing intermittent
> failures, as noted on this bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14818
>
> So far it has failed only when building on CentOS and Fedora hosts.
> Hopefully this will help you reproduce and fix the problem.
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


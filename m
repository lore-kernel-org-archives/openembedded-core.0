Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAD9C25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 10:15:19 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web09.5361.1659694510324468315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 03:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q8umZYrm;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id q191so1024876vkb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6i6/Hgo3rb2e0JOO8SyqpYOUVhLWrOpYIJEuDo6Bp9Q=;
        b=Q8umZYrmctgZYKk+6LxSCLefFd2iGShK8FoKCcfwkPFSWlgZBdGMnB5qq9z3eZPTBD
         yQoBbc9xIKfd3hgLcBINrF1imyqqwxv6k/ono+w6gVSZAGiSTzd5/VYmFy0fXfa9TRl2
         HSnQzNTd5++FEAeVF98cDqvqbYyEat5/K6F0pLPw+T5IuzYDg6ARziYsRlPOm8mK0LFD
         4MfIXqxexBwui4QE3eDTDffnxb/kbGUQKVDu3kKETk9gpmNPJpOHNsThi4idxNOHFgn8
         mu+FdObiM2PJdYcqcHhaTf2WQWSK/szxktz0ip1km8Zfa7C3W81eU6rm2ZmgXpDAwoD4
         6e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6i6/Hgo3rb2e0JOO8SyqpYOUVhLWrOpYIJEuDo6Bp9Q=;
        b=P+GAG/ihFn3vCk33Bxjqp1VxsyBpqxoJjurAZZD62/YsUOTInm1Q7gcTYEEBnLFiOu
         1AqxoTvpEtEJG845atzcPmdwJu6esbbRxCoxaymMRa4nw+P9jVMaKWTJBLWAbNU9/VXu
         Vgu5W6i3k82xQ/d6BCPuzsvWLDB90+bGnjze/fZActAW3G0/ZkTDPkiv1OUSZ99U8ENW
         jnKJJu5XgdgAIZfIbgZiDM1dUR4lL/icf8iSKn/czTb7QJKN/5QGl8pG4lHLT0TZde2Y
         ZsmC7PgVRBu4+CFrSaVA4ci7z5Gf54iIPBF9HYyaE+C1ZggN3qyAp4mo7Uas98YxE+X2
         6dZw==
X-Gm-Message-State: ACgBeo1XLFBu2zj4x8ZODaS7hTJXC/+atyZKANJvCUqo7Hajy2ri8whb
	TkYaGkdHGg2gRu77Bs3C+E0X+U7hhjdfprz8WmU=
X-Google-Smtp-Source: 
 AA6agR50zrsafuLlgo2aC69aAMHDl42H/YWtk8v1icC06xQTkaZR2pQh1C0wXgiijyB7ew/793ERAln45kzSB3IE+a4=
X-Received: by 2002:a1f:9896:0:b0:374:a380:f7bc with SMTP id
 a144-20020a1f9896000000b00374a380f7bcmr2761774vke.15.1659694509288; Fri, 05
 Aug 2022 03:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220803142734.2877-1-pgowda.cve@gmail.com>
 <20220805091248.0e83b7f0@booty>
In-Reply-To: <20220805091248.0e83b7f0@booty>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 5 Aug 2022 15:45:00 +0530
Message-ID: 
 <CALY4987JxDvHj24HceUb2kt8rdG-2z0W-fogYNdVCTE3r1iibg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 10:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168932

Hi Luca,

Thanks for the update.
The issue is due to the requirement of libstdc++ in rust-1.62.
It was not the same with 1.61 and earlier.
It requires the installation of libstdc++ in the host machine.
Can you please let us know whether it should be fixed in rust-testsuite
or can they be installed in the host machine as a prerequisite for rust-1.62??

Thanks,
Pgowda

On Fri, Aug 5, 2022 at 12:42 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hello Pgowda,
>
> On Wed,  3 Aug 2022 19:57:34 +0530
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
>
>
> This patch triggers the same error I had reported for v7:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5588/steps/18/logs/stdio
>
> https://lists.openembedded.org/g/openembedded-core/message/168816
>
> Can please try to reproduce the issue locally, to ensure you can
> investigate it?
>
>
> Also, when sending a new version, don't forget to add a short changelog
> as suggested by Randy:
> https://lists.openembedded.org/g/openembedded-core/message/168821
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


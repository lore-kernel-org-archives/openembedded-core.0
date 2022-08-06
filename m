Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E54C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 14:57:25 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web08.3973.1659797838129447659
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 07:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ip5nMOZi;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id w129so2506072vkg.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=NpssSIg63ojPxRS+3y3wWHdwQSD8TdzOsACqaQ4EWy8=;
        b=Ip5nMOZiN1DEVX8RBOTekmG83YLhp6gieRhmdiUkXIBoNFQYRzXq5At13MkevVuBRA
         5YPsGRwJaEr7l30HfXuI9oBvwenXTnOcdk7RAHgd6vpoQW8/PjZaNktzhngAJZDN73v/
         bN/I0jbkrwLSDl8uvLcwqNStIDDpqbWUkQ2Ogmi0T1ihhl5Ia3e99R2hZiNlFOsJYGMf
         0yfekWgfOdOvRfmteLAiOnGnBeOUO9HCZDsmrSY53bKa4iQSWlEW/j1io3We9Wut9E6V
         SKJaynBJAMQx1RUgWppY4rqMsaHSSo4k48Sig7Kp7lioSh5HgKXoTOPXcRb+5O+G80k5
         CIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=NpssSIg63ojPxRS+3y3wWHdwQSD8TdzOsACqaQ4EWy8=;
        b=iLxzGD2LmHnngS3KIH5/nDlsQin7wr/AY8ypbQv53xP3OH9N0UPPDwYIJLEqaCq24J
         F4mEyCKItTJEETNoOWjNXkgpTYQpZ3ObWfc0Eb44w0zw+E4Mqpyn3UsYcSYk77SKwtj6
         RDXsRWgLMSko3bCy4v4v3LWBfMLPXLco9eSm7wPrpgmMSr1vZR2Xm3Czg8NWYoMj3v0G
         I2TKTaq1xvOp3L639Gg90rgm3J9WNMafxR9RIJAA3Yatdqn2YOW41eFLz8Dxyf8RnuJ0
         ojxfpC57d8SuXbFB+85dcBS20zgSDBrLD9HIUSuTBysyoDtTi8ZM14Heua3ijXgKP9is
         QbuQ==
X-Gm-Message-State: ACgBeo07iIi25RntOFOs4+Gu9Kkyzaxh2epUy8WSodnFo9nsoAEXmTQu
	2vSuwA/eA6Sb1emXJfVo8tTAnCNzxC8wCoLXC00=
X-Google-Smtp-Source: 
 AA6agR5sSUHe+hb3FPca9imryVh1DQFUTghtdqMw5t9bt45yHzzO2tft0KhWc122ZDv3OPrvzCtrtQOrOsvhjgngQxk=
X-Received: by 2002:a1f:9896:0:b0:374:a380:f7bc with SMTP id
 a144-20020a1f9896000000b00374a380f7bcmr5215643vke.15.1659797837141; Sat, 06
 Aug 2022 07:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220803142734.2877-1-pgowda.cve@gmail.com>
 <20220805091248.0e83b7f0@booty>
In-Reply-To: <20220805091248.0e83b7f0@booty>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Sat, 6 Aug 2022 20:27:06 +0530
Message-ID: 
 <CALY4986O=5sJd66JTxLjSmREA5x2pj7RyZ8ZWuUfgNZxPrBP9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] Rust Oe-Selftest implementation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 14:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168975

Hi Luca,

Thanks for informing me about the error.
The patch has been updated to fix the libstdc++ environment issue as
reported by you.
https://lists.openembedded.org/g/openembedded-core/message/168974

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


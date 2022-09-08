Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5DECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 07:06:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.2382.1662620783328185412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HFKGK3hO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 186-20020a1c02c3000000b003b26feb5c6bso955502wmc.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=8dVkUi3gYa+4qqdCs9Q++15m0TPhDIxXWiPIOKL6qgM=;
        b=HFKGK3hOSeWr0fCYJr+9BElfxU/hh4VxIykvB0LTtEvdhDqgl8dtnAw/AtBp0Asn+L
         4tbnh0/vpjUhmynWfvkk+w3AFZo81lxMeBlBcUYw7iF5PPdRzSRnkKob/pgRzR61BeW0
         Q9cXgvW228RmCAFDhsRGqQQ80dm2iU/JmerjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=8dVkUi3gYa+4qqdCs9Q++15m0TPhDIxXWiPIOKL6qgM=;
        b=cQxEz4yBp2d1WjJCemG08L0jgLASBceysu1gzZcFf0EALlzPaxP3ctuuGU6Ep3CcRt
         vQhgEX7+lYaeT6kMb798BdurxzYC3zRkGWb+xhwWYz/wJyxFQ4/HP9TAkION7l47FgYG
         lpbzO+VKg4gWjdsSDTLw3H1BMj3rX0rzrClKHKXcjAxxJT3vnOnStdFhk09xicDBtoy4
         zRAW0e75kodf5pW2byYy0QNBDjkcZe7v5bVRn6T1UKohpc6WnW6WuPsqQueuzYCPsK7h
         NGd5hk4K/zwCXlGVIkisNkjfSWHXXqs6JUMHnj3Zpl1SxU8mfG7MK6BvucHCg4QENGIs
         JoKQ==
X-Gm-Message-State: ACgBeo2AJKQbsS/KJfULSbBDbtUDyM5/fB2iA8MJdHnfKChIm/YSLqzS
	5REPZqn+fE5oiIXdWsnmiukKWQ==
X-Google-Smtp-Source: 
 AA6agR7Ujhy8xycxT5cXml4dhAiL0GMpz7COQ048jtn3+9aAuu5inNfgKTwFp0HhU3YBVhcXPDQXHg==
X-Received: by 2002:a05:600c:17d0:b0:3a6:8235:504e with SMTP id
 y16-20020a05600c17d000b003a68235504emr1111272wmo.58.1662620781585;
        Thu, 08 Sep 2022 00:06:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb2f:2689:d815:bfce?
 ([2001:8b0:aba:5f3c:fb2f:2689:d815:bfce])
        by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003a54d610e5fsm1861277wmq.26.2022.09.08.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 00:06:21 -0700 (PDT)
Message-ID: 
 <e753b255ee9b312db11f0341c12d3e6d3d766bb2.camel@linuxfoundation.org>
Subject: Re: [PATCH v11] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda.cve@gmail.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Vinay Kumar <vinay.m.engg@gmail.com>
Date: Thu, 08 Sep 2022 08:06:19 +0100
In-Reply-To: <20220907145741.4131-1-pgowda.cve@gmail.com>
References: <20220907145741.4131-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 07:06:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170453

On Wed, 2022-09-07 at 20:27 +0530, pgowda.cve@gmail.com wrote:
> From: pgowda <pgowda.cve@gmail.com>
>=20
> The patch implements Rust testing framework similar to other selftest,
> specifically the gcc selftest in OE. It uses the client and server
> based method to test the binaries for cross-target on the image.
> The test framework is a wrapper around the Rust build system as ./x.py
> test. It tests many functionalities of Rust distribution like tools,
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
>=20
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/rust.py          |  54 ++
>  meta/recipes-devtools/rust/rust-source.inc    |   3 +-
>  meta/recipes-devtools/rust/rust.inc           |   1 +
>  .../rust/rust/rust-oe-selftest.patch          | 508 ++++++++++++++++++
>  meta/recipes-devtools/rust/rust_1.63.0.bb     |   5 +
>  5 files changed, 570 insertions(+), 1 deletion(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/rust.py
>  create mode 100644 meta/recipes-devtools/rust/rust/rust-oe-selftest.patc=
h

I ran this through some testing on the autobuilder. The first time was
ok, it only ran on qemux86 and qemux86-64 as it was only enabled for
toolchain-system but ran successfully.=C2=A0

On the second run I added @OETestTag("toolchain-user") as well which
meant it ran for arm/mips/powerpc. It looks like there was one worrying
intermittent failure:

qemux86-64 intermittent issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5788/step=
s/19/logs/stdio

and then some arch specific failures:

qemuppc failed in the test:
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5790/step=
s/19/logs/stdio

qemumips64 failed in the test:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/5786/step=
s/20/logs/stdio

qemumips failed in the test:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5804/step=
s/20/logs/stdio

qemuarm64, qemuarm and qemux86 passed on this run.

We need to understand and fix that qemux86-64 intermittent issue before
this can merge. I wasn't sure what we want to do with mips and ppc.

Cheers,

Richard



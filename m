Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A41ECAAA1
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 21:56:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.30452.1662415012734677830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 14:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gX3+eRzF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id k9so12896058wri.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=a2vgOy1xAIywJavIT7q42w2CgVg9YurHzb88q/0fRSo=;
        b=gX3+eRzF9pX5Ch778Y0niiys3ATE37PbphLc3+4Bc7nXNLxO2RfEKm0AohyOvOvIEl
         ITT3H+dn447dFswl8EUIp93uYe77MDLgtBVty2Qow4eC2HDoItQSgFKpBqoxRHBQgPug
         BrsjDpl1jZIIxign3dEGjQtY6S5jMqIKbbU/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=a2vgOy1xAIywJavIT7q42w2CgVg9YurHzb88q/0fRSo=;
        b=f7+VN+ErV8hShzBAL3I4amRgKryT9iS7a469qUzf9pi7Q4ZIbVYLhMgNAstsEg6DhH
         Q/BN2wwiRCvVp31dBX9Z6GXjNTAjmh7Q1/cQWjF4YxBWL+9RLFnp5X2DI2R0SEkogKIt
         PSEs9VTOcj5bGAiDO5ZGXXLJXGXO94OER2EeXIblxyXt8E/5XQq//qUjv8H+UQUPFNxm
         3zKJ2TKjTOyrqvsmEJv4IG2i9KqhqSPxlCwPDhJfElrUnhc3HL8SXHMH4Nf7+ppufpzE
         KGQCjguW1Rua81OAR2UVZzJ7lsfJonUnCsQtf7dtGEqO6+FleAzCjUmBEZff0efzepqY
         Yr/A==
X-Gm-Message-State: ACgBeo0MFQIo/+uaup/f+UNfqjpLSQGp9BmOwQvSsCeJWI8b2La6ql/A
	oRlhovBaw/2mMHmPsJQllWjD5g==
X-Google-Smtp-Source: 
 AA6agR5Ir6EumCKN8p/cV8J/sTYjX+LLLU2dRoXeyxNFWkwO3+WzqckKcT4NPD6reERwtaoDetuORQ==
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id
 d11-20020a056000114b00b00228ab76fa00mr2735383wrx.628.1662415010802;
        Mon, 05 Sep 2022 14:56:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:334b:5f43:ccfd:79ec?
 ([2001:8b0:aba:5f3c:334b:5f43:ccfd:79ec])
        by smtp.gmail.com with ESMTPSA id
 bd7-20020a05600c1f0700b003a331c6bffdsm11995268wmb.47.2022.09.05.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 14:56:50 -0700 (PDT)
Message-ID: 
 <6e4acb0b302d1d841c765283b12a3b1976d06a51.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com
Date: Mon, 05 Sep 2022 22:56:49 +0100
In-Reply-To: 
 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
	 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
	 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 21:56:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170328

On Mon, 2022-09-05 at 20:25 +0530, pgowda cve wrote:
> Hi Richard,
>=20
> Thanks very much for reviewing the patch and your comments regarding it.
>=20
> > > thread 'main' panicked at 'RUSTDOC_LIBDIR was not set',
> > > src/bootstrap/bin/rustdoc.rs:15:48
> > > note: run with `RUST_BACKTRACE=3D1` environment variable to display a
> > > backtrace
> > > error: could not document `core`
>=20
> I tried on different environments but could not reproduce the error.
> Can you please share with me the oe-selftest.log file to reproduce and
> work on it?

This was on my local build system which shouldn't do anything special
or interesting, it is a fairly standard OE-Core setup and I doubt the
selftest will tell you anything more that the piece of it I pasted into
the email.

Which MACHINE are you testing using?

> > > Something is mangling spaces in your patch. There shouldn't be tabs
> Modified the complete file to remove TABS and use white spaces.
>=20
> > > I think this can be merged with the RustSelfTestBase class as I don't
> Merge with RustSelfTestBase.
>=20
> > > If we want to change grammar, it should be in a separate patch.
> Removed it from the patch
>=20
> > > put that alongside the task definition.
> Done.

Thanks.

> All modifications are done as per the review comments.
> However, I still see that the test PASSes and did not see the mentioned e=
rror.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> rust.RustSelfTestSystemEmulated.test_rust: PASSED (4812.37s)
> 2022-09-05 13:43:50,332 - oe-selftest - INFO - SUMMARY:
> 2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest () - Ran 1
> test in 4875.349s
> 2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest - OK - All
> required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> I am using the following command to run the rust-testsuite:-
> oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
> Please let me know if I am missing anything to reproduce the error.

That is what I'm using too. I did try an couple of small changes to
rust to try and improve things and it did get slightly further but not
much. It does mean my logs are probably going to confuse things more if
I share them so I need to undo those before I can do that.

I don't know why we're seeing different results but it is a concern.

Were you able to work out if there is anything we can do about the
hardcoded buildpaths/reproducibility issue?

Cheers,

Richard






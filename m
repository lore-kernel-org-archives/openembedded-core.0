Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16A4C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:05:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8010.1662559504719016551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fFUWnhbl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id az27so20576154wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=k3shRUsqwp0xXcRdDTYf24Vo2F+dgkNGLHCvltYhy4M=;
        b=fFUWnhblVE0tLL55UG4w/nEStDY7VPqmCvDrpJR+touSqeguY8r65iXO80ahTRdqQh
         /zLoa9F1tfwVREzoO10D5Q/UK+BTLoAeTJaPj12NQNWGYNqyAvcEikCZZKALyHystC+V
         kIsLDYLiFUowVJtxDMTTHPhebs7iLzJY70eio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=k3shRUsqwp0xXcRdDTYf24Vo2F+dgkNGLHCvltYhy4M=;
        b=BRXly9SmBzqMTDc2+q+7VYEsM6DcrecvIBIhTvEiU6FHSulUnlL2fVzKgPDDTXnnmr
         sU5ov/almDx8tIbKfqEgrvRqaJTORn4ZlOj2/Y2vRohsNV197JGM5NYPZxsGprtCVAQf
         DS6zQ4VuknQSn7HMdaZ3FUHI2jLKZFKtTZtHEzvdcXyPCJ8LcpjhAArmLn9sxYQGAD4K
         aI8ucFEtQHSnVqPs/2qvjSStHoJT4T8V4l5bsCYQpbxUkq0Djlxw7frYGgswd8+leZLr
         gV+R9yD9lscScOIitvAVREG9h5Bon+5hyOkdFk/9lYnJM6d/CUOEwYSHRvBpKOJpW4JH
         KWSQ==
X-Gm-Message-State: ACgBeo0+4sBIa4Cjg27qBFIFHtvrBPWhJJfOgHl/NDkm/v/TZpRQGFfB
	TtUbFWcmcbsO/cQIRVNdzoWHFg==
X-Google-Smtp-Source: 
 AA6agR7bhrrfIcECg1lMaoiFJsb/Iqd7MpZwsIKq4Rc3lkipF/ZH+S+N2rWRfOst7ZwvoRHT+zhYrw==
X-Received: by 2002:a5d:6b8c:0:b0:228:db02:711e with SMTP id
 n12-20020a5d6b8c000000b00228db02711emr2216882wrx.218.1662559503118;
        Wed, 07 Sep 2022 07:05:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003a84375d0d1sm28235660wmq.44.2022.09.07.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:05:02 -0700 (PDT)
Message-ID: 
 <b3185ce5cca1b255cc96f5413db5c51cdb665175.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com
Date: Wed, 07 Sep 2022 15:05:01 +0100
In-Reply-To: 
 <6e4acb0b302d1d841c765283b12a3b1976d06a51.camel@linuxfoundation.org>
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
	 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
	 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
	 <6e4acb0b302d1d841c765283b12a3b1976d06a51.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:05:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170394

On Mon, 2022-09-05 at 22:56 +0100, Richard Purdie wrote:
> On Mon, 2022-09-05 at 20:25 +0530, pgowda cve wrote:
> > Hi Richard,
> >=20
> > Thanks very much for reviewing the patch and your comments regarding it=
.
> >=20
> > > > thread 'main' panicked at 'RUSTDOC_LIBDIR was not set',
> > > > src/bootstrap/bin/rustdoc.rs:15:48
> > > > note: run with `RUST_BACKTRACE=3D1` environment variable to display=
 a
> > > > backtrace
> > > > error: could not document `core`
> >=20
> > I tried on different environments but could not reproduce the error.
> > Can you please share with me the oe-selftest.log file to reproduce and
> > work on it?
>=20
> This was on my local build system which shouldn't do anything special
> or interesting, it is a fairly standard OE-Core setup and I doubt the
> selftest will tell you anything more that the piece of it I pasted into
> the email.
>=20
> Which MACHINE are you testing using?
>=20
> > > > Something is mangling spaces in your patch. There shouldn't be tabs
> > Modified the complete file to remove TABS and use white spaces.
> >=20
> > > > I think this can be merged with the RustSelfTestBase class as I don=
't
> > Merge with RustSelfTestBase.
> >=20
> > > > If we want to change grammar, it should be in a separate patch.
> > Removed it from the patch
> >=20
> > > > put that alongside the task definition.
> > Done.
>=20
> Thanks.
>=20
> > All modifications are done as per the review comments.
> > However, I still see that the test PASSes and did not see the mentioned=
 error.
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > rust.RustSelfTestSystemEmulated.test_rust: PASSED (4812.37s)
> > 2022-09-05 13:43:50,332 - oe-selftest - INFO - SUMMARY:
> > 2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest () - Ran 1
> > test in 4875.349s
> > 2022-09-05 13:43:50,332 - oe-selftest - INFO - oe-selftest - OK - All
> > required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > I am using the following command to run the rust-testsuite:-
> > oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
> > Please let me know if I am missing anything to reproduce the error.
>=20
> That is what I'm using too. I did try an couple of small changes to
> rust to try and improve things and it did get slightly further but not
> much. It does mean my logs are probably going to confuse things more if
> I share them so I need to undo those before I can do that.
>=20
> I don't know why we're seeing different results but it is a concern.
>=20
> Were you able to work out if there is anything we can do about the
> hardcoded buildpaths/reproducibility issue?

I was able to debug this. Adding:

--exclude src/tools/lint-docs --exclude src/test/rustdoc-js-std

to the test run stops it trying to build the docs for Std.

Cheers,

Richard


Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46940EB64DB
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:14:06 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.15041.1686755636867219475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NSnyd6aU;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-519f6e1a16cso569784a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686755635; x=1689347635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMMw2/yIcSW9z1TCX5lkBgFGkVh0gbl1yrdF/fom9D8=;
        b=NSnyd6aUV4Bqcei60a1qmkjfUldk/Em6PMK3BmJYowUwxmL0HAOrqMqafYJOqtWCDZ
         6TDe8cJQOaKYYPGfk2R0LRlZXyp9KxNHwomxdt712ID2+qz1T65f/hFdvK9E3igLUlHO
         ZZJyPxXsDWcQSQDMxDPF9mHh1j7LNhz0pyjSVRPOBSdv/NTq8Q0Ks0j2BUHOC8tCtQ7O
         GeoRfToE+2ji2ZWrukYN4twwztVs/5pBToyEei5r04q/SFNhQFxeOq1W9dksT8nTvwn8
         U8K8fzPP2Olq6bzNd4u3d5jhPON/tzGD/ieuul1sX6PuSrrRa8/1wG9jALFqcDFMhF8O
         oMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686755635; x=1689347635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMMw2/yIcSW9z1TCX5lkBgFGkVh0gbl1yrdF/fom9D8=;
        b=Z73Y0RvRnQx7K44jhLTnRW0FFD6UeFj2ZWq1gqqEkseDEVSyZUSibo/hgX8+I455ju
         AMV5GClPN8ngZVyklSqukw7VIRXJLXi6GFrQgC5CHmrzvBMkgjpoimQPp3XCb7jk0VeT
         5Kea4xejJrx86lGLCr2S556sBH2dCnPxo9SvUu8D/ifYxLCQPd1jJI4O73wRk4fuL1uk
         avrDKk+J/tfZ8R27J08QU/LfkAf2xwGhfatOqdhfuEQoOqMM8dXcL8QqAPNnHHU00DRi
         BiXm24H5LxInekyYzWdGiFsSNoog0DDesdvh5cnJNHUpHUhG5ovo29Ll6eW6LknKgSRY
         mSUQ==
X-Gm-Message-State: AC+VfDxSa5wrvlogEnh5/0X84C7N16rISg7PLm5Ra+X8u+WSBuncL2c+
	7CxwlHRln2+EKYOSRHRjuK9ZY3USyKnmydTXLys=
X-Google-Smtp-Source: ACHHUZ4ZI13B9vq39wrjSRgUi5HctvJCHEr0Zs6Eihdi6YxUoXqb85TOl35VaMOLq4pxlkH+bJ/CS4jNL/BCVkVbGdU=
X-Received: by 2002:aa7:cd6a:0:b0:518:9259:a05c with SMTP id
 ca10-20020aa7cd6a000000b005189259a05cmr1302309edb.6.1686755635065; Wed, 14
 Jun 2023 08:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk> <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com>
In-Reply-To: <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 14 Jun 2023 16:13:19 +0100
Message-ID: <CADVatmN=x=5VAUZUU1if+SrX19dg7h-pBiD-B7u1PrX7wHOnBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182816

Hi Ross,

On Wed, 14 Jun 2023 at 14:53, Ross Burton <ross.burton@arm.com> wrote:
>
> On 13 Jun 2023, at 21:52, Sudip Mukherjee via lists.openembedded.org <sud=
ipm.mukherjee=3Dgmail.com@lists.openembedded.org> wrote:
> > # only one of openssl and gcrypt could be set
> > PACKAGECONFIG ??=3D "openssl"
> > @@ -41,9 +42,13 @@ do_install_ptest() {
> > install -d ${D}${PTEST_PATH}/tests
> > install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
> > cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
> > - cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
> > - cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
> > - cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
> > + cp -rf ${B}/tests/test_simple ${D}${PTEST_PATH}/tests/
> > + cp -rf ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
> > + cp -rf ${S}/tests/test_sshd.test  ${D}${PTEST_PATH}/tests/
> > + cp -rf ${S}/tests/openssh_server ${D}${PTEST_PATH}/tests/
> > + cp -rf ${S}/tests/key* ${D}${PTEST_PATH}/tests/
> > +# Makefile.inc required as test_sshd.test generates the list of test f=
rom this
> > + cp -rf ${S}/tests/Makefile.inc ${D}${PTEST_PATH}/tests/
> > mkdir -p ${D}${PTEST_PATH}/docs
> > cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
> > }
>
> As you=E2=80=99ve clearly been looking at the tests, why does the ptest s=
upport need the documentation?

There is a test for manpage syntax "mansyntax.sh" which needs the
generated man pages in the docs folder.
compile_ptest_base will not fail, but actual tests will fail.

--=20
Regards
Sudip


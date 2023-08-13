Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193E2C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 10:23:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.82880.1691922216278811464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 03:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YTPBfQSR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3180fd48489so2735983f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 03:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691922215; x=1692527015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKBPekoT0wIOqiZmAeKHq6y0jyufykGDW6gnOsru8mo=;
        b=YTPBfQSR9XrkvgM7Rtc0YJfSAgcGxvnmosgyU8J/fpsONlcBJm7KM5ei+ZYosYjxEM
         9vIn9oSPaiP1fdVf7+zm7z9M9Xy3OZgwAnodThOmLkL2irx6N31ha23zMn/6Bl4Le5cK
         yONZap1saeKD/tdLZ9F8rlrtMxC8+QNWlv6EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691922215; x=1692527015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKBPekoT0wIOqiZmAeKHq6y0jyufykGDW6gnOsru8mo=;
        b=fKdcKrXgCldcYt93vwamrirWoh+yA5ElGF+tkAXeXTOK2r5bwARJpxNX/V9Ox459eg
         vHpVclHt2bPWh3fHAVPQSwh8fHCpfRpm7QKx+PU6aH6y3VOvaTQJw2SYNpA04OvDf5BW
         eBiJN/FPN4N6NfggGoNdAwOdom5rQuDVSaMZIOIJRHXvFs9powLE/GQh2x8vu79/PI4f
         ztgEV8aaVQQCYi06l7pfImV5vF99TeHVVY3LeGJ8J/3+74XVrovmnLx0CP+t9KVYJTKz
         hx3AksJ0SUSJdwOsiHdR7vi7QIQWKCeuilBUd6Ck4Wrz+cVSAfdLa5h3KRP1EUzqvccR
         MmEA==
X-Gm-Message-State: AOJu0Yy2gV3pNWesdopGyYL0aYLilk4rhxQ+zV1pjbpjO+khuA++g9/O
	2wunj+prF3/bZhSiClwDPIe6jA==
X-Google-Smtp-Source: AGHT+IHc/IrRW2ylDuRlgCOAMryEH2UmfpGcedHiZ8kwDsj1ZbxiBpP0MngsaNTRJv3Nzy7fP1ILiA==
X-Received: by 2002:a5d:500f:0:b0:317:759a:8ca8 with SMTP id e15-20020a5d500f000000b00317759a8ca8mr4195169wrt.67.1691922214663;
        Sun, 13 Aug 2023 03:23:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d528d000000b003142c85fbcdsm11005622wrv.11.2023.08.13.03.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 03:23:33 -0700 (PDT)
Message-ID: <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 13 Aug 2023 11:23:33 +0100
In-Reply-To: <cover.1691914589.git.frederic.martinsons@gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 10:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185868

On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This is an RFC for introducing a new class and recipes that
> help building C-ABI compatible header and library around
> rust code.
>=20
> The third patch add examples and test to demonstrate
> the usage and the good working of this use case.
>=20
> Test have been passed with the following in local.conf:
>=20
> CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp cargo rust=
 rust-c-lib-example-bin"
> IMAGE_CLASSES +=3D "testimage"
> TEST_SUITES =3D "ping ssh rust"
> # To use slirp option in testimage.bbclass
> TEST_RUNQEMUPARAMS =3D "slirp"
> TEST_SERVER_IP =3D "127.0.0.1"
> QEMU_USE_SLIRP =3D "1"

In testing it showed:

stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe cargo-c in=
 /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rust/cargo=
-c_0.9.18.bb does not contain a SUMMARY. Please add an entry. [missing-meta=
data]
stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue: Recipe car=
go-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rus=
t/cargo-c_0.9.18.bb does not contain a SUMMARY. Please add an entry. [missi=
ng-metadata]
stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe =
cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/=
rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Please add an entry. [mi=
ssing-metadata]

Cheers,

Richard


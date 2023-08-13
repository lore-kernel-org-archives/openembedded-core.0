Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4743DEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:23:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.83291.1691925776272769564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XB2f0kpt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so3083599f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691925775; x=1692530575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3oVMACgyBC745VF3rqXJ8X/w6bFjFy5Yxkyizl/ytKA=;
        b=XB2f0kptUpky1LkGFs6oOvIBbCRWI6gt7AZkVh3rPVMmXAx0sOObF81Z77/aNhl1Bo
         ePwM+zoN8DKe3ymlXfRbKd6PivhfFWv9vkq4DdeBLMDDIwYL7221szbUTxUdIZKUz7PW
         HBZHqNFZ+FS/iGT2Y636uYruUauMYKRjkmmbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691925775; x=1692530575;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3oVMACgyBC745VF3rqXJ8X/w6bFjFy5Yxkyizl/ytKA=;
        b=DoHhXKWb68L0vF4JV2jTaLEXIrCafiAhkxBv8i504Hwjg7kuOY0lap8IFOTHF/KyGc
         3f9zVmduKpl9pb4N9Kf1D6A9ManT5PP4qTnEXQlg91VG+WcAQTBVmsvUq33FfQYQx7Lx
         gJNzN4CuAFpV6MwXpMeB9oL+I2T9rANCJan1wYZKXn47r789ZXV7AltIcfz5venqvwWS
         0UEmeKrUrjNXz+uQHduJ6azMnEhdY8QDvUbJEye1iNswcH0t2e/lRQxleqYW14THwrX7
         jLpQx2mshjzkkc48vssLDB1868zPLKkZY48R51VxN7JbL1Xz0TdkrxHsnyY2Zq39DYh0
         aIRQ==
X-Gm-Message-State: AOJu0YwLgOIFkpSRVGUbG5jPQlnJ9yT0V589JEC3hfhj7wQTS/f30wZE
	L5LreWWnvCW1CPM81+0QUJuE7g==
X-Google-Smtp-Source: AGHT+IHnkGW2QjNFzBAZdv6K4FVnQRFJrbySsZmgC9giL6CAv+ZHX71nsiBtAs48HkNnMrOL2N01yA==
X-Received: by 2002:adf:ed8f:0:b0:313:e98b:7de2 with SMTP id c15-20020adfed8f000000b00313e98b7de2mr5510831wro.0.1691925774637;
        Sun, 13 Aug 2023 04:22:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d480b000000b00318147fd2d3sm10992110wrq.41.2023.08.13.04.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:22:54 -0700 (PDT)
Message-ID: <bd5d935d71467e47c5f858719e58edd2537e2d54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Aug 2023 12:22:53 +0100
In-Reply-To: <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
References: <cover.1691914589.git.frederic.martinsons@gmail.com>
	 <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
	 <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185872

On Sun, 2023-08-13 at 12:48 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>=20
>=20
> Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit=C2=A0:
> > On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >=20
> > > This is an RFC for introducing a new class and recipes that
> > > help building C-ABI compatible header and library around
> > > rust code.
> > >=20
> > > The third patch add examples and test to demonstrate
> > > the usage and the good working of this use case.
> > >=20
> > > Test have been passed with the following in local.conf:
> > >=20
> > > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp
> > > cargo rust rust-c-lib-example-bin"
> > > IMAGE_CLASSES +=3D "testimage"
> > > TEST_SUITES =3D "ping ssh rust"
> > > # To use slirp option in testimage.bbclass
> > > TEST_RUNQEMUPARAMS =3D "slirp"
> > > TEST_SERVER_IP =3D "127.0.0.1"
> > > QEMU_USE_SLIRP =3D "1"
> >=20
> > In testing it showed:
> >=20
> > stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
> > cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-
> > devtools/rust/cargo-c_0.9.18.bb does not contain a SUMMARY. Please
> > add an entry. [missing-metadata]
> > stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue:
> > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > contain a SUMMARY. Please add an entry. [missing-metadata]
> > stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue:
> > Recipe cargo-c in /home/pokybuild/yocto-worker/a-
> > full/build/meta/recipes-devtools/rust/cargo-c_0.9.18.bb does not
> > contain a SUMMARY. Please add an entry. [missing-metadata]
>=20
> Thanks Richard, will take care of that soon.=C2=A0
>=20
> Can you tell me what commands do you run to have that sanity check?
> It will avoid me to do the same mistake next time I'll add a recipe.=C2=
=A0

It should just show up building the recipe (e.g. "bitbake cargo-c")?

There are further build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6361/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/6484/ste=
ps/14/logs/stdio

and the build isn't finished yet so Is suspect there will be more.

Cheers,

Richard


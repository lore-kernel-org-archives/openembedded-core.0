Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D85C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:19:00 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.13027.1720613934879055862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 05:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQ2lXu2p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ea1a69624so7122659e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720613933; x=1721218733; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xul5487LMirCc1h4BIuQcbBLTEASw1illPk8PewD53Y=;
        b=IQ2lXu2p4nuiB1iermfCNulRQ8o7DfMypNk1mgSKwTKAjrkWFAtkja3ndgj0YIC2y3
         syxDlEsRzJd3Al1opGvZ4o7RPy9LBPfPi3OMADLqM1qpT5vXB/uGLJ2FilAxTElrg6yl
         UNitY0rGFmwlc+jeA8VFY1Nh6aRLpk4hlWdVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720613933; x=1721218733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xul5487LMirCc1h4BIuQcbBLTEASw1illPk8PewD53Y=;
        b=MRZPxqI1mfNhCfHKXphn4Q6YQaWrzC88nRmGr6lvOxWJpoQquELUI+U905O6NcEK/A
         DUsaxmnUNqdN7pj1SP1EuCdhHk6SasEEs6KIDp+eNaOu8S3RsixFdf1MoZwOMfxCMPl+
         +urOgQYKQB6bLCzxD7sKG3kdgPwvUgx9sOiqHucxcm7zxkADzg6OUmM/UuFcGqf2Ugd9
         TuTjGh1ng9XKTksHmfEMPZv29z6fQcJAQl0Es38wY5mX02Bda9mxy2g6v2Wm5KktALw4
         mIAd3tNbqdpZgwdaIds3u4BCIyu8Mk6BwDcvJ1ZA+G4LkoFlRa6AqCK31yvtPxn/93Vq
         V53Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9A8eKJKjFhk0VpPE5dD6b3nygCKnqxeLGjUWJiNQL7uTZ3WZWVgLaTFhed+A298rhzmFgOXlODZ/ADdP3rwf4tJYmBe/0gmCKrhB2xcZCIrMlG/czS3Pq
X-Gm-Message-State: AOJu0YzLmLvbrX2nDY+Xyv7cw5J7dIhMjtxoFXCTbhBXuX2+5Zxag2oH
	KOJutMhbh/zq8JG/XCCQxoNItVBy9eHjMW/TzOWPQJgAeOt/L5uLQIwDfJdbCcM=
X-Google-Smtp-Source: AGHT+IEj4MnIA/Vk5alQOfNHmjZC5xEjw1Tb3hwPHXWCBI50Ky66cLbmtsqew80oEioUdObxbBBXeQ==
X-Received: by 2002:a05:6512:12cc:b0:52c:eeb0:8208 with SMTP id 2adb3069b0e04-52eb99d3e34mr3795596e87.66.1720613932893;
        Wed, 10 Jul 2024 05:18:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42673d7f528sm67294335e9.9.2024.07.10.05.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:18:52 -0700 (PDT)
Message-ID: <1227d1d9b29b6f83d9ad03c8d0046b04ad72ddfc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 0/8] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 13:18:51 +0100
In-Reply-To: <17DF3FE80C22BC48.23364@lists.openembedded.org>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <17DF3FE80C22BC48.23364@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 12:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201731

On Fri, 2024-07-05 at 08:17 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> > On Wed, 2024-07-03 at 07:59 -0600, Joshua Watt via
> > lists.openembedded.org wrote:
> > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > default.
> > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled =
at
> > > > the same time
> > > >=20
> > > > v2: Added tests and addressed feedback
> > > > v3: Fixed several oe-selftest and build failures
> > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > v5: Reworked to make SPDX 3 output reproducible by default. Variabl=
es
> > > > =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are docum=
ented as such.
> >=20
> > Thanks for working on this. The patches generally seem to working well
> > in testing but this does look related:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7109/=
steps/23/logs/stdio
> >=20
> > Particularly these bits:
> >=20
> > AssertionError: 10 !=3D 0 : Missing objects in the cache:
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/a6/eb/sstate:perf:qemu=
x86_64-poky-linux:1.0:r0:qemux86_64:12:a6eb451ebf8142b51d88b66b79ebbfc43019=
458d7e335e0a1b2a79e19cf3eed6_create_spdx.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qemu=
x86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f65d=
d1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> >=20
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:qemu=
x86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7f65d=
d1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/31/ce/sstate:core-imag=
e-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:31ce987a3b0b34b0d=
2bbacab96b4b9848f851caadd1f1fb1522d38c2b392c65d_create_image_sbom.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/2f/cf/sstate:core-imag=
e-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:2fcfbfd93928c643c30f9=
2b69cd17e19f4dd9136506e0bf1373a28883593d3a9_create_rootfs_spdx.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/1d/de/sstate:core-imag=
e-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:1dded8f18500fb6335633=
1c5e4f5eee5fc35c113398ec98ad7bed1d82c3f330d_create_image_spdx.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/6a/92/sstate:core-imag=
e-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:6a924154d59877cfc4527=
602e72d0984c1fa7b685ac7f93fa8bee225a5de57e3_create_image_sbom.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/62/47/sstate:core-imag=
e-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:624764dcea54752c3=
f6f3928f6719b440728eecd7516b85d80d37b305c56f530_create_rootfs_spdx.tar.zst
> > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/7c/6f/sstate:core-imag=
e-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:7c6f212fe1a869ae8=
edc251f2f9c02e939a5f2b659fd77e9b4bb262eb60f6f5d_create_image_spdx.tar.zst

I think I understand what might have happened here. I suspect we've had
test builds on the new test cluster which can write to the hash
equivalence server but not the sstate. I think this means entries were
added for artefacts which don't exist on sstate.=C2=A0

In theory those should be created on new build runs but in practise I
suspect they're shadowed by other artefacts so newer builds probably
don't create them. That would at least explain how we end up where we
are.

If I'm correct, if there are changes to the code (as we discussed on
yesterdays tech call), everything will rerun and assuming we run this
only on the main cluster, things should work out ok.

I would be curious to understand how these things aren't being
recreated when missing though?

I did also notice an interesting issue in that if you run a build with
PACKAGE_CLASSES =3D "package_rpm", then add deb/ipk, all the
do_collect_spdx_deps tasks and do_create_spdx tasks change hashes and
rerun. This isn't ideal as it effectively breaks our ability to turn
package backends on/off without rebuilds :(. Can we avoid that or at
least minimise things a bit more?

Cheers,

Richard





Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2E7C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:22:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.15695.1720621366664892819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bxL6nu4e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so53257935e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720621365; x=1721226165; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GOEdeznOxAKjNaSJnw4HJDzEEFZRe9rb4+N7hGoV85k=;
        b=bxL6nu4eQCyhMo+j2BxiSupsvOjxpDRucDjyk2chFEVKv8zZJvEYwSNfwO5TpYdGn8
         eHpkGYxmk+nVktI7o18Grxw4C+Wh6xmB3MvKJpQ+sILwyCMeGi3coHEM4qKxIjiJQfKm
         BClgAXuVEvbXppgJX+gnDE+jgTC5cPzFUtR9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621365; x=1721226165;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOEdeznOxAKjNaSJnw4HJDzEEFZRe9rb4+N7hGoV85k=;
        b=YMwWjFKkJQDS0fxPINiMXihI/uu8rOj3vCsXYy5drdcFJ1UrFLMH2q4rN7ABPBZiKY
         6XVxpehNVSBgyykC0CPrB6Hq41Ea/CdujkZtCXYkgdlBBhPAVpJAQLof5QawNxMZc6cR
         70qxBOBMeYe7bWuFJSnGid0c8FfDBrUvPkaYd0OImrxp/u/oGHYVPTiZLTDkvedD9ase
         oFZn9mZP09QaQKyc2RRJrYVz5M+Q8IOybnTyCExCwJGEwGdMVrN00BAV1J1XNv9sqOx6
         LSKibVORUnkQYYtDBgMFnAOqxxZWO82Z2x8f9cT4Rd/bENnr1MiwZJLGYfiZKdTYGDCc
         BtXg==
X-Gm-Message-State: AOJu0YwyrJny1IGT4rPFgJ1AiRjaQWP90ZVDvqB/LSQcENPdnk5u+EB9
	AOZFZKRKUdSEOGDjH1+bqPZjQdSalldTkxStac9z9+vRd4AqmfLIKDzVYYAiP2c=
X-Google-Smtp-Source: AGHT+IFlTZyAyeLJN5fX237o7sXJgOjtFj5JUVAbxVDqBVpMhmMyVxGO6nkU/1j/URd2uW1+LRcB/A==
X-Received: by 2002:a05:600c:4ca3:b0:426:615f:f715 with SMTP id 5b1f17b1804b1-426707dbd32mr44273125e9.23.1720621364884;
        Wed, 10 Jul 2024 07:22:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f737b1bsm85250705e9.32.2024.07.10.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:22:44 -0700 (PDT)
Message-ID: <221705c1de707ca1b68c5b3f7fcd9d90412624b2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v5 0/8] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 15:22:43 +0100
In-Reply-To: <CAJdd5GbG0Zy4+8QD6NGTvFV=STomOAgghiAYShCrS0gZAknPeQ@mail.gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
	 <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <17DF3FE80C22BC48.23364@lists.openembedded.org>
	 <1227d1d9b29b6f83d9ad03c8d0046b04ad72ddfc.camel@linuxfoundation.org>
	 <CAJdd5GbG0Zy4+8QD6NGTvFV=STomOAgghiAYShCrS0gZAknPeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 14:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201735

On Wed, 2024-07-10 at 08:03 -0600, Joshua Watt wrote:
> On Wed, Jul 10, 2024 at 6:18=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2024-07-05 at 08:17 +0100, Richard Purdie via lists.openembedde=
d.org wrote:
> > > > On Wed, 2024-07-03 at 07:59 -0600, Joshua Watt via
> > > > lists.openembedded.org wrote:
> > > > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > > > default.
> > > > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enab=
led at
> > > > > > the same time
> > > > > >=20
> > > > > > v2: Added tests and addressed feedback
> > > > > > v3: Fixed several oe-selftest and build failures
> > > > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > > > v5: Reworked to make SPDX 3 output reproducible by default. Var=
iables
> > > > > > =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are d=
ocumented as such.
> > > >=20
> > > > Thanks for working on this. The patches generally seem to working w=
ell
> > > > in testing but this does look related:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7=
109/steps/23/logs/stdio
> > > >=20
> > > > Particularly these bits:
> > > >=20
> > > > AssertionError: 10 !=3D 0 : Missing objects in the cache:
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/a6/eb/sstate:perf:=
qemux86_64-poky-linux:1.0:r0:qemux86_64:12:a6eb451ebf8142b51d88b66b79ebbfc4=
3019458d7e335e0a1b2a79e19cf3eed6_create_spdx.tar.zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:=
qemux86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7=
f65dd1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> > > >=20
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/73/bd/sstate:perf:=
qemux86_64-poky-linux:1.0:r0:qemux86_64:12:73bd840dbf3fb04c5adf5c09dd6f45d7=
f65dd1808bc4cf8c2f7a20ea551eaabd_create_package_spdx.tar.zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/31/ce/sstate:core-=
image-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:31ce987a3b0b3=
4b0d2bbacab96b4b9848f851caadd1f1fb1522d38c2b392c65d_create_image_sbom.tar.z=
st
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/2f/cf/sstate:core-=
image-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:2fcfbfd93928c643c=
30f92b69cd17e19f4dd9136506e0bf1373a28883593d3a9_create_rootfs_spdx.tar.zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/1d/de/sstate:core-=
image-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:1dded8f18500fb633=
56331c5e4f5eee5fc35c113398ec98ad7bed1d82c3f330d_create_image_spdx.tar.zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/6a/92/sstate:core-=
image-sato-sdk:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:6a924154d59877cfc=
4527602e72d0984c1fa7b685ac7f93fa8bee225a5de57e3_create_image_sbom.tar.zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/62/47/sstate:core-=
image-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:624764dcea547=
52c3f6f3928f6719b440728eecd7516b85d80d37b305c56f530_create_rootfs_spdx.tar.=
zst
> > > > /srv/autobuilder/autobuilder.yocto.io/pub/sstate/7c/6f/sstate:core-=
image-full-cmdline:qemux86_64-poky-linux:1.0:r0:qemux86_64:12:7c6f212fe1a86=
9ae8edc251f2f9c02e939a5f2b659fd77e9b4bb262eb60f6f5d_create_image_spdx.tar.z=
st
> >=20
> > I think I understand what might have happened here. I suspect we've had
> > test builds on the new test cluster which can write to the hash
> > equivalence server but not the sstate. I think this means entries were
> > added for artefacts which don't exist on sstate.
> >=20
> > In theory those should be created on new build runs but in practise I
> > suspect they're shadowed by other artefacts so newer builds probably
> > don't create them. That would at least explain how we end up where we
> > are.
>=20
> There is also https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selfte=
st/cases/sstatetests.py#n933
> which I beleive is still accurate and probably why the images
> themselves show up; we'll need to adjust the exclusions to match the
> new SPDX tasks I added. I think '.*:do_create.*_spdx' would be OK?

If that restriction was just for images I'd be ok with it. It is saying
we'd ignore any missing spdx sstate artefacts anywhere though which
seems wrong, assuming I understand it correctly.

> > If I'm correct, if there are changes to the code (as we discussed on
> > yesterdays tech call), everything will rerun and assuming we run this
> > only on the main cluster, things should work out ok.
> >=20
> > I would be curious to understand how these things aren't being
> > recreated when missing though?
>=20
> I'm not sure. I can't really think of any reason in the SPDX code that
> it wouldn't recreate a missing sstate object; I'm not doing anything
> particularly strange with sstate

Imagine you have some tasks which depend on do_package like
do_package_write_ipk and friends. If you only ever build the ipk task,
the package task would never run again. I suspect spdx may have similar
tasks.

> > I did also notice an interesting issue in that if you run a build with
> > PACKAGE_CLASSES =3D "package_rpm", then add deb/ipk, all the
> > do_collect_spdx_deps tasks and do_create_spdx tasks change hashes and
> > rerun. This isn't ideal as it effectively breaks our ability to turn
> > package backends on/off without rebuilds :(. Can we avoid that or at
> > least minimise things a bit more?
>=20
> Ya, that's a leftover from when I was trying to tie the SPDX packages
> to the produced package files. I had to give up thought because it's
> actually really difficult to figure out what .rpm and .deb files
> correspond to a PACKAGE (at least, I couldn't see an easy way to do
> it). We can just remove the dependency on do_package_write_* for now
> and figure out how to do it later.

Ok, that makes sense. We should be able to map package files to
PACKAGES but we can discuss that one later!

Cheers,

Richard



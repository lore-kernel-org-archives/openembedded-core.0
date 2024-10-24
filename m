Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0429FCE8E7D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:17:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.15646.1729779426490153472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Urm/efV3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so10379665e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729779425; x=1730384225; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WXBZbvbAxfcYW6jywwgT9SrwJh0umRkDXgG7gva1BoA=;
        b=Urm/efV3G8c9vnk5gmwVEVwlzHQ5SxAYBYuS1slp7rMBiQtMrd77fkHFjVs7F5adUz
         7prZtZCyoP+aPBLC4QPmcYFFeWNM0Uha7hL0aBUQuOk1mSawGRzf2V6rvfJdi1waPulB
         9brxIkMBlRAMkuPQ1qlOi4aeLibhGids8rtDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779425; x=1730384225;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXBZbvbAxfcYW6jywwgT9SrwJh0umRkDXgG7gva1BoA=;
        b=IagphB4Vsvl14uq76UHSVqiygelyzI1q/2sWOvMx4f6w1d774R61tp59e3/Jc4l8za
         XXGnM8FjH3svgH8Cy6PZhlBTXcsYFUdwHMK68iczxpGqckKm4PeXG2ENHWJcWT7bnI+v
         VnkihLiQZdwTfyol2VS49jDSEkaB0Wetmz2nmqRWqC0Kij64LMxDYbGU/e1xyLdI6S0Q
         Z2VL1pBtIkzTHIyYbcwOdAHeV5v4vqATIX1jk5MORh1eg17ng0foy/IOJ4D6QgtFQaRb
         dft796Unvj7yf23I7Guj4VuAr28aihEc9deFQCaAlwPIC/1ZExaXCM9UkD8ntoMDAh1N
         HL+A==
X-Gm-Message-State: AOJu0Yy0r3iIebz9Qp2nXm1AiPP81JsuRcelifozXWzM7POSBAMWVjvf
	jiFQexIBWfL87m6C/kZvBvdp0T2z8FXsMiTXK66b0BugFuOaA14LpY0OoxX+de0=
X-Google-Smtp-Source: AGHT+IFKMGEkfaaRgqI0QOA/wJpLdOnmvV8c4EjRfZtQp2WzYnS4lg71or0f40VWKhGn63IXuMxxzg==
X-Received: by 2002:a05:600c:45cb:b0:431:157a:986e with SMTP id 5b1f17b1804b1-4318c715beamr15401595e9.20.1729779424804;
        Thu, 24 Oct 2024 07:17:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c1ef8dsm46713685e9.47.2024.10.24.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:17:04 -0700 (PDT)
Message-ID: <bf7971d1994afd43ac7a169fb9d8a184ec3151ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2024 15:17:03 +0100
In-Reply-To: <1801592C5B3B7B0B.16325@lists.openembedded.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
	 <180122B0064457FF.13420@lists.openembedded.org>
	 <180123793D1D4B45.13420@lists.openembedded.org>
	 <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
	 <ZxoLbNm2VEkRw78N@nuoska> <1801592C5B3B7B0B.16325@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 14:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206297

On Thu, 2024-10-24 at 10:22 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2024-10-24 at 11:55 +0300, Mikko Rapeli wrote:
> > On Wed, Oct 23, 2024 at 07:39:51PM +0100, Richard Purdie wrote:
> > > On Wed, 2024-10-23 at 17:58 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> > > > > lists.openembedded.org wrote:
> > > > > > These changes enable building systemd uki images which
> > > > > > combine
> > > > > > kernel, kernel command line, initrd and possibly signatures
> > > > > > to
> > > > > > a single UEFI binary. This binary can be booted with UEFI
> > > > > > firmware
> > > > > > and systemd-boot. No grub is needed and UEFI firmware
> > > > > > and/or
> > > > > > systemd-boot provide possibilities for boot menus.
> > > > > > The uki binary can also be signed for UEFI secure boot
> > > > > > so the secure boot extends from firmware to kernel and
> > > > > > initrd.
> > > > > > Binding secure boot to full userspace is then easier since
> > > > > > for
> > > > > > example
> > > > > > kernel command line and initrd contain the support needed
> > > > > > to
> > > > > > mount
> > > > > > encrypted dm-verity etc partitions, and/or create
> > > > > > partitions on
> > > > > > demand
> > > > > > with systemd-repart using device specific TPM devices for
> > > > > > encryption.
> > > > > >=20
> > > > > > Tested on qemuarm64-secureboot machine from meta-arm with
> > > > > > changes
> > > > > > to
> > > > > > support secure boot. Slightly different configuration
> > > > > > tested on
> > > > > > multiple arm64 System Ready boards with UEFI firmware, real
> > > > > > and
> > > > > > firmware
> > > > > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > > > > selftests but
> > > > > > without secure boot which seems to be harder to setup in
> > > > > > ovmf.
> > > > > >=20
> > > > > > Sadly I see two wic selftests,
> > > > > > wic.Wic2.test_rawcopy_plugin_qemu
> > > > > > and
> > > > > > wic.Wic2.test_expand_mbr_image, failing when executing all
> > > > > > wic
> > > > > > selftests
> > > > > > on a build machine with zfs filesystem. Will investigate
> > > > > > this
> > > > > > further.
> > > > > > The issue seems to be in mkfs.ext4 producing broken
> > > > > > filesystem,
> > > > > > and
> > > > > > partially
> > > > > > in the tests which don't run the correct rootfs file (.ext4
> > > > > > vs
> > > > > > .wic).
> > > > > > Will debug this further and it is IMO unrelated to these
> > > > > > changes
> > > > > > since
> > > > > > they reproduce on pure master branch without this series.
> > > > > >=20
> > > > > > v10: disabled kvm support in new tests since it breaks qemu
> > > > > > boot
> > > > > > on
> > > > > > aarch64
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 build machine, removed "testimage" fro=
m IMAGE_CLASS as
> > > > > > well
> > > > > > since
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 can end up testing qemu machine during=
 build.
> > > > >=20
> > > > > I hate to say this but
> > > > > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is
> > > > > still
> > > > > failing:
> > > > >=20
> > > >=20
> > > > https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14=
/logs/stdio
> > >=20
> > > and:
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/l=
ogs/stdio
> > >=20
> > > which is clearer without the other failure.
> >=20
> > Comparing x86_64 and aarch64 build host runqemu command lines from
> > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 selftest,
> > two things pop up.
> >=20
> > aarch64 still enables KVM via "-enable-kvm". This is despite
> > QEMU_USE_KVM =3D ""
> > in the bitbake build config. Oh, this is only applied to the build
> > configuration
> > and bitbake build command but removed before runqemu is called. I
> > can try to apply
> > this config also for runqemu. This pattern is used in several
> > tests. Build config
> > is set temporarily and then removed before calling runqemu. I'll
> > send a separate
> > patch to master-next to reduce spam.
> >=20
> > aarch64 host uses "-cpu host" with qemu while x86_64 sets the CPU
> > variant explicitly
> > to "-cpu cortex-a76". I can't see from build logs which CPU variant
> > the
> > host really is. There are a lot of CPU variants in aarch64 world
> > and I don't think
> > they are all compatible, or detect CPU features at runtime which
> > can impact
> > things like firmware code badly. I don't know how to fix this.
>=20
> Well spotted! I'm running a test build with your patch:
>=20
> https://valkyrie.yoctoproject.org/#/builders/23/builds/329

Good news is that one passed, thanks for working through this!

Cheers,

Richard



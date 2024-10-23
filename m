Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA36CFA45E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 18:39:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.5366.1729708795107932376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 11:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iMkddU96;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so9727f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729708793; x=1730313593; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziqcKI4fTgYBVNXPUz6jf0rfS8sNEpkHeQU6PaO7PlA=;
        b=iMkddU96u/pZSM0ciHXMa7haeWk1f9U80lZcP/PgoiAfeTPd5Pf3YV4B+M2VjePCbU
         fhPyo3BNvKJsg7naSTTK/ud6PP4lDH8C4d5ns0xJbnjjx9fRMHXM4bYjZiS7O9yoECBY
         znA+yZ8sf6cu4OdOfcgUtj3j+rSYC7l1T05R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708793; x=1730313593;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ziqcKI4fTgYBVNXPUz6jf0rfS8sNEpkHeQU6PaO7PlA=;
        b=bHtt6Hh8XLSlOBn/qE84CBYA5HlQu3PoHx3XEBz2iOGYrjjyBvgikItz4SgcIsuwFY
         nlKn87tTrbhQqIGcjZ10VShxpXtH+xJ95qCR4QkKt3phojcnJNxWbmvhuUZCp/aTfVsj
         nTMBZsgdjPc64Vmid1T/xYDdgq1yL6Neg7r+cAbDREhckenZUjP4IJbnFMhmwKBSiREz
         VMvYrqcpRGZMHwi90Ys7YA4K1vbqOSyTkYLRevThvxgt6BTXcOEmvqMf061ljy+Mo0kl
         oSGopP++5fA5Iz1puBs8KtONER0reG4aHIuhl4Kho/lfeazmCt2W6NXjKJYQi/quBR2Y
         f56A==
X-Forwarded-Encrypted: i=1; AJvYcCV6hX95u7uDNgvSFSa8nBX0NW/mVGwwQgK1q/V79LmBtEKetrM/crg8CKIC9Qcer1Wq2tA2fqqpQ5y4t4Zl0XXDQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5/vOJdbmwnGXZXKIB7sHni1PNtQMmgK2h8jVkMGyvSbjMUEno
	A9xntDlKNJQENLChg87fkRCyaaZIFoYUoVv1Ns7RGHmsDsDedTvhSeThAVvpb9Q=
X-Google-Smtp-Source: AGHT+IGlxJzUIG4iFIc1gFwNr+75zltghuBsmmxksWExnQ8iu1hh22GmUGJ54e5wVc7w0w0b6HxxXg==
X-Received: by 2002:a5d:58e9:0:b0:37d:4619:f975 with SMTP id ffacd0b85a97d-37efcf05df6mr3048343f8f.19.1729708793337;
        Wed, 23 Oct 2024 11:39:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9433asm9478043f8f.80.2024.10.23.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:39:52 -0700 (PDT)
Message-ID: <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 19:39:51 +0100
In-Reply-To: <180123793D1D4B45.13420@lists.openembedded.org>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
	 <180122B0064457FF.13420@lists.openembedded.org>
	 <180123793D1D4B45.13420@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 18:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206263

On Wed, 2024-10-23 at 17:58 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > These changes enable building systemd uki images which combine
> > > kernel, kernel command line, initrd and possibly signatures to
> > > a single UEFI binary. This binary can be booted with UEFI
> > > firmware
> > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > systemd-boot provide possibilities for boot menus.
> > > The uki binary can also be signed for UEFI secure boot
> > > so the secure boot extends from firmware to kernel and initrd.
> > > Binding secure boot to full userspace is then easier since for
> > > example
> > > kernel command line and initrd contain the support needed to
> > > mount
> > > encrypted dm-verity etc partitions, and/or create partitions on
> > > demand
> > > with systemd-repart using device specific TPM devices for
> > > encryption.
> > >=20
> > > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > > to
> > > support secure boot. Slightly different configuration tested on
> > > multiple arm64 System Ready boards with UEFI firmware, real and
> > > firmware
> > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > selftests but
> > > without secure boot which seems to be harder to setup in ovmf.
> > >=20
> > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > > and
> > > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > > selftests
> > > on a build machine with zfs filesystem. Will investigate this
> > > further.
> > > The issue seems to be in mkfs.ext4 producing broken filesystem,
> > > and
> > > partially
> > > in the tests which don't run the correct rootfs file (.ext4 vs
> > > .wic).
> > > Will debug this further and it is IMO unrelated to these changes
> > > since
> > > they reproduce on pure master branch without this series.
> > >=20
> > > v10: disabled kvm support in new tests since it breaks qemu boot
> > > on
> > > aarch64
> > > =C2=A0=C2=A0=C2=A0=C2=A0 build machine, removed "testimage" from IMAG=
E_CLASS as well
> > > since
> > > =C2=A0=C2=A0=C2=A0=C2=A0 can end up testing qemu machine during build=
.
> >=20
> > I hate to say this but
> > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is still
> > failing:
> >=20
>=20
> https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14/logs/=
stdio

and:

https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/logs/st=
dio

which is clearer without the other failure.

Cheers,

Richard


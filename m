Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C16D0BB7D
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 09:23:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.10440.1729761778125935364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 02:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KBn7noX2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314c452180so12063025e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729761776; x=1730366576; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sNjQcuulTXhagtrDaDE8RbOeQfHGJ3Pw/3Q9t29TAPo=;
        b=KBn7noX2JjApPpYUerdFpJokfDPD3/WBkmanGE5aEEasjZucAN26SaL3ZTDJuxRQoz
         Jli5m7k61dG7lXWxAaratge2JnrC+8v6GvnAAdYetp4utC8FunwnPrSn7b1ydUWANrDf
         ByVCI3aoR9deDEXrU37DiXj7/+uC17ug9H4Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729761776; x=1730366576;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNjQcuulTXhagtrDaDE8RbOeQfHGJ3Pw/3Q9t29TAPo=;
        b=eR2TClZIBeQKqAZIuNcBUw162zhJIdUb3Ovgg9vcw/q8PCFgp5WBH/8QiBeKL25fcV
         2XkcY1mSznnodu6eyZwS6BAcFelltdig7jYcOQfAfgK6wPhv3907SwmzliVY6UUU2oEM
         Jrs0jpiTmpvCROzYIZxeIMcdV0oRH5Z0YRMAncWqSlEAPi6Z6OoZ3YlMuEcb66CSr3qA
         jvvLtNnA9dFeFbCtkpVJOQuV0pOAXWB+0JWl7p3TnthsxTSbr1nbjnKV7JtzFKX4fxGC
         hF8XHTcO+0UqmkLdvoBDsqwSjvL1XDx1yvW0W36lTXdQV+tmfqnUPfNVz6bN9sWIyp5i
         O7Ew==
X-Gm-Message-State: AOJu0YzAFq7MkEWb/i1kd+X5+6NDOKaw7Iv0OIJzpyrRFGKVK/1w9xIH
	bIP76ifzqm6fQNwGExKvJNnxAYmhXfAF6Q9caIGhk548McKjHG/0PWWIkk1yPpk=
X-Google-Smtp-Source: AGHT+IFJkoxXNc/jOHdSUo+6Q4qHtfAHS08F3iyTp5fZKA6vOADSPxKsuMxfgMrHxlg1LuJPEk3LKw==
X-Received: by 2002:a05:600c:4e8c:b0:431:7c25:8600 with SMTP id 5b1f17b1804b1-4318b587dd1mr8296225e9.2.1729761776034;
        Thu, 24 Oct 2024 02:22:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bb15sm10860184f8f.99.2024.10.24.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 02:22:55 -0700 (PDT)
Message-ID: <be8b2cbea3312ad3eaa62cc14ab36a4f4ff49542.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2024 10:22:54 +0100
In-Reply-To: <ZxoLbNm2VEkRw78N@nuoska>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
	 <180122B0064457FF.13420@lists.openembedded.org>
	 <180123793D1D4B45.13420@lists.openembedded.org>
	 <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
	 <ZxoLbNm2VEkRw78N@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 09:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206282

On Thu, 2024-10-24 at 11:55 +0300, Mikko Rapeli wrote:
> On Wed, Oct 23, 2024 at 07:39:51PM +0100, Richard Purdie wrote:
> > On Wed, 2024-10-23 at 17:58 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> > > > lists.openembedded.org wrote:
> > > > > These changes enable building systemd uki images which combine
> > > > > kernel, kernel command line, initrd and possibly signatures to
> > > > > a single UEFI binary. This binary can be booted with UEFI
> > > > > firmware
> > > > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > > > systemd-boot provide possibilities for boot menus.
> > > > > The uki binary can also be signed for UEFI secure boot
> > > > > so the secure boot extends from firmware to kernel and initrd.
> > > > > Binding secure boot to full userspace is then easier since for
> > > > > example
> > > > > kernel command line and initrd contain the support needed to
> > > > > mount
> > > > > encrypted dm-verity etc partitions, and/or create partitions on
> > > > > demand
> > > > > with systemd-repart using device specific TPM devices for
> > > > > encryption.
> > > > >=20
> > > > > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > > > > to
> > > > > support secure boot. Slightly different configuration tested on
> > > > > multiple arm64 System Ready boards with UEFI firmware, real and
> > > > > firmware
> > > > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > > > selftests but
> > > > > without secure boot which seems to be harder to setup in ovmf.
> > > > >=20
> > > > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > > > > and
> > > > > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > > > > selftests
> > > > > on a build machine with zfs filesystem. Will investigate this
> > > > > further.
> > > > > The issue seems to be in mkfs.ext4 producing broken filesystem,
> > > > > and
> > > > > partially
> > > > > in the tests which don't run the correct rootfs file (.ext4 vs
> > > > > .wic).
> > > > > Will debug this further and it is IMO unrelated to these changes
> > > > > since
> > > > > they reproduce on pure master branch without this series.
> > > > >=20
> > > > > v10: disabled kvm support in new tests since it breaks qemu boot
> > > > > on
> > > > > aarch64
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 build machine, removed "testimage" from =
IMAGE_CLASS as well
> > > > > since
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 can end up testing qemu machine during b=
uild.
> > > >=20
> > > > I hate to say this but
> > > > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is still
> > > > failing:
> > > >=20
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14/l=
ogs/stdio
> >=20
> > and:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/log=
s/stdio
> >=20
> > which is clearer without the other failure.
>=20
> Comparing x86_64 and aarch64 build host runqemu command lines from
> wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 selftest,
> two things pop up.
>=20
> aarch64 still enables KVM via "-enable-kvm". This is despite QEMU_USE_KVM=
 =3D ""
> in the bitbake build config. Oh, this is only applied to the build config=
uration
> and bitbake build command but removed before runqemu is called. I can try=
 to apply
> this config also for runqemu. This pattern is used in several tests. Buil=
d config
> is set temporarily and then removed before calling runqemu. I'll send a s=
eparate
> patch to master-next to reduce spam.
>=20
> aarch64 host uses "-cpu host" with qemu while x86_64 sets the CPU variant=
 explicitly
> to "-cpu cortex-a76". I can't see from build logs which CPU variant the
> host really is. There are a lot of CPU variants in aarch64 world and I do=
n't think
> they are all compatible, or detect CPU features at runtime which can impa=
ct
> things like firmware code badly. I don't know how to fix this.

Well spotted! I'm running a test build with your patch:

https://valkyrie.yoctoproject.org/#/builders/23/builds/329

The CPU info is:

$ cat /proc/cpuinfo=20
processor	: 0
BogoMIPS	: 50.00
Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp =
cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer	: 0x41
CPU architecture: 8
CPU variant	: 0x3
CPU part	: 0xd0c
CPU revision	: 1


$ lscpu=20
Architecture:             aarch64
  CPU op-mode(s):         32-bit, 64-bit
  Byte Order:             Little Endian
CPU(s):                   80
  On-line CPU(s) list:    0-79
Vendor ID:                ARM
  Model name:             Neoverse-N1
    Model:                1
    Thread(s) per core:   1
    Core(s) per socket:   80
    Socket(s):            1
    Stepping:             r3p1
    Frequency boost:      disabled
    CPU max MHz:          3000.0000
    CPU min MHz:          1000.0000
    BogoMIPS:             50.00
    Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32 atomic=
s fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
Caches (sum of all):     =20
  L1d:                    5 MiB (80 instances)
  L1i:                    5 MiB (80 instances)
  L2:                     80 MiB (80 instances)
NUMA:                    =20
  NUMA node(s):           1
  NUMA node0 CPU(s):      0-79
Vulnerabilities:         =20
  Gather data sampling:   Not affected
  Itlb multihit:          Not affected
  L1tf:                   Not affected
  Mds:                    Not affected
  Meltdown:               Not affected
  Mmio stale data:        Not affected
  Reg file data sampling: Not affected
  Retbleed:               Not affected
  Spec rstack overflow:   Not affected
  Spec store bypass:      Mitigation; Speculative Store Bypass disabled via=
 prctl
  Spectre v1:             Mitigation; __user pointer sanitization
  Spectre v2:             Mitigation; CSV2, BHB
  Srbds:                  Not affected
  Tsx async abort:        Not affected





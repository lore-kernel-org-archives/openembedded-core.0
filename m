Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33428CF58E3
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 07:26:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.12886.1726817192777134673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 00:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EMn0eD7E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e5e758093so14748345e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 00:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726817191; x=1727421991; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8/ddL25mcT/kk0dh6CjS/sSmskfzyJqw6XBO0EpCe8=;
        b=EMn0eD7E4zHKIG7W1FdpbZR3cbRookb5SWdlp141TgUfSox2k+/xDg7deo5Gh1cuR+
         xR0DECPCYE1BT+cFWRHEDyB/HRP/6i14U2IU/ZxWqceBxsl7jrYN0XoQ2yxXlOVnQiPd
         S8U8x7KldTrvkjJCoI7AsEGb5vF2ihdMvwMG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726817191; x=1727421991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8/ddL25mcT/kk0dh6CjS/sSmskfzyJqw6XBO0EpCe8=;
        b=JDZlg7f/wWzD5ddZmw7SaUhG7FXoYjgEAfNcdqthyZ7IXSVFvGbcUHbd6rOUDr8cdz
         XUM+oUbt6nzy9D81/K6WtHQcmtjBjgZudGbR8Sf2++edwnbtjQ1pqKz+nS+mXtoqjkDX
         SJDfkySusAhYWAiYiJEUQ+bWmkG8K1NAXFSPEp7kNqyfKzVaoZN38uOGGBmpJTYMJ4On
         miFOkZgRpw+Vqx9dzck0wInALL8BptREkvbbi0vZ1z60W6XxXHnpzmDIRBbo472RzEZY
         dsU6J9eFwl5LixB+cvNHTSJ5yys7P8gjrZsVU1OsFhh2Z7HkIkI2EEaZwcwDC1pf0ESC
         s30w==
X-Forwarded-Encrypted: i=1; AJvYcCUns1BMxx41fjD0T3C5m9PCPiRSA2YNoN6zRmD7HCL6X/xnkpMYljac9PSeVYE+/0ZBFy91h6ly+O2KKTA85JsURQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlZmKkXif2pD5rJm+EP2XMew75IcSnAdf7AgM42aiHXn19jXX7
	/vgbzOhzeY+Ph0rnUOy68Jl2JOmkOWUccW/dAC0VyWjreGPZ2Jvpyr57+gheeSmOy39OYpnANRO
	U
X-Google-Smtp-Source: AGHT+IGM5UrWR1mFijIcAxvHWEUcxOXwo+yCq5Jq74j6aQMPRBS/rahmXM+Zv/mPoWEFB8pu1YLhzA==
X-Received: by 2002:a05:600c:4f03:b0:42b:892d:54c0 with SMTP id 5b1f17b1804b1-42e7abf8594mr9768825e9.12.1726817191169;
        Fri, 20 Sep 2024 00:26:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe:c6ec:26f9:aa4? ([2001:8b0:aba:5f3c:6fe:c6ec:26f9:aa4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae5fc68sm14783305e9.6.2024.09.20.00.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 00:26:30 -0700 (PDT)
Message-ID: <6c93960c9a6461991a3d8b6d98f2419b3b66d699.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 00/12] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2024 08:26:30 +0100
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 07:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204725

On Thu, 2024-09-19 at 17:36 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> These changes enable building systemd uki images which combine
> kernel, kernel command line, initrd and possibly signatures to
> a single UEFI binary. This binary can be booted with UEFI firmware
> and systemd-boot. No grub is needed and UEFI firmware and/or
> systemd-boot provide possibilities for boot menus.
> The uki binary can also be signed for UEFI secure boot
> so the secure boot extends from firmware to kernel and initrd.
> Binding secure boot to full userspace is then easier since for example
> kernel command line and initrd contain the support needed to mount
> encrypted dm-verity etc partitions, and/or create partitions on demand
> with systemd-repart using device specific TPM devices for encryption.
>=20
> Tested on qemuarm64-secureboot machine from meta-arm with changes to
> support secure boot. Slightly different configuration tested on
> multiple arm64 System Ready boards with UEFI firmware, real and firmware
> based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
> without secure boot which seems to be harder to setup in ovmf.
>=20
> Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu and
> wic.Wic2.test_expand_mbr_image, failing when executing all wic selftests
> on a build machine with zfs filesystem. Will investigate this further.
> The issue seems to be in mkfs.ext4 producing broken filesystem, and parti=
ally
> in the tests which don't run the correct rootfs file (.ext4 vs .wic).
> Will debug this further and it is IMO unrelated to these changes since
> they reproduce on pure master branch without this series.
>=20
> v3: rebased, fixed and added more sefltests, removed wic plugin side uki
> support
>=20
> v2: https://lists.openembedded.org/g/openembedded-core/message/204090
>=20
> Michelle Lin (1):
> =C2=A0 uki.bbclass: add class for building Unified Kernel Images (UKI)
>=20
> Mikko Rapeli (11):
> =C2=A0 python3-pefile: add recipe from meta-openembedded
> =C2=A0 maintainers.inc: add python3-pefile
> =C2=A0 systemd-boot-native: add runtime dependency to python3-pefile-nati=
ve
> =C2=A0 image_types_wic.bbclass: set systemd-boot and os-release dependenc=
y
> =C2=A0=C2=A0=C2=A0 for all archs
> =C2=A0 wic bootimg-efi.py: keep timestamps and add debug prints
> =C2=A0 wic bootimg-efi.py: change UKI support from wic plugin to uki.bbcl=
ass
> =C2=A0 oeqa selftest uki.py: add tests for uki.bbclass
> =C2=A0 oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqe=
mu
> =C2=A0 oeqa selftest efibootpartition.py: remove systemd-boot from grub-e=
fi
> =C2=A0=C2=A0=C2=A0 test
> =C2=A0 oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
> =C2=A0 oeqa selftest wic.py: support UKIs via uki.bbclass
>=20
> =C2=A0meta-selftest/wic/test_efi_plugin.wks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0meta/classes-recipe/image_types_wic.bbclass=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +-
> =C2=A0meta/classes-recipe/uki.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 197 ++++++++++++++++++
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../oeqa/selftest/cases/efibootpartition.py=C2=A0=C2=A0 |=C2=A0 11 =
+-
> =C2=A0meta/lib/oeqa/selftest/cases/uki.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 138 ++++++++++++
> =C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 58 ++++--
> =C2=A0.../systemd/systemd-boot-native_256.5.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../python/python3-pefile/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../python/python3-pefile_2023.2.7.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +++
> =C2=A0.../wic/canned-wks/efi-uki-bootdisk.wks.in=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0scripts/lib/wic/plugins/source/bootimg-efi.py | 187 +++++----------=
--
> =C2=A012 files changed, 481 insertions(+), 157 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/uki.bbclass
> =C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-pefile/run-=
ptest
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-pefile_2023=
.2.7.bb
> =C2=A0create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.=
in

In addition to the other recipe issue, I also noticed selftest failing:

https://valkyrie.yoctoproject.org/#/builders/35/builds/142/steps/14/logs/st=
dio

"runqemu - ERROR - Can't handle two unknown args: None qemux86-64"

(all the selftest targets failed, this is one example)

Cheers,

Richard


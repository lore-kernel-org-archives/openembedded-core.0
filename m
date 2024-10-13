Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6F1CF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 07:43:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.27450.1728805399052177247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 00:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E+zzmbLT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso19524365e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728805397; x=1729410197; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gHVF/xENEKZUiF6DWVaOBDrLoxclIWcHn41If9ScyY=;
        b=E+zzmbLT1xB7eYljvw/t/uCjy6jL7KqnIDIpRImsfv6V3hs1pbgJZBeoc0R58EoQ9Z
         twMkJfBEAfAXnvChznwtrfCh8qj3bY4EUugK4FEX73fy3gL+4Uj9mCBDieySDRTuuENO
         ISh8aNIWd4bYVBYMkBqI3E/Bp21X/AIl0Pr1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728805397; x=1729410197;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3gHVF/xENEKZUiF6DWVaOBDrLoxclIWcHn41If9ScyY=;
        b=oncXfb+9kumt+Pgt7PpVMI0+Dd7XZ0stqsAh16NVTVABnmT/+JzriJtTeDD1kUs/Ie
         tzDCW1Ohd8ONdaYdbdGJkckxwR0Diy+lqQce95kKo0R69ZjoqZN0dh1dNlkHmX++/wdx
         LpE0IqPd2Ad78aAMYxUQ4i5KfOSUp2l62Wbv4Z63etOH+LKIeRVsQ4ydvR1NxaAqz2ya
         1JJrUgVtNbRzIJh8vbXemQ1w5FOnsLUadepddlcK2s3udjwNXvFwlMt5WJU8jX+/e7hA
         ZGHzXevYU7j8CXPAPkeLpKlDx8bzI5FrXA0iTS7GkLu1HKfo1gy9nK1SfFczqc7KVzQC
         W7lg==
X-Forwarded-Encrypted: i=1; AJvYcCVkQV5gTR9Oq2pL+mw/BIRqU+K/YSkm3a1ZhLRcnYRYwS+juNTDQv1Ygvmf50DZyTNp5nkh5EGYCe0uCz61h9obVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKd+W71R+KdiKCaKIPsYbA1msVPxEUbA2Z3IblMDSuCDviXBlV
	IiYgNyPYkMywN/QgFP51vcar8/Z7ZPjUMdjxB8pgQFTqeAeoIpb0JrkuN4AycqA=
X-Google-Smtp-Source: AGHT+IHECem8C0hisDJlbUnwNKOrjPTh+hioIcnU3FOuXAWJUVSylPyWh1yWMFThnO+0MQBG7ScA8g==
X-Received: by 2002:a7b:cc8f:0:b0:430:56c1:644c with SMTP id 5b1f17b1804b1-4311df58855mr57769945e9.31.1728805397336;
        Sun, 13 Oct 2024 00:43:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:145f:f6b9:9ebe:60c5? ([2001:8b0:aba:5f3c:145f:f6b9:9ebe:60c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183062ddsm85964445e9.27.2024.10.13.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 00:43:16 -0700 (PDT)
Message-ID: <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Sun, 13 Oct 2024 08:43:15 +0100
In-Reply-To: <20241011122044.12222-1-mikko.rapeli@linaro.org>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 07:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205717

On Fri, 2024-10-11 at 15:20 +0300, Mikko Rapeli via lists.openembedded.org =
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
> v8: fixed comments from Ross Burton: debug print from warning to debug,
> =C2=A0=C2=A0=C2=A0 dropped duplicate DISTRO_FEATURE setting for systemd i=
n tests,
> =C2=A0=C2=A0=C2=A0 removed aarch64 comment from tests which are currently=
 x86 only.
> =C2=A0=C2=A0=C2=A0 Fixed the new aarch64 wic selftest to run on both gene=
ricarm64
> =C2=A0=C2=A0=C2=A0 and qemuarm64 by adding bios, virtio disk driver etc s=
ettings
> =C2=A0=C2=A0=C2=A0 for runqemu (already set in genericarm64 but missing f=
rom qemuarm64).
>=20
> v7: add missing "ovmf" to runqemu argument to
> =C2=A0=C2=A0=C2=A0 test_efi_plugin_plain_systemd_boot_qemu_x86 to fix boo=
t hang
>=20
> v6: fixes wic refactoring botch which broken non-uki systemd-boot usage o=
n
> =C2=A0=C2=A0=C2=A0 genericarm64 reported by Ross Burton <Ross.Burton@arm.=
com>, added
> =C2=A0=C2=A0=C2=A0 selftest to cover this wks usage on x86 and aarch64
>=20
> v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-release
> =C2=A0=C2=A0=C2=A0 dependency for all archs" since systemd-boot does not =
support all
> =C2=A0=C2=A0=C2=A0 architectures
>=20
> v4: handle missing runqemu variable from build config, add
> python3-pefile to fast ptest list
>=20
> v3: rebased, fixed and added more sefltests, removed wic plugin side uki
> support
>=20
> v2: https://lists.openembedded.org/g/openembedded-core/message/204090
>=20
> Michelle Lin (1):
> =C2=A0 uki.bbclass: add class for building Unified Kernel Images (UKI)
>=20
> Mikko Rapeli (7):
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

I'm still seeing failures in CI:

https://valkyrie.yoctoproject.org//#/builders/23/builds/249/steps/14/logs/s=
tdio

which is despite setting:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D6211ad9210e8=
2a5a8dd157c63752ad332c2f5de6

QEMU_USE_KVM =3D "False"

into the test to ensure it doesn't have the issue the barebox testing
was seeing.

I've sent a patch to try and clean up the lock error.

There is also this:

https://valkyrie.yoctoproject.org//#/builders/76/builds/235
https://valkyrie.yoctoproject.org//#/builders/48/builds/181
https://valkyrie.yoctoproject.org//#/builders/54/builds/230

which is due to the binaries being run "in tree" within the edk2 build
as well as from the sysroot. This generates two sets of pyc files which
then conflict (or not) depending on which host the build ran on and
which pyc files are in sstate.

We're going to have to get this fixed before it can merge, probably by
deleting the pyc files at install unless we can find anything more
elegant.

Cheers,

Richard






Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CD1C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:39:29 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.57036.1753951160607579602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hFI11B3O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b7910123a0so686504f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753951159; x=1754555959; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVcgagJ9oEYSz9aPM+PZg7tDOi02OK2vdRIWh4N+6fg=;
        b=hFI11B3OdtdstLcpoMG2Cry/JD3pKq0GJJT1du7KXEIs8c0aXHkOMeFxcEYDQgd6g3
         k8VA9DB2wdZt4meJcM0wwU1SpCPvhIOeVKS5MSLTPYBosJcXwIJM7lMDsU6fmGeN4D6P
         l9OzBso5Ju3IWk31Bdkl+mL6GD0s43Bqp0QSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753951159; x=1754555959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xVcgagJ9oEYSz9aPM+PZg7tDOi02OK2vdRIWh4N+6fg=;
        b=EUemQHzYWpr1s9SLE4rPS4kwXq9Ng7q8m/tap8UusmxnS1cyKWziLLayEclj94nZrN
         SRpQPj30H1Ymf/WEbuXDMKY5Qsgoe8VMiIftTpptKLzDrrvTtPDIe67ukc1e4kz5Vkxn
         UXgisPsiVKaaHq4sxO3VETSKbS53raHfdDJu4sv1L9c1hjxG/jNSoLLopwCXWq/o47I3
         udQ+W5PGYEjoJWpcb+KlsqMRw8hQ/frs6l0P4U0cBGapEHxmut6JoAPOa708aWVVX17F
         4DJwfpvj3DiloUeTPcwdwLjnfZbIELv/PY5kflWAEJcNqhTOSMJnhNeUoRQllFKzGejz
         A2fg==
X-Forwarded-Encrypted: i=1; AJvYcCX5VP1JAM7/VYOtLnYw5PlORs8VUnblxCB6gQEbpq8mNpULIVDooMBAqLVy5JJfLQAJ4g22E+P3q1AP3Xsxh0E/FQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyqk7xACXCso49El7YUpht7OLLxWsxR+7olYazvhExEdYh6Ndw0
	OUw2kR+4MJG82/jUbSwFP3R6QtN4QOmzGZxZ+scx5QWhaDuIzqs651WR0yQVi8BRJ8c=
X-Gm-Gg: ASbGncsoE2FLhVF3O7E7g/mjc70xrWuI9+71g+3QApMrYRE4KQsIpR3iQHiHiy7S9GP
	PegcGYtcmpKLX+2L3d6W1Yf9JYcvvj9abVzrgAyUJrEJ4yWBOnMViOwr1tSLImu1zkDH8h10qp3
	0cyAyHAE8/5ElT6Fia3jxGoovLJKho6ZDqNrAoAjlg4mTFZwiFNHGgklkPjwOLkl/HyPLO98wLl
	oUmyMTnmy6KR+GJ+6s+DBY1Spl+eGyuxxpiXmM+LzXco7YedIMZ0WzRk9JCOGiviKyNalwxNYEK
	i/s79ZAA+Bp9L/oKGx4h+F65k/dErVXQcNtwBWR+fkFuXmNlwxB3OfDPc2FrLh2EIG4xtdmaIgN
	DKoFc+Y33lY2AjiGjtzKKVHtu/iaSXMuJJOR3S3RLdpkaUPqAsO8CuIV9aWozhplozkau1DmRYO
	SYQ3kcBZCoPaA++v4lg9zkzWD3RFzhzAQd
X-Google-Smtp-Source: AGHT+IGIQwKRRQ4p+QvGClLe+Gdk501qa1KqLu/aDMDzuNAxzJ0jHC9pA5ofqKXBF2YeU74VwW03aw==
X-Received: by 2002:a05:6000:4029:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3b794f88792mr5062459f8f.0.1753951158928;
        Thu, 31 Jul 2025 01:39:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6? ([2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm1684279f8f.4.2025.07.31.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:39:18 -0700 (PDT)
Message-ID: <27c891466fb7e2bebdd6764db81fcd3fad9a8da6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 1/3] bootimg_pcbios: support grub legacy
 bios boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2025 09:39:17 +0100
In-Reply-To: <20250726014655.3377745-2-vince@underview.tech>
References: <20250726014655.3377745-2-vince@underview.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221180

On Fri, 2025-07-25 at 21:46 -0400, Vincent Davis Jr via lists.openembedded.=
org wrote:
> Due to the bootimg_biosplusefi source_params['loader']
> had to be named source_params['loader-bios'] so not
> to create conflict in the wics plugin.
>=20
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
> =C2=A0.../lib/wic/plugins/source/bootimg_pcbios.py=C2=A0 | 352 ++++++++++=
+++++---
> =C2=A01 file changed, 302 insertions(+), 50 deletions(-)
>=20
> diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/l=
ib/wic/plugins/source/bootimg_pcbios.py
> index 21f41e00bb..69eaa1ae32 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> @@ -1,5 +1,5 @@
> =C2=A0#
> -# Copyright (c) 2014, Intel Corporation.
> +# Copyright (c) 2014-2025, Intel Corporation.


Do you work for Intel? If not, it seems odd to be extending their
copyright on this?

> =C2=A0#
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0#
> @@ -8,12 +8,15 @@
> =C2=A0#
> =C2=A0# AUTHORS
> =C2=A0# Tom Zanussi <tom.zanussi (at] linux.intel.com>
> +# Vincent Davis <vince (at] underview.tech>
> =C2=A0#
> =C2=A0
> =C2=A0import logging
> =C2=A0import os
> =C2=A0import re
> +import shutil
> =C2=A0
> +from glob import glob
> =C2=A0from wic import WicError
> =C2=A0from wic.engine import get_custom_config
> =C2=A0from wic.pluginbase import SourcePlugin
> @@ -24,11 +27,52 @@ logger =3D logging.getLogger('wic')
> =C2=A0
> =C2=A0class BootimgPcbiosPlugin(SourcePlugin):
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> -=C2=A0=C2=A0=C2=A0 Create MBR boot partition and install syslinux on it.
> +=C2=A0=C2=A0=C2=A0 Creates boot partition bootable off of legacy BIOS fi=
rmare with
> +=C2=A0=C2=A0=C2=A0 MBR/MSDOS as partition table format. Plugin will inst=
all caller
> +=C2=A0=C2=A0=C2=A0 selected bootloader directly to resulting wic image.
> +
> +=C2=A0=C2=A0=C2=A0 Supported Bootloaders:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * syslinux
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * grub
> +
> +=C2=A0=C2=A0=C2=A0 ****************** Wic Plugin Depends/Vars **********=
********
> +=C2=A0=C2=A0=C2=A0 WKS_FILE_DEPENDS =3D "grub-native grub"
> +=C2=A0=C2=A0=C2=A0 WKS_FILE_DEPENDS =3D "syslinux-native syslinux"
> +
> +=C2=A0=C2=A0=C2=A0 # Optional variables
> +=C2=A0=C2=A0=C2=A0 GRUB_PREFIX_PATH =3D '/boot/grub2'=C2=A0=C2=A0=C2=A0 =
# Default: /boot/grub
> +=C2=A0=C2=A0=C2=A0 GRUB_MKIMAGE_FORMAT_PC =3D 'i386-pc'=C2=A0 # Default:=
 i386-pc
> +
> +=C2=A0=C2=A0=C2=A0 WICVARS:append =3D "\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GRUB_PREFIX_PATH \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GRUB_MKIMAGE_FORMAT_PC \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> +=C2=A0=C2=A0=C2=A0 ****************** Wic Plugin Depends/Vars **********=
********
> +
> +
> +=C2=A0=C2=A0=C2=A0 **************** Example kickstart Legacy Bios Grub B=
oot ****************
> +=C2=A0=C2=A0=C2=A0 part boot --label bios_boot --fstype ext4 --offset 10=
24 --fixed-size 78M
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 --source bootimg_pcbios --sourceparams=3D"loader-bios=3Dgrub" --acti=
ve
> +
> +=C2=A0=C2=A0=C2=A0 part roots --label rootfs --fstype ext4 --source root=
fs --use-uuid
> +=C2=A0=C2=A0=C2=A0 bootloader --ptable msdos --source bootimg_pcbios
> +=C2=A0=C2=A0=C2=A0 **************** Example kickstart Legacy Bios Grub B=
oot ****************
> +
> +
> +=C2=A0=C2=A0=C2=A0 *************** Example kickstart Legacy Bios Syslinu=
x Boot ****************
> +=C2=A0=C2=A0=C2=A0 part /boot --source bootimg_pcbios --sourceparams=3D"=
loader-bios=3Dsyslinux"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 --ondisk sda --label boot --active --align 1024
> +
> +=C2=A0=C2=A0=C2=A0 part roots --label rootfs --fstype ext4 --source root=
fs --use-uuid
> +=C2=A0=C2=A0=C2=A0 bootloader --ptable msdos --source bootimg_pcbios
> +=C2=A0=C2=A0=C2=A0 *************** Example kickstart Legacy Bios Syslinu=
x Boot ****************
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 name =3D 'bootimg_pcbios'
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 # Variable required for do_install_disk
> +=C2=A0=C2=A0=C2=A0 loader =3D ''
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 @classmethod
> =C2=A0=C2=A0=C2=A0=C2=A0 def _get_bootimg_dir(cls, bootimg_dir, dirname):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> @@ -48,63 +92,91 @@ class BootimgPcbiosPlugin(SourcePlugin):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise WicError("Couldn't=
 find correct bootimg_dir, exiting")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 @classmethod
> -=C2=A0=C2=A0=C2=A0 def do_install_disk(cls, disk, disk_name, creator, wo=
rkdir, oe_builddir,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootimg_=
dir, kernel_dir, native_sysroot):
> +=C2=A0=C2=A0=C2=A0 def _get_staging_libdir(cls):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Called after all partitions h=
ave been prepared and assembled into a
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk image.=C2=A0 In this cas=
e, we install the MBR.

This patch changes the order of the functions which makes the diff
really hard to read. I'd suggest putting code re-arrangement into a
separate patch so we can then see what the real changes are.

Cheers,

Richard


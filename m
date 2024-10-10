Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A3ECF07BD
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 07:53:58 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.38245.1728546833430582311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 00:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qqqrSLfg;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fada911953so15204561fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 00:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728546831; x=1729151631; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s645Uyh8LcjOe2OxV+5R957hJ1LKI7+2GF6dZmN+6T8=;
        b=qqqrSLfgYgGOkoPfwAmIr311/t0VAybwsk+pKzwBxp5495XL4jTZU1xJQzSGV3CcsX
         xbFbnVWfHOSDJWZXTWLLH6IiQHuJPEyxsVFhXbQAFbTyWoBIAbYU6dg2Tzh4Fgq+J/NG
         cK3CIy7PvQRzV4IWaToAkOHMpJomR+3ZB1hPpIODGIMwMavOFzGDrY3JZwbcYZQOrNJT
         BpvfPJP/eHGFaJ4QAwABlKSKGSW9neuIpcxR9rASU+99ib17ufAl1S/dmqEP7eptGgwx
         QxuloX5vqBEvKIDQ53Snlxcs+i5JmAuYFSztEe5HaAQHIlptOu8XXe3INkg/HAVGArTu
         OP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546831; x=1729151631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s645Uyh8LcjOe2OxV+5R957hJ1LKI7+2GF6dZmN+6T8=;
        b=u8v/ieAVNIGdWQ1jsUDVzDb5gXWIySixch12oIG18W19r+B/GgaKhPr6SG+yU2k4PV
         ApvudYzNACtOFWO2fEsBFc/hqEiybzne+c6DLgzFxsQu8hxP1G7Cgl4oTJeSjilgqxJ8
         ymNvAJtuwXd+GJM0DWf5TrcPy8snv1za4L+QjVQ51SrI/ftu3U8RJQquyH0tD+x5hIUG
         Nq7quqRJ2vSTzVJeTyZFbQ+O4+NifWVvuSTWcPP8/DspMUCBI+frV60nDg7okJSTCUtR
         uxCn+Gm7cbUldkv8EFrZGZ38bPpa1ZlgekwYUgvzaECZrkw2Jz0ppfwDTJF199w3hz8j
         tL6Q==
X-Gm-Message-State: AOJu0YyFyjhH6rwZLcPHVzz6xYWTnFFt3KAOoeVJxjHz8q84ZZGG/fUF
	WjleMCrf1zUQUT5gymeq9v73cpPkZVX/xjBiyl9mAAWbHsiSyKpzX/SAK6iNJvo=
X-Google-Smtp-Source: AGHT+IFKxVWtUtb375TdIZI9gps2oy1xtnhqF1MoqjEPXWTgG8+fJ+vCy6fNFN4uMM145KGqhoWQgw==
X-Received: by 2002:a05:6512:3e24:b0:539:922e:2374 with SMTP id 2adb3069b0e04-539c985a890mr776562e87.1.1728546831099;
        Thu, 10 Oct 2024 00:53:51 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f0fbfsm146416e87.236.2024.10.10.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:53:50 -0700 (PDT)
Date: Thu, 10 Oct 2024 10:53:48 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v6 0/8] systemd uki support
Message-ID: <ZweIDGG8rMT5E9R-@nuoska>
References: <20241009112634.402123-1-mikko.rapeli@linaro.org>
 <17FCDA527F20D203.22523@lists.openembedded.org>
 <21828cb8152b762bbc4987312e2dc0c0613c34fb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21828cb8152b762bbc4987312e2dc0c0613c34fb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 07:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205387

Hi,

On Wed, Oct 09, 2024 at 11:36:51PM +0100, Richard Purdie wrote:
> On Wed, 2024-10-09 at 18:53 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2024-10-09 at 14:26 +0300, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > These changes enable building systemd uki images which combine
> > > kernel, kernel command line, initrd and possibly signatures to
> > > a single UEFI binary. This binary can be booted with UEFI firmware
> > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > systemd-boot provide possibilities for boot menus.
> > > The uki binary can also be signed for UEFI secure boot
> > > so the secure boot extends from firmware to kernel and initrd.
> > > Binding secure boot to full userspace is then easier since for
> > > example
> > > kernel command line and initrd contain the support needed to mount
> > > encrypted dm-verity etc partitions, and/or create partitions on
> > > demand
> > > with systemd-repart using device specific TPM devices for
> > > encryption.
> > > 
> > > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > > to
> > > support secure boot. Slightly different configuration tested on
> > > multiple arm64 System Ready boards with UEFI firmware, real and
> > > firmware
> > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > selftests but
> > > without secure boot which seems to be harder to setup in ovmf.
> > > 
> > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > > and
> > > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > > selftests
> > > on a build machine with zfs filesystem. Will investigate this
> > > further.
> > > The issue seems to be in mkfs.ext4 producing broken filesystem, and
> > > partially
> > > in the tests which don't run the correct rootfs file (.ext4 vs
> > > .wic).
> > > Will debug this further and it is IMO unrelated to these changes
> > > since
> > > they reproduce on pure master branch without this series.
> > > 
> > > v6: fixed wic refactoring botch which broken non-uki systemd-boot
> > > usage on
> > > ��� genericarm64 reported by Ross Burton <Ross.Burton@arm.com>,
> > > added
> > > ��� selftest to cover this wks usage on x86 and aarch64
> > > 
> > > v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-
> > > release
> > > ��� dependency for all archs" since systemd-boot does not support
> > > all
> > > ��� architectures
> > > 
> > > v4: handle missing runqemu variable from build config, add
> > > python3-pefile to fast ptest list
> > > 
> > > v3: rebased, fixed and added more sefltests, removed wic plugin
> > > side uki
> > > support
> > > 
> > > v2:
> > > https://lists.openembedded.org/g/openembedded-core/message/204090
> > > 
> > 
> > This seems to be causing selftest failures unfortunately:
> > 
> > https://valkyrie.yoctoproject.org/#/builders/54/builds/206/steps/14/logs/stdio
> 
> I think something may be broken in master causing that. Not quite sure
> what/when yet.

Sorry, this is my bad. x86 test runqemu is missing ovmf argument. I don't know how
this slipped through. Will send a new version.

Cheers,

-Mikko


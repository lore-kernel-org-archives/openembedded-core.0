Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B45C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 16:39:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.50085.1674664741827309053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bk6EFF/V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id h12so13661254wrv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsZnXBTv0fJWkQOUapHKv1N3F4V3DWYCg9Z0bwbxKhY=;
        b=bk6EFF/V7bocEcCZ9+fV1wAFwxiDbghJ7iMwH+M7zSBafnT/oJvYqucezw/k1LoD2u
         DEHsjNVtLEWkpI/9Kp8sxLLSmsgjJC80eMEOuQSuWYXTVZ7j3x9mIu39NmpuH6D78xyK
         ojSOV/+h/ODyku3nvD/zDCIlRbMGVieIHOn24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsZnXBTv0fJWkQOUapHKv1N3F4V3DWYCg9Z0bwbxKhY=;
        b=616loHnZ4BWE6t1LFbJr+/yTF+6NDcLGJY1ZLzlJCQ5TZt2/jseZXTwHbAyWGrtXVU
         Q4/gFA3EyINpOYR0q5KYYoo8sasK+nfFj93CpNbIps2KpbkB3QL0Rh45ShXx4Pr7yfN5
         lRYM463GVCYRXSkCe5jmjdZLq7gvxywtioVuff4qdXXSiwA29Go+ZNsMaNP34olYG+xO
         UaaFlSbfnmwAXnW0nsfReIWkAwKSY3mAv5gJcStdNNFHPk4D2mS6es7dydpq52IRVKbg
         RJ7YRtKWPYimkJNgwV01deVsCi5BXAEnpy+d8vDkJUZL2Q2QHLoPISy3ExthSslaYczc
         /Mvw==
X-Gm-Message-State: AFqh2koYg/dqbqbssUTjiSNCxLDgaGOwPmlJjg1B9rinvfCF0KH3FxBs
	fl6Og74lliJAfhobOYGkxDl2xiync6zzIlAk
X-Google-Smtp-Source: AMrXdXsYI+QR2fJR9YoYvTVj2OyKokTp1e4k7WNJTPU2Yt7cCYIjbTMur5cftuBj/zWUBxA1gmu8sw==
X-Received: by 2002:a05:6000:1006:b0:24f:5890:616b with SMTP id a6-20020a056000100600b0024f5890616bmr36131241wrx.56.1674664740101;
        Wed, 25 Jan 2023 08:39:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a? ([2001:8b0:aba:5f3c:3356:3b1f:dd00:4e1a])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d4fc4000000b00289bdda07b7sm3719393wrw.92.2023.01.25.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 08:38:59 -0800 (PST)
Message-ID: <9bc20570586215be40855a81291c37b8202e9c47.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 0/3] set qemuppc64 default nfs rootfs mount r/w
 size to 524288
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2023 16:38:59 +0000
In-Reply-To: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
References: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 16:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176370

On Tue, 2023-01-17 at 10:05 +0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>=20
> On master oe, build a qemuppc64 with systemd as default init, when we
> use nfs bootup, the kernel might panic due to missing symbol in dynamic
> libraries as below:
>=20
>   hid-generic 0003:0627:0001.0003: input: USB HID v0.01 Mouse [QEMU QEMU =
USB Tablet] on usb-0000:00:01.0-3/input0
>   /sbin/init: /lib64/libm.so.6: version `XZ_5.0' not found (required by /=
usr/lib64/libkmod.so.2)
>   Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00007f=
00
>   CPU: 0 PID: 1 Comm: init Not tainted 5.15.78-yocto-standard #1
>   Call Trace:
>   [c000000007443ba0] [c0000000009538d0] dump_stack_lvl+0x74/0xa8 (unrelia=
ble)
>   [c000000007443be0] [c000000000103524] panic+0x170/0x3cc
>   [c000000007443c80] [c00000000010cf64] do_exit+0xb44/0xb50
>   [c000000007443d50] [c00000000010d040] do_group_exit+0x60/0xd0
>   [c000000007443d90] [c00000000010d0d4] sys_exit_group+0x24/0x30
>   [c000000007443db0] [c00000000002cfd4] system_call_exception+0x194/0x2f0
>   [c000000007443e10] [c00000000000c2cc] system_call_common+0xec/0x250
>   --- interrupt: c00 at 0x7fff9ed9e840
>   NIP:  00007fff9ed9e840 LR: 00007fff9ed7da20 CTR: 0000000000000000
>   REGS: c000000007443e80 TRAP: 0c00   Not tainted (5.15.78-yocto-standard=
)
>   MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 240224=
42  XER: 00000000
>=20
> One or more of the libraries systemd depends on failed to load due to
> unresolved symbols/functions.  This was intermittent - with a failure
> rate estimated between 5% and 30%.
>=20
> After checking the code, this issue happens on gcc 12, kirkstone is using
> gcc 11 works well, with both using the exact same v5.15.84 kernel commit.
>=20
> There is a kernel fix from upstream [1], they changed the rsize / wsize
> to a multiple of PAGE_SIZE, when we applied this patch, the qemuppc64's
> default r/wsize went from 4096 to 524288.But the qemuppc64 doesn't have
> its own linux-yocto kernel branch, so apply this change might cause
> regression with other platforms which share branch with qemuppc64.
>=20
> So, we added an extra option for nfs rootfs, and set the qemuppc64 defaul=
t
> r/w size to 524288 to line up with the kernel fix[1].
>=20
> Yocto did a similar thing in the distant past[2] - prior to boot-arg
> adjustments existing - by allowing a Kconfig to set the defaults on
> nfsboot, in order to work around hardware limitations.
>=20
> There are 3 patches for this fix:
> the patch 1 added QB_NFSROOTFS_EXTRA_OPT in qemuboot.bbclass,it contains=
=20
> a default QB_NFSROOTFS_EXTRA_OPT value and some notes in comment.
> the patch 2 contains processing this value in runqemu script
> the patch 3 set the r/wsize value in qemuppc64 machine configuration
> file.
>=20
> Reference:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D940261a195080cf
> [2] https://git.yoctoproject.org/linux-yocto-4.1/commit/?h=3Dstandard/bas=
e&id=3Da96cfd98add95
>=20
> Xiangyu Chen (3):
>   qemuboot.bbclass: add QB_NFSROOTFS_EXTRA_OPT for nfs rootfs extra
>     option
>   runqemu: add process of option QB_NFSROOTFS_EXTRA_OPT
>   qemuppc64: set the qemuppc64 nfs r/wsize mount options to 524288
>=20
>  meta/classes-recipe/qemuboot.bbclass | 3 +++
>  meta/conf/machine/qemuppc64.conf     | 1 +
>  scripts/runqemu                      | 6 +++++-
>  3 files changed, 9 insertions(+), 1 deletion(-)

I've tried to understand this a couple of times and failed, I think
there is some missing information in the commits.

What is the default page size on qemuppc64? What is the default nfs
r/wsize? Is the issue the default page size on ppc64?

I also need to highlight that qemuppc64 isn't officially supported by
Yocto Project and isn't part of our test matrix on the autobuilder. If
anyone is relying on this support they really need to commit to
maintaining that architecture.

Cheers,

Richard






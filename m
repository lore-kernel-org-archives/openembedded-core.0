Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E7DC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 13:19:43 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.16090.1749042528244979771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 06:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OpL78u9v;
 spf=pass (domain: linaro.org, ip: 209.85.128.176, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70f31433d96so63386337b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749042527; x=1749647327; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ldy4hKo+qpB7aiH5mlsvLZ39JZ/bS3YrxOOEpxHDogI=;
        b=OpL78u9v4ZR7pbbwkrZuBKtMMWM8rjoF8u8g0/5ffkqLcaxTpWKtrL+wxI65hEHzcI
         leXQoIvmIYib14+G2d13VBtSR62hDhh6WZfw4zpC2EDagLC1Vw2jT9XZfFTLcn+1wjy6
         ey85RCFgrXf/fKv0lw7a3HdL4d+wBkzhWRSO2EdiDcJqMQyKlAzQnf4A9sLnL+N59XZn
         knWPJqeG0Cr8b3T//W33ejZ/51BEHn4HVzrpxJmUYaUzQCBhUGoflihN/gVQndkXJoUk
         81LwZezQkyYgxlvbHio/BUr9Kbp23+IgUx9JXokkv6mw62AdmwImOvOnUoL8JLZOekYL
         1A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042527; x=1749647327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldy4hKo+qpB7aiH5mlsvLZ39JZ/bS3YrxOOEpxHDogI=;
        b=rU3v8HMipRI3KQCPqBFSfNJkUFthmS5xRx4d+FlsK2QSQnd0HRLZgZy/bil9juFZIH
         t28eYe6R22u7FR6Bqur7j4ryvQKH7iL1EjekytFPxrYnf52v7FQ1LTUpw0UyoC/eYjKv
         AI8XS3XJJCaqllPcqCLm+VXgvCAis+mJTD3/2JRPyFCzMmompDcCjkloV/C545lvaDlw
         2eE1KrCa7yhet+16okjQHZEtmcVKTDpEDdFgvLIiPyD5vyf2b5wbnwIxpkssD+fhPyBc
         60suOJSJ2P9sDWtfHT6YMwtabX16zJTbsmGpXWh+MJZ4r4o3BypIuvnsgTFZAXJY1Vcf
         63mA==
X-Forwarded-Encrypted: i=1; AJvYcCUndPVV7y5mZ/WvpOBYvMafFcPjeD7ZXzBZuy7rm8yIZz7NrPC1VAAnBIjmrPcpW+biIpKuntAUNgmbeuwDsOfH1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzD/InYUwYPm5kgVi20C4nMP3zu8/9VqWaufeGV5DZNwPHgPA7v
	44qXuvePX4ikiQB7SSHL7ZrTtuBf1RzUHsEuOX5zHwdrpO24ruGXGDSIn/Ops3Ia+cSzrvyptdp
	0hLW0mCJcOVtEPpzjDYKS7+xjCmk62TAUxLuZstBWNQ==
X-Gm-Gg: ASbGncslOe08aRwXE0/7aabSn2xjO7H11KB/toz4aXd3NGpPh34S/yhAJICmJ7a04vY
	j9Zy3JJH1WxqBom+yeQ6euVj3hKtyFg7dBZ+0bi1lp6HTKiv0RTOXztlhpLxrHiMjSLAMdL2IoF
	Z67Vs2O2igwbevuJPdEndXdGbw0cd01S7b2Q==
X-Google-Smtp-Source: AGHT+IEmBgKqyqStTAF5XXdFq6ZYcCTvGkAphA/ms1SOsnTiM8HA0w/QUjBAhAFLqCtE2yU9C2MGMpMxTi0t92i/J8E=
X-Received: by 2002:a05:690c:ed6:b0:70e:70f4:30e9 with SMTP id
 00721157ae682-710d9d76194mr35070057b3.4.1749042527216; Wed, 04 Jun 2025
 06:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
 <20250528005133.GP100073@bill-the-cat> <aDav-wwUJUIGGFVI@nuoska>
 <20250528141808.GU100073@bill-the-cat> <aEAbciwMY_LS2AMU@nuoska>
In-Reply-To: <aEAbciwMY_LS2AMU@nuoska>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 4 Jun 2025 16:08:10 +0300
X-Gm-Features: AX0GCFu5hi756-xHApC4q63g7VDXYZYGIlsMll36rFsrqzkVeLc83xUKnwVXL0U
Message-ID: <CAC_iWj+AAsCX7cRB=0gG+RefX74TO2jTk6Fu8n8-rZCMc+2GtQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 13:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217946

Hi all,

On Wed, 4 Jun 2025 at 13:09, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> On Wed, May 28, 2025 at 08:18:08AM -0600, Tom Rini wrote:
> > On Wed, May 28, 2025 at 09:40:59AM +0300, Mikko Rapeli wrote:
> > > On Tue, May 27, 2025 at 06:51:33PM -0600, Tom Rini wrote:
> > > > On Mon, May 26, 2025 at 11:35:44AM +0300, Mikko Rapeli wrote:
> > > >
> > > > > Booting u-boot on qemu with kvm is currently hanging on aarch64
> > > > > build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> > > > > disabled as a workaround.
> > > > >
> > > > > To reproduce, build on kvm enabled host where "kvm-ok"
> > > > > succeeds. For example genericarm64 machine and core-image-base
> > > > > should then boot with:
> > > > >
> > > > > $ runqemu slirp nographic novga snapshot kvm
> > > > >
> > > > > On qemuarm64, default kvm setup will boot directly to kernel
> > > > > and is not affected by this. If build enables u-boot as bios
> > > > > then the same issue happens.
> > > > >
> > > > > Without this config workaround, the boot hangs without
> > > > > any messages in qemu output but ctrl-a-c to qemu console
> > > > > can shutdown the emulated machine.
> > > > >
> > > > > This seems to have regressed after u-boot 2025.04 update.
> > > > > KVM boot can be detected from speed, for example genericarm64
> > > > > boots in 550 ms with KVM and without in over 5 seconds.
> > > > >
> > > > > Fixes: [YOCTO #15872]
> > > > >
> > > > > Upstream u-boot discussion:
> > > > > https://lists.denx.de/pipermail/u-boot/2025-May/590101.html
> > > > >
> > > > > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > >
> > > > I think it's a tad early to disable this. On the U-Boot side, it's being
> > > > looked in to. In fact, you're saying v2025.04 is working (current
> > > > release) and v2025.07-rcX is failing. At this point in the U-Boot cycle
> > > > I think we'll figure out the problem and fix it. If we can't figure out
> > > > how to keep all the use cases working for v2025.07 then disabling
> > > > BLOBLIST here in OE can be thought on, I would expect. Thanks.
> > >
> > > 2025.04 is affected by this. My wording for this is not accurate enough, sorry.
> >
> > Do you have a known good version where it does work? I assume it's
> > v2025.01 that does work, and an OE-specific revert of commit
> > 53d5a221632e ("emulation: Use bloblist to hold tables") with appropriate
> > status tags about it being discussed upstream would make the most sense.
>
> As you suspected and Ilias bisected this to:
>
> 53d5a221632eeef7483d250fdde09bde6cb54df9 is the first bad commit
> commit 53d5a221632eeef7483d250fdde09bde6cb54df9
> Author: Simon Glass <sjg@chromium.org>
> Date:   Fri Jan 10 17:00:17 2025 -0700
>
>     emulation: Use bloblist to hold tables
>
>     QEMU can have its own internal ACPI and SMBIOS tables. At present U-Boot
>     copies out the SMBIOS tables but points directly to the ACPI ones.
>
>     The ACPI tables are not aligned on a 4KB boundary, which means that UPL
>     cannot use them directly, since it uses a reserved-memory node for the
>     tables and that it assumed (by EDK2) to be 4KB-aligned.
>
>     On x86, QEMU provides the tables in a mapped memory region and U-Boot
>     makes use of these directly, thus making it difficult to use any common
>     code.
>
>     Adjust the logic to fit within the existing table-generation code. Use a
>     bloblist always and ensure that the ACPI tables is placed in an aligned
>     region. Set a size of 8K for QEMU. This does not actually put all the
>     tables in one place, for QEMU, since it currently adds a pointer to the
>     tables in QFW.
>
>     On ARM, enable bloblist so that SMBIOS tables can be added to the
>     bloblist.
>
>     Signed-off-by: Simon Glass <sjg@chromium.org>
>
> So tags v2025.01-rc4 and earlier are fine and v2025.04-rc1 and newer
> are affected.
>
> Reverting this is a bit hard due to other changes so for oe-core it's
> easier to disable CONFIG_BLOBLIST where possible, on qemuarm64 and
> genericarm64 (uses same qemu defconfig) yocto target machines for
> example, which for testing purposes can be used with qemu and KVM.

So I had a closer look. It is affected by previous patches added for
BLOBLIST. The reason this one triggers it is because it
unconditionally enables BLOBLIST for qemu arm64.

I'll need a few more days on it, but I will have a proper fix

Cheers
/Ilias
>
> Cheers,
>
> -Mikko


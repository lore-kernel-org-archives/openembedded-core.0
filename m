Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB901E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 10:13:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.56934.1696155192823014621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 03:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VpEKpEGC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so5940323f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 03:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696155191; x=1696759991; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RV3reYLmyB2blinKRtf7DSGkHLt7hjYbdKa1+h+rhx8=;
        b=VpEKpEGCV73F6aCdjCngVb/qt+V5SaHnUY2fZce+NUBDY34Lrr4BIv+TeV9p0SQrYm
         Rdcj6uXJzHG4TwdAPOjr3DZC5le0Qlb38N3EaGPHYz7MKQCtGXCNndr0BJzJmajidt4S
         bZpJ2FYA6xcur2t9S4gETzPQCj686fPqtK/Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696155191; x=1696759991;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RV3reYLmyB2blinKRtf7DSGkHLt7hjYbdKa1+h+rhx8=;
        b=t1yK/+kr5Olzm9YlB5LhESvvaniKGbLTtEg2So99LPe7Tbp+dGr+fIaXy7Ezg+n27S
         LKY2DkQruOznIqJgduT31oWDUyn7eGh93X/td1L3Y1s36pcX6jGcKuetANfp0lGVwSC9
         dVRihddEWerQEZR6rL4k+2hIykqeLrmzx9dp41bzr8FNuaXwQ9UcNnGMt5IpvtmvY8Oj
         bUL3Tje/r1gWlKeGGn4c0YMlUYhkqU7wi4ZIbht8Q6LmhkrJButTo/Vx2a6uXX1HU74T
         7DpMkR3sXO67xeOCH//fpSOoec41kae1B4Js+Ua4G+AHczxRIye9l4o/rE0O+znCOhYC
         os5A==
X-Gm-Message-State: AOJu0Yy2aFSrN8JBJi7ds/hWPREWwoqU9FViSuXi9GaJA0h1eQI8p9Tc
	f24oIvfmMwfVsvesXRDvlTinyw==
X-Google-Smtp-Source: AGHT+IF4gg/W0BaQoIf9miuahMrMzMjDICha1TkjYeP2Jzqy2Uu0tjrZiSIkVcjzlti08rHDyLIeaA==
X-Received: by 2002:adf:f546:0:b0:31f:d7bb:481e with SMTP id j6-20020adff546000000b0031fd7bb481emr7738222wrp.63.1696155191033;
        Sun, 01 Oct 2023 03:13:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d? ([2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d])
        by smtp.gmail.com with ESMTPSA id k10-20020adfd22a000000b0032320a9b010sm17690610wrh.28.2023.10.01.03.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 03:13:10 -0700 (PDT)
Message-ID: <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 01 Oct 2023 11:13:09 +0100
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 10:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188479

On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> Given where we are in the release cycle, this clearly is NOT a typical
> consolidated pull request.
>=20
> I've done what normally takes about three weeks in about 4 days.
>=20
> With 6.4 going EOL before expected upstream, it really isn't a suitable
> reference kernel for the release.
>=20
> So we've decided to take on the task of getting 6.5 ready and available,
> and at the same time moving the -dev kernel to v6.6. The -dev kernel
> testing for 6.5 was critical for this, since I already knew the core
> was sane.
>=20
> Also we've never shipped purposely mismatched libc-headers in the release=
,
> so I also took the leap to update the libc-headers to match.
>=20
> I've already sent fixes to meta-oe, and there's a btrfs update in this
> series to fix breakage that I found in the tightly coupled packages.
>=20
> I've built and booted core-image-kernel-dev, core-image-minimal, core-ima=
ge-sato
> for both glibc and musl for all the supported architectures.
> There will be some things that break regardless, but this needs the
> better coverage of the AB.
>=20
> If this causes too much problems, our choices are to ship 6.4 EOLd, or
> fall all the way back to 6.1.
>=20
> I'll remove 6.4 from master once we've figured out the fallout from
> this kernel, and which direction we are going.

I've merged this series which seemed to work fine. Given the time
constraints, I thought I'd throw some 6.5 testing at the autobuilder.
It ran into two issues. One was cryptodev, I have a patch for that in
master-next. The other were entropy boot failures on arm kvm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/step=
s/12/logs/stdio

[    0.796831] Key type id_resolver registered
[    0.797581] Key type id_legacy registered
[    0.798724] Key type cifs.idmap registered
[    0.808070] jitterentropy: Initialization failed with host not compliant=
 with requirements: 9
[    0.809690] xor: measuring software checksum speed
[    0.811307]    8regs           : 12333 MB/sec
[    0.812862]    32regs          : 12322 MB/sec
[    0.814885]    arm64_neon      :  7851 MB/sec
[    0.815626] xor: using function: 8regs (12333 MB/sec)


-----------------------
Central error: [    0.808070] jitterentropy: Initialization failed with hos=
t not compliant with requirements: 9
***********************

I did find this in google:

https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-243607479d=
5c@i2se.com/T/

which does bisect to a change.

I'll rerun the autobuilder testing with the cryptodev patch and see if
anything else transpires.

Cheers,

Richard





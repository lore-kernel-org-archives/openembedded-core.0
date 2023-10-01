Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED3AE748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 11:49:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.57833.1696160982104525559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 04:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iVcI3Y+J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3231dff4343so1277652f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696160980; x=1696765780; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1rAzGgtSmLHn8LQgSQQw9/5CH4rA5R4p6X478akA5uc=;
        b=iVcI3Y+JilRYV6Bb9xkjrsHj6oNanJCWme+c4AMU8YVmVnB2RwC6SRkzYgRebtYYv0
         v+BUK+T4CuAIXuDpKYkTcR03OT8G/txuFvVn1MZmfT3Hf/XpjwZAtfh0gSOZ/Yhp8JoW
         MiieG89ne8IJ63zyGs+XxKeyxUa+KlSKdfJJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696160980; x=1696765780;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rAzGgtSmLHn8LQgSQQw9/5CH4rA5R4p6X478akA5uc=;
        b=tol/A+qU0gPJ9o1dXvZabt5TSLybkOS7sOIW0Cupuy+rO2XX4ABgqiGBew8hhem5Tp
         a1V0+t5jnhW1J84kxr4xq2xKJYtDQBKTtFqkXeUG303WYh35W3N5xRt8IxpHVgrYgLnS
         jRbVWXlrLmj/FF4jLING+9z5eYz7UFIVGnqHsej47Hbv9LLkrDbg+fP2A50SPKg76Ct0
         GhruT/Q0E+KiradAypI+yUVeTUTqDNf/p/dyEMlt39PrvvMXM4BWqL88uJ3nVVVthfD5
         qHAgePlvXchbLihR0hHjJFDe7iIQYLF/G2i0Vd8JJNR5zeJT1vkOGF0wZUnckM1JuOIV
         CC6g==
X-Gm-Message-State: AOJu0YwZbOXA1uwCZrHHGZvHhrNtC3WdEbGOMqYJ0GCIiT9b0lw+mdsf
	Vu2AIkCvL/W2gCqu4TkvBM0/jg==
X-Google-Smtp-Source: AGHT+IHpCBjElDiFaHREBAk3U1W348GoNrp35rjsSsJ1ib7Yulwaua5XRJVnEtJxdjhSPDRd9LKoag==
X-Received: by 2002:adf:f050:0:b0:319:7ec8:53ba with SMTP id t16-20020adff050000000b003197ec853bamr7598019wro.14.1696160980308;
        Sun, 01 Oct 2023 04:49:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d? ([2001:8b0:aba:5f3c:ba85:d0c7:3f23:eb3d])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d46c7000000b0031fbbe347e1sm25670225wrs.65.2023.10.01.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 04:49:39 -0700 (PDT)
Message-ID: <a87cca5199af470fc7e3b415d57f5b3b8fad4318.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 01 Oct 2023 12:49:39 +0100
In-Reply-To: <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
	 <2c1e6c379204c619cc4fe41f1b3cea1b8c6582f7.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 11:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188481

On Sun, 2023-10-01 at 11:13 +0100, Richard Purdie wrote:
> On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> > Given where we are in the release cycle, this clearly is NOT a typical
> > consolidated pull request.
> >=20
> > I've done what normally takes about three weeks in about 4 days.
> >=20
> > With 6.4 going EOL before expected upstream, it really isn't a suitable
> > reference kernel for the release.
> >=20
> > So we've decided to take on the task of getting 6.5 ready and available=
,
> > and at the same time moving the -dev kernel to v6.6. The -dev kernel
> > testing for 6.5 was critical for this, since I already knew the core
> > was sane.
> >=20
> > Also we've never shipped purposely mismatched libc-headers in the relea=
se,
> > so I also took the leap to update the libc-headers to match.
> >=20
> > I've already sent fixes to meta-oe, and there's a btrfs update in this
> > series to fix breakage that I found in the tightly coupled packages.
> >=20
> > I've built and booted core-image-kernel-dev, core-image-minimal, core-i=
mage-sato
> > for both glibc and musl for all the supported architectures.
> > There will be some things that break regardless, but this needs the
> > better coverage of the AB.
> >=20
> > If this causes too much problems, our choices are to ship 6.4 EOLd, or
> > fall all the way back to 6.1.
> >=20
> > I'll remove 6.4 from master once we've figured out the fallout from
> > this kernel, and which direction we are going.
>=20
> I've merged this series which seemed to work fine. Given the time
> constraints, I thought I'd throw some 6.5 testing at the autobuilder.
> It ran into two issues. One was cryptodev, I have a patch for that in
> master-next. The other were entropy boot failures on arm kvm:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5512/st=
eps/12/logs/stdio
>=20
> [    0.796831] Key type id_resolver registered
> [    0.797581] Key type id_legacy registered
> [    0.798724] Key type cifs.idmap registered
> [    0.808070] jitterentropy: Initialization failed with host not complia=
nt with requirements: 9
> [    0.809690] xor: measuring software checksum speed
> [    0.811307]    8regs           : 12333 MB/sec
> [    0.812862]    32regs          : 12322 MB/sec
> [    0.814885]    arm64_neon      :  7851 MB/sec
> [    0.815626] xor: using function: 8regs (12333 MB/sec)
>=20
>=20
> -----------------------
> Central error: [    0.808070] jitterentropy: Initialization failed with h=
ost not compliant with requirements: 9
> ***********************
>=20
> I did find this in google:
>=20
> https://lore.kernel.org/linux-arm-kernel/68c6b70a-8d6c-08b5-46ce-24360747=
9d5c@i2se.com/T/
>=20
> which does bisect to a change.
>=20
> I'll rerun the autobuilder testing with the cryptodev patch and see if
> anything else transpires.

The LTP on arm run failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5406

which diving into the logs shows it went OOM and keeled over badly:

https://autobuilder.yocto.io/pub/failed-builds-data/qemu_boot_log.202310011=
01358

meta-virtualization doesn't like something:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2295

The arm ptest failures above are unsurprisingly still around:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5513

There may or may not be failing strace ptests on x86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5694/step=
s/13/logs/stdio

but we didn't get the world build failures from cryptodev.

Cheers,

Richard




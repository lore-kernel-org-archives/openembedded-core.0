Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8144C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 14:00:45 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.121739.1699538441245165384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 06:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aHWutup8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c742186a3bso7824521fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 06:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699538439; x=1700143239; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBZl9rxitf/doFnI0bfx3dWUP4uYkgVPBTd5ELAurn4=;
        b=aHWutup8LyAPsdnlCZ8mV/RAQQ1uBkjphEuJOSCUryyytb6r47vAEcfW0ehIQuKnJ6
         YjKH/7FSNdRRzgmhGfmlfmNvJ8CE4+kHVuW270r32iHW+HQVofDVKvPe9eFEqLmy1lKD
         8jiH0BIFzexpTpsx48dCJz/I9gXUZoR/WyXKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538439; x=1700143239;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBZl9rxitf/doFnI0bfx3dWUP4uYkgVPBTd5ELAurn4=;
        b=nmCcHsDojrtSUEHgkvxQjZ/ZQ3hTBYO8enW9kNwZjc5EO+RoSfR1BAGZ1upoW258tm
         6q49qC1qtlwOOhi5PV8Sul5MtjYECxEBYKywBnoHURS9Syiv9ak2hn7yDlDyxaX1+N/V
         bOvyWZycU6n5s+VO+Y/fm6x3A7EXFxcGI67LqMTQKWXM/1yWzczOKq8d78XHdoIajy83
         b9OCU11QispyuzDHxO+/ahRLzO2P69oeHfCss6ntR9386M0KBAWDtuvzYNqJ1Anuk4/+
         XWee0O8o81AZoMnFDmPbt/r0HcbWcfH+z80E+GlPq+niexHuUxH5K/3gZPTiFLlT2wJx
         gadA==
X-Gm-Message-State: AOJu0YxLuu3MqVpHqoDOdXyKrFbJC4ajb8xXpVM09NEPSDHqEX8rZS1Y
	MFbpQYQkShIbqPUfi+Ve6y+ETw==
X-Google-Smtp-Source: AGHT+IFbMngnrvFCJZYN1xswiN5cFZCqMM18qZLUDhWV2BdXdZLYYQIraM+aUo2e+i/Qc/GPDjvS1w==
X-Received: by 2002:a2e:b544:0:b0:2c5:1542:57e4 with SMTP id a4-20020a2eb544000000b002c5154257e4mr3857287ljn.31.1699538439350;
        Thu, 09 Nov 2023 06:00:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d6a:4777:87ed:703e? ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id x15-20020a05600c21cf00b003fc0505be19sm2132897wmj.37.2023.11.09.06.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 06:00:38 -0800 (PST)
Message-ID: <5d539cfbb0f523f97a160413b171d16b30d5e2e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] librsvg: Fix build for riscv32
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 09 Nov 2023 14:00:38 +0000
In-Reply-To: <20231109065042.2418002-1-raj.khem@gmail.com>
References: <20231109065042.2418002-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 14:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190385

On Wed, 2023-11-08 at 22:50 -0800, Khem Raj wrote:
> Add missing support for linux-raw-sys
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../librsvg/0001-Add-riscv32-support.patch    | 1511 +++++++++++++++++
>  meta/recipes-gnome/librsvg/librsvg_2.56.3.bb  |    3 +-
>  2 files changed, 1513 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-s=
upport.patch
>=20
> diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-support.=
patch b/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-support.patch
> new file mode 100644
> index 00000000000..2e36eaf5084
> --- /dev/null
> +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Add-riscv32-support.patch
> @@ -0,0 +1,1511 @@
> +From a4066c09bec2d4ec956459237e0a48501cc4780f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 8 Nov 2023 22:41:54 -0800
> +Subject: [PATCH] Add riscv32 support
> +
> +Upstream-Status: Submitted [https://github.com/sunfishcode/linux-raw-sys=
/pull/95]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/riscv32/ioctl.rs | 1490 +++++++++++++++++++++++++++++++++++++++++-
> + 1 file changed, 1488 insertions(+), 2 deletions(-)
> +
>=20
[...]

> +2.42.1
> +
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.56.3.bb
> index 4b9aaeecbe7..32d720d2b92 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
> @@ -19,6 +19,7 @@ inherit cargo_common gnomebase pixbufcache gobject-intr=
ospection rust vala gi-do
>  require ${BPN}-crates.inc
> =20
>  SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-whe=
n-not-.patch \
> +            file://0001-Add-riscv32-support.patch;patchdir=3D../cargo_ho=
me/bitbake/linux-raw-sys-0.4.3 \
>             "
> =20
>  SRC_URI[archive.sha256sum] =3D "5a328048a02d014645cd27f61140f4e0b11280fb=
2c7f2a21864fe0c59ac1ce88"
> @@ -38,7 +39,7 @@ export RUST_TARGET =3D "${RUST_HOST_SYS}"
>  RUSTFLAGS:append:mips =3D " --cfg crossbeam_no_atomic_64"
>  RUSTFLAGS:append:mipsel =3D " --cfg crossbeam_no_atomic_64"
>  RUSTFLAGS:append:powerpc =3D " --cfg crossbeam_no_atomic_64"
> -RUSTFLAGS:append:riscv32 =3D " --cfg crossbeam_no_atomic_64"
> +#RUSTFLAGS:append:riscv32 =3D " --cfg crossbeam_no_atomic_64"
> =20
>  do_configure[postfuncs] +=3D "cargo_common_do_configure"

Is this change at the end meant to be here? It isn't mentioned in the
commit message.

Cheers,

Richard


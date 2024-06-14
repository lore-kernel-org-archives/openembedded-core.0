Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39FDC27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 09:17:47 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.7343.1718356660189549519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 02:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FS8nTYo5;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so24854301fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718356658; x=1718961458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ruWGTfr2mP/ud4bWdbEKZGls5Set0XZYNc+JxVruYE=;
        b=FS8nTYo53vL8O7NIYArDcEyhSnDjRzr83Jx8R074VRikYOFTCZG6yO/ONXNPLTkS4A
         7TYUpvya/GNv3AdblbW6avq90roEnbQ9cADDoHSWjFyMPitawI+3BS8XBy8r82ms4d6Z
         exnQLxJCQm3rln6SY6UV8JMF1ye7v4TBszpzgxqLL7+iP36urBPEH4BsjBUJd7U2Gqmf
         89P/wdv3JobJP9ct7XQ34iqROdHGSITPOloYMeMNvWrvbJ+ga6ElTflybFOoP/EZ8BO7
         dFvT0YFlZjlsu5/nIj9oQAn2nIKR75I1m7XoGsCzIjyMZ9+S73oekzGfzFCssa0I5NMQ
         6glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718356658; x=1718961458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ruWGTfr2mP/ud4bWdbEKZGls5Set0XZYNc+JxVruYE=;
        b=S2M3azyPuTEDXcu7iyB/63KKsgVU40gUYs5vFUxzvqCGlEErQnuyhn63ZeJWpCVDfF
         OpGHdGM6TsB+gKx0Geo8ePZ/oY+POwgf/ouf2kdGPzGEL4SO150w1SuxhwaYSIF7TBcq
         DVWLM1Zx5hR9Ui+kBfdZg6h368x+bFQmJNW6PzxoCqbY+RWYEx94M0yzPE9xEPGO8woL
         St0LfjyQqXKxAbZjWIRH6CB9tB8ss2Tf+E/tsLJmOPVM5Gq9NV+rnXU5xetupuldoBN6
         QaZ9Vvu/czt62eWSlT6xoECQMN7Cvops2v/F3+IZSi70N2QoAkzSn+5i6Qmbl7QrgmzE
         U5jQ==
X-Gm-Message-State: AOJu0YzLIgZwlo48lvrNLStuf2In7C0Ai60M4OKR5bdJpQQr2UbtWnbw
	kz6+Icrou5Mg8J2MRW/EdAfvGITjZDS3MTaGSBQe/sC3UWXVzdBH3efd4nPkllDXroDE2kvMqS+
	pBAsKqFUB0gYfRCIOPFOnh6kTEk/sew==
X-Google-Smtp-Source: AGHT+IFD6bLLRQoHYVXMoveBkM6im7Y8yC0y1m5R8vGNcCHo1xTCh5sUEJFkyHR5tACwmZtxRUNiga32UwN/IJ1uq3s=
X-Received: by 2002:a2e:be86:0:b0:2ec:f3f:f4db with SMTP id
 38308e7fff4ca-2ec0f3ff539mr14339701fa.50.1718356658180; Fri, 14 Jun 2024
 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240614054959.3184774-1-Yash.Shinde@windriver.com> <20240614054959.3184774-2-Yash.Shinde@windriver.com>
In-Reply-To: <20240614054959.3184774-2-Yash.Shinde@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2024 11:17:26 +0200
Message-ID: <CANNYZj9vZTXSWO1W8V7U-oWieQd8t=CgDdgCdUtzBP6N4DxGyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.75.0->1.76.0
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 09:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200653

On Fri, 14 Jun 2024 at 07:50, Yash Shinde via lists.openembedded.org
<Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -4,17 +4,14 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>              file://hardcodepaths.patch;patchdir=${RUSTSRC} \
>              file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
>              file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
> -            file://rv32-missing-syscalls.patch;patchdir=${RUSTSRC} \
>              file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
>              file://rv32-cargo-rustix-0.38.19-fix.patch;patchdir=${RUSTSRC} \
> -            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
> -            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
> -            file://target-build-value.patch;patchdir=${RUSTSRC} \
>              file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
>              file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
>              file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
> +            file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \

rust-oe-selftest addition should be in the first commit in the set, not here.

The other patches are removed from the recipe, but the patch files
aren't deleted, and there is no explanation for it. Are they
backports? Are they unnecessary anymore?

Alex


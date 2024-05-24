Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9ECC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 21:18:31 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.6069.1716585505913068777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 14:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C4EJbbSj;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2450441dd16so4519217fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 14:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716585505; x=1717190305; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDJz67RNw3i7D4X6dNkAwd4HmsA0uHZKhzEduZ+DWaU=;
        b=C4EJbbSjdLtHyWeOPYIpRZpIBIgCasVqdfLAi9VbyYXeMFHPK7Mhi59GD6I/l/sIFW
         hNelLrpsf/Fztc184wrMhyect/7rDA/yguhOdwG00hev/U+Pe9sSPp9lqpLU3OePxoXz
         QiHqEH1yudIksbl6SPMwLFGUOprESIFnKYO8sXwshUkdcw+D5xY/VZq9y9XZZj3Bc36n
         6dZzgAJ3g0aTK7zulbuJdsI6GdpqOr5lY/In0lotQp60gp9XFIHzcQv33Aonr6fTOhb5
         vbElA9MYB7t8VHzvYkjgdfrMZwVHyyXcMDtpRBd4WDosdwt5i54QgSaaNnHIO1jy/g3X
         HuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716585505; x=1717190305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDJz67RNw3i7D4X6dNkAwd4HmsA0uHZKhzEduZ+DWaU=;
        b=koAgVCa9gOMzEIyuFOeseADMKfyh3LhQHm8hnvunfFPLmu/C6s8hnpXJqUog6S4986
         EQOXj8U3B01uJqisvkULq+rK2BzKj3vznUIKh/keB/jiyCSXCaUskaD8/I+mK2DZsRWt
         sRBJb4g1v5bnNK/q0yGHzjol3UNOtjWFd1dTgMJgeYM/wF1jYzhO6UclSDuwPkK5BK4i
         qgzyQAJKySZVV01hMzR2TWPcpc1S6rnLoTGfM5qJ5qExTSkcdZNr55CL+C5fICHCooHt
         ScEOeI7u8ElMMrKITK58lNOR65ySCoodIiejbUeJ0PAAd/ZpbFOL5cYvaCiBCWIyalLK
         XXKA==
X-Gm-Message-State: AOJu0Yy6ZfOrHfQtGGN72iC00vlAzO143l/L5SUUw5fNfChH/YsJclwP
	hSsPMl58xAvzK5oaWGcIhiXgKEa6MYR1xNn1KFP/rFZ1YcQ3JO91vB118zPpKmrgXrGP/B69t94
	exkXD82KcDVQjHcNh1v8yDnoRxD0=
X-Google-Smtp-Source: AGHT+IF0NtovAen7t+7qVYBjtPFLHfw0Zx40zuMsUkr8C8wA5STXsN1QKfn5tCNH4p1uOBAiYFfFwd2baqOm2GstHQI=
X-Received: by 2002:a05:6870:a3d2:b0:23e:6d9a:8f45 with SMTP id
 586e51a60fabf-24ca14843d3mr3662710fac.48.1716585505061; Fri, 24 May 2024
 14:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240524201214.3858538-1-mark.hatle@amd.com>
In-Reply-To: <20240524201214.3858538-1-mark.hatle@amd.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2024 14:17:58 -0700
Message-ID: <CAMKF1spHV6uOi1E=+D68rdm+MKrqqaU_yHDPQ_P7xtE6DKeGwQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap 0/2] Toolchain fixes for Scarthgap
To: mark.hatle@amd.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 21:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199863

These look fine to me

On Fri, May 24, 2024 at 1:12=E2=80=AFPM Mark Hatle via lists.openembedded.o=
rg
<mark.hatle=3Damd.com@lists.openembedded.org> wrote:
>
> Two different toolchain fixes for Scarthgap.
>
> The binutils change was found in a AMD/Xilinx specific build script that
> attempts to disassemble some code as part of a firmware setup.  This
> cortex-a53 baremetal firmware triggered a fault fixed by the issue.
>
> The newer versions of binutils have already accepted this change, but
> I'm not exactly sure which version(s) have it other then then the
> current development tree.
>
>
> The GCC change only affects cortex-M.  This is simply a port of the GCC
> accepted change into Yocto Project for baremetal usage.  Unfortunately
> I don't have any sort of test cases to show it works or doesn't.  It does
> not break any of my existing test cases related to Linux for cortex-r
> baremetal.
>
> Again this change has already been accepted to newer versions of GCC.
>
> Mark Hatle (2):
>   binutils: Fix aarch64 disassembly abort
>   gcc: Fix for CVE-2024-0151
>
>  .../binutils/binutils-2.42.inc                |   1 +
>  ...sserts-from-operand-qualifier-decode.patch | 382 ++++++++++++++++++
>  meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
>  .../gcc/gcc/CVE-2024-0151.patch               | 315 +++++++++++++++
>  4 files changed, 699 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-=
Remove-asserts-from-operand-qualifier-decode.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199860): https://lists.openembedded.org/g/openembedde=
d-core/message/199860
> Mute This Topic: https://lists.openembedded.org/mt/106288401/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


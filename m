Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F344CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 15:10:29 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.79846.1756825820453842824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 08:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfAy5d+v;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-72267c05050so27550147b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756825819; x=1757430619; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUoJ/Y0XR0hPhN4alX9ZoSNBKAlOiO9auhy9KY9c3P4=;
        b=cfAy5d+vm0tB4833yufSOZ6KFlgokBjlIjoEpp4KkZgPiUT6M5PJruL/NncEFeeBAT
         31wr0yG2I94AsnOuZClukDOqkJc+p01VD5RDWeaVh0+QsjRRa3+YM/RWW3r/Ht9nH242
         I/sG0dQh3J2zQvK7gugXiPIiSAuFkL0BWbwh/AaTNreSiLMmXS7bxQF3XXhNefrDGGJA
         k+lMM0z06UzvI+1pmEg9XtitoUyyZI4HBH0FSKVe4BNRsL3Fixz1XjpNmQS94Bhky5Lk
         RQ4E7iVaual1uRhCfU8T0FZIzdDHLmwJTXJYUGXinuKDNmrHgPeP6eDg10MF7LDp7krE
         07eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825819; x=1757430619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUoJ/Y0XR0hPhN4alX9ZoSNBKAlOiO9auhy9KY9c3P4=;
        b=h51Yfe3eVyeLUJ/0FseEb5v9//s+no5d+he/P5oVuIzCZFJakEaGAyEohIgfxtq25M
         OqXq9m9rqds0BmDQOmylW4xvurpKtpzP4rZsdp1n16fehwtNeA32fNCO6PsBwS/3HuDf
         mXzHF8Mi8DBcJAQWkVzRbZU7RLLL+CEMC/97TOw18Ipng3BzPzcE+Ck3a4RTusl7IpDD
         1afNMOKqvSwd747lcRIjJaEKL7rGB0gAnUb1VAZDv5WXvx7u61RmGdtOBNXvnWriGGH4
         5bvC8lJtpRLexEb5sEcKxL6Ij5EzDfHwA/nFgAe17pJkx3sBfGejRdGOJBt9WjS7MLCt
         4n7A==
X-Gm-Message-State: AOJu0YywrrELIZt/8tTkycNn3iYu9NmwS+n4dTthY2hO5PEtjjCfY940
	2YjHnC/Z3z3WTXb9cHUp7forSwH8p6aEOXvNNxjaHj3DGo9BPtqDwUu4yFOt9nLdsNvuCNARZto
	nGnpCgtcD3uxksuRWnZr2DooQwcAcvcqCpufX
X-Gm-Gg: ASbGncsw+6XwbzJwpZhBl+Gprw8Mf/NLhqp3nOBOoQ49Taf92DrU/z2mFqkjpH4cRay
	M8sOZlzMw26FkAu7HnGCF8s2MUds0otlTOvcStmBid18HRiV1hmwNrFrPghJHv9SRh8D8cJPe0w
	d2jgJqjyEBvfVQzZovBO+vZUkysUfO/ylHJWon/NlW9zea2uyw+P0vZ1DRY8e87GbPKpuLd7/68
	oFrW2RZ1AiKWJnPvdd6T+ETi7NRdJLtuAv6HIpZM4nnLzNSXhD0wgxqJS8MCbrfaFeTjUzjKon6
	22o121gE75HM7NqZOsZC8qmDw5PoaxZySC1tzbtEKlzt2KAGaRgEwDoP
X-Google-Smtp-Source: AGHT+IExnSNr4i0F1VRqTAQuMbkRE27r0aZv0GLjoBKLFu/vvhui5Nr0HGesJh25w0FQGpJmZGrOHmR2nrl7R0GdTBY=
X-Received: by 2002:a05:690c:c14:b0:721:5b31:54c7 with SMTP id
 00721157ae682-72276564119mr143457107b3.48.1756825819287; Tue, 02 Sep 2025
 08:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250829185539.3379514-1-raj.khem@gmail.com> <20250829185539.3379514-3-raj.khem@gmail.com>
 <DCI3QFN7RXTR.L14ECZ6BDFAN@bootlin.com>
In-Reply-To: <DCI3QFN7RXTR.L14ECZ6BDFAN@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Sep 2025 08:09:52 -0700
X-Gm-Features: Ac12FXyoOl-FfDERS5dwi8ihQCFnzLlmpxlsTk-5F-fWHp-OtrGlaGg5OQzCwGc
Message-ID: <CAMKF1squJp0aAWy-t5-ZpoW_ZcQMOa7AQszLJ0HbZktCOE7dnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] kea: Upgrade to 3.0 LTS release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 15:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222734

On Mon, Sep 1, 2025 at 11:31=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Fri Aug 29, 2025 at 8:55 PM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > * Drop backported patch and refresh remaining
> > * Add fixes to build with boost 1.89.0
> > * Switch to meson build system
> >
> > License-Update: Removed remaining coroutine references [1]
> >
> > [1] https://github.com/isc-projects/kea/commit/93bab7a99f82e2ceadca14a7=
a6a2440cd69fb8c8
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> It looks like we have some reproducibility issue after the update, as
> compilers data are stored:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250901-irpx1jt=
y/packages/diff-html/
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2398
>
> Can you have a look?
>

Thanks for reporting, I wonder if meson-info files are useful for OE
usecase, if not I think
we should just delete it. I will try to figure it out.

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4DC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 05:59:26 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.7039.1686290360696875866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 22:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M26IBdLC;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-19f675022d8so436161fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 22:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686290360; x=1688882360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHa10h1/i5zw1hyALidYov2LosWE0ljFJ930GO7kXMI=;
        b=M26IBdLCm0sqDZbkxFkCavLdO/+0f2yc7Ofz4e2Ii7cifelHzB/ZMLA4s0BTORITRk
         GwFw9fFgTrusjUmDCrbhBHpj0bXhs5s4tcLDmTmRNorf50rouJW4s3AyrPBarh0JaoAw
         l6kbkZlQfLKV8egPKnChW+vD0MAyzeJrjF2pEvIvcxz1RfLB8GC0dW3UTw85oZ6of/oZ
         JJSSIXkKHfj0EpmQRAQrqKU9gr9gjdCYUZ0HDWEnLFV9mr/EXP3Y/OvcjkuSumzQaA05
         grtLmzQX2TtvSjQDy6lvwyEeIxQUwlQ8ixVY3nvDD+tDRCdW8OIp3/mNTragaMqhs8oA
         EqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686290360; x=1688882360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHa10h1/i5zw1hyALidYov2LosWE0ljFJ930GO7kXMI=;
        b=h28I6aPZZnsYGmAeHq6yFL6YDoHhbySNf04jda75ULCzWnGLZjYBp01+i2upn8bnS1
         C+ss9viO1os9VAw4U21r09Q3FsSbIrDYppT1X78VARFGwnh2z230c18BMFWEOsUOtXtV
         QNA8ZPXZgctjKq4CLJgYfF5Ti8d+68yeNd0XdLfzy/GS8n51iN98Mc1lzi42iVcU9KDy
         VYEy9vQ5JXY17elBUH/HMJG0/nXIiNnSapuv5isFwp28t9Pw1MIA+x8A/1IsvQ8J8f+Q
         WjDUG1UYHDB6NSgzdNOUfMN++3XW8PK2bLvF2gFeImMt2auu4XUkjVtIVSCPb1ZEM1bm
         Qz7g==
X-Gm-Message-State: AC+VfDzirTcexG43z3W8uuRMw/oV6VHDKirTUldu5Nc5tYeIrJmA0DnT
	dv6sKWWal94sFHZRrXMgsLOMIGN8ASsrdZoAEII=
X-Google-Smtp-Source: ACHHUZ4fPjLsM5CG4lwZljVgV/TAb+X1ZpkYk2l5hYPotOpInc8zCUFotAn3C8dAMTY6yC4gABOgeUA6lejLXX2/HxI=
X-Received: by 2002:a05:6870:1a9c:b0:19f:3ea6:413c with SMTP id
 ef28-20020a0568701a9c00b0019f3ea6413cmr556505oab.0.1686290359727; Thu, 08 Jun
 2023 22:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sppV_=AW3+jrHw322B=7upV9ZQmqa__Q54a0akhnp0qaQ@mail.gmail.com>
 <25526.1686288043102902785@lists.openembedded.org>
In-Reply-To: <25526.1686288043102902785@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jun 2023 22:58:53 -0700
Message-ID: <CAMKF1spKzj9R03fBynUcusTphe34d8HxJyjOPcf95ndx+RDh9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 05:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182531

On Thu, Jun 8, 2023 at 10:20=E2=80=AFPM Vincent Davis Jr <vince@underview.t=
ech> wrote:
>
> While I setup build environment for imx8 platform.
>
> Does updating VULKAN_HEADERS_INSTALL_DIR to
> -DVULKAN_HEADERS_INSTALL_DIR=3D${STAGING_DATADIR}
> change anything?

Not much. Errors remains same.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182529): https://lists.openembedded.org/g/openembedde=
d-core/message/182529
> Mute This Topic: https://lists.openembedded.org/mt/99365321/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


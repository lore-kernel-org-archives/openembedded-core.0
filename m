Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EDEEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 19:14:04 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4366.1687893234280228912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 12:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dS4gjIVM;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f122ff663eso6880148e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 12:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687893232; x=1690485232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ogN2wyBCSxYzrignpHVILNlKuOJF/vL353l5z+mHSU=;
        b=dS4gjIVMTeE3JZAKo1OczmBSxS5DkZbKL2gYD0j3ke694yVxCSPym5A61P98FqUiNF
         XtYdEIn6gmJU2LMsSrYGsrkZy1F7M4L1V7AnmSOePIagsFPwq+/CZ26ENCOH4VbKPvfK
         WX+bSVOGY4Z5m+6ukC9RxK00dUT8Hb1X//Io3G03ApRFrLxGqmcaOHD1AWEEeuI00Tux
         wppSPav/GxUUZVAQwMubbBDUkC/36REPiPoZYB6f0AxjxL/e9tEIt1vCtwUR9X8JJDUy
         QMsiOabJ2TvDrmqh/r1M2KxG1nUDRNSBv74+ytFQPixXMcEOzxBUwNYwGIrxVt6ALEe/
         oFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893232; x=1690485232;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ogN2wyBCSxYzrignpHVILNlKuOJF/vL353l5z+mHSU=;
        b=OCxN+39YccRI/rQPFyx8bo/OyvFe1wY7P58bwJJXa9rdFwCBM7HoK+xhKYt4ntxwwO
         BLalBL1c9dAHsjDued3mtzZ4Ya6MJpAmcAePl2RvtYhWQ6JBcsW+p33xo7d/m9rU5vsZ
         aotAYfuhS/TqJXIY8zDxOTTQDG7A3dM8d2Cd2Il1Re6//q2INfgZhryMpj0J2XyxpNFt
         52QGBrCsTQ7f2WZoUaU3i2JB0orGNlcPk4pUBRwdbnSS8Yv3cvZ4ruyZDClzepNwIold
         J+QXCRJgHsWjkTb6hipDXCStu1/ebWc2tSRw9ObelaOUkRyVis38BbCpoYUkVL9ZK7a/
         IFBQ==
X-Gm-Message-State: AC+VfDwXjZda9z4WFMOSxSS+gd3KEhBOlOb2Z88MnBrdbJSCEMS0Lh7F
	g/f+DmnlhnGad3QIRY5edLqIO6qXZjCWHGGrRUw=
X-Google-Smtp-Source: ACHHUZ49wISu6VUpROW++U4Sqq0xk7GSsKWqFH6xPOti2v5jKAYgJ4Ox80JzAWMUsqjX4DgeAlJEz1SN3K4Uf8TBQuc=
X-Received: by 2002:a19:4f18:0:b0:4f8:5964:ac63 with SMTP id
 d24-20020a194f18000000b004f85964ac63mr19051575lfb.24.1687893232154; Tue, 27
 Jun 2023 12:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221114152347.z67ftsylidd3tfjt@amazon.com> <21434.1685656554319162310@lists.openembedded.org>
 <CANNYZj-+shiYOgREJM65W4-5=toqiJ_5=HuJEz1tN6vfTGs9-Q@mail.gmail.com> <20230627171028.j6yianz4ppa4skff@amazon.com>
In-Reply-To: <20230627171028.j6yianz4ppa4skff@amazon.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jun 2023 21:13:40 +0200
Message-ID: <CANNYZj_pzQsr9-PNa3FaoTU=iNOD3TFDrXP0KqiB2LjY60gyjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
To: Jordan Crouse <jorcrous@amazon.com>
Cc: Vincent Davis Jr <vince@underview.tech>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183498

I didn't actually use the recipe in any way, nor have plans to do so
:) My involvement is limited to bring it in sync with the rest of
vulkan items and do code reviews, but primary maintenance is on you.

Alex

On Tue, 27 Jun 2023 at 19:10, Jordan Crouse <jorcrous@amazon.com> wrote:
>
> On Fri, Jun 02, 2023 at 07:21:13AM +0200, Alexander Kanavin wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >
> >
> >
> > Given that this was in November last year, I think the best course of
> > action is for you to take the proposed patch and fix it into a state
> > that can be merged.
>
> I couldn't figure out why it kept failing the verification. I need to
> pick it back up but I got distracted by other things. If you manage to
> figure it out, please merge on with my blessing.
>
> Jordan


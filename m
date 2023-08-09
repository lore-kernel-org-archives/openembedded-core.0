Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED1BEB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 10:05:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.84718.1691575527979504996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 03:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZbDx8Y+B;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9936b3d0286so981886166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691575526; x=1692180326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iC5U90uJDbH++ddIMxDBWl8I/OTrXn/hhlxykbtW61s=;
        b=ZbDx8Y+Bd9iudAMCrAUl9ip1So9lSBgs58Z29q+/oMtTqCLdHfRosfoUFrChR+Kgtk
         90bqgfuyav6dr+zFC/Grbep1jCy0EJ+TKLF7GfJaAJ7w3/fq2hpuhjMWkwZuZyxDmBNn
         0Mf5y+FjQDCDLfBO3F5vwhRNuF6CiLsb2KOX6GU+wRg4BhciPPJrw7y9V6c1sa/QF46n
         K/DwenKOTrUdke735gN0aq8iy5RFYm63YcfbNU2lNEdnw+BRjrUyL/Jzr6z6KxQI0su2
         ql23hgJQxshSWuD5JHRjOCqXftQi4Q/stcq6ebtpCbbQAwGwmriE0O88LgY2uxMpd4Dd
         Xnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691575526; x=1692180326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC5U90uJDbH++ddIMxDBWl8I/OTrXn/hhlxykbtW61s=;
        b=QeB9C9ZHmTbHrqzlfW4xHeio+wm1xVqD81YNqk+p5B+vM01pVjeo7+weuE6vabCIMo
         7m+SD+F1UXuWDzZ8p3TXJxaflBZ968eSfzZ4eZLexUF/M+v/MtasyEe/I3KmjoMMq1Pt
         m+swG5+/TzxN3Km+O88rhiwyKQN9TVOxJ01E8M1ebsKfgZbYwYRmSmOJ9UzSbypm6J5e
         T8AxMQ8RomvEvV42FAkqlR3k/88BmSuBFauq/fTP3OuLNQQqs2OWUeFjA3qJzmgtorfd
         WDs9PmBkPmzmwcfsYYEE4k1LwfPkqukCyIEwHH9QNFALMbAWdAc0swG6itt+ybEMRuGt
         bf2g==
X-Gm-Message-State: AOJu0Yza43ebrdm5W8klg9Kj9neMgiyXnkcZFE9WIFMPba9w8Uec3sCK
	DLyf7r4OSLKXpDTOwGMFk8ecF4uMTDxFiUosHEk=
X-Google-Smtp-Source: AGHT+IF69OlJjmOzLwiTOucJlWyl6fttebPFt/AhrQK4F0wQqJqsI3z+apR7i2eWR6K/94f6GOqSYTBtNJ/46NF/qnM=
X-Received: by 2002:a17:906:8458:b0:99c:72c8:bfe1 with SMTP id
 e24-20020a170906845800b0099c72c8bfe1mr1724096ejy.38.1691575526191; Wed, 09
 Aug 2023 03:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230809084550.9390-1-sudipm.mukherjee@gmail.com> <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
In-Reply-To: <CANNYZj_L1BHsg-9cV9LS84d6e7tgt_yQsqNOkUC2E2k0xepRjw@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 9 Aug 2023 11:04:49 +0100
Message-ID: <CADVatmPXY4MxwNaios=2AGOLKPn5vPPreuoSOLp1989xEnVOOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kea: upgrade to v2.5.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185694

Hi Alex,

On Wed, 9 Aug 2023 at 09:55, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 9 Aug 2023 at 10:45, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
> >  .../kea/{kea_2.2.0.bb => kea_2.5.0.bb}        |  5 +-
>
> 2.5.0 is a development series. The update should be to 2.4.x instead
> which is stable.
> https://kb.isc.org/docs/aa-00896#kea-updated-as-of-122022
>
> Please always verify the latest version with 'devtool latest-version kea' first.
>
> > +New version of Kea has started using path of build-dir instead of
> > +src-dir which results in reproducible builds failure.
> > +Use src-dir as is used in v2.2.0
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
>
> Reproducibility fixes are always eligible for upstream submission,
> please do so and include the link. Even if the patch is unsuitable for
> direct upstream merge, at least it alerts maintainers to the problem.

Yeah, I know and I always try to send any patches upstream first.
But in this case there seems to be no way to do it.

I have tried with https://gitlab.isc.org/isc-projects/kea/ but they
are not allowing gmail
or any non-corporate email address to register or login. Also tried to
login via authenticating
with gitlab/github but that also did not work.

So, I have subscribed to kea-dev mailing list and reported there with
the same patch.
https://lists.isc.org/pipermail/kea-dev/2023-August/001010.html


-- 
Regards
Sudip


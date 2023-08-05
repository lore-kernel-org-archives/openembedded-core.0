Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04BCC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 21:36:41 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.601.1691271401303069904
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 14:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KPI8xXif;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so3752379276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691271400; x=1691876200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNyrPIpUPwHajrvcQwgZgRP1Ja9rod5uP/gkAiHBMDM=;
        b=KPI8xXifqqFohYB1eeg4y1rfOQYzkBgRYYRmho7ntATQIbof2I+X4LOk8JhKvxTHJ4
         IWiFHQBOZ5A5hYat0h0lIooPOiu/jceVmPzkm5ZzDc8turbaEKtsfs5/B7W5pf9oYx2c
         OcrH59JGLQ9R1+0sEi7zcSbfP5Erb8ElVXDFNjhtadC0gUyLpvYZxpI3Q6Q4lseT8M05
         d3Db5vmTQOZ4oHFkHvZyRaC9ZGfPfZXgS1iRVOXMZPnly7OkpinEzlU2bjGtTfFcPQq5
         D4VBwb0Lt89SsTnjokcVib/DoRGP24uIzwicNXGrAOfhg8k/UZp3Q0DoWQcT7AiJ6vrA
         WYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691271400; x=1691876200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNyrPIpUPwHajrvcQwgZgRP1Ja9rod5uP/gkAiHBMDM=;
        b=iymtHL49JcfPpZiRQl6LngWuE4nardK9mJM/XNuvsUVZgYDdNXtvkiiXAEA6tZWOeY
         Q/E1vgom4jI2nsVqgFAEE3m/9bBK7lNaxzG5aG7NVe5fce3G4RH3959iMvqvShfBDhmo
         CnDUI4ApKnvNRuD48yGxdL01qiQTr5J+BPK3cu+sBwrNsVRMhDEHf1mnd42fgYmMM3Ua
         kJP2FaoFD+PG9nZDCl9NBXvGMxhRpLIDuAvSurEDyAbF0MAxkYs7XxNFhbkb+YyRm06J
         HtLXLkx7FzbwEDYVZ6uyjQObydl35HJkgQpRAnmg49ayc9AjPbvVakmmn46eEcQibSmf
         2SmA==
X-Gm-Message-State: AOJu0YxxBHbND0LtRAGiMLfCSlPBRRM9IXc6alFmizsYOiU0z05rXdMR
	Ie52HThIw2JNy5z9DB92q1OWmdjqgdEWtWY/b5M=
X-Google-Smtp-Source: AGHT+IF3nRE0m2bWH4KFnXODbTSeP8jU2j4xPVrsWjCT23jRSae5XKmv8p91waPOf8s7bvFjyRTPyabhK5e/gxQvlxY=
X-Received: by 2002:a81:8a02:0:b0:583:d60c:c17c with SMTP id
 a2-20020a818a02000000b00583d60cc17cmr4760720ywg.20.1691271400302; Sat, 05 Aug
 2023 14:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230805110643.2708376-1-luca.boccassi@gmail.com> <2bdc76ae7b92c7fb000e1684d0b49a38f408e2ca.camel@linuxfoundation.org>
In-Reply-To: <2bdc76ae7b92c7fb000e1684d0b49a38f408e2ca.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sat, 5 Aug 2023 22:36:27 +0100
Message-ID: <CAMw=ZnR2_akrHFbkxJ=Hy3+XuQNwNN+f15XQc6x-VTSKm1L4TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 21:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185558

On Sat, 5 Aug 2023 at 14:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-08-05 at 12:06 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > Support for unmerged-usr is deprecated upstream, taints the system and
> > has been removed for v255 (next release).
> > Enforce building merged-usr images when using systemd. This allows one
> > release cycle where it can be tested for any remaining issue, and can
> > still be overridden, before it stops working completely.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > Time to resurrect this. Support for unmerged-usr has been removed and
> > will no longer be available starting with v255. Better to get started
> > now with the enforcement, so that things can be worked out while it is
> > still possible to override it.
> >
> >  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
> >  meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
> >  meta/recipes-core/systemd/systemd.inc             | 5 +++++
> >  meta/recipes-core/systemd/systemd_254.bb          | 2 +-
> >  4 files changed, 8 insertions(+), 3 deletions(-)
>
> Thanks for sending the patch. I did put this in for testing and because
> it makes usrmerge required for the systemd-boot recipe, even sysvinit
> based images fail builds with errors like:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7580/steps/12/logs/stdio
>
> Is usrmerge needed to systemd-boot as well?

I don't think so, that's a uefi binary, sent v2 to avoid it for now


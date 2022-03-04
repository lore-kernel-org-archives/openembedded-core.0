Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE9C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 13:13:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.6650.1646399630226231946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=6ApZ21Ds;
 spf=pass (domain: burtonini.com, ip: 209.85.221.49,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f49.google.com with SMTP id u1so12611375wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nt8HKPDY/ChLDJNmqrFRBhNPaRP3QDDkIo23PTQ++H8=;
        b=6ApZ21DsqymIu9CKLe6KI/xQZsmGPnVoM+9k1IJy2owJdyWO7Ke5ED/nes8+qccwV/
         4lsN++ibZfzUnNHsR8+Y+ocidgf3N2w3hHLtPbXvrqabhl6ZTuznz8jxwahnJ+Av/NLK
         RhOpXLU8aEmHYXXTDdml6bPAA7gErlYVwney7zNpdHu47w+zv1lBX0h7lgSMEogGRErn
         ml/N8cq8COp+gAES12FxeoGFJ/N6VpPiziaLrxP4FiR45y8m5fVrn9qMyVS4bsrK14ST
         mb5WLqs+Sdap8KztFyZY0uW90ldZbMM0Nmhd8vIB1u7srOYve62XYwTRId7rIDWOvDgl
         hlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nt8HKPDY/ChLDJNmqrFRBhNPaRP3QDDkIo23PTQ++H8=;
        b=yaPqXQWH3rmginZxIKMsC9KhSiL3eyrAkmh8+6zJ2DwqYJtYiGztKiXJ1RpF5dZmoR
         cKydFlAm22Gm6Af5GlkxiyaCXqzRZg9jNWDh4iazu4j337X3vT5X5T9UIRNQ6ViqoxOt
         TTAqe3d8zEjDBtwdK3oN75W5+izks8zYgoZHCLBtK9+vF0LrZDLczPcPWkqqGaNILwR3
         6ze3eo+9D09AGUYGsLdLQPcfycpUfoHDC1dx+0DmrlUl7bGqOR6H3HJaZ94LzazRAuRm
         rttPB5RVP94zld69ZRCQHtBnHSkn5RnNTtLIxdvxFpVKWR1CKnEniIneaH7RErR7lbDC
         mZlQ==
X-Gm-Message-State: AOAM530fI4pBVhJAk/EJ2K0COlcwOV+uaWSPfv6eKniPOkI8gzJvQ4FU
	3PTo1hvvd2vND0fVrZO1dVp+1yiMmzWcJUNfakieYA==
X-Google-Smtp-Source: 
 ABdhPJw4Bpp+mUmCNzu1CN+s/zBEQwAz/fH1EKNTvnHNO5aFy7enChy4vQGLB5/hL8y5T2TXD5WecaywjFX8bGm8/uQ=
X-Received: by 2002:a5d:6f0c:0:b0:1ef:d28e:8040 with SMTP id
 ay12-20020a5d6f0c000000b001efd28e8040mr18265238wrb.405.1646399628468; Fri, 04
 Mar 2022 05:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20220304115525.2240283-1-ross.burton@arm.com>
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 4 Mar 2022 13:13:37 +0000
Message-ID: 
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 13:13:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162717

On Fri, 4 Mar 2022 at 12:44, Konrad Weihmann <kweihmann@outlook.com> wrote:
> For me that would be a candidate to be added to meta-python, or are
> there any core recipes that currently break because of the new behavior?

This is restoring existing behaviour, so I believe it should be in
core.  There's going to be enough recipes using this that it is
justified in core. I expect we'll have deleted this by the time the
next LTS comes around too.

> Furthermore the variables names are the same, so if people accidentally
> (or due to complex injection trees/classes/distro settings/whatever have
> new setuptools3 and this class here in the same recipe, things become
> rather unpredictable - as of now there are the same but surely they will
> start to diverge at one point.

That's intentional: if you have a recipe which needs the legacy
behaviour, just change the import from setuptool3 to
setuptools3_legacy.

> While we are at it pypi class needs a fallback too, because for me this
> is the standard way of packaging python recipes and new class points to
> the new setuptools implementation - so if we want to have this here, we
> might need a fallback for pypi class as well

My understanding is that almost anything on pypi is already a pure
Python module and is mostly unaffected by the changes.

Ross


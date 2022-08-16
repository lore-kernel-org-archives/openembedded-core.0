Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C800FC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 17:47:09 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.18593.1660672019921043376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3H9CQMv;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id x10so11260986ljq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aAf+l0sC0ICbaYzsQN35eneuSzZCCGso7ovUf+sXSDg=;
        b=D3H9CQMvJa3ZGVM82PhqbTst431w1eZoxGxnJkmi2iralulaFIrs3zzMz2c9nhL70a
         MFhns5N4EzGoaHr467crmiSQW9EV1yXQJZTEIcu85xYX9qlqwCjvsMBTnEb8U79+s8wJ
         4OE+8rRloXtwaZ0o7+A0EiSIYL02tjr7oKYhMIkk3Il16+oQUqMDpod1SZsmvYRuFrF5
         QetkGpk+Cf0WB6Mg61x57Op6Dkun2/nDnzuLKTTCCuNAC6RgDvUQdPHwL+2rhJDE9V+A
         aM5KgHh0W2DCgH0h9Elfb/2dP+WXo4M4MROaROobvfgKlsG2qdE3qk2JgDCTvjZ4y6Uv
         aVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aAf+l0sC0ICbaYzsQN35eneuSzZCCGso7ovUf+sXSDg=;
        b=3bVDrJBtHScxzfRnVoyeadPsxsMSIQlcSmFk9TG1OnsO2b2Iso4lwm76cEHrP4pAzU
         WO2NDqpTLHEawXJRJOwDhIoYBh5jJbcIvyErA2et83tfk1FnbWOPCp3sZE8CJPgGLQgx
         u1fO6bgXj6sXYX6a0ef9QMLSQOhkSUv4MhlctUEwG3rpe72Nu9fBVV1LYqDUkUkqApD0
         wAffskIjwV9IMDwAngXoO3jZYcgZ/ZE8FKsCXVfRspPQa3LuFJ4SiyyrsGyj8/IQ7Ahd
         51zpWMlJv9aUJgCVZHEAp1qx+ZCZgYXpLQwdAj/L7Vrm689aqxC4PI/OMpNxtU9Qme9H
         /MBg==
X-Gm-Message-State: ACgBeo0MuNKnKwpYph53E46yuvjk94CgXpiYDqzKkZ1xv7ZcDh8nXyzS
	epxjEvI4/fZc1tDrp38iYGj0KwOYDhuFqQIfKhc=
X-Google-Smtp-Source: 
 AA6agR7K5Ryr+fHZP6nFL9hDwn4qsmYWdlhIMDt5JlkABw02kRIJDef5JpA3vss1lDxWpS9PXU0BHRCYAaBVooqk2w8=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr6294159ljh.109.1660672018161; Tue, 16
 Aug 2022 10:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220816165857.2342796-1-raj.khem@gmail.com>
 <20220816165857.2342796-7-raj.khem@gmail.com>
 <CANNYZj8FU8wHYz8UaTYJcQZzC1ZxTVztWfuOistB+zY2kGRTPA@mail.gmail.com>
 <CAMKF1soe=GCqr+TQOa66Rv=21PAuFAbq51pOYdj-YUjRuVtkuw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soe=GCqr+TQOa66Rv=21PAuFAbq51pOYdj-YUjRuVtkuw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Aug 2022 19:46:46 +0200
Message-ID: 
 <CANNYZj9oWe28jqR7dCJLhYcDwFnE8UzVmFcZVHZBwiNf-U7jCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] spirv-tools: Update to 1.3.224.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 17:47:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169452

Thanks!

Alex

On Tue, 16 Aug 2022 at 19:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 16, 2022 at 10:03 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 16 Aug 2022 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > > -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> > > +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
> >
> > Sorry but this does not address my previous feedback. There is no
> > 1.3.224 version released so this is effectively a random development
> > snapshot, and vulkan items need to be all upgraded in lockstep to the
> > same version. If you need a clang fix, please backport it.
> >
>
> lets drop it. I will send a targetted backport of a fix I need.
>
> > Alex


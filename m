Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DAEC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 02:18:38 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web08.5861.1667787513045450610
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 18:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PmK03Eod;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso11267269fac.13
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y0Yu6m86l4dg57F8klSxFfz1Bj/+Ddy6GbYMYX34jU0=;
        b=PmK03EodLY8ya0su75cobo/C2W0hyDWmbS11YbIdFtjb011DUEx/huEb9pKJ0pTi6I
         BhzBOgbs0diNHZN0q+abZ4YE2S0QwJ+MawifC7scsY3Ldze/jD8l5d1L2bV+Gsx6F6Nl
         vs5XmKMeKjNpgEb9Ue98DTTBh+u6rG6xSkKDSZVULZPeQ0V6WcAog4p2fgh7I9DTVcJE
         aHfAPgRxTzkQktsSjFr/9Feu0+FcJ9WGNCKaAvLo5A1HbzkaK0aEWvlMvbBVGKnvXhSo
         +Zz8TjfGrfvfQJf17oenT7bf8W0RYzmw8k6q/t5uigWroyffYxDctJkoS49lda2sXPLb
         GLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0Yu6m86l4dg57F8klSxFfz1Bj/+Ddy6GbYMYX34jU0=;
        b=KGjq5dPgF5ZWFPpgKmXRx3VxkeI2gV3cobBifpOHlLYWnLtACZa0U16yIpYsfBPy8N
         kCWo1IkE6wmmeQqbOvnEjj4Qrcany4dCto6lrULoWve98+ZaO8SCRdeHHMLA8jLKThJC
         81ZSKKkDq1Vl1tZIBHvDJKxB89wFzljQxv2NR4m3ENXDl6GTLn5+PboFQupnEekxG0QE
         02/K6yeXUHxkoGahD+vgPmFPROJexXtOswijWm1lmvDo1QcbX8MdQpWteTmralNqsRaV
         6iBzZvzlVkExRbxe28I/GQ+7qoCWpVvVRMsQSnzj0XBQViZgnW56y8sY6QXKbYuRPfF7
         UnYg==
X-Gm-Message-State: ACrzQf1WWGeve1JtiyBknnj9R/vEYREZmyFLN+xMEYZBfDPF4bZG6ppK
	6s7j6ci2l8OMXr3Ok7yErWQRGr84+7vm8uPzNqM=
X-Google-Smtp-Source: AMsMyM5CcAYrWUc+hT8JMe8csPh3G5efwMby+gQJUl8XF9sJhS8b7odV8MlU/lcf1s5xJ4O08MuwgcMmpTwQo1bCHIM=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr37684083oae.262.1667787512127; Sun, 06
 Nov 2022 18:18:32 -0800 (PST)
MIME-Version: 1.0
References: <172352CEDDCB35BE.6436@lists.openembedded.org> <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
In-Reply-To: <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Nov 2022 18:18:06 -0800
Message-ID: <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
To: Xiangyu Chen <xiangyu.chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 02:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172820

On Sun, Nov 6, 2022 at 5:21 PM Xiangyu Chen <xiangyu.chen@windriver.com> wrote:
>
>
> On 11/1/22 09:48, Xiangyu Chen wrote:
> > With the default jitter options aarch64 CPU-based devices typically experience continuous
> > high CPU utilisation for several minutes after rngd starts.
> >
> > Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
> > the following configuration changes have been made, those configurations
> > also can be found on Alpine Linux[3]:
> >
> > - reduce the number of threads used to 1 in total, rather than 1 per core.
> > - reduce the buffer size from 16535 to 4133 which reduces the time taken
> >    to fill the buffer (and so reduces the duration of CPU load).
> >
> > [1] https://github.com/nhorman/rng-tools/issues/150
> > [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
> > [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> > Changes in V2:
> >    *put the aarch64 specific default file in meta/recipes-support/rng-tools/rng-tools/aarch64
>
> Friendly ping. Is there any more concern on this?

My concern is that will it be so for all aarch64 machines ?

>
>
> Thanks,
>
> Xiangyu
>
> > ---
> >   .../rng-tools/rng-tools/aarch64/default               | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >   create mode 100644 meta/recipes-support/rng-tools/rng-tools/aarch64/default
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
> > new file mode 100644
> > index 0000000000..5a2fbcc9ef
> > --- /dev/null
> > +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
> > @@ -0,0 +1,11 @@
> > +# With the default jitter options Arm CPU-based devices typically experience
> > +# continuous high CPU utilisation for several minutes after rngd starts.
> > +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
> > +# https://github.com/nhorman/rng-tools/issues/150
> > +# In order to address this the following configuration changes have been made:
> > +#
> > +#   - reduce the number of threads used to 1 in total, rather than 1 per core.
> > +#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
> > +#     to fill the buffer (and so reduces the duration of CPU load).
> > +#
> > +EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172819): https://lists.openembedded.org/g/openembedded-core/message/172819
> Mute This Topic: https://lists.openembedded.org/mt/94701000/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


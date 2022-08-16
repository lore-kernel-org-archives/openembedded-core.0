Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3219C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 17:30:29 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.18405.1660671015478292761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TwNXvouR;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3321c2a8d4cso116629477b3.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Kh5PtYZjNbbPm7GBT/HGptEVrieaz2kzH7S8M7UiPHI=;
        b=TwNXvouRdnDxWJV9uMVfT0KqOSctKDTvdKezW8KwcbMK8CdAhDAtKW+uAstw4g0R24
         vxt4cJaKjkY3plBdFW8QYtguHfbHwQHxut7GKMrdLTKug4P6c4xct/JodZR/KbnDDxIt
         q0QFEOynX+ZkqhtbP2ik9VzUZuz/g1F2ky1x1xnOxKM9KyIdoGaBU00RXtJwRyPNwLKB
         +KnpEBahu2W/bJlhUJc89peDEtV1UoVdZjoXxEJGZI4jlnjbSJ55+uw7mGCqqVzyTxJM
         4SaazROxUhI/1JJeckPcyPDgq+4OqeJt5Rr2r5x/ctlK1vv8rp36dsZh5BYKl/cGQ1YV
         +JVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Kh5PtYZjNbbPm7GBT/HGptEVrieaz2kzH7S8M7UiPHI=;
        b=URZjpbnTb47hr9FV8PV0Yskc7pn7ShHMnvAQQ9GifSCkq07fcolj8qEazIJsfIr9zt
         Hg79T+4FMA0ELX7QrGcZIP46hafnGuHUKURR/oU+BBTfo7EJ7wX5sgjKdWsW505PCb5r
         Z2RsG9hsoNIcmXlyJwirU8rf+zjNQTwXlfDeJ6z/i3f8fBw8pzQQJUxOnMZ+HpHtLZGS
         dnUH4CeT+4yu7iWQZBp8yeFcwA1CoQHrOc50E47Tr+YLgYESQOqNfn82Ci/nbjE8CyMm
         Mc/csiIMMUGqoPJNvREl08/G/tplEZW6iXsJodqs+SSUkKUhtUnLXqL1Jsz/B8VR9ekt
         viyA==
X-Gm-Message-State: ACgBeo1QDbycBbRozWa45d6Rtfvf7KjCPVwiWOIG0abHDN0KSsX3LClv
	qo6yzXtQHgEHOIMCI+zZxiJ1YoOUEPkS2+A3YyOxw41d4Yw=
X-Google-Smtp-Source: 
 AA6agR50Ugp3XYZt7iJB7xsmLkkAB1C0y+/9xgZlcZuec+87hJYxR/47ahjkXOAYI3WfJooKr1yy6T+CefK8Z1HFAUM=
X-Received: by 2002:a81:88c5:0:b0:31e:f1e:dc23 with SMTP id
 y188-20020a8188c5000000b0031e0f1edc23mr18766884ywf.139.1660671014585; Tue, 16
 Aug 2022 10:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220816165857.2342796-1-raj.khem@gmail.com>
 <20220816165857.2342796-7-raj.khem@gmail.com>
 <CANNYZj8FU8wHYz8UaTYJcQZzC1ZxTVztWfuOistB+zY2kGRTPA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8FU8wHYz8UaTYJcQZzC1ZxTVztWfuOistB+zY2kGRTPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2022 10:29:47 -0700
Message-ID: 
 <CAMKF1soe=GCqr+TQOa66Rv=21PAuFAbq51pOYdj-YUjRuVtkuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/7] spirv-tools: Update to 1.3.224.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 17:30:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169451

On Tue, Aug 16, 2022 at 10:03 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 16 Aug 2022 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:
> > -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> > +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
>
> Sorry but this does not address my previous feedback. There is no
> 1.3.224 version released so this is effectively a random development
> snapshot, and vulkan items need to be all upgraded in lockstep to the
> same version. If you need a clang fix, please backport it.
>

lets drop it. I will send a targetted backport of a fix I need.

> Alex


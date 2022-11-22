Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9A2C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:13:30 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.21896.1669130001383056451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BTwNgjkT;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id f13so2486351lfa.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSK/wndAAW3EPAYPjR8OT5GMR90OufB4w/Oa9j5nlPw=;
        b=BTwNgjkTXfBuvkmJCpKH3VZYKOruHOGsACKzXZycLtETuEPJArVBpd6m0Ql6YW9yU7
         jBzLykp1j7/f8pfPBGMnEUcSE+ZpZYOnffCVg2RNVbTdFfNsGW/d5QdP9avm8e/y2Cfn
         JXJBUTamz8lCcxqUbrowZuoo9gOHMQJ2WS94xQpa0/YsCVP0zGB9nPhoGkHJogbbJAS5
         /lCXAmjsxQQz4fbYSa6bVGi+PY2Jh5jGYk1MwLCwSZzd4+ZCcJeuow45n7595EZYr4Q0
         3kgZBOggo53kdkm4hLP9FJrnU0carTjepMK8//eN7P9YyxBCxkhPCBB1Iz6qnG8mHo6Y
         OzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSK/wndAAW3EPAYPjR8OT5GMR90OufB4w/Oa9j5nlPw=;
        b=ru/Dxa7F115uGHZs/YyPzAC2ioDUtClcYokV8MBFQrRUjN1Yzx5nZ5+vzAwVWZq5UU
         +gj/kKzmi5Y6mWoWQQfwsVbG5OSpSzTsHONN4ckGl3K/3OpagKiwhFAbVRTBqn3Ik1Du
         +0q68OqjrFwUH5IrRHK0PUstLJOK1wHFeNx/9J2iYO2Go1/4l3LwF/vYQPPXPniOhu+f
         bg07UDt2YpIWxi6qkmjRJka17A4IVfGCujldOo/36B/0yHAut6EptZMTWK5rN1C9p3rq
         L0LLh3V1fLxBLkEs4dwutQEPxm2gZroJ8DKyilNMT+HevnAjJtUIKbf55FPnzSgFLN5f
         viWw==
X-Gm-Message-State: ANoB5pn3p5ou5qmMWRhnbTsgnVuQDJQ7mi2tGi13vsKD0KXlHXoE3zbu
	gJPM2LBOkoa9NTzvRZ0kuykoqDlkZhOq/t9SpAM=
X-Google-Smtp-Source: AA0mqf7fr8HNnH2nMo8tJzs8qEzvTupA9FV6mz6o0vdKCE+Ro9fKsVlSxWbX5DbEXg4MleUnNse+IZeJ9Eg3IaZLrdU=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr7648615lfs.367.1669129999522; Tue, 22
 Nov 2022 07:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-5-alex@linutronix.de>
 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com> <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
In-Reply-To: <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Nov 2022 16:13:07 +0100
Message-ID: <CANNYZj_2nVeyfb1625BRANujfKVJZqQ22JPoz6JS6bLoxgSGpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173684

On Tue, 22 Nov 2022 at 16:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > There was one failure in a-full with glibc tests, and that's fixed,
> > but I can see there are more spots revealed by grep, e.g. runqemu and
> > sdk_ext. They just aren't automatically tested.
>
> A change that worried me a lot was the removal of the custom ports as
> it means only one client can run on a given system. I think that could
> mean that we'd potentially hit issues if two tests ran on the same
> build server. That is relatively unlikely but it is the kind of race
> we've spent a lot of time removing on the autobuilder to avoid rare
> failures. I didn't look further at the other patches being removed,
> that one worried me alone.

I just also found out that upstream did pay attention to the previous
submission from years ago, and merged at least some of it:
https://github.com/unfs3/unfs3/pull/6

So it is somewhat more nuanced than my commit message says, I'll do
additional testing and also confirm what is merged, and what is not.

Alex


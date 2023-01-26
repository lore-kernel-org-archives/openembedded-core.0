Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A61C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 14:18:34 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.74544.1674742711124728701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 06:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpx3DhlK;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id h24so3228290lfv.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x47jF3fqd2tuGwRVdUXR292r6F91AcoVkVh+LII6VSI=;
        b=fpx3DhlK/cVzfG6a0Qr3DJezyRxQ4//iYbZCxhAQqtHduHZIPbsdwN2bHnAJ6m2yVq
         UAC+iqXnQ0bNLDqXQmRv8kvZUElQLngEyNZdmOPaXq9J3lhcbufGJVndnsdTNNVU7N1i
         CLCu/GQy7Y/whWPGlLAx52rYtq3lr94aPbPIiBmNjJRgzuZB/3qFX72YtiKSUb7DnSZ3
         KI0bSZJEPsEIIGTZnxuifu/amwmB4xcJ24kJR0V3Z2tl+hP1KcJLzwoeWX5WZ8ll4DPC
         QsZUV1atSsLf5uvBjOj9+wUmqGuIWWntA2JfJIsuM+fVeDiIe0jT7gxVSMw/eyu8Pl9R
         NDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x47jF3fqd2tuGwRVdUXR292r6F91AcoVkVh+LII6VSI=;
        b=HMnlXRQC/PfsMljS8skhT7faGiqLxtsbbRwu5gUgMNzbYYrho/Yk6Ey+WU4OzywPIk
         g4uOm/8p422jMFC9ORSuwmpf8zhAUPHftwkFMM8uQAsXoCh1dJurkblP0t+/8DKDXgmv
         MsWFF3Vc1T8QaOvBEXyrgaIf2prx49Are48NzSHguOFAv9MYD9vq3qI1xtbdK1m3TqPq
         ASgEOoB2QS567kaWdabHIEOXSPLVtbu/p6ykZApb3/PwSbvgQdxJXPBoPkkg/eeYS/Hq
         vL5xisDkVn4f8SU9V48kqfyT7XcoVDz60b2Cm1S5IhGL0oBjoeozjFGtYs0G/utu+T1J
         w6kQ==
X-Gm-Message-State: AO0yUKVYRA36tSw7JSPYqNA63RLiKDPn7fIJeg8JdzBlkdogweT6XAfb
	CXOf/mwa4GXrPmgBZZwlDDssIOWFIijGefAjddU=
X-Google-Smtp-Source: AK7set+N0+ggjqDXmPOMGF7xmf6Uwf/9mRnt25IbKF6on06Qtk6oD+e/phiN4VynI0lgnmjA3V9G479yo5Flb7jVsSE=
X-Received: by 2002:a05:6512:61b:b0:4d6:f432:23d9 with SMTP id
 b27-20020a056512061b00b004d6f43223d9mr724485lfe.111.1674742709269; Thu, 26
 Jan 2023 06:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20230126083752.151940-1-alex@linutronix.de> <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
 <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com> <0bbeba753327c9348177349032e03f366c38d5dd.camel@linuxfoundation.org>
In-Reply-To: <0bbeba753327c9348177349032e03f366c38d5dd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 15:18:17 +0100
Message-ID: <CANNYZj8FVr7_ASbMswYxWthAM_a7sS_9iF1uyP8hb-QwsU2N4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176399

On Thu, 26 Jan 2023 at 14:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Ok, that helps explain it, thanks. Could generate these files using
> gdk-pixbuf-native?

gsk-pixbuf's meson files are written such that the files cannot be
supplied from elsewhere. We could patch it in, but upstream will
likely reject that:

https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/master/gdk-pixbuf/meson.build#L352

The real fix would be to teach meson to run custom_target() items such
as the one above through exe_wrapper (qemu); there is an upstream bug
for that (from me) that had no attention so far:
https://github.com/mesonbuild/meson/issues/11029

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A179C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:16:01 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.8695.1672827350915451353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qIdTgh4S;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id s22so34932976ljp.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 02:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2v2QabzOqxwm/lWCcQcd1VM9zcnsCOGZAsxbnC78+w=;
        b=qIdTgh4SrurI+yCl8BqLYVmzPOOMvi4wenl/r2sw/gnFTBCQXCutd4AopPxi2Ws654
         UyCT8GCcheVdx9Iik8Cn+vBN2NWXR/lUk8e+JJAIaZ5o9xgy1yNqMxPDs0hwXFwW+BCV
         5ZkT39gjR8lj6+C8vxuzhqZcetLGrOlxbaG2xTbHGzQvp//EkiLCir3H+ALR1M6XOKnc
         CWXMTKQhD2+rYG2wUZp2Ts+fjwYg7JDlQEScdN/hxePpFpyLoq65gG6zMlcpzNSc4d1I
         LqF4GBRgKEmeg+gB39fQasQR5V0Cmg1yP9OnOuUfwYEiBZBqw+ualftQIpa4cEPGQinn
         kjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2v2QabzOqxwm/lWCcQcd1VM9zcnsCOGZAsxbnC78+w=;
        b=PLeBNbRGpgpbab1J1G6DBpeAlbV7bw5Y+I3V1I9abrKOJzhG7cpJDSwsMjbBJGb0Bt
         2NqLXRo5pCMlzpFuLzQN7AJ3hglBevANGHpHe2GuNAxmtNz7sCsz8MWOeHe8ErVLYp7E
         EoS/qec/KsCO6QeGpLo9qi/+WP7bbzmokNwbUUBRjDhSAlbKL4GWaPkPogyPMDgAJ/49
         E7hDkhkkTwBpXffYnBFePaUDHKJyrwQPx9bcZ+UlarFsHUxFCiB2s/guBba2fuZHply9
         R8NCOR1tyR30GYdxSFijcOt1K+/lN8f3oYsuWhD/SR+hsmzbZLMK1DAfCBfVotwe2HiF
         vOVw==
X-Gm-Message-State: AFqh2krJ6eW8TKFIGL7qPZsnt7kJhXQT+a7xah/mmikwIjDaHt7p6IOe
	C2sTIOus/cw0IYtAA+klHaaIeFKhlR/D9Hbuw68=
X-Google-Smtp-Source: AMrXdXuhHC9QRi+MX1PWKY1Wrp/CxuHGEkB21r1k2i4R7FMceB88naFMSylWGhbt3Br1WvfK+pCa5ADWXCX2ftSpnJs=
X-Received: by 2002:a2e:a4b3:0:b0:27f:ed42:72c5 with SMTP id
 g19-20020a2ea4b3000000b0027fed4272c5mr915410ljm.217.1672827349112; Wed, 04
 Jan 2023 02:15:49 -0800 (PST)
MIME-Version: 1.0
References: <Y7VFxCWF/bLuBrSc@nuoska> <10036.1672826007578485001@lists.openembedded.org>
In-Reply-To: <10036.1672826007578485001@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 11:15:37 +0100
Message-ID: <CANNYZj-ztn+YBaJrf6ArbQaxPk9gZ5oWaMmcYN0Ej-95hT0WZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Enable native builds
To: =?UTF-8?Q?Miroslav_Mare=C5=A1?= <mares@2n.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 10:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175382

You can easily enable native supplicant via a .bbappend in your own layer.

Native builds are not meant for running tests on the software that
goes into a product, they're meant only for building tools that are
needed for target builds.

Can we see the tests?

Alex

On Wed, 4 Jan 2023 at 10:53, Miroslav Mare=C5=A1 <mares@2n.com> wrote:
>
> We are using native builds to run some tests on the software we develop i=
n Yocto
> and some of this software uses wpa-supplicant library.
>
> Is this an acceptable use case?
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175381): https://lists.openembedded.org/g/openembedde=
d-core/message/175381
> Mute This Topic: https://lists.openembedded.org/mt/96047102/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


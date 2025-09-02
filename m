Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A80CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 03:12:34 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.68794.1756782747792009071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 20:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fH7hzIM0;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-72290cfcf5eso12053957b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 20:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756782747; x=1757387547; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdhNZ17rLY1GR5Yws70hdCS1iHZMV5Gzl+PGrXsXN2E=;
        b=fH7hzIM00MzjML8UZv12Sr9rrZpCbv33NB8nydx5EKmF38z7O6x727pWBupruHQfVR
         UTu2DBcFO9tDWJBIxxnPJpIAgbJ5GJXflfgVICxbvs4zjas6PuWWVInchW0jp3B81hK7
         1GYZ7dZLerBIfMXikYB1MHZJFIfbxXGogLNVb1DnZeD5ghT/fqnoxJtgEYPXW/DslD5E
         M6zOMdBFpFVdbgOeViDUr2AUnj4S4z4SaskmXbb1vJeBVYqBHjaCkK56cHTSoHIWzjhG
         BAA2xafeu1+lIf8cBMyt0NTTmioK7Cna+Mm4RoOPRNJy0sjWR1RLd1pA71ta6qLs89Ev
         q+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756782747; x=1757387547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdhNZ17rLY1GR5Yws70hdCS1iHZMV5Gzl+PGrXsXN2E=;
        b=aQQSN0EVhxCaMnah7MCErZfTK1XDvlRYLiMPaKF29aVuTwNzQuTau/TFga6l4RG3ZQ
         3nspCKPeRMxqN/sT1g75fMYBZiB0/hmfUN75DtBQUy9Sf5JrHJvKufzUK3utFzrhOFWH
         wqtvQ4gOCvLGYg3jbZYQi3B+Eqj6GZjiopKusZIY6OFBgSC/yluZQ3Y5rBve/pEUT80p
         kZ0kdY2ZBBQybSTrLkGcKbr0Qy9m44FqJqCGSY7aYL8Zw7zFr62BOOUsoT1KmI6qbyys
         xR7uzYJS2pHMY3pl/VcICdtz8tTHh1RGriOsJnm8TrHWOBgse2pw/W8aXYPUX93lXRUD
         V4cw==
X-Gm-Message-State: AOJu0YyPatqf+Wt0n9x9Gi1koSLEVIq8cWpgUZtSSEP1AWM5mQFSIq2Q
	GY8yXkWP1FFddWTwiQvalLII3Sy4DNLzHYOKeKjgLD4K1wUsTckq3IRPzvb9tl37iGLup1vv2Ci
	guWl9f46w1mK+OKZG2vuzLCDNpW/Prbk=
X-Gm-Gg: ASbGnctmlNNhtyxsiEiBjnARlDo6Q1zCbKtNvEcfDmm4qOBCNzuQIZF/qISEvE8FxZ4
	ey15XkRrIIFvsAW5raADO8S5sOdemXNHNW4strnK0febMT/Qps/3UU7nKcwKyqPCDmLyG7TF5tI
	T4afr78ARiXr1nHhuPc/eP1r3+TdQOXA0yP44DJHviR8faD3pWuZen1d6rboyC5/58go6LOOs3p
	WQwHJ1+2o+MZC00aKH3neQV9i3Z3ql+henBM4Uq+c085xmZWNMxbAopP93iEwllRihl+iyiDVpi
	rJRfDf3X+2moiDfcpW+fCpj0GIDa7bxURg6wzCBIB3n2MEJ7YGs+Js+WzwX+4SCPxiGZ
X-Google-Smtp-Source: AGHT+IHNSgwTwusPTATzUuqsR7bLBCRWnZIPlp4LexAkozeUy/mWtNdo2jsapFUnEJrWd/gvygd+5wfaCc/qq1V+Ocs=
X-Received: by 2002:a05:690c:46c7:b0:71f:f942:8446 with SMTP id
 00721157ae682-722764effa0mr109132237b3.29.1756782746812; Mon, 01 Sep 2025
 20:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <CABWbsgC2qLDQfnS4oumgLSuS8TWCk=1a3j8yTxN17_UFjMxuxQ@mail.gmail.com>
In-Reply-To: <CABWbsgC2qLDQfnS4oumgLSuS8TWCk=1a3j8yTxN17_UFjMxuxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Sep 2025 20:12:00 -0700
X-Gm-Features: Ac12FXy86oOXVFWBBm_Z2pdlnVfauH5SdNO3tLO7Qa8eC0qMYY6jG_GA5uwwtWQ
Message-ID: <CAMKF1spFSu-EOfuxdBasDs2SQ3S0DRpnbLNyWkRGO77Bp8p7vg@mail.gmail.com>
Subject: Re: [OE-core] yocto-check-layer and DISTRO
To: nicolas.dechesne@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 03:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222700

On Mon, Sep 1, 2025 at 8:25=E2=80=AFAM Nicolas Dechesne via
lists.openembedded.org
<nicolas.dechesne=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> hi,
>
> I recently came into a situation where yocto-check-layer failed in
> Yocto A/B for meta-qcom [1], while yocto-check-layer was not failing
> in our CI [2].
>
> After investigation, we found out that DISTRO is different in both
> cases (poky vs nodistro). This problem in particular was in a mesa
> file in meta-qcom, and with nodistro mesa is skipped ("skipped: one of
> 'vulkan opengl' needs to be in DISTRO_FEATURES").
>
> yocto-check-layer obviously depends on DISTRO (and MACHINE? and
> others?). However I could not find any reference of what they need to
> be set when testing a layer for YP compatible status [3].
>
> I guess we need to clarify what that means to be YP compatible, and
> what defaults are being used for that. Or suggest that we run it
> against both nodistro and poky?
>

If I read https://www.yoctoproject.org/compatible-registration/
then it talks about OE-core + bitbake

> Any thoughts on that?
>

meta-poky is a distro layer which is YP compatible and AB jobs test against
poky distro.

> cheers
> nico
>
>
> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/85/builds/60=
6
> [2] https://github.com/qualcomm-linux/meta-qcom/issues/1029
> [3] https://docs.yoctoproject.org/dev-manual/layers.html#making-sure-your=
-layer-is-compatible-with-yocto-project
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222666): https://lists.openembedded.org/g/openembedde=
d-core/message/222666
> Mute This Topic: https://lists.openembedded.org/mt/115009504/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F64EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 21:50:39 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.2564.1687297837280171624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 14:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OngWtdBV;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51a3e6a952aso6278973a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687297835; x=1689889835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVDQle2HFlVAPDAgTtqaf5lFbx076PM3oUGK2T9fQ70=;
        b=OngWtdBVvRzgEPW0wvzu4nFUE/arIR8HHE/8DMOQwNyOBXzkXkFh8zd3SCiOLHxpuI
         MwJ2wK5tmip97Ima5gJcEs9hT8LQuaR8LePgr5JGnEX9MFxRGrVn9hNKchD3t1Z9ikkQ
         P2Xa8cfaco5MVzDjLMSLMAwBJpiyngob3S+IBs4jFqMLlWCU3LhkOhd13t3eAECQbTxg
         4IZOWnj2J/p6SCdcU3Fs+uayqJQYv/slYTz8kkeQY4J5Mk5T7V0x7P9U09U4bASmrKOj
         P7S5J/JPfdXW73yt4i8VnXUmnE8rRlgKDD9B+Aa8zDQ9GW9ISUsIzKWJDPdU0j1nJF9z
         7y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687297835; x=1689889835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVDQle2HFlVAPDAgTtqaf5lFbx076PM3oUGK2T9fQ70=;
        b=fSuuKrJYVRzUXmGqEORjNODTMEUNOxPwG+33SBQYw/wnmo/lgddZXJvJd+0gm8uvbH
         mlj6DVY66wUFGRD5wsL0Imki4YOhK9jj9/oX3HfBIlY5PDY34IhwYkE8/cyHYIXpG/Qo
         ytpYiw/JhFljwOMp1klLAei99ZMDjQm26t6fikJdPp18hjyb7d8v/W7VgbkoFI/MbF+e
         3d+/2e4wqAIvV+LDzDCEgcEEicTvMHb3llASgPYXsh4jjN32eeA2ObQFEtMlbALG3ncy
         JQtZEhpRWraJ5SaysJvkbBeNB6LoKL8Wq4/Icpir6D1ih3q3mOctie5JqIErzEQ3VWf6
         opTw==
X-Gm-Message-State: AC+VfDyk/gxjBWRfpCrEbouaACLb4rh/3pH5iuwsbuYazpMuXHZK7yp2
	fuRFb/ATcXAOcc0KNRDcNDSEQZaUT9Bhij4GY1/5kSZaW22Zys+d
X-Google-Smtp-Source: ACHHUZ6Ny/Qc0ab1wemicVZEw0r422RYlVuOWvqmOn5miG+7EuZALCWGrlV5p2hXunT3XYLw91lLSrQaGkPAuME1L1M=
X-Received: by 2002:a05:6402:1b0e:b0:514:9df0:e3f3 with SMTP id
 by14-20020a0564021b0e00b005149df0e3f3mr10269476edb.0.1687297835332; Tue, 20
 Jun 2023 14:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <509fb73a-b410-47da-8958-e2ae0de33437@kernel.crashing.org>
In-Reply-To: <509fb73a-b410-47da-8958-e2ae0de33437@kernel.crashing.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 20 Jun 2023 11:50:24 -1000
Message-ID: <CAOSpxdaQ89GAnDM=WPR6vbx5muZW_1hVqaCHoHwy7YYMo7pSAg@mail.gmail.com>
Subject: Re: [OE-core] Langdale?
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 21:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183157

Hi Mark,

Send the patch to the list. Officially the branch is closed, but if no
one objects I think I can take it.

Steve

On Tue, Jun 20, 2023 at 7:04=E2=80=AFAM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I know there won't be any more releases of langdale (as well as automatic
> backports for security and other things.)  However, I found a bug in the =
oeqa
> qemurunner (fixed in Mickledore).  Would you be willing to take the backp=
ort fix
> (one line) or is the branch closed for further development?
>
> Thanks!
> --Mark
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183153): https://lists.openembedded.org/g/openembedde=
d-core/message/183153
> Mute This Topic: https://lists.openembedded.org/mt/99648680/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


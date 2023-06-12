Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEE9C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 15:08:03 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.61854.1686582477971445932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 08:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rS3Cr0dR;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1a6847c6036so1067530fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582477; x=1689174477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1HEvLyXNzYbfqJuW6AmRhNO9SK7pqwayIHX10EXHnE=;
        b=rS3Cr0dR+Qa2MevO6nOY6AscmF886FBXzTeivnJC9/JTnKQzc233Pzu1SbGaLUCEJy
         JRz+NxPfhF3ei2hrvwGhoOcm85VBor1Q9FVHASOgFPducHWEDBs5ZOLMx1ROD6AuS6hH
         kdTL1IjgX3JJ5W72np586TFVpVM67C4iED7NaCspANX5Fr8JkabnSp4p3z/uIVbjPTlJ
         xQ0xwrsU5n/SNeAB4BFNUe+0Bk2pLOfdKsnLVIkobs0Q/r++bfIPP7p5QxHH3Hx287ss
         bOaYIlf/W7tSqyAHJH2q/Mzz4rcbiCsufGF+A8TbyuG6flgVcExWQDJ0yBZJ9keMaYnm
         BtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582477; x=1689174477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1HEvLyXNzYbfqJuW6AmRhNO9SK7pqwayIHX10EXHnE=;
        b=E3chkZ/1zlTvYmr+t7eHsCE0B2kqJg8m0OQqy6cGE01xSYK3IIr7iZ2tPAXVr7YbTN
         Wcyz95Hd9b8iJx4zSx7xJferzSDYnNwgfShBDs5opzaJrRD3j9Ksubxxtb3j9t5+Gb7w
         i9Z9h9ri0T+i86rkyMxWhCvTQa7+aUf2QtJjxB8ULJwIva+6nlLX9R8m996ZWRAjxFXO
         RHYsfag/LfzIJgwLRWzL/irVPkL54D7P3cWGtgn2xeb/aZ6yj5FCiOcW62O1/PphmE50
         gg6vS7MwAKqLfPNG5oAbw3fXLddEiwpFJHp5cm3my9uAHAMD2rk/RgNL8KH+QqFkGAx7
         UNCg==
X-Gm-Message-State: AC+VfDyBnBiloNHnTkTsR6fb2GL3bZP/zDsJLLNMAV8SHTOoCxsY9C7g
	w6ESiHOwJRcOA28WlTvYG+1ewj17RNltMMa3MgMt9DIV
X-Google-Smtp-Source: ACHHUZ4I82diBJ9wX+znxcQsiqppnPJ6ijWhq+3ta2G4+YeL56podiBKpgkPPzsd6j8AcPPbfJSjwrtEi63bodiTfjQ=
X-Received: by 2002:a05:6870:4316:b0:1a3:2447:7f4a with SMTP id
 w22-20020a056870431600b001a324477f4amr5430099oah.32.1686582477107; Mon, 12
 Jun 2023 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230612094415.2338958-1-deepadeepthi98@gmail.com> <14338.1686563912593685566@lists.openembedded.org>
In-Reply-To: <14338.1686563912593685566@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jun 2023 08:07:31 -0700
Message-ID: <CAMKF1srpWrg5p1Zt-rFV1yMXnT+uc2aiqPFsf-H2GdWungCRDg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates.
To: Deepthi.Hemraj@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 15:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182673

Can you share details of the 1 new failure

On Mon, Jun 12, 2023 at 2:58=E2=80=AFAM <Deepthi.Hemraj@eng.windriver.com> =
wrote:
>
> Regression tests are performed and below is test summary.
> Test summary after glibc updates:
>
>     153 FAIL
>
>    4408 PASS
>
>      41 UNSUPPORTED
>
>      12 XFAIL
>
>       6 XPASS
>
> Test summary after glibc updates:
>
>     154 FAIL
>
>    4405 PASS
>
>      41 UNSUPPORTED
>
>      12 XFAIL
>
>       6 XPASS
>
> Diff:
>     1 FAIL
>     3 PASS
>
>     0 UNSUPPORTED
>     0 XFAIL
>     0 XPASS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182661): https://lists.openembedded.org/g/openembedde=
d-core/message/182661
> Mute This Topic: https://lists.openembedded.org/mt/99479400/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01731C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 06:56:24 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.32221.1686466584016596170
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jun 2023 23:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qGi4jdJ5;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-19f3550bcceso1622952fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jun 2023 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686466583; x=1689058583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38uNzqjdLhRC5O8zryGT4uUfIolA2JWoz0I2pT8v97s=;
        b=qGi4jdJ5Iw+HX3TyzODW86eM+vLn2B2d0tIS3gAOjz9HJOJPXuSe/V/Hm49B8vJt3/
         1xMZxY3Yw0ddblCqeoGl9+TWdflxuELVkoo55tuWZtvaA1mRtVYDwrXkA0425HdXxKBV
         fpZJQ85Zu4Vfer5hVz0XCwWlZZjk4lgLdmmFeBiX5xltlN8bjtlYNRnPLGsB3KNUDqDH
         5jEcditXbQ4ToikhElOqbl4Q57RlBxMi1RpWnQiollJmaurfRPORNL3fda+GvZJSw6gj
         DIqabz57TrBkEJmKcRqFeQ1WgkqEQjrFIadYktnXHyG2R85+2c5By2NMKwirotyam7Jh
         KByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686466583; x=1689058583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38uNzqjdLhRC5O8zryGT4uUfIolA2JWoz0I2pT8v97s=;
        b=Wq91NP9v3poZRMY1K8PuSAHcylg3eWe3J6Xjv5I+LOdV6yP65/kK3mzCGCC+L3koqF
         TBQht8xRkkdcCxVBFOefTa6jkcsL963HgJeYRCEGGMhtvaQQgROaEMyGXUIkaNWJORXS
         vyxEnd7a21PFGVznxmy8L/wT7+JEM1xQhqvmmfLdZHhEC4AP448tqLSXxhgYnG8Nc8TS
         LLjcYwkyWWCVm0xjOcCL7z5PDhhCkSEmvWcDY/jczjQbP5Avtzsd/rSoQrwRBMkaefAN
         Q8yBBYub+FhLNaMWmxswvs9r95q4vPC/Wbb8XZSJmr2TAqrAHhJNykWAdGPMNiiOYQdx
         EEpw==
X-Gm-Message-State: AC+VfDx7tu+9ZSIeKw16EUcA6bq2RM28d5gOJrPD4hdabibyD/qWmVTc
	3nhzGP/fx8A7KzKrKGcKR6nUq+jHDsFpS3qAF0ACLGFe24E=
X-Google-Smtp-Source: ACHHUZ6B4hVYTw4aTRIB3Ggcw4Cp/PplB8s+zrgI5WSHmWi6K/yYb4iaW5ODi8+5/yDjml0tWvu5SJpW9yc7+eXM73U=
X-Received: by 2002:a05:6870:9185:b0:1a6:5403:eaae with SMTP id
 b5-20020a056870918500b001a65403eaaemr2011498oaf.5.1686466582986; Sat, 10 Jun
 2023 23:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <14338.1686336106059476225@lists.openembedded.org> <2689.1686344267035888315@lists.openembedded.org>
In-Reply-To: <2689.1686344267035888315@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Jun 2023 23:55:57 -0700
Message-ID: <CAMKF1soQ6wcnD8o79GDz1TxPtQqZHKX7LyDSyNNr5RsYaO5=vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 06:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182615

seen more failures on qemux86 and qemumips

https://errors.yoctoproject.org/Errors/Details/708137/

On Fri, Jun 9, 2023 at 1:57=E2=80=AFPM Vincent Davis Jr <vince@underview.te=
ch> wrote:
>
> Created patch series should be fine to build now
>
> 1. https://lists.yoctoproject.org/g/meta-freescale/message/24918
> 2. https://lists.yoctoproject.org/g/meta-freescale/message/24919
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182598): https://lists.openembedded.org/g/openembedde=
d-core/message/182598
> Mute This Topic: https://lists.openembedded.org/mt/99365321/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


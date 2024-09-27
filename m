Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A5CCDD1D3
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 18:26:46 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.76148.1727461597702000607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 11:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5L+n+Jw;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so4896671fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727461595; x=1728066395; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoC9uWg1RHbDr8uVd+8K/KG0t1T5oPx0A1LJvtB8LR8=;
        b=V5L+n+JwOgZ7GUKXeLJ6gqBsmzsMwLdhuIMu1XQQ138U/EfQcBacbrxS0n7L6jJhPY
         mczWgHRbJ4ElwKMMXYFfpHu1C5uqcQF9gK7vZ24gbpMVHwO8AbYiJAsqDOCgFM42e2YX
         YRL+8I8rVaNBJxdvdlpCeab5LRDUJph/Vku0ZnWy+1RkPap4aAJHebCf7BlGjgtF17tL
         t/LJbL98nPFnk20auc6ZKXS3AS2P9Y26iZ/5v8K05S86g9kYx3js268YK1c1TtcVwvAv
         68NyceTx1vNqIiudi2zLvgs1XKERD8UiteLWk+h4uNgJYwuwNwKXjlXMz4JlZMRxAGev
         l7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727461595; x=1728066395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoC9uWg1RHbDr8uVd+8K/KG0t1T5oPx0A1LJvtB8LR8=;
        b=DAZ/OpAEjVHfiPbC0xVwpYYScNd1qhm4VlYMTsHTGcDhk0euGVdZz/bguTL6t3mUmx
         PMzqqKVJp+GTCd1GGUGvN4z0Ldme9HdxNLLdokMZuntgM0M4VinUXDavCAVnLR77sjPV
         asa6xC2V8KuRj0qKmkyMIPNUNqNQJZxDOWd+OnQkwStyS7L/R/7N2onlJb4kHvsX2coz
         mTcM5Pq1foZVbMVHV/fBekpKVDhTyOl0sRDoxdCNY5FZDd2pvtUirw/32NWAL3DBU1ng
         MFbw4pgni/wzmViQ+3TMEXbm0yrpVQKnmdHX53dcyDXXgj/tN/PGpYddrIbEFRuvsdmt
         qslA==
X-Gm-Message-State: AOJu0YwAmLDJ4butAuKNC/Gxa31Z3htAep2JBXo0/HHn2mt7A08cxO8v
	khHi4BelJsCbCkNaCUOhBrvSihtUSpzwWTS77IPrd0K+cx+PnCeeC3SCke22RwHRrj3Vqyyz0wR
	6u1L8KIYDD/j0m8mwXD8MXBqZVWw=
X-Google-Smtp-Source: AGHT+IEkKTn8Qm6x43F/8mqV4fHkA0aLYE2ivXucA/38mfV51rZXwkyIDXEbHjkB+T6kC38/tk1xctaWwRD9Fg+Mc0Y=
X-Received: by 2002:a05:6512:eaa:b0:52f:cffd:39f9 with SMTP id
 2adb3069b0e04-5389fc43e5cmr3183259e87.24.1727461595058; Fri, 27 Sep 2024
 11:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
 <20240927155247.1012846-4-JPEWhacker@gmail.com> <979D8C4D-0437-49EB-A5EA-8FAD50B65488@arm.com>
In-Reply-To: <979D8C4D-0437-49EB-A5EA-8FAD50B65488@arm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 27 Sep 2024 12:26:22 -0600
Message-ID: <CAJdd5Ga+_PO_TTy1ZC_JihaOZ5Ui21_hJ3d25=ai202s1YdDzQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/4] create-spdx-3.0: Upgrade to SPDX 3.0.1
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 18:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205039

On Fri, Sep 27, 2024 at 10:02=E2=80=AFAM Ross Burton via
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>
wrote:
>
> On 27 Sep 2024, at 16:51, Joshua Watt via lists.openembedded.org <JPEWhac=
ker=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Upgrades the SPDX 3.0 implementation from 3.0.0 -> 3.0.1. This version
> > introduced some breaking changes. Effectively, 3.0.0 was a pre-release
> > version that we do not need to support any longer.
>
> This sounds=E2=80=A6 important.
>
> Should we ram this into styhead for the 5.1 release? Would upgrading to 3=
.0.1 in a styhead point release be reasonable if not? Or should this stay i=
n master and not touch styhead?

Per discussion with Richard, we don't want to hold up the release for
this, but it will need to be backported to styhead. I don't have a
preference if that is before or after the release

>
> Cheers,
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205035): https://lists.openembedded.org/g/openembedde=
d-core/message/205035
> Mute This Topic: https://lists.openembedded.org/mt/108688994/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


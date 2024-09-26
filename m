Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0260CDE020
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 16:04:37 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.47562.1727366670836741550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 09:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivrhNpm6;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-28707368ab7so264048fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727366670; x=1727971470; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfVc6+TRkFMcnXfxSW6gSsdOEppWxTgjPru3CAkQ6LI=;
        b=ivrhNpm6MFJwyyPlXcM9eEmufvg3EA7jGnzjIRxyLRwMDmrVIjQUvoPK53CNm8npNm
         vjrNpdxs3AsNXAwcNMkNTvii7Iht1mv2xfZje/TnBk5jXph7/F0vfF1/Pq/eHOriHk4f
         EG6s39zujuRLxTpZtHLVJY5DV1P4+w5e0XS7/GoVWLF681lqfMmnl8q+lmTB2mfV8BUn
         vSDtoGg63JDsgoCHS/v3YCL372qhaSK3B5Yfa9+Z2fGNNxBpXpPFqlZo3gS1V1iK2pFs
         UDyRXLjpuLD8R9cHIeGU8K8iWFDioYnSIyo65LYRYZ3AeMW44wzn2KJArO9lKUsfCPmy
         gWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366670; x=1727971470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfVc6+TRkFMcnXfxSW6gSsdOEppWxTgjPru3CAkQ6LI=;
        b=dltP2Zp0Ygter6jEegrpTw2lOWEdiMPQ6mCNWPkI8vYSQnyGRYLL/L1+g3hZIyUedC
         oux2ElhezDQAkaq8wx6EOklxn1fiaOPKpUCIS/ksbKkt8PkR3KEwYAm33Wuj1Z01d4RE
         jUN9/E3c9PgQDmYS18mIKJEh5D9zVP81+ir7tUWCkgHxI3vLMNoLAeFGsvGI7joB7Mwv
         D+O7I+gc41NLnvqHPzSGMmMaf+3egVUAtWXyD3fY3nQG+u32zQsYeVtJSxkO5GW/XBAs
         V1KXu6ZjqeRIpcWOYqcnt+jpMwvWqTTViUnv6FfIT+9skG9EHpYGw6VAU6PCamAij7No
         oYDg==
X-Gm-Message-State: AOJu0Ywyg/6QcK6+n/8TLurnVeKqFPiaUJ+qm8faA6z5y6Kr1Vlfa8Dx
	gELmOXiWrgUssq/Dyd/BygO2zO/KSt66C/sfHs0djkZqIGxvZEadtOV928CJhUrL6fl7KeaRvt3
	0rYrK6g7SnDQHRHIlL80On/YdrIc=
X-Google-Smtp-Source: AGHT+IF27H/2HeH/mFFSskshIVxiD1fsqaypsutVwyoQ3FW+VdQE3DzMQo8RckeloJ80O/0o7uvuvtMH/xu+J4QeqEk=
X-Received: by 2002:a05:6871:5228:b0:261:360:8e26 with SMTP id
 586e51a60fabf-2871079f415mr508971fac.0.1727366669893; Thu, 26 Sep 2024
 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soz6mBG3GiGkT9mRcvVu9+sXpU_gA-vm+zPnK9LEsKeKg@mail.gmail.com>
 <29158.1727329037811955873@lists.openembedded.org>
In-Reply-To: <29158.1727329037811955873@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2024 09:04:02 -0700
Message-ID: <CAMKF1sqhyyLuArBMuD0jjnoofiv_qF_aDkz-cjG0zAWa48aRtg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.40 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 16:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204993

On Wed, Sep 25, 2024 at 10:37=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> The test case malloc/tst-free-errno is an additional failure that was pas=
sing before the update but is now failing after the update.
>

then its a regression if its not intermittent. Maybe worth digging a
bit into this and root cause it.

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204969): https://lists.openembedded.org/g/openembedde=
d-core/message/204969
> Mute This Topic: https://lists.openembedded.org/mt/108643422/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


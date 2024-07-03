Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAF3C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:47:25 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.47308.1720000039848843272
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JARNPTs/;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so61132351fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000038; x=1720604838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ3da6XHceaAzNW0bYJsrAqweJ/lz3dKw2C3HnlpS5k=;
        b=JARNPTs/qGAcuFn8q1i7ShJDkshzbTmDCLmKBbRdFAINQ6QMGr3hA/u7LRwvzqFEtq
         8sYFyCCfITyhQ3w7UMuXX8ICyBHh8dRLoaM5VRZ1FbIuEQhRgjD+NN+wgZYGd9+XWpMr
         eBP3tYHx0eUEJUK0uDkNvl8Od2h94cfcDPaSOOZeh/oixbe5iWWslmcd8uFHWrIU7r2x
         HDWvwyjlUdZqme/I3hw2vHlr/wg59bCJQ7TofkcFRjXr1dssdkvhGlva5Iox2NWkyPN3
         u1HBpE7mKkZmU3vZiaLTFoZ1jzl1zebkLdyygo53McW/kXQjAJWZ3R6j8/Hv90uHuDnn
         rnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000038; x=1720604838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ3da6XHceaAzNW0bYJsrAqweJ/lz3dKw2C3HnlpS5k=;
        b=KH5/d2mxK5dwj02yB7pHAYQp70ubfqyIvTU01my62WxiyJWzbVmJRhXRo+Qc6A+kjc
         K8uYvSqeDcBICgT7jQytCE4flB5tSCVevbdts8yc5f/2q60zKkLOxC3918Ita//pEJWf
         Ty2rh68+2lT5QCWOzRImkshbkVk0BgAX+rw+prnHIeHwkaF15yUpx1zFszpwxSd1cBZB
         wl+FTz1vTHWFroyEVYImpcWJmxgQOOawNp+Ax2V0BLLu8xfV4wWtyxWtnoQEzyLd7wj3
         eeTVTHmd046R1LUI7b5HsUqXSLIlhcS+AHz4ze/B6AArrC818kIIrWkYvS6pHL+vOn/g
         CyaA==
X-Gm-Message-State: AOJu0Yzht0lJzhMgScUSMDat3VQAKZBlLbClHDmWy+Ie9U4g+oRQkR4n
	m2D10Twz9dXg9LWNXr2zMJurT5/yQKm9/i1GDc3oumhQLZAgvYBsNfvv6gG8JoyKGyd0boToIt8
	dQhMBQlT0SOv7rmvA7HbJdBX3yymldQ==
X-Google-Smtp-Source: AGHT+IHbotGPQeJe9eumk/3OarAvBoHIhw7/nAiPxh42vdvbWLsNlGNX3RNVh5hGdkK80YqTyKragGYNNciVIeEUtvo=
X-Received: by 2002:a2e:b535:0:b0:2ec:4eca:748b with SMTP id
 38308e7fff4ca-2ee5e39260amr63722951fa.14.1720000037866; Wed, 03 Jul 2024
 02:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240702222833.3826-1-gudni.m.g@gmail.com> <28357.1719992407222827322@lists.openembedded.org>
In-Reply-To: <28357.1719992407222827322@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jul 2024 11:47:06 +0200
Message-ID: <CANNYZj869KeEDLq4wpOCpshYnY5QvuK3MU_chinUeOcpMmfKVQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] python3-requests: cleanup RDEPENDS
To: gudnimar@noxmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201464

On Wed, 3 Jul 2024 at 09:40, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org
<gudnimar=3Dnoxmedical.com@lists.openembedded.org> wrote:
>
> I thought I should mention that now on master branch, python3-ndg-httpscl=
ient recipe is not required for any recipes in openembedded-core. Should it=
 be moved to meta-openembedded?

Yes, that would be good.

Alex


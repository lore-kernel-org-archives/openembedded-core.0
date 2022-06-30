Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B557AC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 18:04:02 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.28860.1656612237432065446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N+ibaotf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso2225717wma.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GL3b7tqXGVb8sSanuEpIElSyC19O2lLFhb1fKgRT0Zs=;
        b=N+ibaotfjTAvp/oMSgUc7OBaZ/SehIkfZkBXmfimo3mD8YNvhFvNem5VuSJ7ujwPiI
         OyyrNluCHdNuZdyS6iOkGHR/Fzlyh5a+K86EUv6CIMEbHIzutZafZ6hVDwpCznVTvFLk
         TxD4yYX6IXRa8nmi7GTHHeen2yIaPG8LGBRIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GL3b7tqXGVb8sSanuEpIElSyC19O2lLFhb1fKgRT0Zs=;
        b=GLB4OA2yN4tzJMv6f+nonaukdBApoE2zPuk4USNo+FKq7Bm/xhKZaTTOQIZ4MEUgJS
         DJRUjYE/3p/fgwVFxsVrp3UaQbRyq1vS8+pNXtJ/7dqV4Y+PQuJqLI9kTSIInw+AbxEl
         ZP5uTb5UJWPm7OyeHYGeH8HgNHQP7K2y0eIxo7hfumcTcPtiN20D4oNhEkKaSISYWKy9
         gPc2KO3WTl1BVIGUV2YVvU0UhpgO0f3VMZDmt44vsaMb99CRAC1iWLvKtxI0mVZjsoM6
         +1+QFB4Z/sD0Bwkp4ccyza6NTVeHH1ufJiDzDHt8J9z+fWxWRxJbKPetDPz9NKCJ3uOu
         mkrQ==
X-Gm-Message-State: AJIora8l5UmpS+T8lvGCfrbnmTf05bBOGLN4gE2CBCBErgRR2ro/nIyl
	zHCzquQ26BNg8c5eCoDLZSp0VQ==
X-Google-Smtp-Source: 
 AGRyM1u+dNh2Jk8dlVCvVi+p/Fust6QoqYybVudPoFleX79NsTSJ+UtV7Dqk0wDUyXLwJQDGgqOm7w==
X-Received: by 2002:a7b:c94e:0:b0:3a0:2c82:87bf with SMTP id
 i14-20020a7bc94e000000b003a02c8287bfmr11433223wml.136.1656612235734;
        Thu, 30 Jun 2022 11:03:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f06b:8b84:2b52:384a?
 ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003942a244f40sm3651462wmq.25.2022.06.30.11.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 11:03:40 -0700 (PDT)
Message-ID: 
 <0f9d6bbc96f02032137f4f5cf6d1f5bc0f2518f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: Upgrade 3.0.3 -> 3.0.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2022 19:03:16 +0100
In-Reply-To: 
 <CANNYZj_Y4JKwLaFF4FU28Y8HxCADJFW+b9tQnQfxBjjkf-vUnA@mail.gmail.com>
References: <20220630162044.671912-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj_Y4JKwLaFF4FU28Y8HxCADJFW+b9tQnQfxBjjkf-vUnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 18:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167431

On Thu, 2022-06-30 at 18:43 +0200, Alexander Kanavin wrote:
> On Thu, 30 Jun 2022 at 18:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-fr=
om-co.patch \
> >             file://afalg.patch \
> >             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> > -           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \
>=20
> The file needs to be removed as well.
>=20
> devtool (or AUH which will run in just a few hours) would've taken
> care of this automatically :-)

but it wouldn't have mentioned the CVE in the commit message which I
was looking at. I'll drop the patch, thanks for spotting.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32489C7EE23
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:18:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.847.1683037111754987441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gwbUa59V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f315735514so171201635e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683037110; x=1685629110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tQhsgc8Y1cCfPj2atP2CSx/wKhDFEv05ZQDoIc9vMtY=;
        b=gwbUa59V1tugaFsc5gU0f3OVYrM6wB/3A3s5UbogRd2elr47zKI9BNF8NiUcx259Nl
         yQBl2+0I4D+pbX+fKIcSXFxCcHqU39ayk5+ZDgSXkDdjMhrxvtXuL/7SU9e+13EqAb1M
         FwV8+TzJS2wtikXQ/D/b8fxFV/dgzgdwc8wSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683037110; x=1685629110;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQhsgc8Y1cCfPj2atP2CSx/wKhDFEv05ZQDoIc9vMtY=;
        b=QNfC8NAhXp5MnJ55xMwiqJUPE4kU1eBwxII2oe15/f8pDbl8uP0S7RPOdqlWz6ul6M
         x384/7MU/FXmPGIyGdELTrXnqtbwkI+Oh82MflDtsqiTqAQQ1/Y5ujOWAXFbPjF+jMSR
         YE/n47YFaT/eGgygm8Wrdc5FLr1bk9sDsboSIVc+rcRpaNnY+mgLojPg+Rm4sVVQH/FC
         0cdEsGsmpN81W69yCJn4u5KfEUW6SAMkVSF9fCz/4KM5k01IyEQ+h/iEyY5QmQwXVdBw
         CYPN46I1Hcjijo2ya3lyRtuDDGU/8/DO1W053ZWS/1lJEY/7RTH4K0E4spthd0CAA3gL
         g3yw==
X-Gm-Message-State: AC+VfDwAtmlo4HsuYbJtDY/Mh6WuCichKdqrDreoJMtW2If1tqUdTihA
	d6Vb7K3pK1zBmkVES2WJ4zrgiQ==
X-Google-Smtp-Source: ACHHUZ7yw+dYm1lG0qUSQXGm3/2ripDB5e0cueQU5kO7E8GqpDxyp4JXGGjozipH3wM4Fmj0U4Bpkg==
X-Received: by 2002:a5d:67c2:0:b0:2f6:1a6d:a6c3 with SMTP id n2-20020a5d67c2000000b002f61a6da6c3mr15671648wrw.21.1683037110177;
        Tue, 02 May 2023 07:18:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cffc:b608:40fd:850d? ([2001:8b0:aba:5f3c:cffc:b608:40fd:850d])
        by smtp.gmail.com with ESMTPSA id h7-20020a5d6e07000000b003048084a57asm21590259wrz.79.2023.05.02.07.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 07:18:29 -0700 (PDT)
Message-ID: <e20d1f52fef28bd8236efc791a0beeed1c7a31f5.camel@linuxfoundation.org>
Subject: Re: [docs] [OE-core] [PATCH] init-manager-none.inc: have no init
 manager
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Date: Tue, 02 May 2023 15:18:28 +0100
In-Reply-To: <20230502141402301f77f9@mail.local>
References: <175A0DD84C89F64A.26969@lists.openembedded.org>
	 <20230428090602.82995-1-michael.opdenacker@bootlin.com>
	 <20230502141402301f77f9@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180733

On Tue, 2023-05-02 at 16:14 +0200, Alexandre Belloni via
lists.yoctoproject.org wrote:
> Hello,
>=20
> This causes the following error:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7035/st=
eps/12/logs/stdio
>=20
> This is the expected behaviour of the patch but doesn't fit with what
> this particular build (qemuarm-oecore) is testing as we can't run
> testimage without an init. I'm wondering what should be the proper
> course of action here.
>=20

INIT_MANAGER didn't used to be a variable and therefore could in theory
be unset. The "none" configuration was designed to cause the system to
fall back to the original behaviour. OE-Core's "nodistro" uses the
fallback.

We could decide just to require this variable to be set to something
but this could potentially conflict with people setting up their init
system "manually" within their own distro.

It is a bit tricky to know what to do in situations like these.
INIT_MANAGER was added to try and help people avoid needing to repeat
certain config fragments.

Cheers,

Richard



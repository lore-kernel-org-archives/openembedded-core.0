Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71944CCA479
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 10:16:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.54220.1656411368438326498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 03:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FSPUdRHZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v14so16934640wra.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/Hy2kpg0aOGm7FSbesgeUv7YTUTUP3JiaOoSpQbiqjk=;
        b=FSPUdRHZ6EIPeG4q3gotO42qJTzSd0RxLRdDS8wQm8w9wgYX54GKpL3tkToTS4wW0W
         CcpZ5eacfhaw33Fq5m1okTJWiZrsNddCIVOOcwHNJBYuWtDLXHlx1Jg0pbTztijHnNdN
         8QAkCazBAJ3GCy8RkWpELGGgzeHmTowGEcCoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/Hy2kpg0aOGm7FSbesgeUv7YTUTUP3JiaOoSpQbiqjk=;
        b=mVEMs+TQcw36G3wnlQVLAONbYxxSVySR02yeR8k0aMSgiG/JnAisIdu1OoUMlzD575
         svNWJ/Ob5/r1g7qd9KLls6AgNP6U1Y7seJSSY1dLefVk/caC05s8d1mWPUQrdSR32RMe
         0DMHkjf4//8h7gNAmkSaWPovJ3FPdGoYg03Q110jJdMVWeU/GX4udRzv0PlxsoFzPTSR
         vaMLOlF15a9hoJ2H0VsKI6AQl98REYNDL/AFtK/FzMZhueh6744q/p3BeD26ngEoGwFs
         ZfNpGgdI1hGP2YqXuU8fjaBFbutHL4LX/+mNqkdsPF1lFDEVIRrY0WIxYYW4wBZy9HOM
         Zfww==
X-Gm-Message-State: AJIora+G69vACn8CqdAe7jBTBJexxswxLnDlftL9bWUmVVLZMjGSwKfy
	bxM1anCwPnq5FLOxUWgv1vy/uA==
X-Google-Smtp-Source: 
 AGRyM1tZrnlUlbqGy+0lTGNtz/gEdD4F6vewhMMwx2M5fjLzSjXcZYdk6Clh30H0HpAtirMqd+eWvA==
X-Received: by 2002:a5d:64a8:0:b0:21b:9ab6:69d0 with SMTP id
 m8-20020a5d64a8000000b0021b9ab669d0mr16954452wrp.512.1656411366678;
        Tue, 28 Jun 2022 03:16:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1624:49b4:7dc4:c660?
 ([2001:8b0:aba:5f3c:1624:49b4:7dc4:c660])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b0039749b01ea7sm19933846wmi.32.2022.06.28.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 03:16:06 -0700 (PDT)
Message-ID: 
 <8afeea0dbf57ab08aade7ab3da3d66603b003bd9.camel@linuxfoundation.org>
Subject: Re: eSDK dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Marko, Peter"
 <Peter.Marko@siemens.com>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>
Date: Tue, 28 Jun 2022 11:16:05 +0100
In-Reply-To: <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
	 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
	 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 10:16:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167336

On Tue, 2022-06-28 at 07:55 +0000, Valek, Andrej wrote:
> Hello Richard and Alex,
>=20
> Richard:
> We tried to revert the commits which you mentioned and it didn't work.
>=20
> Alex:
> Yes, is fully reproducible on latest master.
>=20
> bitbake core-image-minimal -c populate_sdk_ext
>=20
> eSDK installed via: poky-glibc-x86_64-core-image-minimal-cortexa15t2hf-
> neon-qemuarm-toolchain-ext-4.1+snapshot.sh
>=20
> . environment-setup-cortexa15t2hf-neon-poky-linux-gnueabi
> devtool modify busybox
>=20
> Sstate summary: Wanted 14 Local 0 Mirrors 0 Missed 14 Current 6 (0%
> match, 30% complete)
>=20
> So it started a compilation of missing components. We are assuming,
> that eSDK will include all build deps for all components in the image
> and not just a deps for image itself.

Ok. To confirm, SDK_EXT_TYPE is set to full in both cases? Could you
share the locked-sigs.inc file from both? I'd like to understand if the
tools are there but not being used or whether they're really not there
at all. Is there much of a size difference between the two eSDKs?

I suspect some kind of bisection to track down the change causing the
issue will be necessary unfortunately but at least that test case is
relatively straightforward...

Cheers,

Richard



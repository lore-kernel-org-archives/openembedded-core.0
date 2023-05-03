Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A53C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:14:48 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.13814.1683101680229982040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ELK0LM3+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2fa0ce30ac2so4455891f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683101678; x=1685693678;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpBp2v4O7t+AM2Y37IC/soRZDeSrxYBka/AlZyihb9I=;
        b=ELK0LM3+MEz5f7YAlDEwt4b92JcJ1AhUQ68Kd/XqPg9J8WXSB4mxUI0xuMYbCE8nNY
         oEUbZ3I5ZePjnhBOSp2AhvwzyDuLGKhMy6pklY7em6eXoo+RX4g1u4mP+T6LqLy1BRmC
         tZSVNBWqHMtFH5aqVaN625Y9K56yuCgQ7qBpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101678; x=1685693678;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpBp2v4O7t+AM2Y37IC/soRZDeSrxYBka/AlZyihb9I=;
        b=Fxf3+YI6T8H7EhltGpGPQIv+SBiNkauJwnVLcz7IBopLyAHjYnOMSlCs+1PI87uZTd
         +bE4mEvJpbOgGmV9pUb72bLCG+NtsphVQ+VGNd41C4weWWL/toflUP5kzdLv7f/aNMVU
         92CzON9LBRC2KaXEbchAz5fRYNjbQ/e7xXkzQRIvaFPmBKkoY5ZUlT9Redfkb7d8dZ7Q
         jisvbn1oJT+mWCSyPmUcYal93ph61wtcwmXX0WNz2omCbMmtPGyW9W/Jvt1By/rwl9+2
         04kTf0DENYmGiPNVuJ+ROkXd1MY2DCHMMqbHbJAnVVbzPHllT95fxIsEYucNCJGgXXhV
         Tr4Q==
X-Gm-Message-State: AC+VfDy89/sI3jbN1aX+GPTwKK93YFYtO2S76VpxgRB3gREs2srw63qI
	oVDokKRjaLWwTpLqWcvfneB9iA==
X-Google-Smtp-Source: ACHHUZ5z6rMLtx53/PPgPsYaPJ1SKe5L0SbMp2URlWsiFjzOob2RfeegJzIMu642Urky9kzJUt6VUg==
X-Received: by 2002:a5d:5009:0:b0:2cf:f279:378f with SMTP id e9-20020a5d5009000000b002cff279378fmr12498524wrt.44.1683101678616;
        Wed, 03 May 2023 01:14:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0030627f58325sm9722459wrx.25.2023.05.03.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:14:38 -0700 (PDT)
Message-ID: <7a4151989e1ec54802ea6499d174a0d61543d4de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: 23.0.2 -> 23.0.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 09:14:37 +0100
In-Reply-To: <20230502201240.2372610-1-otavio@ossystems.com.br>
References: <20230502201240.2372610-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180785

On Tue, 2023-05-02 at 17:12 -0300, Otavio Salvador wrote:
> Update to 23.0.3 stable release. Release notes in:
>=20
>  - https://docs.mesa3d.org/relnotes/23.0.3.html
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---

Unfortunately I isolated this change to be causing qemuppc xorg sanity
check failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/7010
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4517

I've not looked into why, just isolated it to this change.

Cheers,

Richard


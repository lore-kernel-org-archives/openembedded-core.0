Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015CBE95A9F
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:00:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.66309.1696867225597837241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d3SQjG05;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-323168869daso4645878f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696867224; x=1697472024; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNI3sw7nV/CPy8AxkwCg6A8E3334EtGLPDP2+0n+vPE=;
        b=d3SQjG05htHgvRBkTuSlOcQ5DfCI6DCN9LYWRIpY8QASiUO76LMcIhnA574KYJlWEd
         mNpRlfGc2oDPTICxArEGzrI+8FsKI9dB4tBy90uHo0gLeUk7iaAHlk+yODPm5eSYUv8+
         kT0vgAzfQvfZUUnm7Fq3EI9FDzsVYFfoyg4uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696867224; x=1697472024;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GNI3sw7nV/CPy8AxkwCg6A8E3334EtGLPDP2+0n+vPE=;
        b=ebyNaNdTn5TKfVY6wq4UwcnOe2ig2q/yigN4G7U5qMeKSHSL1H1LSVOG223I6Pbvna
         TBj3EvXCV1ZE1JST79Wq9A42QDs36IaVDIXEKeN/vWv/72Aa10j3qKu5DSuoqcFJkpzY
         zhY5RMudDOU1joyOWIPHaEKrgn4smxZebGmOSEUcmhQrPWTIXAV6gq3It8SUF89Y6MyF
         TxmCnp1xYwkqEdeXH5atv6MBPM+Q/4xIb78Isk/rmXRQWHniWFGBFZzKM7mkXHDHFazN
         PAaXyEHNg4DOSL9hfsudc5WXKGdkk90Q50Y6wXEp9tJoyxXe0kDVWT7jT3cBdFY7yFKh
         BaqQ==
X-Gm-Message-State: AOJu0Ywsd90DCp8Drf5BTjgaID2L4sZM+joRWS+0F8fQuxQGq1ITn0EL
	jftAvy5dcKBXe277AVMB+ZmesQ==
X-Google-Smtp-Source: AGHT+IH3tfPjEDREqstwbwepZgvDo01edRj0r4Y1zgdoB+b1wEKWbnpHfHKTlEA8isy58l6EDg67HQ==
X-Received: by 2002:a5d:494f:0:b0:31a:d266:3d62 with SMTP id r15-20020a5d494f000000b0031ad2663d62mr14788158wrs.54.1696867223924;
        Mon, 09 Oct 2023 09:00:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8318:8840:ca53:f6f2? ([2001:8b0:aba:5f3c:8318:8840:ca53:f6f2])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm10086299wry.75.2023.10.09.09.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:00:23 -0700 (PDT)
Message-ID: <0b6d1354d372946cd1175db2962e707a486765cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-subunit: upgrade 1.4.2 -> 1.4.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Mon, 09 Oct 2023 17:00:21 +0100
In-Reply-To: <1695716722-9223-1-git-send-email-wangmy@fujitsu.com>
References: <1695716722-9223-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188842

On Tue, 2023-09-26 at 16:25 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> License-Update: Rely on external copy of iso8601
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Subunit now has a dependency on an external iso8601
>   module rather than shipping its own.

I checked and the code does now import iso8601 so it needs to have a
dependency on python3-iso8601 added.

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4524EC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 13:09:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5513.1691240965417239517
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 06:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFQG5p29;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2bc27029so28966405e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691240964; x=1691845764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lj8SHArn9fPxSbh11tbTkW90yD6QdWiRcXDApXQtycE=;
        b=KFQG5p29p4acMF0LiH+SW/qI4d2Rkvz0zfe9gqNdxKDbNoxBOLDogjmxXLYlbA3OB8
         N8jWwEjg5adE/hvpxqWL+Jy8QEAv64GFqSEVWzRZ/MevTFdwslNvHDDTNrrbEbPMtwjZ
         MV8/PRrIqwzOOf5rhVFvzd+Xsn3V8HmERIh+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691240964; x=1691845764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lj8SHArn9fPxSbh11tbTkW90yD6QdWiRcXDApXQtycE=;
        b=IiiuT1RSJglW5C2KZzSVuJu9KYJpnwr+NrSDGjJjYoHoSJQJ0xCrezmuYwhC1JnBz5
         VcLBIPedl3K5HwNWp/NOsATr13Qstyabp5c8aOHuPdN75dEE2a0DIl0nQ6tTxkFwtlRu
         /OR4qFingn1RiUIdAKvnPcGYKFhLTB6j77IlH3abX1oUqtwVMqB0RJK/jIIc1bvAJzSH
         tKO9DCL+WD8XInlQcXKK1Z40DzY9VWnoNQfdPg7hQ3+7LlfckSwrdFvGqxCddzhtXMq9
         fhawR7RUW7eTptlKbP6bizpWAreilxk1Cc+vk3TMnhqvKJ3+0IdlYa7nUayldGL0EDck
         rXiQ==
X-Gm-Message-State: AOJu0YzipLS56lU8DqCtQEdu8bIDfXt/bAd8JPh7f483kiVriwDM07L0
	vUJu0u99CnBYkJcjvn36GRJoMg==
X-Google-Smtp-Source: AGHT+IG1pWhMK2ivB9BFWXGj5T6LbB4O0P6xKFBGFM1przqM8E9m2ig+VgOPM/KZ8GSZjU7KjxXmIQ==
X-Received: by 2002:a5d:4487:0:b0:314:3997:530d with SMTP id j7-20020a5d4487000000b003143997530dmr2991274wrq.31.1691240963699;
        Sat, 05 Aug 2023 06:09:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1adf:6477:9da8:f35a? ([2001:8b0:aba:5f3c:1adf:6477:9da8:f35a])
        by smtp.gmail.com with ESMTPSA id y16-20020adff150000000b0031762e89f94sm5090333wro.117.2023.08.05.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 06:09:23 -0700 (PDT)
Message-ID: <2bdc76ae7b92c7fb000e1684d0b49a38f408e2ca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Date: Sat, 05 Aug 2023 14:09:22 +0100
In-Reply-To: <20230805110643.2708376-1-luca.boccassi@gmail.com>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 13:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185554

On Sat, 2023-08-05 at 12:06 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Support for unmerged-usr is deprecated upstream, taints the system and
> has been removed for v255 (next release).
> Enforce building merged-usr images when using systemd. This allows one
> release cycle where it can be tested for any remaining issue, and can
> still be overridden, before it stops working completely.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> Time to resurrect this. Support for unmerged-usr has been removed and
> will no longer be available starting with v255. Better to get started
> now with the enforcement, so that things can be worked out while it is
> still possible to override it.
>=20
>  meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
>  meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
>  meta/recipes-core/systemd/systemd.inc             | 5 +++++
>  meta/recipes-core/systemd/systemd_254.bb          | 2 +-
>  4 files changed, 8 insertions(+), 3 deletions(-)

Thanks for sending the patch. I did put this in for testing and because
it makes usrmerge required for the systemd-boot recipe, even sysvinit
based images fail builds with errors like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7580/step=
s/12/logs/stdio

Is usrmerge needed to systemd-boot as well?

Cheers,

Richard


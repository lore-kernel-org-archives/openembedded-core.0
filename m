Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AACC3DA45
	for <webhook@archiver.kernel.org>; Sat, 13 Jul 2024 06:44:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.7231.1720853049316475704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 23:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gpkkap8J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266edee10cso16748225e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 23:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720853048; x=1721457848; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8P9GnJi2kuHI9PXpDzBkejgsrdEogJEq+oYBXFXG1Q=;
        b=gpkkap8JINkT4gAD5QkvMCk2gftv+jEdsgFzu/6ATVBK23x8IlKvZTkKMHWljbQfkr
         vyEvRoKLS9fX1RpeP4CprYL5+Ly61LuHozwZUGmU/e6UGbZaSBG3pHojhaGJb3bSLhGS
         bzzRd6/WU8Q4R4D5XMfLlwj172nNUpC4Ioico=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720853048; x=1721457848;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8P9GnJi2kuHI9PXpDzBkejgsrdEogJEq+oYBXFXG1Q=;
        b=C6YnCKPIfy2cxZROTVkYuvVB+v0G72qq8gwAgSEsMcBsWmTuvia2l3qiwzoCE6RQTR
         AonDMacU8gITc2Gg+aa7pRoZpNr6ipLuEp7PAA11KIoYIZf37t5TinxBYd4V/fSABSL+
         +gL741WpbLraFkBTkcEUtR3qdnAk6T/JMLpdqTnFsAV/VJ+TYNnYRLhOS4pHi92+C6wy
         z9gruWZRSmFw/ylDAn2BKOPSDlVAO8XI0V0InGoJM7yo6wv0kpM2WKJPWcaDYKiDcdrA
         9kGi05S9hRBazsCN5UdQ9OzdNp0KJOkQG/4VxKziVAQ1m2nueNg0fZy9s+zeaBLqi0Tr
         GNag==
X-Forwarded-Encrypted: i=1; AJvYcCV+XfLgZMMa/FgcYGcj4fbhJNmI98OR9e9yQIfGyBxm1ikjxTiK6jWGznzixoVja4R7EpNkGR3BCd5p/AqOm+dfQtJ5TwF9HVMbdq4006vZCwZ3AAy1PES8
X-Gm-Message-State: AOJu0YwcK0F2WlzO4b0xgAi3pSsetXV5FsGWbFwUQ+a/YJlLFR/aHKAg
	Te2C/c5z4mZD/4dKJ6XOjKV/4UTDZnCSGWAN1G/KCEIGnoF76tOf2i0z2Nc+9JM=
X-Google-Smtp-Source: AGHT+IG+2LTvJ8fgsR/g2iuh5zySepW0GGcoWC1X4qFnx0F6Q6ER1XyT+L7ARr1LpgxmZifvKQNBcw==
X-Received: by 2002:a7b:c40e:0:b0:426:59f3:d976 with SMTP id 5b1f17b1804b1-426708fabdemr88773995e9.38.1720853047668;
        Fri, 12 Jul 2024 23:44:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9755:4166:da6e:b0d7? ([2001:8b0:aba:5f3c:9755:4166:da6e:b0d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2397f7sm44503225e9.9.2024.07.12.23.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 23:44:07 -0700 (PDT)
Message-ID: <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 13 Jul 2024 07:44:06 +0100
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <20240712160304.3514496-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201853

On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
lists.openembedded.org wrote:
> This patch series add support for SPDX 3.0 and sets it as the
> default.
> Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> the same time
>=20
> v2: Added tests and addressed feedback
> v3: Fixed several oe-selftest and build failures
> v4: Fixed silly typo mistake in staging.bbclass
> v5: Reworked to make SPDX 3 output reproducible by default. Variables
> =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are documented =
as such.
> v6: Many changes:
> =C2=A0 * Fixed bug where building baremetal images would break SPDX 2.2
> =C2=A0 * Most SPDX code is now in python library files instead of tasks
> =C2=A0 * Removed dependency on pacakge_write_* tasks=20
> =C2=A0 * Fixed sstate selftest cases to account for SPDX 3.0 task names

This had a lot of failures in testing I'm afraid:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7134

Cheers,

Richard


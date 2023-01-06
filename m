Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB5DC54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 17:36:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.118.1673026600676230935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 09:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ed6i8iy4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id z16so1934504wrw.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTscZbyRNTkuliepwdEOgFLmXELrSTEacBIapY63E0Q=;
        b=Ed6i8iy4xph6Mj97USBnaMlOBh29mqGBbwXkj/c3NT6LhrZ4R16cdNcMa0Tn4LIZia
         +8tqV7qh1gjwjOpgLuLivFAKAzaaNsuz3TE2qN4YEmmvHz21JKWAEQ9Pre+N/fcc19Gs
         cD+0kNkcWhaIS2yTVObcCt2dhgzSa1QiYrGfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTscZbyRNTkuliepwdEOgFLmXELrSTEacBIapY63E0Q=;
        b=HJPW6ZFcyyV09BqKLEJTyPv6ycqFyVTG+pS5C/fBmkUulADagB0jykanEPL7r0mFpW
         aaFvEk2xqTydcEAtV2L2oy5MqIAjYpWbQIuMQpyyQdSr0llZIkGSwLb1J569yMBcsRNc
         gq2LUjgMjg2cZ6yPYK/WaIkrXT6vn/3PH7q9g4ZDRihgkJWPuhsR1zn/nWKQLDgpCeBC
         KVOt3ytqk/3ya5ATiskcgHYdirefjJjGeoZ1Aro8ty/76nonoJzmKveYZY+KD8F1WMGw
         vAestelBLmOFWmNXY6fbaMkIOKt2nsKPFMLEeZ4SbGkifLyZiRUaukCmIfoMidl2DFPR
         niUA==
X-Gm-Message-State: AFqh2kqvQ+MSKZFDDHLGT0/Svbvh1jOF4vNx8+NK1JHbhorGxstoiGV4
	IQ9pnNOBu7IHsP85SkOTmODMyg==
X-Google-Smtp-Source: AMrXdXvqjyZMepUKsRTzEsC+h219m/Vvfk0SEeO+HbeJfuNr/jDLLp7ucvbd4GJy7T//XMB8yoeBfw==
X-Received: by 2002:adf:e19e:0:b0:297:811e:9a72 with SMTP id az30-20020adfe19e000000b00297811e9a72mr14493344wrb.54.1673026599116;
        Fri, 06 Jan 2023 09:36:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id t17-20020adff611000000b00236488f62d6sm1663816wrp.79.2023.01.06.09.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:36:38 -0800 (PST)
Message-ID: <e8a055695b925b5a09538c4695ea9b14b510c554.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta/classes-global: remove
 package_tar.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Jan 2023 17:36:38 +0000
In-Reply-To: <20230104152958.13559-1-michael.opdenacker@bootlin.com>
References: <20230104152958.13559-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 17:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175607

On Wed, 2023-01-04 at 16:29 +0100, Michael Opdenacker via
lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> Remove package_tar.bbclass, which is no longer in use in oe-core
> and meta-oe, and which the document reports as broken and unsupported.
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/classes-global/package_tar.bbclass | 77 -------------------------
>  1 file changed, 77 deletions(-)
>  delete mode 100644 meta/classes-global/package_tar.bbclass

We've kept this around as whilst it isn't useful to an enduser, it
could be the basis of an image class which doesn't use package
management which is something I've wondered about adding.

We should certainly be telling users not to use it but I'm not sure I
want to delete it.

Cheers,

Richad


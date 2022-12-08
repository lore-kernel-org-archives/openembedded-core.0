Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7800C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 10:10:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9894.1670494226942351100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 02:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hYw9CkJm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h7so1016940wrs.6
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 02:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FofsZDZF/KxEQUPODYdfoCPCXSBJca8ITB+HHk6vExI=;
        b=hYw9CkJmkrUGCMjRcXkV2C8+hDL4x+GBTPp73t0lmQ9TOw1XTQI248xNfepFLyZTz9
         rmv7K4eJv7QZR9pnLzCMRAl1Qrtk4eDEDULwsVZQl1pV/d0w2V+wxFlaXUeNaTtCMw9A
         /e7eE+I8XUP1HDCj/4GEqrk2T7bn8TBFvxowk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FofsZDZF/KxEQUPODYdfoCPCXSBJca8ITB+HHk6vExI=;
        b=Z2hdJCPVn2FV/OBdL65mxGRHe3CmDO10oQ/QTN0GkikrCsAluNOK0hk6nhyVPyHaQr
         1cXEEOFtVYEs1U0OU0oUWLnIKGeKRsWVilJdfokn7vCHw9caEaYW0lZev2p3YQGZ5dmC
         XuGyEsdIN608AjgUNMiCmfc3L7049p1And7YyWHodFxBfKuNLS3HRZEzGF8y8qcApQNK
         1IXql2hKXx/Oqpiyz+dAIuv1DrAzKxv1j6bIWeOLvbEgmA4pYAUwsWG79CMyNIxj0bFv
         2IF7uR1hF8GLmS01V+Hq/RnMEE3ENxXikMqdKR5EszdSgLcIEVbnpRvXuhBMs7CJ2Juu
         I4Ow==
X-Gm-Message-State: ANoB5pnTWwqIO6wPTF7VE0jXZNQgzkVk5oQ2DI/L+rPoXp91xc9jhGSq
	XXMMlZceHG47Fr/9rB5ptRp9nA==
X-Google-Smtp-Source: AA0mqf5Opz8UllxSfQVOjt1N1v5qolNi5zH2v1JXh3maKc4cv5ySO8E+DKzVzRyu7Y/dEbSJYutoAg==
X-Received: by 2002:a5d:6207:0:b0:241:eeab:6ff9 with SMTP id y7-20020a5d6207000000b00241eeab6ff9mr1111036wru.65.1670494225135;
        Thu, 08 Dec 2022 02:10:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91? ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d424d000000b002427bfd17b6sm7430210wrr.63.2022.12.08.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:10:24 -0800 (PST)
Message-ID: <029656ba7b1a8f22d017aa317abba98390ec1507.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ola x Nilsson
 <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 08 Dec 2022 10:10:22 +0000
In-Reply-To: <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
References: <20221208071136.1967696-1-olani@axis.com>
	 <20221208071136.1967696-4-olani@axis.com>
	 <CANNYZj_NFOejE6Xe2xHTTWkuMVY2TmPGpXTZYT=3+5V1Y2u3Xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 10:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174395

On Thu, 2022-12-08 at 11:00 +0100, Alexander Kanavin wrote:
> On Thu, 8 Dec 2022 at 08:11, Ola x Nilsson <olani@axis.com> wrote:
> > +# TODO: Only for 32-bit architectures?
> > +TARGET_CC_ARCH:append:arm =3D " ${GLIBC_64BIT_TIME_FLAGS}"
> > +TARGET_CC_ARCH:append:armeb =3D " ${GLIBC_64BIT_TIME_FLAGS}"
> > +TARGET_CC_ARCH:append:mips32el =3D " ${GLIBC_64BIT_TIME_FLAGS}"
>=20
> On the contrary, why not set this globally?

The 64 bit architectures don't need this and should "just work" so it
is probably better just to set this where needed. At the very least
that will keep the compiler command lines a bit cleaner.

Cheers,

Richard



Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8B8C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 16:02:08 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.74743.1698336125671157315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 09:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ab9WPTLU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40850b244beso8618545e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698336124; x=1698940924; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQoIhGnNvsTcTFvpnv1Fe6o1cx05CXF7D3m1UjoUoL0=;
        b=ab9WPTLU3WEnEJBTjHzjRrgHVdzkVxyHv8ifhjanYKQGL0jTSgZ+39THSQNVY4Xka0
         +0jfbS83DvPCXrlu0AfqvokSFrmhRnH5FoPpYt5j4jSSt75QJs+FmN5ULm848+Dhu+K7
         GEqh0bpl2FwvrMXxJVsWkedrIlOgx3tDEf10Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698336124; x=1698940924;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQoIhGnNvsTcTFvpnv1Fe6o1cx05CXF7D3m1UjoUoL0=;
        b=goHaMGiEWA79qmfT9+7iS2HTYJjFtJDzTM9hvbeGugRaJnYZgouhkrDFdL4C1zePj1
         QQNL1P2y2sXWuGaoM03Jlx++QvhsAdDubSMCj+NFvib7feNpF4DzzNLOAcmQgeVWNx1S
         NCbnnGDtvPTuVIhK6Zu5U2ov2i8wTW1BpnNjqR33f+Qe+MvEc2hJXo91vz6VH9072T08
         HVxMs3C+Sk21yXQU/9cs5f6O4jowv8E42qcKp6DjSUoxxEOXqVWsjSyJ0CM20lLH70im
         FXHJaZAdSHxxKiiLR4NRhkcVduMGkPXJ6qbdWEJQTgLPskoUBXamlsjWdjUrTGHP9ym3
         oogQ==
X-Gm-Message-State: AOJu0YzQS4uEA168zMEaONThPf5mkdiZRre+F6KtvK+40hMZrudiVT9l
	bDueuLSWPSp2TEtHxSb4XX8uaQ==
X-Google-Smtp-Source: AGHT+IFXjYPHLtkF6Btys/dl2jnlstrkQ5yhLmIXchZeHmZ1fLiA6VCmPYJd6NyX60FNJJXZ8i3izg==
X-Received: by 2002:a05:600c:259:b0:407:5a7d:45a8 with SMTP id 25-20020a05600c025900b004075a7d45a8mr161543wmj.31.1698336124052;
        Thu, 26 Oct 2023 09:02:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c348100b00402ff8d6086sm2890762wmq.18.2023.10.26.09.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 09:02:03 -0700 (PDT)
Message-ID: <37ea982f4ef7bf56b4dd8525726aed0a7df5a295.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] convert-overrides.py: remove "edgerouter"
 string
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2023 17:02:02 +0100
In-Reply-To: <20231026145825.1946337-1-michael.opdenacker@bootlin.com>
References: <20231026145825.1946337-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189733

On Thu, 2023-10-26 at 16:58 +0200, Michael Opdenacker via
lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> The "edgerouter" machine has been removed since
> https://git.yoctoproject.org/poky/commit/?id=3D0c64d0e4317e3749f7f7ed9ecd=
5d08bbb0cedc9e
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/contrib/convert-overrides.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

At this point it might be better to remove the script? That machine
could be present in anything from the era it belongs too which is why
it is left there...

Cheers,

Richard


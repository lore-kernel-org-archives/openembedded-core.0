Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385ECC433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 07:51:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.18426.1651996300297032399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 00:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIUMsDYS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so6693797wmz.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 00:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CyNhsCAdX84uLMjKEpQAY8WLF01qiuXu1t2SOeY6xVU=;
        b=FIUMsDYSqSGIfAnwi07gFynTCj+quItyGd6KaW31LHKWb3vV0i7+ouyJ+UBaLzIPus
         Fr5viHsk8Pe5wPd/qc/Me67vrwh/++Q7CTi/XgAV6Vx5FdVPJ6GbcDnO5bX24AhtWeBh
         4lqFQef1E+i/2ggEWrtFlOPHvXEfYMotXBvQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CyNhsCAdX84uLMjKEpQAY8WLF01qiuXu1t2SOeY6xVU=;
        b=cDze4aC/anAhBtglOfqjmdGNsrCMPIqqdWEgcEFG7pR4gi81PRUumXhJB9efFTMT/5
         kVzRHuwFBKdhMLTpRku8ffF110CRuHhta6c2z1Ul7g1QxW3FVxNkkZT7IY3X+M+LEYY9
         cgS5GaLuycr4OjfEPASBQMDXdDCba971yc6sDNsrD8F4foIvN4rIrYV1FBerKMvY01Aa
         Rq9Hht63YbSVF9QjXFwvcEd63OoN+w7mrc7ro3GtDw6yMm6zX6WWcGcttEWzyTtFangy
         CR0ZlnPwlezh3E10hZztVns9RJQFHEdyZvkR5HColaSQPIExmaNgCkCbwjyKWVj8NWXn
         R3ig==
X-Gm-Message-State: AOAM531UrrhH5pjfQkQbjvitsxQ55+Un0ZuyCoPdjPTovEDYjQ1Qd8vX
	NPzveeNNcZU8/RmJxXCDF+FDlQ==
X-Google-Smtp-Source: 
 ABdhPJwvVUyf+HQwsdjR6ITvhhg883OBFYH+QT+OdDijJGjhnRQFBCaRNr0S6AzlcZoW3sS5NULLJg==
X-Received: by 2002:a05:600c:4e8c:b0:394:8144:6836 with SMTP id
 f12-20020a05600c4e8c00b0039481446836mr6304352wmq.130.1651996298706;
        Sun, 08 May 2022 00:51:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7637:badc:40a6:4c9c?
 ([2001:8b0:aba:5f3c:7637:badc:40a6:4c9c])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4309000000b0020c5253d8f0sm8111722wrq.60.2022.05.08.00.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 00:51:38 -0700 (PDT)
Message-ID: 
 <096070335958e9858738de9e006d9bc22aa67260.camel@linuxfoundation.org>
Subject: Re: gcc12 testing results
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 08 May 2022 08:51:36 +0100
In-Reply-To: 
 <CAMKF1srx8pESdLFi6Dv1n4cfXLvvktXbdk_PjmccivxSLAL5Kg@mail.gmail.com>
References: 
	<0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
	 <CAMKF1srx8pESdLFi6Dv1n4cfXLvvktXbdk_PjmccivxSLAL5Kg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 07:51:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165366

On Fri, 2022-05-06 at 21:42 -0700, Khem Raj wrote:
> On Fri, May 6, 2022 at 8:14 AM <richard.purdie@linuxfoundation.org> wrote=
:
> >=20
> > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > 5.10 and edgerouter:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
> >=20
>=20
> why are we pinning edgerouter-alt to 5.10 ?

We have two kernels, 5.10 is tested in the -alt images, 5.15 in the
non-alt ones.

Cheers,

Richard


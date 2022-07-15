Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA02EC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 14:43:02 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.56.1657896178897730556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 07:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GhY5yVKP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d16so7001852wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=mIIimVc/qFTQ9iTyLyVo9Q0dPzARzFYBGa08dV25ew4=;
        b=GhY5yVKPAbyAylu5cK7e9N42VEn/8Nx51wH2hRXfbm4oxQMCVb4xOdn8H8K/9qv7w/
         PlrRV3aWFv9QBUYcpqWIcR9MDucGQY2zSDXra67A2+vhL+65zb8AY2TXJfMQ8iPeN/CE
         Z1IysWNC0ztj5Sb26bDEmr0fRdI08QSoFlB/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=mIIimVc/qFTQ9iTyLyVo9Q0dPzARzFYBGa08dV25ew4=;
        b=Vgm1jPY28LU1mEBMTnhFnmXEDySnvTynFyQqeKLcMhVaYGzulFZgrkb3nUGyaxeadL
         GiCTWVJsmJw3gaHo+1jEFL77r+7fN0Wo+HTvSCyKOKttJ2R3PfsCDA4ammZPOAh32g/J
         LK0QM9loLf4UBsyQX+SrvSqZPsz+ddJ0mEtiw3oB/uWpRFOr2RkJZzr0BlWXx4usCg2a
         y6UMH/cWw4scK4m7XmrHKpRqpe+dtxtqh4XWXP7G6a1zpfZBcvVYEf6BtzYbDBUmP7Oi
         VLDI58PEItNJd0FgaVtCHdKUCnCT7UV7Qc7i1cjVnigrXeiGiyBFfaqzhqOCsbOd3+gA
         VFhw==
X-Gm-Message-State: AJIora+jQkn6OSwjj/76MHCxaFpveJV9akawgmGb0jekMvpf8E14qCaJ
	N7oDf0Hr0HnkEe71YxmjOr0nwg==
X-Google-Smtp-Source: 
 AGRyM1sHgf4Bf9LioX4ZDgrWsVHBCwmRViBiiI2NZ3nXA0Mu8lii5YPMedAGHBZZaZORzh16pjpxxg==
X-Received: by 2002:adf:9cc7:0:b0:21d:642b:85f2 with SMTP id
 h7-20020adf9cc7000000b0021d642b85f2mr12907508wre.21.1657896177025;
        Fri, 15 Jul 2022 07:42:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef6a:f831:81f1:d696?
 ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 q5-20020a1c4305000000b003a2d6c623f3sm8987404wma.19.2022.07.15.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 07:42:55 -0700 (PDT)
Message-ID: 
 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 15 Jul 2022 15:42:55 +0100
In-Reply-To: <20220706182329.3085564-1-alex@linutronix.de>
References: <20220706182329.3085564-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 14:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168063

On Wed, 2022-07-06 at 20:23 +0200, Alexander Kanavin wrote:
> This allows:
>=20
> 1. Showing users where and how to define these settings correctly when se=
tting up
> a build from templates in poky (meta-poky/conf/site.conf.sample has comme=
nted
> out examples and was previously unused).
>=20
> 2. Distributing site-specific settings with template configurations in ot=
her layers,
> so there's no need to set them up separately.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

We'd always intended that site.conf was more something the user would
setup once for their environment and not need to change. It was
therefore deliberately left out of the auto-setup piece.

I hadn't remembered we have an sample version of it. I think a sample
is fine as an example of how a site might setup a shared downloads
directory or common proxy information but I don't think the layer
should be installing it, particularly if it can trample an existing
file which I think the patch could as it stands.

As such I don't think this patch is the right thing to do.

Cheers,

Richard


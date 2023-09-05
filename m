Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4288DCA1003
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 19:32:25 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.31745.1693942343286448112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 12:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ITn+IZtT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so27127975e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693942341; x=1694547141; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nqBQu0Rqpwbov4Lw7yhBtLZSQSCu6ehcQRWtXQj0dXY=;
        b=ITn+IZtTodoxu00HFeIHMgK03kFYJCjQrZfSd12b2E2Am4xV7/GOG6kELx0v1r/Gx/
         oxGRqJAM7PpKMrIF97MLAreoFXQtu9+sDZXFKjbzfCJTArhSPxK6LBgpiFtz8p4vMcwy
         0xFON7w9G2cmf+PvSSTNLW+7SoLKOGK4nhFqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693942341; x=1694547141;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqBQu0Rqpwbov4Lw7yhBtLZSQSCu6ehcQRWtXQj0dXY=;
        b=JHi/xKsf0ideaQCRqrsP24o7DBsPRhpZGDoPnXN/X8lXW1zGP1CWKEZLPeD1PrIn+1
         FDfv5x49AZP+5vqzbcS1N/+V2SbkmkAfde4qFyfOMKzJnovkkYW3NgIdiQvSRyCfL1jU
         5z55xPrckTw3j6NF6CDGquPB1ZMhiyxNJd12/DBaXNYyLT39hYX3SE0bsI6Hw2p26NXm
         Hd3X2nHYMljXhBZhait+wiCL42mqlm19H32/gXppkhuVH/bXiNAGq7CCJpXTgcwQRxqu
         HvtiAD7FwFlYKWuxL9JcDV0BBk+8/mS+uLt3DXTKu/tMTzyPk7sfSacVEk8HLemLIarE
         WrcA==
X-Gm-Message-State: AOJu0Yx4qCBhFOxNSYrt3fTuPzd/Xi9dunGx73qSPtJJkyj0pGkfxE7B
	IJxeolOSRX8aQDskPBbtBL7kneedhmi2iYf8ZRk=
X-Google-Smtp-Source: AGHT+IF9SfhFhG3oLNlCrbUbCx/IKAeH+RrBR3x/7+n/IeAMJqa3AkG3ZQmkfWawIYCYPbuYYlhyDg==
X-Received: by 2002:a05:600c:25cc:b0:3ff:cadd:329b with SMTP id 12-20020a05600c25cc00b003ffcadd329bmr556449wml.31.1693942341338;
        Tue, 05 Sep 2023 12:32:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f? ([2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003fefe70ec9csm20856309wmi.10.2023.09.05.12.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 12:32:20 -0700 (PDT)
Message-ID: <b9ac5c81f623c560f74e98294b4855bb8da9b534.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] Add DOCS-WIP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Tue, 05 Sep 2023 20:32:18 +0100
In-Reply-To: <1781038DDC42F2C1.32676@lists.openembedded.org>
References: <1781038DDC42F2C1.32676@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 19:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187252

On Sat, 2023-09-02 at 08:13 +0100, Richard Purdie via
lists.openembedded.org wrote:
> We've needed a way to queue/note/sync docs changes with our manuals, migr=
ation
> guides and release notes. Add a file which we can use to "stage" informat=
ion.
> We can then ask users submitting changes which need docs changes to add
> information here. This will then make it easier for the docs to be brough=
t
> into sync as we'll have a much better idea of when something merged and
> what changes are needed.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  DOCS-WIP | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 DOCS-WIP
>=20
> diff --git a/DOCS-WIP b/DOCS-WIP
> new file mode 100644
> index 00000000000..0e2baf9e0bf
> --- /dev/null
> +++ b/DOCS-WIP
> @@ -0,0 +1,4 @@
> +This file is intended to note docs changes that are being made by commit=
s so
> +that people working on the documentation know that changes are needed. T=
his
> +includes entries that would make sense for the migration guide or releas=
e notes.
> +

This has proven contentious. Whilst I think it would help our docs
maintenance, there are differing views:

* it should be a directory for conflict reasons
* we don't want a top level directory for this
* we don't want a directory called "WIP" as it looks bad
* we shouldn't have "partial" half way staging, either the docs are in
repo or they're not

I'm weary, I can't reconcile the views being expressed, some people
haven't clearly haven't read or understood the proposal reasoning and
its turning into a perfect bike shedding exercise.

Much as I think it would be the right direction, some people won't be
happy, the complaints are going to annoy me and I'm going to abandon
the patch.

Richard


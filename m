Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA1FC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:02:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.70717.1679572957755316893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hLIGZHU8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id y14so20175173wrq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679572956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CTFrg2vT1Y3Xo3i6zgegdm4aJha/UvxW85o8tDlrGjw=;
        b=hLIGZHU8FlSV1lPPETZEnhSZFUMZVZPtUIGloRHpQlxSTy3PLZjIBLVgYXtlu1jnl3
         qO73nchdhO1APuEdfRUtNio6PKe0tyMOqgNp17OmkF6OekFpnXkVzIG3Q8htbNhP8B3J
         mT217HnzX8rNQtPmt9ivmCWMoUIbYgSZnH5xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTFrg2vT1Y3Xo3i6zgegdm4aJha/UvxW85o8tDlrGjw=;
        b=Olm5xMoylj0y6mAugv9IuUaP1JUtbdh+YBfSmIPZDdcDKbOeLc9CIRH0XTlRpitW1J
         Gkj/tweBRheB3vHhIsZ4pmpqkVodjPzmaDghhDLvDDE70HO9/P2TyjLo8GsLaocXWGep
         rD6+IyOX75HmCccyOfnizOKv64o3UR/YdlMU1XtHzCAAc3WzqyJ+cg/Pdm7TE0505wTZ
         shxI6P5ciSfnzBz7uWRDyKSM61JMZ7+ab2tIBItek474VrWKdoZ91XZN+sN4zTskBlix
         1PwE2Y4gSfwb/nhj8Yq/3wHyes0iid5I8J9BxvRJtzDQGi8eMWgyvDjPCMRIW4sX9Ml3
         UinQ==
X-Gm-Message-State: AAQBX9d6BlrYckEsBvT7ZLJjXAN+uPlDU7hFEIrwGhGxJ3tlTmkqdHXX
	guyTQi6b7+jZdRnTUoPZqVq5Kg==
X-Google-Smtp-Source: AKy350brwsbvPNi5AUtS7h2flRFdRP1vs898q8LwEG7E83WESeAaDIrOtXJv0R3fAwqCJ7JEA8FAvQ==
X-Received: by 2002:a5d:4442:0:b0:2ce:a9b5:37d4 with SMTP id x2-20020a5d4442000000b002cea9b537d4mr1956410wrr.21.1679572956145;
        Thu, 23 Mar 2023 05:02:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c6:d95c:5baf:6f61? ([2001:8b0:aba:5f3c:f1c6:d95c:5baf:6f61])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b002d75909c76esm9121325wrt.73.2023.03.23.05.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:02:35 -0700 (PDT)
Message-ID: <f7d2ef262419b2328adccf0cac83ff42a975a4c8.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][langdale][kirkstone][PATCH]
 gcc-shared-source: ensure that S exists in do_deploy_source_date_epoch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Mar 2023 12:02:34 +0000
In-Reply-To: <AS1PR10MB569705403F56BA43CA730619FD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230323110146.243968-1-peter.marko@siemens.com>
	 <a8d4855315c091bde32979f928885320c1b5b3dd.camel@linuxfoundation.org>
	 <174F09F9DA2ECC9A.19937@lists.openembedded.org>
	 <AS1PR10MB569705403F56BA43CA730619FD879@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178981

On Thu, 2023-03-23 at 11:59 +0000, Marko, Peter wrote:
> Would this be more acceptable change?
>=20
> -       cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
> -       cp -p ${S}/../$sde_file ${SDE_FILE}
> +       cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
> +       cp -p $(dirname ${S})/$sde_file ${SDE_FILE}

Yes, that makes it clearer what was going on.

We did have a different bug in this area which I thought this was
perhaps related to but it does sound like a different issue.

Cheers,

Richard


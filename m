Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA38C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:14:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.24426.1683285238728011269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KZag4X9L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f18335a870so10795245e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683285237; x=1685877237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgKrRPnkBrXTVQICN4mAqHS2HSAlLAcA8mVsnunoOEg=;
        b=KZag4X9LU4Zz/B6Tij/pue9pBlyeRsLwylrR6wk7YlLh9a+9NXVmQ443UdMmFuHirH
         MaYswxbNrZRaTSz2B1PrSuytDpPQYyQKIPx/3vcYNO4gRy4zndfJDGP1jQ1DUWpVNvJj
         YfeXmbiPnIEloI61/a5MUM6pmOJG9ZM6BtArk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683285237; x=1685877237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lgKrRPnkBrXTVQICN4mAqHS2HSAlLAcA8mVsnunoOEg=;
        b=PKfPxHMoyCPIqyxzgh0ScX2kNW0wkpwa2CX5eSPQ5PwcH3RWGSZbqD/T/TXcctxkSz
         bToIjVTC4n3J7fMMYnNSnQJKWebwf70g5vjafwRNewLJA1vXF9AwMR3PmKGnvtYn7lZT
         fMwuaJiy+bR2licQ1yXkBvQQaw1U+i9nt6ovz/8lVdefkelmskYFAB6aZS25zX8oq/pK
         IyyjHzy4LcS+jZKGr8RHbM8mwjq39v3MdiZ7Ezyb3psBgqRxzgks7HUdTnlKNEHPhWrL
         sYWdslRhm1NkDO8y+U4/T2gwUILvAJoyFAUpgyh0lV2BRBhNaWBr1afaEbKCTOK5X1Gc
         SXWA==
X-Gm-Message-State: AC+VfDxEaVZMaBtptmvR+otf2bQ9/40B+TkVBBsRSH0gpAKM0vYALtAq
	BMUlndLikkKUNq77a9TF0jSBsaPctPuspxwmrpb9Tg==
X-Google-Smtp-Source: ACHHUZ4J18ddH7p0DHhboJkcyVa4b5LJvb7yIGWcWqXFC8sazBd2vjT18GJIjihOuk9q36koqOXxIA==
X-Received: by 2002:a05:600c:21cf:b0:3f1:987b:7a28 with SMTP id x15-20020a05600c21cf00b003f1987b7a28mr841662wmj.29.1683285237191;
        Fri, 05 May 2023 04:13:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id j37-20020a05600c1c2500b003f173be2ccfsm7794963wms.2.2023.05.05.04.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 04:13:56 -0700 (PDT)
Message-ID: <0bbf150c0005164134998c6c2e36d67a45f2084d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] image_types_wic.bbclass: remove MLPREFIX for
 binutils
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 05 May 2023 12:13:56 +0100
In-Reply-To: <20230505041725.3186569-1-Qi.Chen@windriver.com>
References: <20230505041725.3186569-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180910

On Thu, 2023-05-04 at 21:17 -0700, Chen Qi via lists.openembedded.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> With the following two commits, the MLPREFIX needs to be removed
> to avoid the 'nothing provides' error.
>=20
>   gcc/go: Drop crosssdk suffix from virtual provides to improve dependenc=
y handling
>   binutils: Drop crosssdk suffix from virtual provides to improve depende=
ncy handling
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Martin had sent this patch too and I've merged that one.

Cheers,

Ricahrd


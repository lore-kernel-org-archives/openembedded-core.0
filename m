Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF511C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:21:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.15549.1676906488302632542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AEedcCAC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id j2so1414845wrh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 07:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=opnw4M2b05gPeH9YWGeLCQdsESnhXBL4ZoYrOCxYRCU=;
        b=AEedcCACEnFu2eRW+qtVy/wpgvy8LHpJGFAzmPGWmiy9PwdBC8meI/R8jMtXszEZpm
         sK08MnZNQfOcIzSvf0ls8WlvuI1NQaM0iiMIjjxWIXDIOM7qxaOLaCu2GtpGt3cG3KdQ
         Dk4khARO8jLB77hpnFkX8zwnWrhjASDZE6dBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opnw4M2b05gPeH9YWGeLCQdsESnhXBL4ZoYrOCxYRCU=;
        b=a812m7AqeVyDYSL1nenvZFikCmXi8/kowSdl8/GqdXu4Dyhyc0nZGQO/5aW0yOEjAv
         d8gTJdwyAhDfL8yZdXFBwKHAnWMQWRgabDBrI0ve/r36Mpb0kEExHPwPs11Cgp0ftg6D
         sONQZmZ++FHIG3AHJWmQhYvA8tPODNq56oty9CZxOin6tzcs8Bii2gAJXVUYvk7EpqvR
         ThM6pyJI/UirMCmbz0/padC6ThqL670bzlAY1xU0Nqne7dE/yi/LXw7TqQZk2wk00xSJ
         c0fbRAq7QRoUQyi8IM5YgYliJUb/rKNoBUmpcO7WMBFCoOTosSJBl4b1GIX+mKnsyLBW
         gSkg==
X-Gm-Message-State: AO0yUKXPE4NeMueWhn0V7qqz1weKjnct6ldvFrx3hTgBNgtiPug1ULiW
	7WRd2ulJ9RZ/Tmd49CQTKUc6mg==
X-Google-Smtp-Source: AK7set+ZjkdEtRDmTFj5gem3IOA6XGOccOpuKLOc4u3+n2I1f43o7kKMYDd6UcwdbXrQqhiy798Lhg==
X-Received: by 2002:a05:6000:689:b0:2c5:a38f:ca31 with SMTP id bo9-20020a056000068900b002c5a38fca31mr122233wrb.7.1676906486555;
        Mon, 20 Feb 2023 07:21:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6c6b:45a8:4f0f:7fab? ([2001:8b0:aba:5f3c:6c6b:45a8:4f0f:7fab])
        by smtp.gmail.com with ESMTPSA id c11-20020adffb0b000000b002c5503a8d21sm6466726wrr.70.2023.02.20.07.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:21:26 -0800 (PST)
Message-ID: <dbc204e0b3570c78e6618cdb5c4bdfbace18e45a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/39] insane.bbclass: make patch-fuzz a
 warning again
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 20 Feb 2023 15:21:25 +0000
In-Reply-To: <20230219193101.338397-5-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
	 <20230219193101.338397-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 15:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177429

On Sun, 2023-02-19 at 20:30 +0100, Alexander Kanavin wrote:
> Having it as an error breaks the devtool workflow
> ('devtool modify' in particular) that is meant for fixing
> the fuzz.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Should we tweak devtool to disable this check rather than disabling
globally? I'd really prefer we stopped the fuzz issues...

Cheers,

Richard


Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD43C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 22:16:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.518.1662675369155435204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 15:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gYRFA7ER;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id h1so11788750wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=aKatpJ81ldwZl3RqAnk9pdy9KUfAc/AZA3iOC4Fjsv0=;
        b=gYRFA7ER0XA2cMUCjjyPHIkfXLuGBE8p8zx0ti17uyCwlG6qZKWt+FORGxddM1SYZT
         4iliyrrk2fFq16mess3x5oX+X5q6M+LNBf8msuqICbjxXFBSN8GTb2NBghgB1yV2fEGr
         QerDu9s2JCJHrfy73Sg9iBQxa0OV07wMYR5FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=aKatpJ81ldwZl3RqAnk9pdy9KUfAc/AZA3iOC4Fjsv0=;
        b=z/rf53k3FRMs7+iFqEiFXehMLPZA1tSeo40TJnqltwl3sxVpwoTnj0gLcKiE6nWrj3
         eW1NC2WndbwBlVTMVmbpn3xNriRUG4/xp9V7xMGLc6dd5+ZK/WOWHobkIZUSV/yl6Gma
         olROp/M5/gllt9cnIhViPesBEoi+BlUfaBpTse4DqnVnKcxUmhMQw77oWps2CXAeUrJU
         DtjHjgcR/mb/G51Q2B9ETDMeqqu9xvxlj78DdYLl5PhKGbD5hQU2xC+mBU6bjMAkgvFF
         ivlZcjmuaBE1TwLyTqkXLxLFqiN3JQYNdSgx4Umi4oHH2Q+vW2ckCa8nGWcnxtbOAz9D
         Au6g==
X-Gm-Message-State: ACgBeo1XYF2wZDtSs1m26V6VI56Vq8S0UA6k+bA6Sos546h5EJUGBkQZ
	tzPg5mVPDV3cPDtJbHtL/JihfQ==
X-Google-Smtp-Source: 
 AA6agR71rESWnOBEcyMLCd/PZTYwr58QaTidNmUqDxuaP+YESwgoUKo/DiMgQuLmde44/yRjGE2Tog==
X-Received: by 2002:a05:600c:4f89:b0:3a8:3e65:bfc9 with SMTP id
 n9-20020a05600c4f8900b003a83e65bfc9mr3438399wmq.17.1662675367537;
        Thu, 08 Sep 2022 15:16:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 n18-20020a5d67d2000000b0022584c82c80sm299377wrw.19.2022.09.08.15.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:16:06 -0700 (PDT)
Message-ID: 
 <0e3f678c925022884e9d74e352c81d51135e1ba6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-hello-world: move to meta-skeleton
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Sep 2022 23:16:00 +0100
In-Reply-To: <20220908163327.339038-1-otavio@ossystems.com.br>
References: <20220908163327.339038-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 22:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170475

On Thu, 2022-09-08 at 13:33 -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
>  .../hello-rust}/rust-hello-world/0001-enable-LTO.patch            | 0
>  .../recipes-skeleton/hello-rust}/rust-hello-world_git.bb          | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta/recipes-example/rust-hello-world =3D> meta-skeleton/recipes=
-skeleton/hello-rust}/rust-hello-world/0001-enable-LTO.patch (100%)
>  rename {meta/recipes-example/rust-hello-world =3D> meta-skeleton/recipes=
-skeleton/hello-rust}/rust-hello-world_git.bb (100%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/5859/step=
s/15/logs/stdio

i.e. there are dependencies in other layers.

Cheers,

Richard





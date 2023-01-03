Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F764C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 12:40:11 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.62258.1672749609406743996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 04:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ROfXUJcX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id bs20so27188719wrb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 04:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yCOPpZGI7rwmhFzwxR6EwWQjMXJqPdXZBIojgg0Ju2c=;
        b=ROfXUJcXeogIHoc1Yc2yAmbGfCUcJ/I2hC5MlVGQMAHZ/XOU2mMHFvmnxeYAelXVsT
         Lpv0aJhEN3x3EAU+4L0nua10+VyNdZAGDS6y3M7Da4vRlVuccAud1r62Wfs/gjOyzLgn
         794ck5PLHZkHYkV5xsQkAlcyCg/A61+RCfGbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCOPpZGI7rwmhFzwxR6EwWQjMXJqPdXZBIojgg0Ju2c=;
        b=asvJSjWVgSkDV7FZoKY9EPHMjYTQID+sLrZd0kaOr+tScHq8OOB/5KFROw8O0rvOJn
         Ht6EfA4LxAMpWfxI8Rppoy4X0FllBKUwRPs0Img1QZgSA4UTxvH+6EVCcdvyOQkQ+uXQ
         TD+AYui9pN4RuplvNycwZZUbhhAJtOSemo0anrzTpa8O8oIpg2CHy8W+KqNhSdHEzhuD
         zxM9Cz07A8yA66oYBMiOcrzwCesMh8+h2oSUc0cultjAInv8NsLxZImkcPS4bWigIyey
         9xS9SAmP6NJRd2tYbYeS6fSaBHAHvg10KFXrzmA+rWc4i18z/n8XDs5QVluAcZdhKZg6
         cT5w==
X-Gm-Message-State: AFqh2koacOAo7Aht6ent3EyUtLAfKOqAifb6uRTuHIySmUfJV3rafRof
	EW2Keu5x/hAEJustLi7WU1Jk1q/qrzGvwe8C
X-Google-Smtp-Source: AMrXdXvhTp25dOz1EAVnGr6Q2bfxXTAos2qIjS4nYYc0lcneS6GsqpVfsPSOdQQSNmaKEceYELlytw==
X-Received: by 2002:adf:dfc3:0:b0:294:c208:c921 with SMTP id q3-20020adfdfc3000000b00294c208c921mr6161403wrn.42.1672749607708;
        Tue, 03 Jan 2023 04:40:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d934:7269:d594:9ac2? ([2001:8b0:aba:5f3c:d934:7269:d594:9ac2])
        by smtp.gmail.com with ESMTPSA id h9-20020adffd49000000b00242209dd1ffsm31103726wrs.41.2023.01.03.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 04:40:07 -0800 (PST)
Message-ID: <52dceb5d7867a60a1da6c6f5879f4d949c9be483.camel@linuxfoundation.org>
Subject: Re: [OE-Core][master][langdale][kirkstone][dunfell][PATCH]
 glibc-version.inc: Use https protocol for fetch task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Date: Tue, 03 Jan 2023 12:40:06 +0000
In-Reply-To: <20230103123419.32240-1-ranjitsinhrathod1991@gmail.com>
References: <20230103123419.32240-1-ranjitsinhrathod1991@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175344

On Tue, 2023-01-03 at 18:04 +0530, Ranjitsinh Rathod wrote:
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>=20
> Use https protocol instead of git as sometimes in proxy network git
> protocol uses whole timeout and finally gives fatal error and then uses
> mirror.
>=20
> Error:
> LANG=3DC git -c core.fsyncobjectfiles=3D0 fetch -f --progress "git://sour=
ceware.org/git/glibc.git" refs/*:refs/*' in /home/builder/bs-workspace/yoct=
o-downloads/git2/sourceware.org.git.glibc.git
> fatal: unable to look up sourceware.org (port 9418) (Name or service not =
known)
>=20
> So to avoid this delay during fetch task, we switch to use https
> protocol instead of git
>=20
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

That looks like a DNS error so whether it uses git or https, it won't
matter if the name resolution is failing.

I think you'll need to fix your network, or if the issue is with the
sourceware.org name servers, ask them to get that fixed. Changing
protocol won't help.

Cheers,

Richard


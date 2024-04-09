Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F53C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 16:12:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.140806.1712679139195494717
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 09:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iTogUzxw;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2ae3a3f66so11222095ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712679138; x=1713283938; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URyXsXC3lWhXMM5kIQ1NpDUn3Qh4s5YQTXmXc05FHao=;
        b=iTogUzxwnj+oKy9AiU0Q27k4TklXHPo2FdjZ2dcdRHf9+OrppPayXRwkDf+h22+iR+
         oURzNQ5iBy2YDOOlxSQNe9rq6ypRH4Y9wTCeAyAijtbsrvbak12mPmlPZsWTKX7VGtZA
         vpL96xYfyAYeLNlMgyJjOgpiZJBCZFx41KNMNR/XbSoPxQppbeLJ8BzcuvkNgR+D1ZxT
         FcgBYPQLhpt5upy3uQ6WZeCKPAH6c1DA5YcMb5TzWvL2WJYF0lYXFRZasc/kW2gnsln0
         rVgRiAMqR38XWPdkYtIb8XRKfKbbp0lvsX2ssaw52US+YhvsB8PFtGeobgVo+790SzgT
         3goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712679138; x=1713283938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URyXsXC3lWhXMM5kIQ1NpDUn3Qh4s5YQTXmXc05FHao=;
        b=Mie89VIADADeeCu2cuWWhvXdJF77KCIqZZ46g0LNNAmvh3DjbTR+Om8wLSb6RRSRoV
         ba51+haQkN0EUBePLGCeLUOef6WZxOFFUepqjxKQeSgM/nUAqCGqPQ/QdT2b1in+PMMM
         ttbjw6E412kaxiiN31XVY5TigCXI7WsClwefk1W4BAWEec0joS5v6rs12PXVN++DkQqh
         D+1Us7mzTjxgg10ehXK7keR9t48goOsDwF8b9wN2r6Kfn+h3OOGlsxDYzx9TNEuh9k7u
         /OnfcinVGMn0zlStrLH2uPvY21y+VhjzjBtssoICfeyI1wmjebNCu4hIEEmKhWTtshRY
         xeKg==
X-Gm-Message-State: AOJu0YxXXOqCOe9G5dL0b1SbBsCIslrdepcThQ+LU2MjTZ7rnvsZNs47
	sozKk2CZnsaE9N4b6vx8boL9hbYovV10Whv74x8ofq5Z0MOW+234BGM+lGPkwX4J5fNpXsKEb6v
	QGWBSJajrCJ3eHb8EXCqeap4JQSU=
X-Google-Smtp-Source: AGHT+IHYKSwufLdl2S5iGzrLZNa3xJGxMkMR7edlBki1u/KBt6eTseOeekrFdjCk+yDFqHX/snTM+xgJHGcDswVEvE0=
X-Received: by 2002:a17:90a:eb14:b0:2a2:afca:c635 with SMTP id
 j20-20020a17090aeb1400b002a2afcac635mr128925pjz.0.1712679138472; Tue, 09 Apr
 2024 09:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240409151205.3333978-1-tim.orling@konsulko.com>
In-Reply-To: <20240409151205.3333978-1-tim.orling@konsulko.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Apr 2024 13:12:06 -0300
Message-ID: <CAOMZO5CBtwDu5MWbkFZx=op90vpCpr3M+iuRoAJ938i3CbKrqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: update to final v2024.04 release
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198069

On Tue, Apr 9, 2024 at 12:12=E2=80=AFPM Tim Orling <tim.orling@konsulko.com=
> wrote:
>
> Release announcement:
> https://lists.denx.de/pipermail/u-boot/2024-April/549827.html

I submitted the U-Boot 2024.01 update last week:
https://lore.kernel.org/openembedded-core/20240402120223.152044-1-festevam@=
gmail.com/


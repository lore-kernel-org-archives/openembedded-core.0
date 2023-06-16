Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CBBEB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 16:51:59 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.3809.1686934317438507854
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 09:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LmOtHhIp;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-55b171c1e16so654582eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686934316; x=1689526316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc+TW+/gwcYeEW21oc8eWyx12TvPIslrYkPdvKJpRBU=;
        b=LmOtHhIpNEKVqcAMi06mORxHBaNV1YxzKsT7RwQ4kqu3PcAyT7Tt/ixXpiuPhGZ9rs
         IJptvXOGlLet3Ckd+T+0MNuxKwNs07PqnplHqCAH0hO1zDDwdPDdpnwwgONV97C2sLC7
         NmeHZ/cyK3JM/e5EvG//66o/5HDzaFn5t/e8w0EEnl2AHwM3Tz++0+0X0bkiFwP8Oc1Z
         2iJUh/hlQv+E5xvIIsduyjDbur0eLkO0XXi3JEH4wt5mYpcQmMXagnyH4uJPvP63SKIW
         lyWlkf8Jq92leS9S5o7HiNSeRQMEo6GeUMcwWeZB3l1d3njBIK1jVVs68cnqZJl9S9RB
         nsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934316; x=1689526316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pc+TW+/gwcYeEW21oc8eWyx12TvPIslrYkPdvKJpRBU=;
        b=XA3paDiDuHZzigbXYRjUggyU4PSYs5xqiD4m0GGltVI+xY/FPWAtWBN3hxtg2h3cfT
         fTP9sqp0OiVHk1lbiyN6X7SEwO97gwuy96NGxugPOGk7ZtnpuTK73wtj7P6Adm840EyK
         YRvqitj7SP68XIsSVyIJUvjefo+JS+WU8wvP71CIBCvCgUiEEpq1VkM/Rt7+g+fqEeOi
         W0C9cnny6ItSsxZd3LjHn3qhYhkOFn6mNc0lF19dxqlZdklgQkmE0CUzuR5PDh8SBrK7
         1TEkCtQJZ4WxDuxxGMAf3ew71adZQtz1OpwVeOr64S4LZD8cvmRjFoHLOp5UfZ0++Mux
         uLDQ==
X-Gm-Message-State: AC+VfDxahL3qK3DPNlmsTSbIwYWz7+4cpIt5AaEFlApVV339NgXDnD8c
	FGoTjfhfNz963RwRBhoPjphH/ZS65HzKSauiPG0=
X-Google-Smtp-Source: ACHHUZ4LpOuaoreJzVzqn1etBMZu2LbF6/TgxuYQOV790CJN/kAWRw+YwmLrGiIRGCdyWf5YslhERs73wUsgOY2/q6k=
X-Received: by 2002:a4a:e1d3:0:b0:558:b386:7a78 with SMTP id
 n19-20020a4ae1d3000000b00558b3867a78mr2631710oot.5.1686934316333; Fri, 16 Jun
 2023 09:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-49-alex@linutronix.de>
In-Reply-To: <20230614092918.4065570-49-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jun 2023 09:51:30 -0700
Message-ID: <CAMKF1so8rzeZMrg+dOjD+qSppadPLtJqP3FH7ddMBVuZZiGF=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 49/55] vala: upgrade 0.56.6 -> 0.56.8
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 16:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183051

This is in master now but it breaks geary

https://snips.sh/f/32iLt9_dQn

On Wed, Jun 14, 2023 at 2:30=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/vala/vala_0.56.6.bb | 3 ---
>  meta/recipes-devtools/vala/vala_0.56.8.bb | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  delete mode 100644 meta/recipes-devtools/vala/vala_0.56.6.bb
>  create mode 100644 meta/recipes-devtools/vala/vala_0.56.8.bb
>
> diff --git a/meta/recipes-devtools/vala/vala_0.56.6.bb b/meta/recipes-dev=
tools/vala/vala_0.56.6.bb
> deleted file mode 100644
> index bc5f5477d73..00000000000
> --- a/meta/recipes-devtools/vala/vala_0.56.6.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI[sha256sum] =3D "050e841cbfe2b8e7d0fb350c9506bd7557be1cd86a90c896=
765f1a09a1870013"
> diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-dev=
tools/vala/vala_0.56.8.bb
> new file mode 100644
> index 00000000000..f55fb41ad39
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.56.8.bb
> @@ -0,0 +1,3 @@
> +require ${BPN}.inc
> +
> +SRC_URI[sha256sum] =3D "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380=
af118e295d904bde"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182794): https://lists.openembedded.org/g/openembedde=
d-core/message/182794
> Mute This Topic: https://lists.openembedded.org/mt/99524186/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFF7D3A66A
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 14:57:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.21832.1730213852709495357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 07:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCp7wrE1;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539eb97f26aso5757421e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730213851; x=1730818651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcYQ2K1JFJMjzv4cH6/oxkC4DuNgDnw95rz7g2K8uD0=;
        b=BCp7wrE12uFaYD49d4gt0URG478taMbBbIv5iYx1xpBjRKHblTu8wEygc+8QiqmRms
         jO9VVL0iW6cefVrXfZ+G03Eo2Wwl+GYyf4RGq3orSDNcJOvG5AX2dgyEtN+ZK9CueLFo
         /QZ7tCqEN8EJlv+KUMg+oxbT7WUXpk1t84QQpXjx5xL3D648uehk6bw710+UaKDcSpRP
         5n053882ig2nKGyd+tqDgm3u3lT2SWQ7xDMaQlK6tYDpcw2HoXVxIq/zLfG0bS0PyM1c
         fZEXKLSrX+CYSeqNF1Jfm/jgeeIDLawUNjyjyaxAfE1QlU29WhcxQ4ObNE6IZ3Z/Z2BR
         Tjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730213851; x=1730818651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcYQ2K1JFJMjzv4cH6/oxkC4DuNgDnw95rz7g2K8uD0=;
        b=sUZrCN41Kb72m9Vpp818+7slum7j2qst71Dy7zaGkOOkk/5suVLif1MJryi6JaK6j8
         e4KLLyWer6ePTnuhlgHC6LiQ6ME+YO/DHOTpciVMYNze6bKsGA+Hp38joXc1eSsJe+OG
         si7dT75FPgLelsfKnKAhdLo+g3wFQ6TKTGB1TKdLIMjsqxXAg8m+uUsVq5VhVQgv8ZyN
         4EPnjn4utDhoauJKxr4JX7oaj0X5wzXlaQ8ndLq0IP6H4+VbpTX9XSzakdjEGGGF7t20
         b7YN/f0tysOQPulYlW2tgSmePyTRki87Qm94xFA/d6bcqIQNB8EoodVIWjg/qyUBsQmG
         fmig==
X-Gm-Message-State: AOJu0YylHuTsiW0mQuSn3wmrTBaoXR38hwSnesmXITWs37mxdguK4QjV
	8XzXdcVWZGzjbXoO3VHs8f9ToycSovoLayZIJRAXgA7xBrvRlt4YeOAXXzQecjQurU+EK/f6qdy
	5O5Bh4lzHwLMwDI6fa4rDxcteNWudbg==
X-Google-Smtp-Source: AGHT+IEPU8S6fcfrVRTwoilITrNihm4QJueOC4JUvGayL66PglurpJB2wyZsgziLGta7j98R9LRbQIORhN4MP7+3N8s=
X-Received: by 2002:a05:6512:6ca:b0:539:f5b3:f87c with SMTP id
 2adb3069b0e04-53b3491cc62mr5531595e87.46.1730213850613; Tue, 29 Oct 2024
 07:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241029091723.2851061-1-hongxu.jia@windriver.com> <20241029091723.2851061-3-hongxu.jia@windriver.com>
In-Reply-To: <20241029091723.2851061-3-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Oct 2024 08:57:18 -0600
Message-ID: <CAJdd5GYEazjH2tvxU7MsTg0tVKfTY90h=RWjyuwjM_o-JA8X9w@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/7] meta/lib/oe/sbom30.py: correct typo
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 14:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206504

LGTM, thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Oct 29, 2024 at 3:17=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> The isinstance expected 2 arguments
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/sbom30.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index 8db90f30fd..e3a9428668 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -631,7 +631,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
>          sha256_hash =3D bb.utils.sha256_file(path)
>
>          for f in self.by_sha256_hash.get(sha256_hash, []):
> -            if not isinstance(oe.spdx30.software_File):
> +            if not isinstance(f, oe.spdx30.software_File):
>                  continue
>
>              if purposes:
> --
> 2.25.1
>


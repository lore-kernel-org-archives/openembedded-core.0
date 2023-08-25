Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C161EC3DA66
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 06:41:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7966.1692945695378529030
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 23:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f62VyfKC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31771bb4869so454238f8f.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 23:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692945694; x=1693550494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0h4iQaGhu7JE6+6cEP6fId8DSi1J3KES6jujwS4CcXI=;
        b=f62VyfKCSjZMkbZb2AjoiPQzs/zxZwj+sQTE7tOUETR2VG3gd9VkjKz9VBBGudOBgB
         V5HJ+lryV84Pcn/gI6lbONXKLyOe6wD089OzfqKzep/A14Mj/N4IIMc1H3vF/sh375VY
         Fym8m4ZRvgJqwxf2FlXe6LYbOkOfM11CUSRUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692945694; x=1693550494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0h4iQaGhu7JE6+6cEP6fId8DSi1J3KES6jujwS4CcXI=;
        b=Q/fsJ7zZnX71XktvVyDp7l7tzSQ1QlOx+3dVp0QRIN4xW5pDVHoDC2hvvsLgeM4T2A
         ZZohv797cM+wOuJzTOa+ZESuXQfUQdfloyyGL6EtVi3rcrLn1pNxGqykYEmVlzyxyW/p
         GQsnbJ/eefLwVjvMMh+nc5HfB3aBjpWKDRxa7RmwMKrgWMosW1qKHMl0oTSCUUNYoib7
         S+8kAWIyAtPGs1NO268fQ5ioCiiozpIsTdrjKC2OTil/RAkkReuoS16YUrt/a2AXUXtf
         PehmoIcWyUy0rbhqrmjSpWu++SJPiOxqQhDdOueGM7Tzk0e7me0VhDQyGgBfpjgm+nRW
         z1sg==
X-Gm-Message-State: AOJu0YxuBzMdLKPUMw5hVuUB6NozNYEnh0//xJG5cZJLLtb+w7uIc6Ba
	Giqnp0Tp+/eSBIj85y9TTLARCWIX6+61q3SKK4g=
X-Google-Smtp-Source: AGHT+IFab75HePt+bHDfG15qiE2NZNaYl2sPiyozFvDFNWh2jK6iKbCSKiiC2xoDZne/VQ8M/6AGkw==
X-Received: by 2002:a5d:4c4b:0:b0:313:ecd3:7167 with SMTP id n11-20020a5d4c4b000000b00313ecd37167mr12799300wrt.42.1692945693737;
        Thu, 24 Aug 2023 23:41:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f51:6592:7dd5:4623? ([2001:8b0:aba:5f3c:5f51:6592:7dd5:4623])
        by smtp.gmail.com with ESMTPSA id r6-20020adff106000000b003197c2316ecsm1236183wro.112.2023.08.24.23.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 23:41:33 -0700 (PDT)
Message-ID: <fa3898c0dffcc1b3d7a1387bd151493a27726143.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] oeqa/utils/gitarchive: replace warning with
 info when reading local tags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 25 Aug 2023 07:41:32 +0100
In-Reply-To: <20230824091810.1795629-1-alexis.lothore@bootlin.com>
References: <20230824091810.1795629-1-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 06:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186692

On Thu, 2023-08-24 at 11:18 +0200, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Whenever a script needs to list tags, if it falls back to the third metho=
d
> (reading local tags only), it emits a warning. While this warning is usef=
ul
> for future diagnostic if some tagging issues re-appear, it makes buildper=
f
> autobuilds status as "Passed with warnings", which is not desirable
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> See [1]: buildperf build has completed without any major issue, but is
> still flaggued as "Passed with warnings" because of the log.warning in
> gitarchive
>=20
> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/133/builds/21=
35
> ---
>  meta/lib/oeqa/utils/gitarchive.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gita=
rchive.py
> index ac36ecb3a9ca..64448f47d94e 100644
> --- a/meta/lib/oeqa/utils/gitarchive.py
> +++ b/meta/lib/oeqa/utils/gitarchive.py
> @@ -128,7 +128,7 @@ def get_tags(repo, log, pattern=3DNone, url=3DNone):
>              tags_refs =3D repo.run_cmd(cmd)
>              tags =3D ["".join(d.split()[1].split('/', 2)[2:]) for d in t=
ags_refs.splitlines()]
>          else:
> -            log.warning("Read local tags only, some remote tags may be m=
issed")
> +            log.info("Read local tags only, some remote tags may be miss=
ed")
>              cmd =3D ["tag"]
>              if pattern:
>                  cmd +=3D ["-l", pattern]

Thanks for getting to the bottom of this! I merged them directly so we
could see the effect on the buildperf worker and you looked at the
results before I managed to report back which was helpful! :)

Cheers,

Richard



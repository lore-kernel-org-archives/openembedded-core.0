Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34810C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 10:10:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.4170.1640081435410437537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 02:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TL3JuH0/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id a9so25785862wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 02:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=n4S2mH8CC3uA8EKc2BsNMc/+IaNuMKNJIheCaycnU+0=;
        b=TL3JuH0/hELCDnkZ+IfIY+aowKl9VOA67I7TKiJ8PPxVFpavbkBzF+ek4g6yVVzhaO
         aD224vWSyFQpjrYOf4NPk8McvfuUYn8lxsYt9PwcJnJX6nmNRc1YOx8xwcKYSJApR7QM
         YbFQF8ZGj3VNPG9Syo1+LeARiboQCCIs1ouqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=n4S2mH8CC3uA8EKc2BsNMc/+IaNuMKNJIheCaycnU+0=;
        b=ztzQAWiz/T6mY0KkgB+SGecnO92YJ14bGaYA7fNovibGMZO/cXVk5S4BZYQwGUFazo
         OebOasfUoM1ZYBEN+gZwZLpMzQ0xltzXYE3ScHsB/8d4Y85RmmV+RpEKPZsKQWFmKIPO
         LatzETeBtWdRMYO4MMPZ6MPN4ofQr/vhdkJP0e1Ve3x0hg3IYQnzxn5q4alZsazimqhy
         wEty2C66SaJd60Ho1k+YtnFc/0VZIx1UxFi+HKwfAU01HFvh+mkOqfqaIascVWmeXF/f
         Lhq9m9fc05gU2pgUux3cD726fr9RGMkPpubHE+gpLEIkdOx5yEucxN3WhaH9116196VD
         Lidg==
X-Gm-Message-State: AOAM530ObrCaBSwcmTSnkGNZwxQ3J+Rey/NszE8W9pdGbgmFUzTq6T3t
	deexBzuYcjh5lgaPLJl1mKT1Vg==
X-Google-Smtp-Source: 
 ABdhPJwyDy2gJ+5euEj08EUkkN7rY0tqB37UsUQd1BF+aeU9qwumyIOc2QXo2z5KCYz/5rcKnEhqdw==
X-Received: by 2002:adf:d1c1:: with SMTP id b1mr1104851wrd.491.1640081433762;
        Tue, 21 Dec 2021 02:10:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b341:7ebc:5ebb:45fa?
 ([2001:8b0:aba:5f3c:b341:7ebc:5ebb:45fa])
        by smtp.gmail.com with ESMTPSA id
 w17sm2086154wmc.14.2021.12.21.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 02:10:33 -0800 (PST)
Message-ID: 
 <c481f5aa97ace18b76976698fca3b7d1b36595f5.camel@linuxfoundation.org>
Subject: Re: [PATCH] Binutils: CVE-2021-42574
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Date: Tue, 21 Dec 2021 10:10:32 +0000
In-Reply-To: <20211220095009.120251-1-pgowda.cve@gmail.com>
References: <20211220095009.120251-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 10:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159909

On Mon, 2021-12-20 at 01:50 -0800, pgowda wrote:
> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b3aa80b45c4f46029efeb204bb9f2d2c4278a0e5]
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  .../binutils/binutils-2.37.inc                |    1 +
>  .../binutils/0001-CVE-2021-42574.patch        | 1998 +++++++++++++++++
>  2 files changed, 1999 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/recipes-devtools/binutils/binutils-2.37.inc
> index fca4a80ad2..043f7f8235 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.37.inc
> @@ -33,5 +33,6 @@ SRC_URI = "\
>       file://0016-Check-for-clang-before-checking-gcc-version.patch \
>       file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch \
>       file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
> +     file://0001-CVE-2021-42574.patch \
>  "
>  S  = "${WORKDIR}/git"

This fails to compile on mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4502/steps/12/logs/stdio

I suspect we also need:

https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=795588aec4f894206863c938bd6d716895886009

Cheers,

Richard





Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06ADC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 07:39:08 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web12.31379.1644824347334533690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 23:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPe0qJ4F;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id 60so7703248uae.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 23:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LclCeU1+KxTboxlrO8Y4VEfODxHj93c2v97z074TJsQ=;
        b=QPe0qJ4FRaf8u2BmvPCa1C/wXdmsGDPLprl7Vw77yn0ZU1mXOf36IsrwXnmyZwyB90
         llffTU3NKhltR9MiWHtYu9asPyL2hvBIqbOi3iXP4w8al7JbNcAmtWZ+CEmoT+WtxKL0
         wbp4bbRjKZ1SaUM7NPkzG+OCmhYxLBxyZM8XL5IDixolGL7S3okigNyqbioL8zXgehaW
         K+a2mlTsBoSpgV0xmQ4Kqyhti7WeKPnOjno5Z7sXScmxdgPGCNGjrvUXAIFn66YWcMX2
         OKOdJJhHuYzB9OBPy8/EsuGurfMbpzQ1aEoS30VBs+dLkvNatOXT1gk/o85rXafJ0J2J
         EqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LclCeU1+KxTboxlrO8Y4VEfODxHj93c2v97z074TJsQ=;
        b=K9wpy+nIBGi1NU089Ikl1LOLpCN+IOvEQnGWgXfqPb2XtX+a8BinjIM/0uB6gFG2Fd
         sIXyFos9ocPnAsxt19YBGoSVn3YshlEcw6Gcv2xwPLVoqB4ZlVKgAt868fLJs+ElG6uT
         iM1pdNELFKs1eqSFzvyl9YOlGx8KydoXDImytU1WliIUURxtoWDZFJDX9KHzG8/pTae4
         FT4gCrm2hku3+x618ayUGE9H2tKz4f56NClybnpBzMmn6YIDAIhJz4t4JCJxefvDZ745
         LU27fvujQav8N9WhRgnBUZC9nE+PLpSN96qEeMyMBlcg/7T+XP6HL9uxkNECbL/aSU7O
         fHmA==
X-Gm-Message-State: AOAM5307hRCFf7N66PAC8SURYVBb1sGdg4NHP03p/vRHKVU/64bQJ2rO
	rPZJq0fmmzkpFwDmDcxzSuo9h0wsIAo8+xC17eNGogUT
X-Google-Smtp-Source: 
 ABdhPJzBl7qTTIWHtZOcXXXMXCvB9gkqqEqUKbT2vcJh7Pp0doVi+3Zg0bGEGqQ81+tC4RaWUlEF72sioWTUD0ZymUg=
X-Received: by 2002:ab0:1592:: with SMTP id i18mr3144424uae.33.1644824346359;
 Sun, 13 Feb 2022 23:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
In-Reply-To: <20220130062039.151292-1-pgowda.cve@gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 14 Feb 2022 13:08:59 +0530
Message-ID: 
 <CALY4984r-NMcFLM1tEO4ZhrySxve6Ye5Nxq7HCq5ufVaQYj6Hw@mail.gmail.com>
Subject: Re: [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest version
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 07:39:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161695

Gentle Ping on this patch.

On Sun, Jan 30, 2022 at 11:50 AM pgowda <pgowda.cve@gmail.com> wrote:
>
> glibc-2.33 has been upgraded to latest version that includes many CVE and
> other bug fixes. Ran the regressions and results are better.
>
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 63241ee951..e1eefdee49 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.33/master"
>  PV = "2.33"
> -SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
> +SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
>  SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> --
> 2.31.1
>


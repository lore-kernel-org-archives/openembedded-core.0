Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80EFCF0449
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 09:58:09 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.12588.1728467883690456457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 02:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WrndJMss;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5398996acbeso7486976e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728467882; x=1729072682; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9SavVlmN5Yzi1xQtO0azTBStxXNWoUNcLWLD5MWu5I=;
        b=WrndJMssNNFbqt+g6PGCQI0AtTwRo+XZaoNFVu5TvLi+gUBlrpOnYnfyGanOEeqT1s
         vI0LL3CjTVE9hQVBV7b1XElggQTy09BTN8XVgNKHPxutD0Bx1XkVQjwYd8T5MMe27wNP
         Koi/ow+y/HIKt6OFGpMUhhiZaCUufh+rbURb4fxMFbjy0dgy5f2qv349P82YaBxonis1
         AiU60KsvgOMFY8UYMhtC0BZARGj2isdW3gjKgtXkwRuJ2ZhZoUkp6rhXZacZPBu6hv6w
         ag73gWOKrUJCLd5GAKg8RGAEJuudBN1aqewwrbq3OE0L9BMLE3GEVWuahAmlqNUZcCUw
         Uhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728467882; x=1729072682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9SavVlmN5Yzi1xQtO0azTBStxXNWoUNcLWLD5MWu5I=;
        b=wvasuimHnU1XV91/md3cM/nNh1lWgr7D6f7sg2hUAGsIoT2ivzvvLqYn/zCvQtB/ME
         XjVGHJuEaWVcw23dRfi53ErcxvPsqdWPH2x2BfxuUPRtfMTgx+80mK2fseqev00/MJu8
         nMVSXevSR4knlt06S23XTRA8ZxydrVnuAtY7d74hcCuyz4AxEiJqMsY6fZFSn7iNHOTg
         7BWSg1HZ0Jwr+pl6YPAMTTGRlrSKENXnESIY0sjA/DW9ma8ee4V03Js0O+jkUiWoKCM+
         O6EU77vLFuapKO1RKVCQ+D6Xg9/iZOovR1bo8FqKftkrvrxvo96CsAC9bZ2w1/68ufD6
         F/gg==
X-Gm-Message-State: AOJu0YxdvaMT0GTqqIHVvkxtkmpNr/0Aqz0hM+O/PLQ4VFImLCarrhYw
	ZLfHeCNwyjcnq8cg7epggWubagK9uQ8cU5meuSiL1yilnRYVO3fzBrJuovwJL3o5mxhcRMveKnp
	vJiaWnhMdxsVS1gNtcx+kD+ihWjs=
X-Google-Smtp-Source: AGHT+IGBPzhmc1mxR4J8tRzGu9N6Ctbpm+TyQB4agUwQye/fNz1+E30RRgOhbDMG+PFxrZqWMA582cYF1aNUsv9slGw=
X-Received: by 2002:a05:6512:3b23:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-539c4951548mr1061960e87.39.1728467881384; Wed, 09 Oct 2024
 02:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Oct 2024 11:57:50 +0200
Message-ID: <CANNYZj-36t73aSYb85U11P3tBmU3gONjHvZ6Hfzi47t8qQOMAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/26] bash: upgrade 5.2.32 -> 5.2.37
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205345

Changes to 0001-fix-c99.patch seem to indicate it's a backport that's
been already included and can be dropped altogether? Can you check
please?

Alex

On Wed, 9 Oct 2024 at 07:49, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-fix-c99.patch
> refreshed for 5.2.37
>
> Changelog:
> ===========
> - fix issue where comparing quoted and unquoted words to be completed results
>   in readline not displaying possible matches
> - fix for reading partial invalid multibyte characters
> - fix compilation on systems that provide select or pselect but not both
> - fix for parsing compound assignment while expanding alias
> - fix autoconf test for broken strtold
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../bash/bash/0001-fix-c99.patch              | 20 +++----------------
>  .../bash/{bash_5.2.32.bb => bash_5.2.37.bb}   |  2 +-
>  2 files changed, 4 insertions(+), 18 deletions(-)
>  rename meta/recipes-extended/bash/{bash_5.2.32.bb => bash_5.2.37.bb} (90%)
>
> diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
> index abd83d09af..e0f1a51433 100644
> --- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
> +++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
> @@ -1,4 +1,4 @@
> -From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
> +From 60a075c6e3258df9799d067e360e4c63e24e229b Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Wed, 19 Jun 2024 12:57:39 +0000
>  Subject: [PATCH] Fix C99 problems
> @@ -8,9 +8,8 @@ Backport some fixes from upstream to fix configure checks that fail with GCC 14.
>  Upstream-Status: Backport [devel branch]
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
>  ---
> - aclocal.m4   | 3 +++
> - configure.ac | 2 +-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> + aclocal.m4 | 3 +++
> + 1 file changed, 3 insertions(+)
>
>  diff --git a/aclocal.m4 b/aclocal.m4
>  index cc97bd4..7423b99 100644
> @@ -26,16 +25,3 @@ index cc97bd4..7423b99 100644
>   int
>   main()
>   {
> -diff --git a/configure.ac b/configure.ac
> -index a3b5bd7..2a38c6b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
> -       [AC_COMPILE_IFELSE(
> -               [AC_LANG_PROGRAM(
> -               [[#include <stdlib.h>]],
> --              [[long double r; char *foo, bar; r = strtold(foo, &bar);]]
> -+              [[long double r; char *foo, *bar; r = strtold(foo, &bar);]]
> -       )],
> -       [bash_cv_strtold_broken=no],[bash_cv_strtold_broken=yes])
> -         ]
> diff --git a/meta/recipes-extended/bash/bash_5.2.32.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
> similarity index 90%
> rename from meta/recipes-extended/bash/bash_5.2.32.bb
> rename to meta/recipes-extended/bash/bash_5.2.37.bb
> index b159c0232f..87e0aa24ec 100644
> --- a/meta/recipes-extended/bash/bash_5.2.32.bb
> +++ b/meta/recipes-extended/bash/bash_5.2.37.bb
> @@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
>             file://0001-fix-c99.patch \
>             "
>
> -SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
> +SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
>
>  DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
>  DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205312): https://lists.openembedded.org/g/openembedded-core/message/205312
> Mute This Topic: https://lists.openembedded.org/mt/108904270/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


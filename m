Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D11C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 19:27:33 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.368.1644607651933234600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 11:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=tYIPQ9DB;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id v12so16946206wrv.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 11:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iv16CTfqUcAku37f8IqyaO30ttF0gd1SSIe5RULmALM=;
        b=tYIPQ9DBgJUL1UOO4S1/g/pGNgW9y05I9Ahi01UFRqVqbXl29vVXL4F7Ta6Psh5tVG
         DprGnUiEAiXjoImPdrGJY02+uttolj9Q5YMzH70YdduFCvpSm8SNGOLnJcIHfuNwf09r
         U8+QoClYHt84R01LV87cGsd3/m85PE4wxsFwa2Zvc0tM00bu3YnkwMYiQFcw8fja5DG+
         vDyLvGZI0tmQ5GuquEOVGetXg1vXUvY5DaEwBQRFbWNwhtxiHZEX+HKEfX1LdxxKmJJL
         ZU/orIYC1vFYD7HWZzcIt2SVyLPchw0+Q8NJ/0b+zasGMgwzZOJ/9LZyNAoCF2Q92jaw
         Lz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iv16CTfqUcAku37f8IqyaO30ttF0gd1SSIe5RULmALM=;
        b=B6SWcW5665QpR77Oq9qR3dc1fKkKQZ4WlHmDVZSvZmfiCRdAN5cvg68MnbivklU4bX
         UuwrzD1ICcS6KwS4tF5evoMR3OnUM8e4vXplCZuWgAa8c3ZhO7VAF+aUEAcO1lf/6qgV
         OGMVmsP0GMr99P11PpHSyJ3CDHZN+YiCIVltvgF34ZMOdGl2W1ckiuX3Ni/5nZRE8h18
         isO0RhIs6KU0H5mbUGqghO6vOS9otXh+BuMdST2aJDxs0PVwkanc62UDjLqMBr3I1PVu
         rZgxzWUVSZUwcNENdkmLRv2Qj2By/r3u7Qf+Hnt1Wiy+RE5zawTVwNMMVw3hCC/YBzfG
         ToUg==
X-Gm-Message-State: AOAM533EIDHJABj3sGp3rWDwD/j4q74I8pQbLxPsb/r92TVPJJoceFfp
	34e+yjXgHiGjzI8SLCgTmD8MTXm635Uk/1mP0sUyeQ==
X-Google-Smtp-Source: 
 ABdhPJxmFc+nbUZwlpqh7o/CUROjycDdnzmEluL9N7MDXbcu43xWnvMpK2XZvj/LNnA/eRWGnZpyWya1CEGPUBA8gZM=
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr2467303wrs.620.1644607650031;
 Fri, 11 Feb 2022 11:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20220211174613.2732343-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220211174613.2732343-1-richard.purdie@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 11 Feb 2022 19:27:19 +0000
Message-ID: 
 <CAAnfSTvhtTsY1SjWrSdf=3LydUS_RrGnjc1xkM+vQ_Jh3h9Etw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] default-distrovars.inc: Switch connectivity
 check to a yoctoproject.org page
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 19:27:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161662

+1

On Fri, 11 Feb 2022 at 17:46, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> example.com is proving unreliable at present so switch to our own connectivity
> page instead. That page is very simple avoiding app overhead on our web server
> which was an original reason for switching to example.com.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass                     | 2 +-
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index f288b4c84c9..773902e619d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -353,7 +353,7 @@ def check_connectivity(d):
>                  msg += "    Please ensure your host's network is configured correctly.\n"
>                  msg += "    If your ISP or network is blocking the above URL,\n"
>                  msg += "    try with another domain name, for example by setting:\n"
> -                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.yoctoproject.org/\""
> +                msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
>                  msg += "    You could also set BB_NO_NETWORK = \"1\" to disable network\n"
>                  msg += "    access if all required sources are on local disk.\n"
>              retval = msg
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index fb0f1097da9..3bba651a776 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -54,4 +54,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
>  # fetch from the network (and warn you if not). To disable the test set
>  # the variable to be empty.
>  # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
> -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
> +CONNECTIVITY_CHECK_URIS ?= "https://yoctoproject.org/connectivity.html"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161661): https://lists.openembedded.org/g/openembedded-core/message/161661
> Mute This Topic: https://lists.openembedded.org/mt/89077055/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


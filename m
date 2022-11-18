Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C91C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:59:40 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.250.1668794371542776564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JpquTRvo;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id j4so9478400lfk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qK00sTkIVoZUUMhELEeQ4FcjQ0jU1AeTopOC7ytVN9Q=;
        b=JpquTRvoobuyGGGqH9L72GU5YxJSCk1hW+J676uYay2SjAVwxCIDMg7XP63f2T2781
         n/fsAaMbTQggM9yapitPoKeOHJoE9jTJDkYX3p5uCapmH0sF+CAPd2g818QyuSzcEibC
         0WSrLBCA9rGOeTjmVPu97DUX2bdwUJxn6kaZzMXe8S41MiY/83RC4xWVB1HQqLHMbkRY
         VNjDGTR7wD3MSqiORuJLTWXdCz2w1E50ZvEdVk8SdPzHIpsjI33XqxA1VDuRdFFTS7Rk
         61QOIbIkImXrQ+l/85CtP5PtdZV7pd/alLrp7l1E6A7klMgT7W/HuO/JlUCbrY7KaRWz
         6pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK00sTkIVoZUUMhELEeQ4FcjQ0jU1AeTopOC7ytVN9Q=;
        b=7fFUjOd79fP3YhCYWJWPFxLuTiC8G+snbCSuNzKGcKceP4zcZvSYmq3OhmRUnIszhP
         rg8lTZj4keAbY+SfXuNJVZZgpmkRC8AVmgW7vHKNess6GHGwQ63KNfOzGhz1sJ8cH4SS
         LbMZb8xA/Jty+Msj3w7IjHMFob9KPD3AFb6bv1pCKXyxcvPyAs8X+gEizYfHV8wRcpid
         ABFNfrLhunvwBb1Cj5eqecGd3SmwpJkJMaSx7nleBadCYqotgwl7xC5ZMcyDP8AeB63o
         08Bvkyd7JFoYML4KipLhRi3Tbkye27CHvWyST809KwkWKqyNRjsLVwraimuRCEyU/lCt
         6Vtw==
X-Gm-Message-State: ANoB5plws6wKPsX+U4rnIlD+D7u3zt43v6SLfOuWHGByQmX6xZeB1qye
	rdqf41hQxEAQ6rJlJZx5rCOS8wvPqbMwFZD27lg=
X-Google-Smtp-Source: AA0mqf76z42WS0PehZj1Som8xEXi1LVzVMzM1O93AeltRc1YYHhgu8UwJlUnNgud7EPt0tiEA64O+jaKvB1hmv1SJDg=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr2730617lfh.345.1668794369694; Fri, 18
 Nov 2022 09:59:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668793524.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Nov 2022 18:59:18 +0100
Message-ID: <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] liburi-perl upgrade
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173488

I trust all of the affected recipes still pass 'devtool
check-upgrade-status'? AUH won't work if that is broken.

Alex

On Fri, 18 Nov 2022 at 18:52, Tim Orling <ticotimo@gmail.com> wrote:
>
> AUH has been missing upgrades to liburi-perl because the author changed
> back from ETHER to OALDERS, which changes the SRC_URI. In the mean time,
> the dependencies for -ptest have grown a little bit, so we add two new
> recipes and import one from meta-perl.
>
> While we are at it, correct the redirects in CPAN_MIRROR.
>
> The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b739a2b:
>
>   mesa: do not rely on native llvm-config in target sysroot (2022-11-15 09:38:38 +0000)
>
> are available in the Git repository at:
>
>   https://git.yoctoproject.org/git/poky-contrib timo/recipe-upgrades
>   http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/recipe-upgrades
>
> Tim Orling (5):
>   mirrors.bbclass: update CPAN_MIRROR
>   libtry-tiny-perl: add recipe for 0.31
>   libtest-fatal-perl: add recipe for 0.016
>   libtest-warnings-perl: move from meta-perl
>   liburi-perl: upgrade 5.08 -> 5.17
>
>  meta/classes-global/mirrors.bbclass           |   3 +-
>  meta/conf/distro/include/maintainers.inc      |   3 +
>  .../distro/include/ptest-packagelists.inc     |   3 +
>  .../perl/libtest-fatal-perl_0.016.bb          |  36 ++++++
>  .../perl/libtest-warnings-perl_0.031.bb       |  39 +++++++
>  .../perl/libtry-tiny-perl_0.31.bb             |  36 ++++++
>  .../0001-Skip-TODO-test-cases-that-fail.patch | 110 ++++++++++++++++++
>  ...iburi-perl_5.08.bb => liburi-perl_5.17.bb} |  34 +++---
>  8 files changed, 248 insertions(+), 16 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
>  create mode 100644 meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
>  create mode 100644 meta/recipes-devtools/perl/libtry-tiny-perl_0.31.bb
>  create mode 100644 meta/recipes-devtools/perl/liburi-perl/0001-Skip-TODO-test-cases-that-fail.patch
>  rename meta/recipes-devtools/perl/{liburi-perl_5.08.bb => liburi-perl_5.17.bb} (65%)
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173482): https://lists.openembedded.org/g/openembedded-core/message/173482
> Mute This Topic: https://lists.openembedded.org/mt/95117529/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A57C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:41:24 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.8559.1657125683011729424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8LYYOk/;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id z7so11439374qko.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiuB6GJx08juuKdjnyPlxBHifPWmCD+YJ+avS4ugXtM=;
        b=c8LYYOk/n4b37cBQtIL5FXvG3vIqH8E4eNJP/0WXJC24OML9PqiQfAsTDxNS+Rq0J/
         4x9hc+9/j0uRhfYvBn3oNlLOC6k4DKIds50lMmKsig+/nqQtYkWVaq1smO9rMrysHoC9
         dxYAsoWkHn80kTQ+AVH7JlgORP5GKOFtcYSqrN822lgFmTxcWwJlYSP2h74wpW1ZJtdy
         UiE8vxBuoJpSVFpoLXsws1UaPFY9+iqvprM0nj5vO/JH1jU0hDhuQqXq1e89xbXplahz
         dYUFTX7NXtQfAzV1dZFXXxOjA+okWuvziAmVlyJVSFF1WFf3PToPPXAmiMLrUqIybyhn
         HH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiuB6GJx08juuKdjnyPlxBHifPWmCD+YJ+avS4ugXtM=;
        b=JiqWFsb/uzwQXWjf2g/RUTkQ6bX7ZOt91iAy24Hc/y4K+bJdKG9W5NmcQ1oVHkMwPA
         XtJa3YCLMuJSTZ+2jx+5JdHcCKGP343rgfVd1SkXhfCHYFnmwTqzMBCeBQRip1CmTBV4
         JC02I6Jpgj9sfbJnPGdKhfweC1Ot7q+0EoTcHcKMa/9cGpLRuuJtznjPjE1B4dKiQkSS
         tZ+9b4ixvaiXeCvyO0SllnCJ/13BQNEwjeXkEGl+fnOeLvdTeHC6BNOhzsJQaTWs29N5
         iG5/v6GW9leJeLkYaxkeD1xS3kQEjgnPHlf9SWB7zO+8Zr5l2OxJcW48ETgnC+H2J/uE
         ZkPQ==
X-Gm-Message-State: AJIora8a8TD+J0JhWwCmMyfwwYsJ200zeplOSCRNlGCao+IsSzaud68A
	7+Zp5ufzY25ZpcGF+li23fz3Z2xzxXKnk098JhY=
X-Google-Smtp-Source: 
 AGRyM1tLU5YnUYEEyHVzpwi9u4J5HeaEpU3VAAaQ/HBh3tRDO1tiwYOLb9MFq5T5B9n1Nn4s0X+JohEq4hnlAGf5MZM=
X-Received: by 2002:a37:68c8:0:b0:6ae:ffb1:8495 with SMTP id
 d191-20020a3768c8000000b006aeffb18495mr28755360qkc.463.1657125681938; Wed, 06
 Jul 2022 09:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
In-Reply-To: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2022 12:40:55 -0400
Message-ID: 
 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
Subject: Re: [OE-core] is "poky" distro defined to use "sysvinit" as
 INIT_MANAGER?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:41:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167737

On Wed, Jul 6, 2022 at 12:38 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   not sure why i never noticed this before, but i started a new
> project from the poky layer (not OE), and realized that poky.conf
> explicitly sets:
>
>   INIT_MANAGER = "sysvinit"
>
> which can't be overridden in my local.conf. if i want systemd, i guess
> i can initialize my project from the OE layer, and i also notice that
> i could use poky-altcfg.conf.
>
>   but is there a reason that the default poky-based project fixes
> INIT_MANAGER to "sysvinit". perhaps just for simplicity?
>
poky defaults to sysvinit.
poky has poky-alt distro fi you want to use say systemd

> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167735): https://lists.openembedded.org/g/openembedded-core/message/167735
> Mute This Topic: https://lists.openembedded.org/mt/92210454/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


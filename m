Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAEFC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 13:42:24 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web08.2557.1665322938093676302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UHnjyxdR;
 spf=pass (domain: gmail.com, ip: 209.85.166.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id 187so6767236iov.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1g+gvHiKuUKI4D0O+d8DbmVxUHPvF4Xo8cEwH/KrCI=;
        b=UHnjyxdRiDKGcFfQB1maYnuiy4EZx8KJOLHl6XkiDrpAyv3QNPPTgzPDNuAzESOQ+q
         wTqqMCMcbq1v5HvLkHDcTxYBdp3iJgwPO1eiYcDn8oxaqTzm6Lee1F/R2/102Pp0RWcz
         GEcbKX7mUNDrl5oakwASyHrqSTk65AIhqiyA9eXlLwgJIj2TD3S4jfhTv1jfhVsMAG6e
         N4my4pYDeDBQHNmb0kiW8Jg1pContIOaLfIsyMhKfdeOpjK4FT/x5vgT84BB2Y4Zc/kS
         eXuTsfNP9WMEcH+/rr4TSQEhzqGQ2lJfI3smUiZHgrLHZrscS4tw7wKBg6+S8tP5q7Wo
         hh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1g+gvHiKuUKI4D0O+d8DbmVxUHPvF4Xo8cEwH/KrCI=;
        b=RcYecuskFpuCldqsnV09UQRAFCLP8yG7x3hxbic/OdZU0BqcJERy12OKS3QsNDjMRD
         eMu0lN2/uOA/NhbuijBUOc/u2GvazMvH8ZSWVm3lbSyO9lT5Cu05tpq46dNNQETpFJeJ
         iaDptcsJmsHrHmPZI75QN+DJ/TCGXKBzrGmWbsRtWZ0E/bQ3wd5VLrz3zqgHrVo16MW/
         CuwZO9iIqt8WB2FdPu76tJnyqvrr6hQgUPaQhNX1I2B2FJk1I+dyx/28NzO12PIINLDb
         pX7yNGYhNEs/VcJlOxer292ckvVKjp33lfRJD7QKwVksRV3SyJUI8fa7lZ3aw5GdqebQ
         AVFQ==
X-Gm-Message-State: ACrzQf2G1LgWLailPuBTwLjxrccOxsjxJWY//uZr1HT3HoDytb8tfyrA
	3Np4hIr1H32wkdu8wEnEjLOIXW3MS+Elrum29Bg=
X-Google-Smtp-Source: 
 AMsMyM58QM0BgO+ANl6mlMYyoy1S7OX+Wa55N2aWkLktjwKOJYldOEXqMGKqDjnL+2SlgeVztjlB+E2rBebWfhyLwjw=
X-Received: by 2002:a05:6602:341c:b0:6bc:1c3d:836e with SMTP id
 n28-20020a056602341c00b006bc1c3d836emr774034ioz.24.1665322937440; Sun, 09 Oct
 2022 06:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665270768.git.tim.orling@konsulko.com>
 <84594a2a5a9392187568022af9453e97fae2aa9c.1665270768.git.tim.orling@konsulko.com>
In-Reply-To: 
 <84594a2a5a9392187568022af9453e97fae2aa9c.1665270768.git.tim.orling@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 9 Oct 2022 15:42:06 +0200
Message-ID: 
 <CANNYZj8GwP7-XPu5uAf-O7yW6DFXwv1H5iTC=oL2JaMgED_WLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] python3-cryptography: upgrade 37.0.4 ->
 38.0.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 13:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171553

On Sun, 9 Oct 2022 at 01:55, Tim Orling <ticotimo@gmail.com> wrote:
> * Update crate:// (via cargo bitbake)
> * Manually fix crate:// versions to satisfy cargo

Thanks for the set, I trust you've seen my proposal to update the
crates automatically with a task from bbclass? I've tested it on both
bcrypt and cryptography, with no followup fixups needed.

Alex


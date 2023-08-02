Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592B1C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 23:17:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.2636.1691018229650319155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 16:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EgjGu2Mr;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-584388ec441so2640837b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 16:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691018229; x=1691623029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ggpGlrwkSQ5Zjda29SU1CWpo3JcTEyypV05gKDmJ7Y=;
        b=EgjGu2MrwKf09M4CfTYyiTNXcFCrszj9FnR1ZI6kacis0HIvGa3PYpJoXpAzlvjv1l
         xtSkE/Pfm38wQiD0mWRuLHVVcALYPsKyGIbQOjdiDLwOxiF5tgtjM1Qt1Rfu56Bfqm+d
         F/7zB1RSVT/w7IhONyuBaHure7aqN8EwKwRbEt5NN0PivMv+rujwhI7NJaqV4GPQ4Fpy
         YbkA4upfaMVbTTuXVptf1alRSKkwFP/x7YGOPPQTuskUW6P+CoOQKjWMSQnTYBmwV754
         pkaTwB+2tLTVtq9DA5DAAYN0HfoGb8NdxMAy56VTcBbmrsXZGy1Qpqv4ljrgsPlKHfUV
         NbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691018229; x=1691623029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ggpGlrwkSQ5Zjda29SU1CWpo3JcTEyypV05gKDmJ7Y=;
        b=UjjEzEro3O5+VoNoZeSyQzRka14GJ1mef+EcqljxQRC5RaDYxH7/QUr2V0JqdFA+sy
         s5aAx9/kMuiBAw0xjcX9vnqLtwVPYPIXqc/k3TfKgNi0jlKPS9Cc00aX+DKVF9Q2RvyL
         38cVl0dyAmTVAk9x+fsnvugxLqFMlZgsV96170cD/T01QegsRkvXheYtEg8auOQnDGRC
         wFxjM64F1DSxD4fcbDqcy427mSZqhNMGk2KyN3FcN34NriDzAWClUhthMja0ZPwVntzf
         QmC3zNLi8VGKt/kym1af03jTyFSapGsevAUcKSFwl1tu73xocCrx0JfmdL4VEnbsJk2g
         tY9Q==
X-Gm-Message-State: ABy/qLbwrplvEX4NTdn6W+BeX26pQ9HusTx0BvBmoAmVrA1Jny/6uJ6z
	oNAeqoTYBAeX8ts9eNMXhd6+eBZSOuc5wg6dxU4=
X-Google-Smtp-Source: APBJJlFrEVMiSxgnhB3niycsRf7oDifTSJEWJb+IlRI8MlkzuTnTkurOZnraVXWdOh5WulepTssoJ7UXiQ/2op9lVac=
X-Received: by 2002:a0d:df96:0:b0:56f:fbc6:3b0 with SMTP id
 i144-20020a0ddf96000000b0056ffbc603b0mr16134919ywe.14.1691018228810; Wed, 02
 Aug 2023 16:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802185425.2044630-1-luca.boccassi@gmail.com> <b7a75eb0-caf6-d999-42c8-d1532200807e@gmail.com>
In-Reply-To: <b7a75eb0-caf6-d999-42c8-d1532200807e@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Thu, 3 Aug 2023 00:16:57 +0100
Message-ID: <CAMw=ZnTgBDUJg9-rmzVxEcHUx3OJbt1=nDnjkZ41BJ9+kaPiXQ@mail.gmail.com>
Subject: Re: [PATCH v7] systemd: update to v254
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 23:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185443

On Wed, 2 Aug 2023 at 20:27, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 8/2/23 11:54 AM, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > - Drop dependency on gnu-efi, add dependency on pyelftools for EFI builds
> > - Refresh patches
> > - Ship new files and directories
> > - Use meson target to build sd-boot instead of filenames
> > - Change libpam recipe to set ANY_OF_DISTRO_FEATURES = "pam systemd" to let
> >    logind pull in pam-plugin-umask
> >
>
> We need to fix the includes in few more places, I have submitted another
> pull
>
> https://github.com/systemd/systemd/pull/28651

Merged and backported in v8.


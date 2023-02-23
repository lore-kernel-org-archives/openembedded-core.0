Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D86C64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 19:46:20 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.241.1677181576696212443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 11:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CseYl1Ra;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id s22so15044309lfi.9
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 11:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677181575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gDEt5CZ9b31eqShMJFRB+HblTRtEOrGeB29qoa6KLhA=;
        b=CseYl1Ra9uo0+MmYlcjGTr0msSnbHU8PE1VUcCD/AZw/AB5JXDGzzCRI0uTSG+mOC5
         vTQLzqyQh7u4PVQAa+h0Y1dR1hn+eEO74CNn1njLPj2yCNILuWkgDzd1GTFKHCVD1CdH
         WB297A4ILDeIsXmyaeq18zfj8hAuq+0WURhJqIPcc5Jnva81Q07gp1EVLkcAfWHcW7Je
         NWJH5QJFeyqxR7NCv+vZHaKURQDEPmywONUDGIFNnrhHn63gkIJp8qkmkHtAE8G7gEyF
         khvs4dJeSimagiIph/gw5e4BhrvlLfcf+FnbhJhXWRrqtynby2oMUKj13C9TiEdpUfiN
         URtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677181575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDEt5CZ9b31eqShMJFRB+HblTRtEOrGeB29qoa6KLhA=;
        b=uXI/DFuXq2kDO9uxF+0uRsvV0l2kTeuZr7YE053bK8iwYrSZtzYj251nRIQcY6/DMd
         gwlqsUGoVNw55FktMQOGzJ5LYY90+YrrpPzbh1zfcxw6PXAZBd1zWpWjFzFQwsBc0MxU
         9t8LykFToU2kIdkWm1IHUEtMFKXTlcbA+h9Ptbb8mELqw0drFGCfrGo04y79rIRHo/lM
         86IFqVSb5k/QifgpsVSpewD9mLrXTsK5pBK5vLsMIqEM45TnZAp+nCufMvSOH0tvR+Gl
         Hco33bZdy+v3up8AzQxJ/AZQXY91ZtckF5Iu0kgdeZRdE5VRbjS+2qa3/TL+q2bNrLbL
         WgZg==
X-Gm-Message-State: AO0yUKWCoJPGnkNOH1Vvvrcr6JRWcPQaNeuu9xNk/NTK3XVtNnZWsQIT
	SXStxZxR2lYEQhlu7EJQXr44tiOYsrwag/qtxvs=
X-Google-Smtp-Source: AK7set9yCQed2JNdasnPy4Yp61/jNyogcmYm/+SwhZshu6l7WrTJnP8Gkzpo3mpWi/K5OoruLE+lxVRiQlrYUOnuzvw=
X-Received: by 2002:a05:6512:15c:b0:4d5:ca43:704a with SMTP id
 m28-20020a056512015c00b004d5ca43704amr4171782lfo.13.1677181574568; Thu, 23
 Feb 2023 11:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20230223191937.1215699-1-f_l_k@t-online.de>
In-Reply-To: <20230223191937.1215699-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Feb 2023 20:46:03 +0100
Message-ID: <CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv4] vte: update 0.70.2 -> 0.70.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 19:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177625

On Thu, 23 Feb 2023 at 20:19, Markus Volk <f_l_k@t-online.de> wrote:
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'vala', '', d)} \

You need to use GI_DATA_ENABLED variable instead here. Then the
:remove statements with vala in them below will not be needed.

Yes, I messed this up myself in the gcr recipe a few days ago, that
needs to be fixed too.

> +PACKAGECONFIG:remove:class-nativesdk = "vala gtk4"

Why does gtk4 need to be removed as well in this case?

Alex


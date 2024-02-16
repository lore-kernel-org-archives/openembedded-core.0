Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D565C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 10:58:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.16099.1708081089608813919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 02:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lc4mECk/;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5114fa38434so2197339e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 02:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081088; x=1708685888; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N4iK2lntiKGPuRqz7PEOsaNmMTazsp1l0MsOtaCQt98=;
        b=lc4mECk/gIYwYWNyxpwotXqpWlsINsZZqoDMyd5ax+6mKuTeWCgiIXlAgaAqe3Z5bA
         EKuMwclI+paozO1qB1iy7UKtTFArv9k8t+nUwqCt4OqNuvW0UNQoHTwrmOUqIZw2JKKC
         Do7hQw8HqlxGjoVvyzRoJeNUbz1tEX1zv+FlZQAHb0jJrxRXzmDVgn7T4yw8WTcn2XZm
         IiK0mzFB6lwL7VhBzMSpKI81ZdaieLfj4L8c/1arCHxtlHCskEiA4ZvxH2uFW48TlKrA
         v/pbA0temIw8mKupV/feI4zpkYkjfhSPTIkkGQqGFTfKtjCcVdjPYqF8SJgwOzyvBpQL
         06uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081088; x=1708685888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4iK2lntiKGPuRqz7PEOsaNmMTazsp1l0MsOtaCQt98=;
        b=gvwKSlOptbOIPZrYvAOsti8168fPzutw37tTsKlPSU40BRkHxzBFT4q+roEgpe2XcU
         BcjRT3cJ6ToyFTBW7+Q6CJD5AhCx5IlheDakk8PhqB70+NQOYftnkBo+ojmDLWoq9hYn
         rvXC+2Q3/zo1XXYxVRnMxmuSGxKJQxGg4Wy82UgaJm1+uPwHOgnsCC9oM51dgo7DYcjl
         n2Ez8uXhIxgK4V5YASNwMRmtMjUcPKcWeJMW604RaWWMpCY1R4AsG/Ji8Yp/sLLg5fBy
         0wcdJWjyao6drPtMm7zW35uDZcb+SkTBfV5V2qMSExK6+IkLCrv9CMg3UVEvUhavzO+x
         jRQw==
X-Gm-Message-State: AOJu0YyyAk3IDl+5Jy6C3pJ2hyT3b2FWiTFd7ykv9MNsyBKjdsiNSp4f
	IL2T+b78ffYmOHQ30FGWdtBPNMaClbKAjuwKDL3Hg4DwY1mlh+v3GuCJ/v1a6gmjxK7LHAv/5wj
	YTALGAiYKQO82P6qgq6NfsyaLnTQ=
X-Google-Smtp-Source: AGHT+IHPew7TV78bsMrtwQ1nmGA4SFjHr69JlYpvIePlaY+b3atKmyEdPRrAJG3tc/voiL7uzZZOmO35Vrxjm3Yo1Ds=
X-Received: by 2002:a05:6512:3b83:b0:512:8d85:7da2 with SMTP id
 g3-20020a0565123b8300b005128d857da2mr2845878lfv.19.1708081087505; Fri, 16 Feb
 2024 02:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20240131123908.1098544-1-alex@linutronix.de> <851124e8284547ec3e9ab47b8bf78d114a0be766.camel@linuxfoundation.org>
In-Reply-To: <851124e8284547ec3e9ab47b8bf78d114a0be766.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Feb 2024 11:57:56 +0100
Message-ID: <CANNYZj-csKB9jz75Kg01_y2jFK+F=xoyjC5FYXwFzv5g89mt_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] meta/conf/templates/default/conf-description.txt:
 add a template description
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195746

On Thu, 15 Feb 2024 at 16:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I know this feedback is long delayed so my apologies for that.
>
> I think I'm ok with the idea of this but I believe the naming isn't
> quite right.
>
> "notes" does suggest something longer, so that is fine. My worry is
> that in the metadata we have the SUMMARY and DESCRIPTION variables. The
> former is the short one, the latter is the longer.
>
> If developers see:
>
> conf-notes.txt
> conf-description.txt
>
> then they don't know which is the "short" one.
>
> If you however you have:
>
> conf-notes.txt
> conf-summary.txt
>
> then I think that is much clearer?
>
> I think I'm therefore ok with the idea but I'd like to suggest using
> "summary" instead of "description"...

No problem. Peter suggested this previously as well, but I didn't
think it's super important back then.

Alex


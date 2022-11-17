Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365BEC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 21:18:24 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.2320.1668719896742716636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 13:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hKIO50a5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so2760153pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XEStEFbQsDFaeilGUexEqhCdCdnhDSRMGI6iQjUoe2w=;
        b=hKIO50a5CTi0RmQNTRsZL1nycWvTcUYPphEm9HD4tHmmPli4Fb/0j1HUP22LMwFVUu
         vMkFoXQB+bAfBcU2FjS6+jJpLXyaRXZhw59Ix6V43q4lB9q4i84NqXRe2nvs50GEH4zu
         pz3/d+tdB9G9xC5/mqW4inRpVnbbR4KXYQgGyfAYXEdA0NtQJUAhbipFfUUTm9QD0fT9
         z2v5x+bC+ndHLqnkvSynVABae9g/HFX1xCYYd3GT6fRMES9bSRGe3kG0MeR9Dwhat8XU
         vrO7FBGySi/DmtgywxMQgN5a3TfUnrcpAWXMX13HHRhq1nUN1IHI4KySsWlawU/flRsW
         rg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XEStEFbQsDFaeilGUexEqhCdCdnhDSRMGI6iQjUoe2w=;
        b=MAfCS8cVGwvBcTzECamcNjV4bnjC5PGf4g49RQ/LHpA1/5zQOaw20diL29eWcIwQij
         6Cz0oAZCb6b+p/IbBlinirj1G8818cCeCIVKA0jynRRbX0upRUYIsPQdmCyc9iDMQ8uL
         +Ry7cDZA3sNwj7JyG+8KRukYyj8goDQfJWFQLvPAW21YhJRxDt/84aT2lU0DZ25+b0UF
         iAmA/g07nUQcyjrTowYRWKka99k2g0ZCaOxJcriMHQvnlEerwxBaang18nwTX47+GKB1
         LMG75D+Taz5qDjas8CgpZWxMyT/92w+zJ2wSDphpizHvHmDx22eRaIejiD30utdMzY1o
         5QZQ==
X-Gm-Message-State: ANoB5pm/01KooZHpwK+Ya7qeSG9gLfRWUQ8twG6QCJx41IN9q6sMyIJK
	HSYHyRvyGTyTHhLqQuk/+grzVPElhz2zFVrPGO4=
X-Google-Smtp-Source: AA0mqf5VJMiNWSjPz8UTj6i/vpuum9KtxphayQ8d6jytBKZKzNeslv7OwIy7biokuOsXfP6tp0RrLkt6ov/+aZPxJiE=
X-Received: by 2002:a17:902:e483:b0:188:75bb:36d4 with SMTP id
 i3-20020a170902e48300b0018875bb36d4mr4590501ple.55.1668719896147; Thu, 17 Nov
 2022 13:18:16 -0800 (PST)
MIME-Version: 1.0
References: <20221117211605.2746-1-joe.slater@windriver.com>
In-Reply-To: <20221117211605.2746-1-joe.slater@windriver.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Nov 2022 18:17:59 -0300
Message-ID: <CAOMZO5B594skmzpFZJSSz-iqyg2+e_-S3xHEw=1cmQWbPpbJJA@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] python3: advance to version 5.10.8
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 21:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173448

On Thu, Nov 17, 2022 at 6:16 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Fixes CVE-2022-37460.  Also add patch to fix CVE-2022-37454.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>

There is a typo in the Subject. It should be 3.10.8 instead.


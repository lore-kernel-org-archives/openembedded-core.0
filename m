Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A500C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 13:14:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.5021.1647004444250303737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y6fCV5WG;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id j26so12939827wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 05:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGv4QG8gvzS6D803xpY7MPUnULGDvEcor04iBaCH5Io=;
        b=Y6fCV5WGvv1qgOoDpiBjlY1LKrldQUQA2lruikSQr7P9/vUEc6QGqwdYbiey73E8qj
         P6JSiETLv5o58g8nlHTsyI8WuxZDTrYl4Aagk8Lz6q7ISXW0VYmFDRpSRIeUeEImh2ZH
         d9W+fJIfiD2AOJr7iWOAowjSyTuSkIEHiu6x1G2NlsEWZ7MB/c7iQhExUUoW0HlK3/GR
         z+Lv7TaJWVAYxceQQVjVtjngHCVx6Q+U/bE/Lg6ZU2hMhOyuHrR/RO9R5h9yU4ejEClw
         vSMlePjIxvQDax7UpWqeM2Aj5yeW3Jqb8bHBb4kbE3muP8pp3bGLqZvBHlswQl24GvDn
         c5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGv4QG8gvzS6D803xpY7MPUnULGDvEcor04iBaCH5Io=;
        b=wL9fTR0TjhMUFNjsclgZQPxDG/rdyJZRujhmRCa59zaG2EqdT1imVJI4jMvrbhGKJg
         PqEkuciJ8mUnOMteHgUQH8b+zTS1SvjcJ49hgrXbrk79w/+dORn304x2A4H4SOjc/Doa
         3iar96MfL5h6fiiTanHtA1gFVCYeSlurG5saCIV2pCx2ACMu7BLjI3zss7IEeVXg/tX5
         gqi4M8RJ2euJ0o1mIJI4PTK2g43Ho5V+XGbgGQ8Z4fAlKFiIoyeMNtbwt6h/amGTUclx
         GL9JUwk5lS3ncs02xpygo1UFwzc9EVm4jtVK9lHCgtbP792rpmTMnuudqVK+YDADz5sC
         KqSQ==
X-Gm-Message-State: AOAM532wq93x5r581s0L5A5spLXePvQuCfk9Ye7kaxr44nAOOCGTCTd9
	oMy4ef7VaYe5OBdTcwPwb83ysXdmpvq4DksJ7wRNQg==
X-Google-Smtp-Source: 
 ABdhPJxfJ9LL80iBVW6gC5129s+jNf8tRz71aEmyFLBdMO2IiOv4wTJ8Nu5c8wT7fkMw0YSoAxL8irrVIpCzaD7FKuo=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr7053965wrn.231.1647004442641; Fri, 11
 Mar 2022 05:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20220310171656.3106028-1-ross.burton@arm.com>
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 11 Mar 2022 13:13:51 +0000
Message-ID: 
 <CAAnfSTtWevUx-qWNi6BKXyBesRx8gHq6CD6J+Q=HbkDHC+-a5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 13:14:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163052

On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann <kweihmann@outlook.com> wrote:
> Sorry to say that - but to me (even though it's more work) pip seems to
> be the better option - the proposed tool is ~8 months old and not part
> of pypa community as it seems - so in comparison to pip this could not
> be labeled "battle proven".

FWIW, as of today installer is under pypa:

https://github.com/pypa/installer/commit/4495dea3baeab5e0f8059ca72b12ad7b91552832

Ross


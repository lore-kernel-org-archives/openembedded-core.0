Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FACDC7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:24:58 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.1075.1683041094439891653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GtduFChX;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51f405ab061so138887a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683041094; x=1685633094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClJPM2ekwQJH0wtNNreMHqMbMol99w9w5ZbTDgqVgwg=;
        b=GtduFChXGUAVp/GS66CCQg9KkxjsQdFZag9hWB370pjZD85qPFvZQ4HjMEt47RHzRw
         FCKGUfHRXWEr22QFiLMOXoMf7XHi/7Dw2zmUPXNvNXqQ2sueRyySsZYw8I2vNv9yKHrv
         CqlRPvqjNY1sc6A2ttUvYVdyrPcvlAA/NluUyscY1ulnhTDrHz0K5N4kWvqCc3NpuLKl
         5cqB98JILqYFo1MoyEVVA1+zQ1Ur+OzyYp3y665oLrt0M15QudkW9gS/QD47vfPNuaGk
         D/it+8ZFUchuUEd25GnDKlinYK2pE6Ch56ciqBQ2r8GywEhTW10whdc6NcJWPjebS+qq
         l3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683041094; x=1685633094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClJPM2ekwQJH0wtNNreMHqMbMol99w9w5ZbTDgqVgwg=;
        b=FeLvEoRRk1rUvwVcXgmR7mX0AXt0CsMZr5drTzEj+p+ECmE4uVpOL56B1Sk5lilC8y
         SxYxvRdCgZwyRMPoiWLu9Ya20+HVf1KoZLz9LD0B7srba9eCavpGaoUoZMxu38L7Vfls
         V1oVleEDHlxCFLW+KaPy/xqEbc4EwC6Vyzai5pBCfNj0HrGd3/Bcv3eS19luCw9XtIAQ
         D9SXv9mrp3cW/T0sYUZvWJcKxdR0JAwamM9Qka9tTKnDg2JTeQBii9ZPIjwxDtA3Y3T4
         yZKhfSuyRetLjCZQEVr0udSiwTVXvswsdXAeUDJYlIa2CadWip1tXuYBYFZjega3FVZG
         doOg==
X-Gm-Message-State: AC+VfDwl8tOiUuGwm5JZZLcUZNSFZmORgs7TjD3AmE3HtfAJGZT9puZU
	BVBujc14TAIwmXQ8v7AaQw1Zmq1DoTycXQ+jXyJWufnxwY4=
X-Google-Smtp-Source: ACHHUZ5IdTnkz0M5ev4jbTeWhcXeww/H8cFykWGP5AZwWs9rA/LHhGWv7kD1JEDOXImPd1ahypobGaNrkdJs5DcWpXE=
X-Received: by 2002:a17:90a:1a12:b0:247:9e56:d895 with SMTP id
 18-20020a17090a1a1200b002479e56d895mr2562091pjk.1.1683041093750; Tue, 02 May
 2023 08:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230502151344.1836838-1-ross.burton@arm.com>
In-Reply-To: <20230502151344.1836838-1-ross.burton@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 May 2023 12:24:42 -0300
Message-ID: <CAOMZO5AzW5VqQL+yABjq83Jm2N8yCUHAJSNAGN-rJfxWtDA2ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] piglit: upgrade to latest revision
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180747

On Tue, May 2, 2023 at 12:13=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Upgrade Helper <auh@yoctoproject.org>
>
> ---

Missing Signed-off-by tag.


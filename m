Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DB8D0C5EE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:10:26 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.7857.1729847425994844033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKnQf54P;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2175052e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729847424; x=1730452224; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhoD7VR65w2a1yJUMvD3vbQOHfyr/PSR3+uma/DX16w=;
        b=eKnQf54PGqS8J1T9zxgTveNvlkEe8FP7KJHWrah2Dvcq8fRzQne1iu2xWRIthRMZIO
         vNv2thNlt1PYWNxO4IDOfJmjhy22oPRiXY4J2Asv8z2dtXJLqkSVYBW26aAjR2sRA94V
         s8Zd3lWOZ67mUnNDrO8YIvf5zxuglj7bnMP1YexMl0fguRU4K8p2Skk5l+V/w7Uq10pZ
         bMP9OK2RJnR0nTImLC0Tkf8PIiz6LJQ6lpJ/sNvqSwEb9bGD7cZB9rK07CnM795YGxUA
         nni/n8QcyAZoATlBrQDELyRJCL7OGTQqMYxFVpLHqtoSmdWhUdTz8WAWA+MwOZWXie+8
         UZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847424; x=1730452224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhoD7VR65w2a1yJUMvD3vbQOHfyr/PSR3+uma/DX16w=;
        b=IMxvRfr/2snIAEm8c3JrVjNNkL1ZwQPyLwFBHflliWKOCo/1ecS8j8F89RWD+E737B
         apbIUlcACPKlT2i838ghHyDS2CEeMREJa3vSiY+jQdD/cN6PLgb4ecBx8ZNbchI5LaRs
         dHTMX9TcguoHuPmx+LVb7sjBhN5Jn1J1U4/yCsSutnxV4/VtKAq5GIH9OwIdtxiFLhit
         aeDpkB4D6tIT8QuiFO0Q6nY8vorywst7Dqxy5IcN9PhVvyg1mNBis+5qSupNg7Ac33JB
         yIWe3YEjEK2FGEtVO7Pks2Kvl02Yy5LhMSJASjugD59BuGgYnBJJa7Mq4aAp68mYfFyS
         1epA==
X-Gm-Message-State: AOJu0Yy3DLHJzeeER4ThNmQ1a1coV9Nl8QRZAIdXnF1I9ZEfCZbIxnXz
	1iJmvIwnqB68ChtigL8r9E9CqnbpfvkheMP3E7nEBABUyABZd+4rnkk+CCcMmsY3m8usQC+MVsu
	xScDEVuG8LGDGXOGOoYKgX0ej2ZE=
X-Google-Smtp-Source: AGHT+IHGtFsM3xRpli8x9Br5PbR1U5e0UhOTQhyNkZyGk0TwxttfO+pq5MjJdVXZ9Kr02Eesz0x74lQlkPsO5jsSKYY=
X-Received: by 2002:a05:6512:3e25:b0:539:d10b:e38b with SMTP id
 2adb3069b0e04-53b1a3615c6mr5561065e87.39.1729847423897; Fri, 25 Oct 2024
 02:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com> <1729834769-4717-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1729834769-4717-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 11:10:12 +0200
Message-ID: <CANNYZj9Js9=_HTGtpgrm5L+x44h_9rVTWVcH_GXn606fPrQtdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/22] bash: upgrade 5.2.32 -> 5.2.37
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206341

On Fri, 25 Oct 2024 at 07:40, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> 0001-fix-c99.patch
> refreshed for 5.2.37

Looks like it's actually removed as a backport?

Alex


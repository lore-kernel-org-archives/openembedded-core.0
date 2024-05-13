Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE440C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 17:51:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.67649.1715622657453339568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 10:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dz3BC7hT;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2dfb4ea2bbfso54839081fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715622656; x=1716227456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AJrqer+sl4P05MKIThRssLCxyw8pnAxxwNx7uCmF1dg=;
        b=dz3BC7hT759s8V2NjUjDo9Bx0IGwJhKPec491uqlOPfigVPzfwm7WQzlAHNEvTFhNR
         tVQJirL2oeYrh9gO4yqbqrNO0DJNf0wA1KburKg5tyzPmuSJP5RLLnf6eeuqt+kuR2Wx
         J0KdILJlGPvjasP88gkXqj5JoviCTdHhjfYRgc1ZEijI1vkvnUYIYcEBr7aNQPmJ8K6r
         WhmRRL5pxi4DdCp8xGQT8jHRSYXLfKbnCd5ccYiwp8hVKbzIboT6hV0Jdu9NG4MN//TC
         s5ntG2k04FBBs5rM/he9KoIhMBHEu90WWA2paCipPA5jubZSqfQ35mtZnot9zITx/l6e
         xzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622656; x=1716227456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJrqer+sl4P05MKIThRssLCxyw8pnAxxwNx7uCmF1dg=;
        b=oqo3SgqiZeBVbmfgLQg64HxmETJcmMfyZVhjgZ7fjwCoNxis5j63TMlRhx6T8lR/2s
         masLDkljyeI3YHoDfUUlPdNNZMuVbn0FcFcpXWtivFWs5qsiI6w4U/sSqfVcDf/eDns1
         qlB0yV3WqIVeSuepAjQyrBeYk7+jkcu7qbRgsOoKlY/sdhsb4opJ8zB9x4ZZ8qwWlFVQ
         R0gwjJCOwaObv2gwoV6WPBCRJyGOZSS6pnr+MmKuF8mY17vqCZq0rbyebng8gNvfc7r3
         e7Ng6LEuTc/V4sARjWZ82M5zaW1QUd46APk+rCUlrZQMkUZOv/di2R5IPAOlTskcIOU/
         cziQ==
X-Gm-Message-State: AOJu0YzABAu53rWvIuA1GoJFnkM2x8LlgbG/zAsrdkWE85Lqaa1RBKgo
	Wf+Cbe2Hizn12ql88dtCipgdXHqqvKHdsXo4V56RQL2FTiB9ISKp9/WwrmMdjyxAg7jHz6AYSFw
	yPMD+PReBS9txABMQSbr/jUGPEcY=
X-Google-Smtp-Source: AGHT+IGjKuiJz29PBLraegaVt7DyWAt0+Vuqp/KeWHSiodSK8slDzTza5tRE5Mu+eM+j5bEpeGZYj3CpbdiR/q6KoKs=
X-Received: by 2002:a2e:720d:0:b0:2e0:69b4:d655 with SMTP id
 38308e7fff4ca-2e51fe52731mr69113191fa.3.1715622655364; Mon, 13 May 2024
 10:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240513174908.4124760-1-raj.khem@gmail.com>
In-Reply-To: <20240513174908.4124760-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 19:50:43 +0200
Message-ID: <CANNYZj991Ts_xZ5AcKSnru5vwQYcQOBUbwHCmTU2fzqJMZvaBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] valgrind: Upgrade to 3.23.0
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199248

On Mon, 13 May 2024 at 19:49, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> v3: Update patch status pending -> submitted

Thanks!

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7308FC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:17:55 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.1296.1716826665068203555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBizVqkx;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a883101so42357061fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716826663; x=1717431463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bXKoByoSgRFNdBpRSDlRJMB4ib5JYa059ie2FTzpPfA=;
        b=TBizVqkxeTq4wsyDRpXf47jENCRH4/Aks84SdiNgHAPg8WplOYJI6w2yzUEfd9D4g0
         2Gfk3GQWCpzoT+oYbL7hxOn6e0+wR0Fl1Q5wK7aHOiSJqhuq6/dd/lo3LyRKVO1SssnO
         DA35xAbwFCBJG1mT7D1wdBip9DZ+JOOWTsGQDaNmbHQNC3yEhLm4i5qu8GNs+1W8cD6w
         v0IVs16dliInZiLntx7jzGryT7NMLQ7icrvQh8A/CydEQLoTPBXX3AG1pDcXUgfwxXjP
         D/TrTrRhxjNmXlH/DktNyrAHcYrvCVgpVL/dM7FsZ6glc9Akzi60GqsC4i6swpntYaBP
         B8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716826663; x=1717431463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXKoByoSgRFNdBpRSDlRJMB4ib5JYa059ie2FTzpPfA=;
        b=lS94p4mieg8uLVTend0FlmcuNQOzSwVgWEYVpMV5sXqrFCxVVyRRSnfWwYJPt6wdwf
         vvI6r1ArlBYaq0PFoN0SXKbYk4UWiQ3h+a2MDpoIQL9Tlzw6Nvqz3MjqbB45WZD3OO6V
         EPNubFkru5nK9wOanRgKU132NFNLzTlickqUIDYl2crFUUhWO754O69u9HTnZAmxeAMC
         R/DfF7ikWQ0EdtOQBsZg9z7zEI5JjReDAwTyVQSWcOqvsgBnmfgwdCqUzPzbXb+EMdRg
         6XANr+CyWK3IhKDC/LKBeT8xXBIVkFFX7eoGNqx/vGa8q9ZW/1+8AiwxEtXhjZLbdxHG
         xRBQ==
X-Gm-Message-State: AOJu0YzcTw5MWjH/AsRw2LzQXL7bJpIDm482Q3gEWAIhA9wTO8qk6TxE
	vmx6TtESsLeu1XOmIVbrQywVv7fiRZ9iQjlZ30jly5A9hkHQeQtBmUiW6n6ME1HibYznTcTJmto
	uGWgagLGwfp5yGQ77zxqaGTvwi8U=
X-Google-Smtp-Source: AGHT+IELz2Hc9VeSYsfPPQaIwa6KDd7SCODiV6x/BcmAAAvxnHu8RwCPae2QE5/Hjo7P93s0MJgFLMbS0hIfGyo7lJM=
X-Received: by 2002:a2e:a318:0:b0:2e9:840c:ed07 with SMTP id
 38308e7fff4ca-2e9840ceefemr3737061fa.35.1716826662776; Mon, 27 May 2024
 09:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240527161104.2954913-1-f_l_k@t-online.de>
In-Reply-To: <20240527161104.2954913-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 18:17:31 +0200
Message-ID: <CANNYZj-kvU_f8wxaRa-PN9DCqrfs4NZN5tUhGQueZfaavJZXMQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199907

On Mon, 27 May 2024 at 18:10, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>   Patchstatus still pending. Is this the right thing to do?

No. The expectation is that patches are submitted upstream first.
Because otherwise they won't be submitted at all, most of the time,
from experience.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDB0C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 10:05:59 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.48008.1754561154836038752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 03:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGcMNzTJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7094f298dc3so7412886d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754561154; x=1755165954; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1r2DDu2nUDsdRSBnxg+BKGW5kSYFsgRhNtl/zTHGvbU=;
        b=DGcMNzTJFrNj68IBhGJ+25ZXPnNA05c1mGJvqxAFlY5beeZOq3bab0kzSV4kvcI69+
         bl6LfE8aHpZYcwjCHPtHtQnFr86bSX4m9ech10qCyXPdi/IVNHQtkpp4/lmkWzmWoTG2
         YmSD5EkDnarlPBDbLkHHbp0bvIcq0GfO4JR+xyYH7D6uEq5L0iXhr85PceecxvoOJ2G7
         tYA0zYfUH0dVdjs4ZDrH3Ms4unPFsuA3z6lqV88txiboP9mympr5zE3n1AFokflhbEQS
         uLdHFf7W9Y1gomZgfD5v4tbDSzSDk9UGP5WaCQPzy/vRS+X2w265hSdBjBUobljAnF9V
         IMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561154; x=1755165954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1r2DDu2nUDsdRSBnxg+BKGW5kSYFsgRhNtl/zTHGvbU=;
        b=uAgv3YSiqbpRL/S9qrdWfrLcJwDmcxyyEJbkfA78fQNXpOvZihiIGh7OfKCmGPhmw0
         i+HFCh4q1ldZYhcbyMwfQgm6Ksf0pgthtvj1ADLx12joFPYRCHNBnDzqA/b/MhL7IF+s
         1NjOM99cAYKr6WKNij6Sdpax1HJAuSfac8CjZiLBNA0h4l8hui2Qk6HBiAV966QXPS5d
         5ZhSR0VYne185xfIIAQkafyD43RXRXgOtxttnRzaZ3IuwmSVySm9OuvZfTEsDeu7xoPE
         C/HPJtOzb0zrYxvbWn2dgVph5uToc1km1XeV8de4vPyQ38KsHUttqR0MtFD7z6mtB/Lc
         vP8Q==
X-Gm-Message-State: AOJu0YyQ20U0oFzXw/+s953NUyjY6ZPbphq/xjC1iqWRpL+KyW0mHwg1
	GWK0AYhoX9QWKxlQO2Py0ZP2KHdtdEDDYyIkUyRRPTF9/id0xWhgl55+Tcb5Gs1AiMBAChppb3G
	vRrVjsas1GydKAc5qmQlkid8+NJDgVL9ghQ==
X-Gm-Gg: ASbGnctMAGMn0WPPbvMxky5LGZDaZpw6rLlnTNNpIT5SkXgSZf8QEiTRpk7WwCzrspl
	yaknbtY2rLf276XviSlIwvWTvnAPgYVfBGOUm6LFpg9vDgNRjrDzbFznb9ZV5ADJQm2gpJvsWVH
	H1PFJMIP5ei+Zkt1NjtTJIv4bHwXSwD+ZpzKsE0EnaPpaH3gheiG6QQlrYY1+ghfaf4TC7uQigG
	tVCIlDjbB5H56iizc91Tbju+1Rh86at5v70HH1m9Q==
X-Google-Smtp-Source: AGHT+IEGIp1Xt9naLvGvIJU2gU8aOtX6eXovfrKrn56zwhQhOpke/tVLZR3teIMy4hARnzNUwAxGf/lROoH4kxLNC+M=
X-Received: by 2002:a05:6214:2269:b0:707:5a23:7382 with SMTP id
 6a1803df08f44-70979605a5bmr101920306d6.23.1754561153410; Thu, 07 Aug 2025
 03:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250804084809.2797941-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250804084809.2797941-1-pierre-loup.gosse@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Aug 2025 12:05:41 +0200
X-Gm-Features: Ac12FXx9srKyvxQeWQXI70ryqw-IB2B3DPqQVcTY2sJ6uDupHR9XmFy_-35Eyow
Message-ID: <CANNYZj_7gVF6ZsWN2Qfj1kG75SnUZqcfrwh2M5niiBmELh-tmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: add --keep-free option to set unused space
To: pierre-loup.gosse@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221562

On Mon, 4 Aug 2025 at 10:48, pierre-loup.gosse via
lists.openembedded.org
<pierre-loup.gosse=smile.fr@lists.openembedded.org> wrote:
>          part.add_argument("--extra-space", type=sizetype("M"))
> +        part.add_argument('--keep-free', type=sizetype("M"))

There has to be a better name, as --extra-space and --keep-free are
basically the same thing.

Also, wic has an extensive test suite, and the new option should be tested.

Alex


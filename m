Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F827C636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:38:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.3371.1675841917261358870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QTotT4Mi;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id w11so25839773lfu.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jNJRZZtbJvvSiIFhvrveSIYIeOn0Ff12qFtoPZP/S/c=;
        b=QTotT4MiyiWmGn26Dn5sCzon5Tr6zOvRx+DQB921AzrFR8wqRbv9NqZAY6OmFMtGIC
         FJA7S98Dy6I3hB0Tshc17AGbkJ0b8vwA1dHA+kBBCSgD6jqCaQoMhIwRNvSoLm86nnyd
         X4ABP7tTfd8m/oJpFFZG/D+olu4ouzF02nAtEdcaZyzpmVpsPet1u3X6HPNslhB4irCg
         UCCloO6ABq6VquLl0lgJnZUL0HDBGAdvifzGFqXvtgGbaRTnaWW6qf5fRwH7P0YpV3HI
         Y6x29SgXFZJ46EPEoTTRdkmd75DwqiC1EUnaJUpFoEh1dGEhvGLh733G4ljxVlhIxE8k
         mnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNJRZZtbJvvSiIFhvrveSIYIeOn0Ff12qFtoPZP/S/c=;
        b=TPyIRhsZUZDQ7c0vBuHWzuZgeAqg6u6/AJkFDqNNHiCECvKhJN8yo59dvypUu5y2td
         jRLyKqte6fhS/QFURKIM0cVVfHsxag3vZRVa40rdoZr5KCgiguydWqzml+iHDoZJ7+DA
         ZJ2gQP4P4bR/krdXkdS767/QZQB+MXD6eNu+Ia48bswzsUlZyppOXHIvU9xCeXqyeeha
         ZJLiEMPQICKLdNriid2r/P5PojFOiSTOvFOEEHk6ZwarmRviEuJ/+Qb551EZX1e8yE/V
         3Wjh0Xv4ZUB3GtNjNqaiGihMcqWwvfCrzEgqz2rdleH5D9tOq5zSynEAP8OhXLuHqeuS
         S3EQ==
X-Gm-Message-State: AO0yUKWxoG2H7Y9sBoX0G3v7dH4EcmEb3ihFNbOfkUQBqhFwc5ebdsp6
	oCeU6cK3lMGYgj2Ww6hDy9eh1Fls4p+3azVAyyg=
X-Google-Smtp-Source: AK7set8yPSLk6yLKGaBmXO/1p/QL7ubsXoDMCQvdKcnIFeCAHbun9xQ6AfzFS9j08WOx0YZwEklAl/Pzhy1cWKCDW1o=
X-Received: by 2002:a19:760a:0:b0:4d5:a652:e2b2 with SMTP id
 c10-20020a19760a000000b004d5a652e2b2mr843812lff.154.1675841915353; Tue, 07
 Feb 2023 23:38:35 -0800 (PST)
MIME-Version: 1.0
References: <20230208071251.5412-1-peter.marko@siemens.com>
In-Reply-To: <20230208071251.5412-1-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Feb 2023 08:38:23 +0100
Message-ID: <CANNYZj-rtpJ51hLGKrFWGkjcGWnn7644eCyHkH+L=hjKRGKrXw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/3] systemd: split timesync and networkd to packages
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176893

On Wed, 8 Feb 2023 at 08:13, Peter Marko <peter.marko@siemens.com> wrote:
> One alternative we considered was via systemd-conf, but binaries still
> occupy space in rootfs which is not desirable for some devices:
>   ln -sf /dev/null ${D}${sysconfdir}/systemd/system/systemd-timesyncd.service

On the other hand it's only a single line of code, instead of doubling
the ways systemd services can be packaged, chosen via a global,
publicly documented variable. When you are writing new code paths,
consider the ever-growing maintenance burden, always, please.

I'm leaning towards installing the services, but not starting them approach.

Alex


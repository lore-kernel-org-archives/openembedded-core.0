Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469F7C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:20:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.2103.1667848794838310857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dvU4vSv2;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id o12so18119039lfq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 11:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B9AXvgBLe7V7XMc7geJaH3yoda8nywS2VA1PHU9uWg4=;
        b=dvU4vSv2Z9buKaN5xrYXs29ARdJ6nhk71CExssN0PVbmx0QmSnwQhHBvOJxjVL/bKk
         vwa9KmeAA4MbrOQWCrZh/rPjp+IcLDGvpJk3snpeyTgaiRbuCRoghHEKBIMcfLGULCl1
         RQAMVpclREahfeUHWYJK6jY3xW+KIxH+GYkcE6uB3DOxzvgI+9bjvsAqtboEigZpkBvX
         ouD5/HNUbrK+8noZWAEvDGua3Fgi3I5EEf178fHxa5SSjdqNZH9MhoACeazyd8e1W6YX
         /9jfq8g7OBCD5SmYRwQ3f0PRrZLQtZG5kzWmerUEvBa9IyCfarFJ8S37nf7YsXHwsbw8
         LPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9AXvgBLe7V7XMc7geJaH3yoda8nywS2VA1PHU9uWg4=;
        b=5grmln55YmjBcVR7mgiuX7dEhutfwtAeslqeXzTdT7jImIxLVfuBlMbZbRQGzxrBfW
         JmPHYXY/PyzU2iubdXCkcaxP8AvaLUMpfdqPWMcz9zvNrz5UwibzyiL4lPDs0LIkVSq7
         BDmFs4+KAmE5itDjKgmeEm9VwevFDFtd4YUl/DuCaZZKtfxBkRDiZe4QRR6zV9LsZzNJ
         8XtAX90FAGrAR9MOC1yhtpk0xo2P/ljMfLkmZ/9Spb4Dx31niI/MbgVcdvZ1MR2LHkc0
         /Omu/tpkHC3ASaUxT3F/dy1mi++YZKuL0Rpk8emAXglZHMC2z6BqrhOS8EzdHBuUK82z
         3DCA==
X-Gm-Message-State: ACrzQf3fUKLZ8CNLFhazKPzPK/bZQyRKVq6PpJlGyv5IRrljL8Fs7+br
	NttNEd8/KbomMhpisnu83mmEti9Gav79kPzX0fg=
X-Google-Smtp-Source: AMsMyM627VSil1BQOAmcMvdw+OXu7lG7zlfh8Sn8mfc8Wcxt25ya21bss7QmJPCcNchAws8Ib9hSrw3BY1M1TcLZiPk=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr19756032lfb.393.1667848793075; Mon, 07
 Nov 2022 11:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-44-alex@linutronix.de>
 <CAMKF1srHNxbP7b57jdbwAFq5+ZTgno6QcMF=VgwCGAXVxeFqAQ@mail.gmail.com>
In-Reply-To: <CAMKF1srHNxbP7b57jdbwAFq5+ZTgno6QcMF=VgwCGAXVxeFqAQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 20:19:41 +0100
Message-ID: <CANNYZj9XbBiWA8-OOOS2utnWzGHn2V5fpp7Rb8AGHzr4GU1PNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 44/48] selftest: add a copy of previous
 mtd-utils version to meta-selftest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172934

On Mon, 7 Nov 2022 at 19:26, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Nov 7, 2022 at 6:56 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > The latest version update eliminated all custom patches, and the selftest
> > expects them.
> >
>
> interesting, is it used for testing the patching mechanism during selftest ?
> in that case it might be possible to use package which has a sticky
> patch instead.
> we can avoid maintaining another recipe.

I don't think there's going to be much maintaining, it is used only
for testing devtool operations, and isn't actually built. There are
several other such recipes in meta-selftest.

Alex


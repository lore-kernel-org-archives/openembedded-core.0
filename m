Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D81C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 17:25:42 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.37291.1644859541276104503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 09:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QVz9w1jT;
 spf=pass (domain: gmail.com, ip: 209.85.221.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id f12so1601989vkl.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 09:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivZ3YCx+QvoVFFomJReJaGg3o0CyfwFX8e3LqIZSsVw=;
        b=QVz9w1jTK/wKTCLAA4WL1W0vKzqSgdn5D7/y3cn1ubPR3sgXSeMVJEI6CuKhpZEKss
         rEMnABUiTnI10qsh6YE9txDEWMyvKveVBnOXf5SCoxr/9FeERdxexzPS+IS3X2Z4b3S3
         WsftViVDWc0H4fUnQDUU+DYF2q8b7prruHybZzSnzb9dL0YAdtSTGiEB5N0QBWx1Xbc+
         wP4IBOQKDT3hUSIIAWY8rGqVcIdzcZx8a2BJoIDYWjqMw3tBN4gwBW4qstO8LsxrXSjP
         fiGESB2ZxYukebfXsXEr1bcl8PKDl7hLwiHNFsXJpWX7Jk8DHsADs8KNnEnS57Fz0YuC
         kPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivZ3YCx+QvoVFFomJReJaGg3o0CyfwFX8e3LqIZSsVw=;
        b=ZVitMMN0fWjY3ZQJcEB4eZ4HtaMO3+Cmhr3S6yQpSx5dCn3wCGqd4UbDE78L7AES8Q
         PMipr2qurOXlsGpqGl0JAYPCNzajMhU2PPi4UewzPzY/2LXgU2e9YCo17Yu9RVmCRI9v
         g8lBieoetmPSlBiD0p9xo2OJFc9gTShzF6dm1Gi2wtWNCXQCFyfRfYn2l7E0C0VojdTo
         GdesYSlmsNnL6DpRtmPxo3JPtL5ro4cUY+BhxQzlgCpUjnlb1UWvIzkuHKQSSKzYi2qD
         RL1IzzpID72Ywp944jjCegyt0rj+d48FWzmIj8K9m8HE13viYI5aosBKBdhK9jgh8QZr
         BVVA==
X-Gm-Message-State: AOAM532EateSu1X34yYSAwNdO7Woko3J7ZJC6SMDIc6qZMUc3KKSYr4W
	Pm5okAClGpYzZ87xPXBvzl5+kAl7PjkG2dj7VnY=
X-Google-Smtp-Source: 
 ABdhPJzoeEi8yKAlMEGfPAaBD4KXuO8BYf3GTjvCWGrSXrbM3jef2tnPAzF80+Tg6Q4ETeWPpCXdmkceKuAAw8uPbAc=
X-Received: by 2002:a1f:ab56:: with SMTP id u83mr196423vke.30.1644859538918;
 Mon, 14 Feb 2022 09:25:38 -0800 (PST)
MIME-Version: 1.0
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220214154521.26905-5-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj8scA0wBen_qmXQEb1yD_hx806xGynxBwyJzqbyQCL-9A@mail.gmail.com>
 <942dc513-53b0-b774-f26f-088d46a758ec@weidmueller.com>
In-Reply-To: <942dc513-53b0-b774-f26f-088d46a758ec@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Feb 2022 18:25:27 +0100
Message-ID: 
 <CANNYZj_eb8E3QKG3tPOdzY-bhCm8P3fwXP2ns9gX5tGmqCr4rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/5] selftest: wic: Disable graphic of qemu
 to support WSL
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 17:25:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161728

On Mon, 14 Feb 2022 at 18:12, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> Am 14.02.2022 um 17:28 schrieb Alexander Kanavin:
> > This fixes one location where the problem can occur in selftests, but
> > what about all the others?
>
> Other tests like efibootpartition, gcc, glibc or runqemu already set
> nographic.

Yes, some of them do. Others do not, here's a complete list:
[ak@localhost meta]$ grep -ilr "with runqemu" lib/oeqa/selftest/cases
lib/oeqa/selftest/cases/gcc.py
lib/oeqa/selftest/cases/runqemu.py
lib/oeqa/selftest/cases/efibootpartition.py
lib/oeqa/selftest/cases/package.py
lib/oeqa/selftest/cases/wic.py
lib/oeqa/selftest/cases/devtool.py
lib/oeqa/selftest/cases/imagefeatures.py
lib/oeqa/selftest/cases/overlayfs.py
lib/oeqa/selftest/cases/runtime_test.py


> > Generally, it is not selftest's job to ensure qemu can be started:
> Why selftest requires features which it doesn't need?

Selftest does not 'require' anything; it simply uses runqemu()'s
defaults. If the defaults aren't suitable, the right place to correct
them is runqemu() in lib/oeqa/utils/commands.py.

> The graphic support depends on the WSL version.

Yep, so please correct this in the right place, subject to actually
running in WSL version where nographic is required.

Alex


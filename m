Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C28C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 09:58:10 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.66086.1701683885600964884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 01:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CLSBnUYT;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c9f572c4c5so21038231fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683884; x=1702288684; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IoIbWGFLKkWK8nM81Ka9Wp+7TKMsDQCsIAmNwEE37dc=;
        b=CLSBnUYTGovX8Tyl2rZc4f+i15+5MMX/lsYy3bAACePKaz+6KqSgdouQaS2Dcugmh3
         xCmAiAKIArVTEyANIqtJtwKpWVsriKaR2ZhP4OoWhokc23kvzPAFjdid1DEtG3mpQzoJ
         Hiz5PXBlxK7XqGNXIVdbD4NPosiBEU3QwD7RoQHbhoZy4LEvmv0ErYybnPnzy50OJ6uV
         43lmKtE644WIYR9EdMkapWBA/HQIMJzSps1J7j5yC3kVuQqI3U08m803sFmNXSgWTnZO
         sCqEsLNzdr/4vmTZLVWcXVRT05qSfrpmvuO79OMwbntVlnEXrg/usWg8kiCoo3Y9/o6x
         fB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683884; x=1702288684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoIbWGFLKkWK8nM81Ka9Wp+7TKMsDQCsIAmNwEE37dc=;
        b=Ly7H62AsksLo0LEjT/XeC6doYJ5xtZB85VdZwldp/qdI+QauF/PSufvyJ+RkYRAKue
         BMRQQlalHX+lc4JdFU1oL8HGajfLf/fvkW6CZigbZGri08JjkLHQZTpIxWPS+yhZmqDz
         4DH2EptysEK8G/nb+aOJH2JM2nGA3GbvuYaZmDyxRPfgICj7drDydDsp8JkF2AckfiG9
         O4jJS32v4fTetJMt8a6eCWU8rHun0tUCPZ/qqgoF97H3zjLQo56sjx16KP7AnzBwXak5
         OI8Zg2JxknihfjhaynggoWaB7SHndZbvKCS/XOU7broU+/rmYRAC0DHEUTXh6JvR40Ac
         2h2g==
X-Gm-Message-State: AOJu0Yw9wwf0pByjXM9Y+Bh/3I+couIlW4y+A3pm+uVKSeP8mN/KmZFw
	29C2VKC6Xxq+7KTI0fER0hzHtNkGfzjhCFUcnJc=
X-Google-Smtp-Source: AGHT+IEnZURSuDwMRr0Qc+xWAzd0n6ozrwMpYs9RGdModjfx4eS+ozbDSShHwdTYspzlCCIvBAFo0bx6jP7ZbJAXul4=
X-Received: by 2002:a2e:9dda:0:b0:2c9:f25d:8a9c with SMTP id
 x26-20020a2e9dda000000b002c9f25d8a9cmr1566256ljj.24.1701683883441; Mon, 04
 Dec 2023 01:58:03 -0800 (PST)
MIME-Version: 1.0
References: <0101018c30874843-c31eae1e-0aa2-41f0-832a-7c03e92ab619-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c30874843-c31eae1e-0aa2-41f0-832a-7c03e92ab619-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 10:57:52 +0100
Message-ID: <CANNYZj_ffhYrDfG+rcjG=UbokBa-pRw+zc4gxqK1Jv5Nwnhhkw@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [PATCH] tiff: Backport fixes for CVE-2023-6277
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 09:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191729

Is this a different patchtest issue to the one that was fixed?

Alex

On Sun, 3 Dec 2023 at 17:33, Patchtest
<patchtest@automation.yoctoproject.org> wrote:
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Tests failed for the patch, but the results log could not be processed due to excessive result line length.
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191718): https://lists.openembedded.org/g/openembedded-core/message/191718
> Mute This Topic: https://lists.openembedded.org/mt/102954001/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


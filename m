Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDBECD4959
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 05:49:27 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.9646.1695275358669656604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 22:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmLJVSxp;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bffdf50212so8520491fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695275357; x=1695880157; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yq9MU02jXRs98eG9hiREeVqz+9NO/vNuKsa9nwyifJk=;
        b=XmLJVSxpWLDOgQLcIWT2JuAozpoxVho3KLaMQgHXzhHk2H9ABxRI5Ns/cGzF5+HDXZ
         oV9FRO9pr2V+9K5h+3K2hgBexngYPSqr3LZJVXCA+5MYgZUnATxj3UVVSiObOge5tOIM
         hVHFbm26+4Tw109aMWIgFrreyJcOHFqoiI0/Bz17wZPeyii2z0NuUjt5FGmx2Gxp4M0+
         nebtsY3fL/CyFMFow91QWC3Lcyv5oHW5lq6Tw3TAQMogfpXSO0UeBYSBpyMQsFlm1g/U
         0Fo9lRDl91XnY8yTcNucCW1NyedE1g/V2iSnxvO7agdIG5cLX1AXRwpbsTtuVYVAfGuM
         YAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695275357; x=1695880157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yq9MU02jXRs98eG9hiREeVqz+9NO/vNuKsa9nwyifJk=;
        b=gxctLlOq7ilakKnfEcWmDjapbVXlRKWcRl8f3Vsa5hHcOg68GT58q0YwemtDV1XBA0
         49MaXYMw0EX/KbjO3hnSBIKXW0TRA1ZQCHUeN3GIOWw1p9cKbbs8DWNO5HMV/V7ybAm8
         4u5r7dcGCqvdEDkTWFB2l0TzscDsHSZNQd7zCurK8aUvkM3ObrTZ4/X6N9pcWRRUZ4+w
         /AZExzYlKFDtNchmDOmPxVP9gspSN8lNk8BBCmO8R50R62U89HdLrDPEbcPbsAGut94P
         oSGHj7llrRSCVKH6i+wQAcQHLDXnSOX4lzMswSQW4KKR7BsYITVpzK8kfcOBmRoBUF9x
         4t6w==
X-Gm-Message-State: AOJu0YzthJGFCORm01LusCXKmAb1PyB5Wm5U13sNhOHKlJBns8BfKrZK
	GHKunQ7vohDPCMMGFmG7PjMaUNLTL6/Fqy45r1k=
X-Google-Smtp-Source: AGHT+IEkBsO3A7vGnLF/zV+aAf8SfHlhSfH4p35Q8or2RBdOU1xBCix9b9uzppunr9qYRI/RVhw0AKa5T7Oq41mX5Fc=
X-Received: by 2002:a05:651c:1034:b0:2be:3ca8:bdc9 with SMTP id
 w20-20020a05651c103400b002be3ca8bdc9mr3432502ljm.49.1695275356441; Wed, 20
 Sep 2023 22:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230921051435.1234043-1-kai.kang@windriver.com>
In-Reply-To: <20230921051435.1234043-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 07:49:05 +0200
Message-ID: <CANNYZj-zpfLCd-7W6LMf-PhOTRWZnCq_gGCMtNf-UT6r1ox1Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] adwaita-icon-theme: 43 -> 45.0
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 05:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187972

On Thu, 21 Sept 2023 at 07:14, Kai Kang <kai.kang@eng.windriver.com> wrote:
> -inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
> +inherit allarch gnomebase gtk-icon-cache meson

gnomebase inherits autotools by default via GNOMEBASEBUILDCLASS, so
that needs to be reset, and then inherit meson is redundant here.

> +               ${prefix}/share/licenses/adwaita-icon-theme \

This should probably go to ${PN}-doc?

I also got a fail here with the same update:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5795/steps/14/logs/stdio

This has potential to mess up sato icons, and that would fail QA
checks inside feature freeze and make RP grumpy, so we should probably
hold this update until after that. Or someone needs to verify that
sato still looks ok.

Alex


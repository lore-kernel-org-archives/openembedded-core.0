Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A54C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 08:23:47 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.22841.1659947017039853279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 01:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AtlBK8fj;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id l10so4436728lje.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Scr8dNlVf0YdfYmPPX6lAvWA/Q9v3QetfTQqTx2YiiQ=;
        b=AtlBK8fjOyF6JxzOhQRpVQIxfV7LpL5X2IKgXoJAa2UEWzcOrbQdwHV8gclfIaWy9Y
         83BJy/aH9JAaIM3qOv5WCX5aKv5ze0//RqmpsodKxIgxGjoAcHypdz1oJSJL//wceaZG
         k7iA8q5Hsd7kQlEYttBwGsIIaLVXZZn3kE32VzYL/gldNxbK3o6zZIeOMgTA+aNCFzfj
         0eyqnH6MBkQIU6ld2rgVG/lJNSo5VI+WaAg+ijddSrTDjipyUFjuRfvAn9FasMTK2RUe
         FtErAkg8AFY1nGKU1Z1hNDdxBeIR3AUp+XkcIZNL9n2dR7q1VhdXXUV8QASUAz07q0qT
         nj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Scr8dNlVf0YdfYmPPX6lAvWA/Q9v3QetfTQqTx2YiiQ=;
        b=bE1lADe4mcy3eNLrZ8UJjlTgvM+V9EZk4QExFkWgXqwwBiDXpQdkg81sbm9fFD9RaC
         LoFxrS/vFqjd8qdAAOQjF81FtYU3ZnSAyfIZaAno5S8EoGKidxPjdfBUBrR4egpcrOI5
         O4eJPmwq3xyWzztX8YEwJ4d61pF+bxDWqYgowIEasqRwx/+7tfuAYvccwMezv1NmrW/L
         pVGI3pAnKUYb2663WLxa4dstmAgTf4KFlnstKxRP/mGPCHBxSI92m00CED6yyRO2eJAQ
         Lzs5oUCT6CaEDbsUaXXU5k+4sP1oRmZlkNdt7+ws593ApxArUr33WbfcCHZ4QtejKl5v
         RjsA==
X-Gm-Message-State: ACgBeo3r1zo7URrMnqIB6L1pboYScU2yeULofzCkfrrp/V8wPF2fXnYw
	iGSTUWUcKMAJxMYUDIB5tKRNa8O4LB2W8QSNBNo=
X-Google-Smtp-Source: 
 AA6agR5UxZgNbgvF3nAQisoltX85JXZCBm+OOxe7v8E1PnYqQVK9o3dDXBa9mg25KNA7bQRTj0C8ujS9UswUlipiV8I=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr5135666lja.68.1659947015051; Mon, 08 Aug
 2022 01:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220808063843.3975130-1-alex@linutronix.de>
 <20220808063843.3975130-9-alex@linutronix.de>
 <5b490d3995e9290f4296a120870ad04c7be9d80a.camel@linuxfoundation.org>
In-Reply-To: 
 <5b490d3995e9290f4296a120870ad04c7be9d80a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 10:23:23 +0200
Message-ID: 
 <CANNYZj_E3pRsu_M=77WteJ2SaRufkwzO-zezDAS_CqYG2t6U_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/45] patchelf: update 0.14.5 -> 0.15.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 08:23:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169074

On Mon, 8 Aug 2022 at 09:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-08-08 at 08:38 +0200, Alexander Kanavin wrote:
> > Drop handle-read-only-files.patch: read only files should
> > be handled by making them writeable explicitly. See
> > the upstream discussion:
> > https://github.com/NixOS/patchelf/pull/89
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../patchelf/handle-read-only-files.patch     | 65 -------------------
> >  ...{patchelf_0.14.5.bb => patchelf_0.15.0.bb} |  6 +-
> >  2 files changed, 2 insertions(+), 69 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
> >  rename meta/recipes-devtools/patchelf/{patchelf_0.14.5.bb => patchelf_0.15.0.bb} (79%)
>
> patchelf is used by uninative and you have no idea the world of pain
> you're pushing onto others by dropping this one. It isn't as simple as
> you think due to the places patchelf is used. I don't remember the
> details, I do remember thinking along the lines of this patch and then
> changing my mind though.

Usage of patchelf in uninative seems to be contained in
uninative_changeinterp, which can be tweaked
to handle r/o files before invoking patchelf. Was it that all usages
of it need to be tweaked similarly?

In upgrades like these I only see what the autobuilder and the commit
history and the patch header say. I can restore and rebase the patch,
but it would benefit from a better explanation.

Alex


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC21C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 11:32:49 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.115521.1669635166478650838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 03:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZZsc6Y+m;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id d3so12795413ljl.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 03:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNjdeDKrVGtz9DaHiAB7mxmkkwawTpmFajaSp42G4BM=;
        b=ZZsc6Y+m/BHlXsGX0a1rVWZVp7R7jsKtPnynp8+gLFgzKhRtRycbz0hRnQpi+HO0pD
         +gKUiYjdiZAb9ZxcPrMVZymQGpcaof3EPV8MKje8ar6Lj6AwqZBds51noCr/5PFew76m
         SMx0Ukx/8fKSPrh8jc//RpERTH6G3Ows9F1mS2eFfrUqtFTjwXagGGgZgV0fqtVqZMNF
         /fEkVyX3DwWEnfe5b3dRAuUTYZuOt2ZTVSPtfKTm/QSGOGYp/Jsp+p0S6io+uWOwt9XE
         LqMvmLyx8YAUA/PGdsqqi4+493p4GSLVcXWGL+bpC8h3ZLcyNCPt8KQ0K3sC6TpVUaR3
         BDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNjdeDKrVGtz9DaHiAB7mxmkkwawTpmFajaSp42G4BM=;
        b=1NbVa8wtD+uTW81iSyMpBoAc25Lm3wRhITq29hv/J70pqmzSct2j8dyxQ8MrPD9iuo
         3LB382+TpELU1eUEzy2Q+Mnh3/NxOS0S9I+xL3zbwpuf+mq98M86Ez6Dt0jFYa33V1E5
         io3zq36jGCYaKkaMsCoOMCsLSggkwb4fC3BNvJdiSyuzgaCUq/5an/knDhvWf3nWJIEU
         ecNNgsHS1xa7K4Qw516KZBSfWIkWHYqhIpXBkCVBVNW+HGG77/HDXfj2cQJ5qQKcJpgD
         9YvkUwel0G70Cg1Gand63DxgMfgfwmzHrnM63ZNh8GiIxdWuivPTa9vqd4lJsb9fm6xz
         Oatg==
X-Gm-Message-State: ANoB5pnVXsRziR5ni70w1UAomlxP5WqFD1nMgO54JkNKKhD3yguk3IO9
	EkDs/fxYpbdn44ZkMXPGkdGv5Ya33oLs8FyVbZY=
X-Google-Smtp-Source: AA0mqf5MYgQq45G2E8dNPdQjwZPv0GGOdMyA0Jm+P9Khn2udbYRgIXcHOFoNI6i35xrg8F42hRI2VyFFJ/gfUlfEXsc=
X-Received: by 2002:a05:651c:c8f:b0:26d:d196:d04 with SMTP id
 bz15-20020a05651c0c8f00b0026dd1960d04mr16908217ljb.403.1669635164856; Mon, 28
 Nov 2022 03:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20221128112232.123025-1-f_l_k@t-online.de> <172BBC1E4D879E7E.11309@lists.openembedded.org>
In-Reply-To: <172BBC1E4D879E7E.11309@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 12:32:33 +0100
Message-ID: <CANNYZj-+Obq_V6NmFJenpyDP0RCwAoQupwtwnsa3Dr3ZCkbZpA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: alex.kanavin@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173909

Ah is it the same issue? Then please backport.
https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/114

Alex

On Mon, 28 Nov 2022 at 12:28, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 28 Nov 2022 at 12:22, Markus Volk <f_l_k@t-online.de> wrote:
>
> > +do_configure:prepend() {
> > +    sed -i "s|ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).full_path()|ssh_add_path = '${bindir}/ssh-add'|" ${S}/meson.build
> > +    sed -i "s|ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).full_path()|ssh_agent_path = '${bindir}/ssh-agent'|" ${S}/meson.build
> > +}
>
> This needs to be explained. And we need to find a better way to do it,
> preferably one that is acceptable upstream.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173908): https://lists.openembedded.org/g/openembedded-core/message/173908
> Mute This Topic: https://lists.openembedded.org/mt/95287600/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


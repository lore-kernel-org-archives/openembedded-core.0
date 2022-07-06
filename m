Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4DFC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:11:18 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.27.1657141872794749240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=md9zEulX;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z25so10371446lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ApScPiLv8bMpA67geSyhGhTxf5S8UHFim4gYF/9BU+A=;
        b=md9zEulXNzlzZA3/oE5/Gn0VqDjKD0xoH/3lJIE2sSxqMNefc3XpMj9sfYK5wXMENC
         tmJkJcZSbkxrxj88/E+vz3VPuN87KU6w8L9hIIA3bFB+nPyiBKx3rC4phJnzVR3pj25f
         JpopdworMG4a/bo9G3vFarqm0R4sSXdnHHmnoCCwDPtq1Oe3XlqB84x7PalUHIu/l2LP
         JY0NfLXGfotmsueNqS5jhgQxIAwDoSBGc+Cao2fdcx2VbzzG66XzNPHGUJt0lPk4MByY
         ZGZZlakPkKGdy+cAlJHlDKv+nGeh07o7DNZov/Z6sapnWsVxHcKeBmcis6yn53j9Yxyk
         PKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ApScPiLv8bMpA67geSyhGhTxf5S8UHFim4gYF/9BU+A=;
        b=nKq09mzq1i0AoiuVqhk+njou5AbXVrFzO6ob6kjlaE0rdYvYLAhhL9KsIA5bLb27R1
         ngY+9lxRr6lBThvqV2PD+oq3XViYD3mwVHXYgneOeHBEOsG1NEXSwt5b1p/Y4wK+CHhY
         DxZLfQVkom+JronPxzFg5d1t5dVTygR3INJwdJYvNa3iss6COa67X3a+bCdzxhPm0Lhc
         79hHIrmqaBlNeHdIQo2AU3Z2caTz6WIx7KaxUh+fNb+LrQCMmR90XJWiIsVASCF9Y/XJ
         gmk8uEeeXxPCPlU0yasoV0JPDWDtG+V90jIkdwXM5DkYDi1q/Xt4IRwmA1KppOTzpZwt
         XBPQ==
X-Gm-Message-State: AJIora83N/UvqylH12U9TX7uDW/Y1Pas53/qrUE41CFjxFF5/UD4+bA7
	OxtvB35JA80nUBYmGIyNtnAu/Ultx+7bzZ4RZcg=
X-Google-Smtp-Source: 
 AGRyM1t/9lbv+JR2ER/iirCBJACrw9Q/JfD/1YNZ/1jXj9OcJmankqi1DKQRynhUlXebz8Ajl+W+I+czf5RQxcd41Ow=
X-Received: by 2002:a05:6512:3b21:b0:47f:665a:bf50 with SMTP id
 f33-20020a0565123b2100b0047f665abf50mr28071203lfv.673.1657141871007; Wed, 06
 Jul 2022 14:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
In-Reply-To: <20220706195311.974830-1-JPEWhacker@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jul 2022 23:10:59 +0200
Message-ID: 
 <CANNYZj9RJP67u40+OmHD8u6Oykah7WUhpSOwgABis_EsFQtzeQ@mail.gmail.com>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:11:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167748

On Wed, 6 Jul 2022 at 21:54, Joshua Watt <JPEWhacker@gmail.com> wrote:
>  $ python3 -m pip install jsonschema
>  $ jsonschema -i meta/lib/layers.example.json meta/lib/layers.schema.json

Since jsonschema is not a standard module, we need to think for a bit
about how and when validation should occur with tools available
directly in core. I would like it to happen every time json is
produced or (about to be) consumed, but then the module should be
coming from somewhere, either from the host or from a native recipe,
both look like not a great idea. Thoughts? Is this where 'oe-setup
installed via pip' approach starts to show benefits? :)

Alex


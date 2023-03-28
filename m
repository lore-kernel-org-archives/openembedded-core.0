Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1233CC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:27:55 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.61093.1679992073602415814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F+2hF5kA;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h11so7786718lfu.8
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 01:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EnnMO1f6N455GJv+OHlH8sSBbYOWtesOuRP9WA/mZ54=;
        b=F+2hF5kAJaWFwkqW1sfLftgNqchmGpAfdb5QbDuxJE8VYCaf8WLfXN9W8Xg6z6pmw2
         g/iBRf0BHraPeJZPA3ro0rHxYFcDXpg8199tVSb7yCyyAe4WdKiQE1DXT3ZMknlSYEYc
         f+Ps7QrXim4LpoAH68mqb2+SAtD+NdaRpYFSH20yWtINwcjwig4fKJ7vsXyH84DLPAYK
         fWuOV+o8J4l+hvJJkI6nasQWfBxp0cZkJQciHsXyJZeVUNCRvO25M+u75/orjFnufavv
         eiJeAmx/lvznGa0hmO0PfoDSqRkc/7RGrp56QNmoOt3/GeIFncQSi8D6zC3BZxP37G4j
         Mcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnnMO1f6N455GJv+OHlH8sSBbYOWtesOuRP9WA/mZ54=;
        b=WZLYPgM6u2+iHQmIikVaWs4yaGKjj4UP4JWE9dXObEyWPEF/VBjamqcPxVfaUyE9qc
         Z9d717sNQmhZ4pcjWHndumTJ0cPluvuRrkgAxR76os8tjPbuZIXH8AmJ+n5EEoA+SBGw
         QxNi2ttMXSRRKec34MMJfZDIXifpBGjHniAQBbytLfoC9Be1SgiZugx9EIzIgpiLsxHk
         jVvu2IjClvCdqPipA3I25OTv5qUUo6Zy6YeNPhsaBikyBWnCcQj3gT3hgLFXqFTGWgHS
         p+OHtHIhdh2o4U7sK3F7rEZVMu5rpd4zjSwX69U9/dFJdrUVdlGcmuhdNmHfMARHUzcy
         A8DA==
X-Gm-Message-State: AAQBX9evL1EGWVcPNDZvLLtPWovcRObhyBnMe61jdQrrxmUc+BUaZNUo
	F+wuycva6Uwypgi6f0BoHhYt+NQU/00MHJVAtfg=
X-Google-Smtp-Source: AKy350akD1Z+jhlAJUfYH69KA88EJs5XCerRQk5+1Tqe6OKu/a4aVV+19E3KMSq0QKlNfrKnwt+qM1OGrYvfwL4aIgY=
X-Received: by 2002:ac2:4884:0:b0:4e8:426d:123f with SMTP id
 x4-20020ac24884000000b004e8426d123fmr4334877lfc.11.1679992071441; Tue, 28 Mar
 2023 01:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230325004818.2784943-1-f_l_k@t-online.de> <20230325004818.2784943-6-f_l_k@t-online.de>
 <2023032714382786bc343b@mail.local> <dd874e52-dc20-813c-3211-62b70c1d210c@t-online.de>
In-Reply-To: <dd874e52-dc20-813c-3211-62b70c1d210c@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Mar 2023 10:27:40 +0200
Message-ID: <CANNYZj_x0esv-NGjaP4+7q=hjKy9sW8cQZA6BOSg87Vdmt_-oQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 6/7] epiphany: update 43.1 -> 44.0
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179210

We do want a real browser application in oe-core, and there's no
better choice than epiphany, even though it tends to pull in hard
dependencies that are sometimes questionable from 'lean build'
perspective.

If webkitgtk itself has an alternative in-tree, then epiphany can move
to meta-gnome.

Alex

On Tue, 28 Mar 2023 at 02:54, Markus Volk <f_l_k@t-online.de> wrote:
>
> libadwaita is a hard dependency for epiphany so it would be needed to
> import it from meta-gnome or to move  epiphany to meta-gnome
>
> https://gitlab.gnome.org/GNOME/epiphany/-/blob/44.0/meson.build#L78
>
>
> Am 27.03.23 um 16:38 schrieb Alexandre Belloni:
> > ERROR: Nothing PROVIDES 'libadwaita' (but /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-gnome/epiphany/epiphany_44.0.bb DEPENDS on or otherwise requires it). Close matches:
> >    libedit
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179192): https://lists.openembedded.org/g/openembedded-core/message/179192
> Mute This Topic: https://lists.openembedded.org/mt/97836713/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


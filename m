Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C331EC43219
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.31701.1650901963019942812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WgBvnpjl;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y32so26969332lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y945Ts8wq1CCgfW+vFJj3nr5Sfb0SMhB2Q2G9tjnmYQ=;
        b=WgBvnpjlQ7D2+/DeyhAVOGGlwNs4+vuAnyoRUkucM2VfTJz+wPIN8W1VnCQNFGJ4v6
         6yowhQRw6SVKH0vHAp7QJ0DKhNdkBN0RzGrn5ZSkjJMR6Vf1umJFJjqMVFWQ11HUWMt6
         Tp1q8530G/cCw+QsMmFRq0XyPicgStd9k6GblJw7nY7jCekw4bHjK58JJBVdPojbVX7n
         h8uXss5vCxbSYAW/9R/tAjQCPpjcCF3d2mmwjxDEpOMPadDopPI5RoO7uO0uBPOWSCA8
         8LcdJf7AddDelSa4Wp+eFcjGY7vKyvGM9KMA7ofU8KKHIQNHwa1e2hJijlPOPAuQlfTB
         AxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y945Ts8wq1CCgfW+vFJj3nr5Sfb0SMhB2Q2G9tjnmYQ=;
        b=MPVHacA4wJGF7+pqo5Bepan+Thj95jCQ2R9l9nEu49UeCscwt4zB3Q06eHOnZljuwu
         5izInUN8jOoCldzTqYx7scRiLVAcbiowPBpOsDt0gCf4W8XkwC5IbZh5vNQQkH9QxbH9
         Cwx+kbyw8wxIpH5Y/TTwXqQWXp9pZinnspuBjqEkw8hQeclQAZmG/sYpdVG3EedL/DVD
         CrnJxS9hxOmT0TzgTIO3OH0F6kJF/BhQ+FF3DJHUTPjGmpNJKTeMCYZQH2GhztBpYRBY
         L7m43IVf7goB0GUralu6ZdqUWr4xie+pX16GHGk3ACi+NiHd9VI0vChIVcBUGyHBSKjU
         dtQg==
X-Gm-Message-State: AOAM532tuTLpUKiTHmUrSC4R4Q5BkYqet40TvBFA3vkgewKQTcq7X2hd
	DMy10h0G4B6fEYA3MEVH64dIagu+kPB72Jgn+X0=
X-Google-Smtp-Source: 
 ABdhPJyBhq+vvUbeaYIvrCxBdUK8VJxMNPZ/xaY36Uczo9iY0ZvOX7jydZ8X2qbERUim5EI2A6n3l4SP3boS8xAfLXw=
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id
 b18-20020a056512305200b0047207f8f344mr3808662lfb.380.1650901961060; Mon, 25
 Apr 2022 08:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220425100533.101314-1-pgowda.cve@gmail.com>
 <12715f51-7013-d520-574c-c13774549e53@gmail.com>
In-Reply-To: <12715f51-7013-d520-574c-c13774549e53@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Apr 2022 17:52:29 +0200
Message-ID: 
 <CANNYZj-LgnwiS2UiSOwo-mKpaHtpoeJw5f6sBi4dOJoEOPcZ2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: update 1.59.0 -> 1.60.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Pgowda <pgowda.cve@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164833

On Mon, 25 Apr 2022 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
> > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > @@ -2,21 +2,21 @@
> >   ## snapshot info is taken from rust/src/stage0.txt
> >   ## TODO: find a way to add additional SRC_URIs based on the contents of an
> >   ##       earlier SRC_URI.
> > -RS_VERSION = "1.58.0"
> > -CARGO_VERSION = "1.58.0"
> > +RS_VERSION = "1.59.0"
> > +CARGO_VERSION = "1.59.0"
>
> why 1.59.0 ? its a bit counter-intuitive.

Rust is self-hosting and bootstraps itself with a pre-built previous
version of itself. Just like gcc. The exact (previous) version that
has been used is specified in the source tarball, here we just
replicate that info.

Alex


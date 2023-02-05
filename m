Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CE0C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:57:37 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.26671.1675594651414766968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Feb 2023 02:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IqN4ghYT;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id lu11so26813095ejb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 02:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ua/8mtRjMwntFUHcEDqKXNzCCsGMkGwtftiAyxXsUcM=;
        b=IqN4ghYTMaMwRFj+vs9VjZO7SPvX+wx/SS1/oMIb5L9zHZbF3uZNgaqM//WzK1LdYK
         zshrHeUb5JiRxJFEhsHYj6dbZwuxvaAW3ylOjlq8ioC50fe0pMIratXlHmOOdMDDuGAy
         aX50sclAMkok2t0eLfezkebIqQqRCl9gWk6NzWCn9zQtxMCK6PwvNfO9tySC0bfGwzEe
         0XYweGLMoPLNaK3PIXnKQTjar1MMcIb9KRNizSpAUOJC8cmO8Ht9LBtxwMX1Y6MVQRsL
         ofavoVKbzjCYsDRD6cHKIIechwZM1WSiJQ12jdwzTreMXTSdb0alUv3TBWD5qzQFsL97
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ua/8mtRjMwntFUHcEDqKXNzCCsGMkGwtftiAyxXsUcM=;
        b=pWY7i8yNyuZLBgC14Fs6G47iD7x0hcjMDZ/CQSn7mUDfeYnPeIjuUKFyh2RITkXoxH
         BsURE5reue2izcPKVqMYsbwaFmitJV7hv9E+cgjPhP9u6oSDX6v+0INAXwUzyWalcjjD
         fO8BYU/3Doq8ASVssXYsuvGxZcQVbYA5/ZvnwxSP+am+LceaAKzu9oD3YnjP93kY75Xu
         4OtrFrF49RdBgZdqi/H7cQVaHcekB/2Ls/djWmw9Izfo75xl/cwC37Ji/8aLO3+U/fgo
         qUWF1Y7/RsM8S5mpeccxdjjPLZjhz15F+XiT2D1NGxLAad/+2eqXZZur3WoYL7EWOHtI
         Zwog==
X-Gm-Message-State: AO0yUKUu3FtE3WwGphzR6Nx3ZCy79CyS52CB7ne1UHO1Z0F6EIjPml+E
	7XKLkXvX/pzWPHAik4i1BuZnK+iONR9K4EZ0nkM=
X-Google-Smtp-Source: AK7set/Pep5wSE/jq7jVUJOCz015c4lN2tsZSIJe8unQ2f89DjjMlLcKvV1uZ3Ftu6BiPaVMdEVmeZhKd6Ry5UyIlvM=
X-Received: by 2002:a17:906:5048:b0:88a:47d7:3c3a with SMTP id
 e8-20020a170906504800b0088a47d73c3amr4935704ejk.182.1675594649792; Sun, 05
 Feb 2023 02:57:29 -0800 (PST)
MIME-Version: 1.0
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
In-Reply-To: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 5 Feb 2023 05:08:38 -0600
Message-ID: <CAJdd5Ga11=ND7_5qqXjT7FHkEy4=RXdj-2Xa6RKFBe92QJ9phQ@mail.gmail.com>
Subject: Re: SPDX 3 and OE-core CycloneDX support
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 10:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176784

On Fri, Feb 3, 2023 at 12:26 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> Hey Josh,
>
> I have been roadmapping SBOM generation for NI's yocto distro and have a
> few open questions about the future of SPDX and the create-spdx bbclass.
> Since your name seems to be attached to both of those, I figure you
> might have the best insight here.
>
> Also posting to the OE-core ML so that this discussion can help other
> members.
>
>
> 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewrite
> of the spec, with more support for modern SBOM discussion topics like
> VEX and more comprehensive vulnerability tracking. And it also seems to
> me that the timeline for its release is very behind schedule [1], but
> still in active development. Can you give a SWAG for how close that new
> spec is to completion? Are we months away or years?

Our goal is to provide SPDX 3.0 with "example" SPDX 3.0 documents
before the initial release. This should benefit both projects, since
it means that we can give SPDX real examples of comprehensive SBoMs
before they release the 3.0 spec, and also means that Yocto project
SPDX output should be of high quality.

SPDX 3.0 is moving along and it's getting closer to release, but I
can't say exactly when the release will be. If you have serious
interest in this, I would recommend joining the SPDX meetings:
https://github.com/spdx/meetings/blob/main/README.md

>
> 2. If/when SPDX 3 support is released, is it to be assumed that the SPDX
> facilities in OE core are going to be upgraded to handle it?

Yes. We should have support for generating either the current SPDX
2.2, or SPDX 3.0

>
> 3. The rest of my org is interested in CycloneDX as our common SBOM
> format. Have there been any discussions about supporting CDX SBOMs in
> OE-core? Any blockers there; or is it something that my org could author
> and upstream if we decide to go that route?

As stated, we don't really think supporting CycloneDX is worth our
effort in the project. That effort would probably be better spent
making the conversion tools better.

There's not really any documentation why we made this choice, I just
decided to do it this way when I wrote the implementation. TBH I think
both formats are technically fine, but SPDX had an edge because of the
LF connection between the two projects. Gvien that there are
conversion tools between them, I wasn't really concerned that choosing
one format of the other would cause problems.

>
>
> [1] https://github.com/spdx/spdx-spec/milestone/3
>
>
> Appreciate the input,
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>


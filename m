Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A80C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 09:52:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.16695.1690278750918550040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ePf0DSZD;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so8122994e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 02:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690278749; x=1690883549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jTSARsWMsPzM233ssoKnlWHrGyadXdulx2+cO+6yBNo=;
        b=ePf0DSZDlqebxfaG/vl7+tGtj/Wjg4dhlph82Fr27fPYG3qA8QEZ/EADv8cYIS92g8
         DkhRTOpQ9btK6jnuFY9IyrHhq48u2aufWipzScsWsEcYiBmHwaEZ0j0B3BVk1xorGKaj
         bzs42p78rsWEbHfvdyQ7sOdZ2P5w8giQVcntARIGfuTXSHt/07O6CuKcDSiyF9RIJgcs
         pgMddd9aA1W+MstDSD2Tl2KJc7ox3J9MKm/daegC1PBw7bHpShnh4U7PvQMBmzK7LtPK
         9uH45oJ/lpo/p/QcwVIdzPT/ALnPMk2bc7kUHMWhTmRGRGRWJKdvNdOyWV6HpVr+ug1t
         DjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278749; x=1690883549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTSARsWMsPzM233ssoKnlWHrGyadXdulx2+cO+6yBNo=;
        b=OQ4y5MTecCUHHJc0uv8rUeAMp2JTo1acvS82qQbF+punQ26JBacalFLzlRhfw3QwIT
         hb6r7rVyLT9HG5LUiB1qW7HItNcDLlNV4eOgNBLibM7wJWmOQwtq8SDMFCfJ4BjZhjqF
         Vg1J+jwHmJjKXs5NyRosgnLKqwKdquugyxc27EIrQAEvFxf1nUehoboyrthLxeAi5WUB
         uYvyiBT3p9Xb90XOznUKEWv5Rf7S5gS8b4w/O3a9i7uuFmMhGro54/J7awAhvTdQ3TMt
         lbTkS9nWuQjg8UrnOzzSIUOb0YuYUIRRduX/cC8nOo6KL6v6uQPWXvkwZ23rmzQxNYMX
         aT8Q==
X-Gm-Message-State: ABy/qLYsdGpcHfOTF02/PcCzhQl5oGtLvPEPOkN1hMw1DLu+5ZnBkbiQ
	z3XC8KZFTaTye5s0isYdWE3yyG1kT7psk2N/b9s=
X-Google-Smtp-Source: APBJJlGRTLZyPSv4TiCS3bMDLCet4sFzcMmzfkV3vti3fmCnkbZe6/vHTwteJTwlvpPRqJ341enyz5efGRUd7+TQLpU=
X-Received: by 2002:a2e:b712:0:b0:2b6:da64:734f with SMTP id
 j18-20020a2eb712000000b002b6da64734fmr8174438ljo.47.1690278748958; Tue, 25
 Jul 2023 02:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
In-Reply-To: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jul 2023 11:52:17 +0200
Message-ID: <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Andreas <rehn.andreas86@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184828

On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com> wrote:
> i encountered issues with the new poky release on dunfell.
> explicitly linux-firmware: commit hash a04b507d39d668a02b7ebd990c94194cde16bf2f
>
> i building dunfell images since 1,5 years and my images are normaly 1,9 GB big.
> however since Sunday 23.07, the image size increases by 1GB due to the full firmware installation.
>
> i double checked it with the previous commit 0bf993da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expected.
>
> i hope someone is able to help, because this is an unexpected behavior.
>
> PS: this my first post so please have mercy on me. :)

Can you enable buildhistory as described in
https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
then build linux-firmware before and after the change, then run
buildhistory-diff? That should highlight where the size increase come
from in its packaging.

You can also manually inspect linux-firmware's ${WORKDIR}/packages-spit/.

Alex


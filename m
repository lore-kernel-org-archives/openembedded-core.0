Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFF4C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:26:58 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.44585.1684312016002755160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=D8fEQzgu;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ac88d9edf3so3605491fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684312014; x=1686904014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wFbAVDFpKMfXFfitRZ25s/NT3MuBqQo/Q7whmXVgqlk=;
        b=D8fEQzguzKOlLKA+a9Oe50OPau/o8sKIN42hZy1s6RIf+5EsBo/3GrhcxbzKdfWFPZ
         MxDlSP4H9FozO88VAtsDNguy5SOYflftHZDgTSLtysJbvVbYjFUm9Z0fypq/+JXj7ZN/
         H3NrcQNwru5UaLIX7Mzo/jD1Guy3rZ/Wg2inf5v/1ES9kyaqlVgy9OgF3vnfk05vs9f1
         du2/p9nQV41ShPGlNUatLc5Ek3L0btShcgl1GsA6mC7levSjieCbeMV1M334L57K+xMX
         leyq6wkrYg9OHbUE3X5X1bbW2oBIJH02vDqwrKNNI0p6hvDPpVbErBqK05iwIvL0u4Pe
         wtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312014; x=1686904014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFbAVDFpKMfXFfitRZ25s/NT3MuBqQo/Q7whmXVgqlk=;
        b=JbPuBwo91BswB/lVO0gOk+r5fVFbSyjEbhIP+mEpfb07+vav53VouMev7+LiwhIq0i
         HfqrZQWAmr+3PvwpUdKgCIyZHsCJd/FWA9EQ8ymaZn56jXx/tHU+ARu5kbJ8cb8Ba5kZ
         caAlhWcP+x2DX+7wbIu94QhhmwRyr/d/lLeF1+HEYU0+mY0PlIOV3mNNMIx08tK3C4wl
         eSlefexJWCuxYz9L1ar5RL1IfKkBCyNRPIJbayk4+CenI8wqXqGwAAeDu9wb0hrVtSGU
         4d2jT9eKZQmqNajwOfFWI5pSpUt1eEvDUCRIH8ujSp33XHovGO/BzhxKweYuaeXslxPF
         n79A==
X-Gm-Message-State: AC+VfDx3hUX693jZT7/0+iKlupXqqKSU585RnXhrqHgZ25oObGUlB0Dr
	aofahDrq5ScBS+v5+v6lXJv5OUkS8TuhQLAHPwc=
X-Google-Smtp-Source: ACHHUZ4jJKseh+j+RoONdjoaUnSJOh5FB/WzsY5bexld9yWx1EGKs0tJZNdK56zsnfGAT8nIcxtuVfoi4sZEd7W0fxY=
X-Received: by 2002:a05:6512:21ab:b0:4ec:89d4:b586 with SMTP id
 c11-20020a05651221ab00b004ec89d4b586mr7441494lft.27.1684312013732; Wed, 17
 May 2023 01:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230517082146.578-1-florin.diaconescu009@gmail.com>
In-Reply-To: <20230517082146.578-1-florin.diaconescu009@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:26:41 +0200
Message-ID: <CANNYZj8T+P=QYHEaKufnEg+eza7Mee3h01f7x0Toyky_8OUT9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181474

Snapshots are not releases, but rather in-progress development work
towards the next release. If the goal is to fix a CVE, then you should
backport the patch.

As explained here:
https://invisible-island.net/ncurses/ncurses.faq.html#latest_version

Alex

On Wed, 17 May 2023 at 10:22, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> Latest patch in ncurses GitHub mirror
> Includes the fix for CVE-2023-29491, done in 6.4+20230408
>
> Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> ---
>  .../ncurses/{ncurses_6.4.bb => ncurses_6.4+20230514.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/ncurses/{ncurses_6.4.bb => ncurses_6.4+20230514.bb} (78%)
>
> diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
> similarity index 78%
> rename from meta/recipes-core/ncurses/ncurses_6.4.bb
> rename to meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
> index 166e30713c..44aaac3613 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.4.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
> @@ -6,10 +6,10 @@ SRC_URI += "file://0001-tic-hang.patch \
>             file://exit_prototype.patch \
>             "
>  # commit id corresponds to the revision in package version
> -SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
> +SRCREV = "b9f9d6304f6abd71a5fdbfd500a645e521edf8b6"
>  S = "${WORKDIR}/git"
>  EXTRA_OECONF += "--with-abi-version=5"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
>
>  # This is needed when using patchlevel versions like 6.1+20181013
> -#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
> +CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181473): https://lists.openembedded.org/g/openembedded-core/message/181473
> Mute This Topic: https://lists.openembedded.org/mt/98944133/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18C7C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:50:48 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.44795.1684313439968927724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BrOt4tZc;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f26f437b30so694462e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684313438; x=1686905438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wZJoDUkW5kZ7XVNgca1BuP6ZZK1O07BKGgheiWSr3rc=;
        b=BrOt4tZcAZ29ZqC2s+bvpOwxJmowGBYiBS2oEbJNuI15q8hxWri9HaUsIpgBtU9gu0
         aOFdXq4gMNlrA4lgIB/Nk0hQ68Vnpwwq7tWCUWOeBNvNz66DbtWzk47e9skL6mUHf+jE
         VibkQx9Or6cT3+oOnYLPpPfzU7kbMR4qOzN0nMOkM1l+TPGj1n9IJO1fhEtXqWj42wsy
         laAZvyn9TTyOPH5t8/afZZdktlRAfSeYnbEGRFO/hjwyingnfafDrJ22JNYLR0HQbTg/
         K4/bJkq20f4+1XhfTiB8Jwr83mdgXYIHyz/Xev0aWDNokXPn/W/V9LFS6mnQCb0wYA+l
         P1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684313438; x=1686905438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZJoDUkW5kZ7XVNgca1BuP6ZZK1O07BKGgheiWSr3rc=;
        b=XQRoyLbWQpBvEMvH9wz0QeLbAZ5yjwSnT6nWkooWkfSKOPCbB0OpRKEhECMOO1vVO0
         lKGK4EqfhE2UgOTHrHgYkPkvspYKswXxO4PLFyV7DGs+DjwU+lMoLBd1yN0oMnYeG3i2
         9BTUMDqP2RMwUGHf4ZFK0+DEdNvklGhzs5DRF1G7dFI2L2buIqCHw95gzeQTSXGL8UPG
         bPQA3B7mHeJijs6udeuHFAtLBM+NF6CnASeLQ64/hd1fsbBZI4KNLuto2hrFq8tiLy7Y
         P/2YOU4S3MCIImu3J65mRpalTEWJWsNOJ8dXs40svfyZOu97iyYfZpVbLTyQhce2nLOS
         PEzw==
X-Gm-Message-State: AC+VfDx6+deBolCb/1hAK83dFFrPxKbxxjHIEaOlbND9tDHKh6wqZOWL
	e1Qpd1Xp+Nt2JqX7tF3yEg7KJIOprV2/9PnSB/g=
X-Google-Smtp-Source: ACHHUZ7VQ2cG697mBr/WNNWXw4mEti3LsVFCSbEYFXxmPs1vINfRpAW0fVkYadaWd0uvhQMtob9zG880EZRmqRF+bow=
X-Received: by 2002:a05:6512:21c4:b0:4f3:80a3:b40a with SMTP id
 d4-20020a05651221c400b004f380a3b40amr3220307lft.69.1684313437899; Wed, 17 May
 2023 01:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8VfMO+15hTGtxEXK7uFZb+3_hP_fh9yoE_kD5RL0weTQ@mail.gmail.com>
 <22909.1684313164897477681@lists.openembedded.org>
In-Reply-To: <22909.1684313164897477681@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:50:26 +0200
Message-ID: <CANNYZj9aZbX9Ftjy=3r7m2LdTqfO9joiNPpQjcOTj1xcSDK9QA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181481

This was back when it wasn't clear to us what ncurses snapshots are.
Somehow we thought they are bugfixes on top of a stable version. Now
it is clear that is not the case.

Alex

On Wed, 17 May 2023 at 10:46, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> What about this, then? Looks like it is commited by you:
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncurses?h=kirkstone&id=325fe5f68bc698f78f5c1a14407c0bbb4cba45f7
> Indeed, you were updating from a development snapshot to another development snapshot, but judging by the history of this recipe I thought that this was always the case.
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncurses?h=kirkstone&id=fdb2a95d5e0265de1172940b6dc71fc7d602e8d1
>
> If the standard policy is that, maybe the CVE_VERSION line should also be removed.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181480): https://lists.openembedded.org/g/openembedded-core/message/181480
> Mute This Topic: https://lists.openembedded.org/mt/98944133/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


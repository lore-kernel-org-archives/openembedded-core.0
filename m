Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4F8ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 09:26:48 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.4039.1663320401711482488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eiFzeCJy;
 spf=pass (domain: gmail.com, ip: 209.85.128.175,
 mailfrom: dbaryshkov@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3378303138bso252471137b3.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=qatQ66muNI/G5NbTfG1gZUwujc0q1jizuWk2teD0bqI=;
        b=eiFzeCJyhb7NRZ0vGhcbm0wy5VMcRDBKhvgW6hseUAYxKr+8eyozqA+a41GkzyxjkC
         XKBm6zoXLDpQwJyRxIumVb8JqkNMnqkFpakA4IwPrkNExf+FeEGZL50m6K3E9hKMEUsj
         Ky7LAfdwn/PAXKk2eOotYi/VTuQ5hx3YGQy1nlQgDb1UTlNdMFzR7HmrDochPxPZkSlH
         x/OwSCTwb/PREV+84ucapwzBNK0UeI3e8FsAYRIe6U+PBnueuukAxSBTHBtNjmh6f48R
         8oY7u8kPFHNVTjOyYN+ZTf27MWkubKJJuipvgSBl9xEVOdAW7YvwQaXMPOBGxAwiG/v6
         0K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qatQ66muNI/G5NbTfG1gZUwujc0q1jizuWk2teD0bqI=;
        b=SAHUCNh92lLh6PmCKpxKZbyH9Pi2RC6ibjMDL/6xVK6oabqwQ7z0HtVuWtjSENkDL6
         CU4W1zSoqlG7OJBx+v9cjZbBlZKCpB7R/ka8ef5jvbBxP5gIpw6KsaM71Wj5+LrAh+fl
         2IQX0hFDBO1Dh1HI1xgnokaP7ncUqBu0filNgH66kTGPRsDX2oGC+3DDUidWoVsxQ0ZX
         r7KKR7C24lMMmdHQdA1ighBHd0iPzT/3qizhEH1MYFefUvqxIhjM2M5JzV1W2tiUt9JC
         PrRRfugJHQZDThO5nv1QqGJEShkUPSvY1SGTtTApBDV0YBxJRepG+7ScG2xOU5g6zfqa
         5+oA==
X-Gm-Message-State: ACrzQf0lSPYSa+ULYhH0zML06rFn4kvelwsy35drqBf/hHhXiHljLFVV
	xuvesYJkXamgD0Ek5+4Z++p9esoBbTevi5PYHqs=
X-Google-Smtp-Source: 
 AMsMyM6ogIkVwAyGFbYXzPhNHvyK7vdmGRDcukqc/BrSyJ1VmDK1+g8atgG+XW7W311U4jiVADefLOsOyruZRm73L7Y=
X-Received: by 2002:a81:6756:0:b0:345:525e:38 with SMTP id
 b83-20020a816756000000b00345525e0038mr3594985ywc.47.1663320400815;
 Fri, 16 Sep 2022 02:26:40 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0101018341840303-0b2daec8-9d75-4213-9067-f3d9092f7bca-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018341840303-0b2daec8-9d75-4213-9067-f3d9092f7bca-000000@us-west-2.amazonses.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 16 Sep 2022 12:26:29 +0300
Message-ID: 
 <CALT56yP0sutR1zeU=H1Bs3M5zFnN0ZUJF-fLDw5LNsA+tegHeA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] linux-firmware: upgrading to 20220913 SUCCEEDED
To: Auto Upgrade Helper <auh@yoctoproject.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 09:26:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170784

Hi,

=D1=87=D1=82, 15 =D1=81=D0=B5=D0=BD=D1=82. 2022 =D0=B3. =D0=B2 17:19, Auto =
Upgrade Helper <auh@yoctoproject.org>:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *linux-firmware* to *202=
20913* has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-linux-firmware-upgrade-20220708-202209=
13.patch

Note, the patch again rewrites the LIC_FILES_CHKSUM, which results in
dropping the separate WHENCE_CHECKSUM variable.
Can we please teach the autoupgrader to handle such cases and to keep
the LIC_FILES_CHKSUM if it contains anything other than the raw value?

>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.


--=20
With best wishes
Dmitry


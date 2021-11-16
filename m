Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FBBC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 22:11:25 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.411.1637100684364789866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 14:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=d1cFQ8ii;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id p4so455285qkm.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8TGkc6aDs3fdk6xhFRjImxPguNRmLAR/FtjtXdV+A3Q=;
        b=d1cFQ8iiJFV22dLFELKaYVBM2drx6X9qZiV8/yzN0QVd2Npcw9Fu1tAqX/wqQx308H
         b4UTTwKa3AWK8zWZbSWORLnqJBqLPXmBrFRBg85OWIvXOLsgo+bCgbwLYqcjT89IFneJ
         ZYPaTxJpvB8llduOm/FguTAvgGFi+T3TijU/L2Qdn3PFABbHU83zS1wuj4eNGuF+zaSQ
         bOsX49fxLMe/ijaTqeo3NGyBxPwHdYlCK5952D+ifwc/g+ZVF+PlpL97PlXc7+BKTjpX
         ngwkFIbp0Ed1QKGGWbiHMXkfxpunPU7PT90DTRqlKFxhIsgqT1nI5MlLfyuj2ZInyHYK
         lIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8TGkc6aDs3fdk6xhFRjImxPguNRmLAR/FtjtXdV+A3Q=;
        b=3fVBplEePspMLn+fbl8oj7hPf33wktQ77P6Y4DZGIItQuALMyZljuRdESnKo+Udbyk
         vJzbFabNWpEkByPqKudQtagmcdTWb2B9xtWQDeusSyguM1hm3dkY+1X/wBtASgQjvfQg
         suV4uSYq2VSaJKmry00CtC3Cx+PJNNADO9hB1ak7XpGTPULplU6Rotr5vMM5qkSPa1vF
         26M9fe9NZuh7vqG6IErHBMv1xUO6CC+SF4+1Diem1p9G4n6ehXzsx0jkELejAxKjGHw+
         hOIJuLvNUd1sB5NKyYYY/ppwGZGRVsTsDA4RwtVm+HTyVj3LWnMQqVTohe4aoyzduhZH
         u8pQ==
X-Gm-Message-State: AOAM533oBlcU4hXKwtBxQzq+5LSMOKt5hXVtSqzJhyyZE7RWbyjJPOgi
	7boRlRISBemtoUXH/6ta3XUgD/IIstxiJ1wm8yi7UA==
X-Google-Smtp-Source: 
 ABdhPJyK31tcLs7DiH8XLpAdKORE/AgmgSgO2am0qeiaSD2W2EExfuF/QuelfM+SmhFUYFJKTyh1keIIph/xG/zL7MM=
X-Received: by 2002:a37:6254:: with SMTP id w81mr9064152qkb.391.1637100683348;
 Tue, 16 Nov 2021 14:11:23 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 16 Nov 2021 17:11:12 -0500
Message-ID: 
 <CAPoiz9yohGUzG-UA0BHQw_BS+eme4CFqYm17Oduo84GCS0X5zg@mail.gmail.com>
Subject: OpenEmbedded Developer Virtual Meeting (OEDVM) December 2021
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 22:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158373

There will be an OpenEmbedded Developer Virtual Meeting (OEDVM) held
on Friday, 03 December 2021.  This will be the day after the Yocto
Project=C2=AE Summit 2021.11 concludes.  The scheduled time will match the
YP Summit's start at 12 UTC/7AM Eastern, and run until 20 UTC/3PM (or
earlier if we run out of topics, but then will most likely turn into a
happy hour).

The event has been added to the OE Calendar
https://www.openembedded.org/wiki/Calendar


We have added some topics that should be interesting to the larger audience=
 at:
https://www.openembedded.org/wiki/OEDVM_Nov_2021

We are looking for "moderators" for the currently listed topics.  This
entails helping to get the discussion started by presenting 1-5 slides
on the topic and problems currently being experienced.

If you do not see something listed you would like to discuss, please
add it and put yourself as the "moderator" (and a rough time estimate
for discussion).

As always, if you are not an OpenEmbedded Member (but are interested
in joining), please attend OEDVM and you can be voted in.

If there are any questions, please feel free to email me and/or the
entire OE board (board@openembedded.org).

Thanks,
Jon


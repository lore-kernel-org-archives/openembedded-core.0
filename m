Return-Path: <arabishi900@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BE3C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 10:11:41 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.7375.1634811095034184727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 03:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iX9k7vic;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: arabishi900@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id g17so5584638qtk.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=B8fXCwTSsluW50WGchsM5T1PxAXibohQC1hDiJndt0Y=;
        b=iX9k7vic8cPbHB9IyKoA1ZOzWRk3NzLGcrnkxGuDaOd/ULhc75413LrkqKYIJV+kdA
         6SzrKbXsx43OU5DLT1l8MfXGoK/8lDZdMZu5Pk1RmkKp9byqAPvNBr+kETk0ElT2pDx7
         O0d6IUeVXQHNHfpIbv5xZfidMgGFVDx85Oaw9oGBvNYIgU6T/mle/MuuaUILSKchC+pv
         RmacPUE+VpthXoOw4TEtzrSYu9wsb6H3f/ZOxXdLSkyowBfqS/epGwo4cLVBq6WqN010
         dmCQOfQQqeP6wRYsqKC8RJsPl7vGOVzUDasl+VaUoLOu5I8zv2E9mEnAaPMAVM//zXV7
         nfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=B8fXCwTSsluW50WGchsM5T1PxAXibohQC1hDiJndt0Y=;
        b=vWZaJjpO0n0JwlLmaRtISf4n6k3A4KotLulTxNmp4JORgwWfUGBjrJbnNzyOffQI2h
         rMfoPI3RxJOr7oH1xejWG5GilNDGfu8M/aHmYkBnxvamI25EVgtyKfxchEJ7zQTJMZsD
         MIbdSijI+gW4twj0hzugtmHbfRFb2lppXQ0XZgwCEdfpL5I7g3OTDU3oLl7jPkzPk8yq
         c1y7rg5VLSO74BVmg844ybCuU3BqJTzCIivorn2wdfPy3M7i5zKymtSzi46lsI6w+0W6
         BPbKs2AEFKbqTWTPJTVSQibRsdroaSExu2Smg+5pjRP/hEafbzgvf3mvQ5FOGmrnEK/+
         pYbA==
X-Gm-Message-State: AOAM531+zGsdQmrzSLkurLDe9MB5NuGd0jj41y/mCvIOTijAjbr/89nD
	NomH0cFnqU2zmeetMIZsGPpmOWoDhpKUynir5iGWAElO81w=
X-Google-Smtp-Source: 
 ABdhPJzrf/syibtgujZnb4uWBe9+GJYOjWbNdxY3kIw2Z7XFNbRafIrndaaenHg/bL59xkEcYbUOLRGVfpX0nWfMSLM=
X-Received: by 2002:ac8:5c92:: with SMTP id r18mr4767358qta.341.1634811094103;
 Thu, 21 Oct 2021 03:11:34 -0700 (PDT)
MIME-Version: 1.0
From: Akira Shibakawa <arabishi900@gmail.com>
Date: Thu, 21 Oct 2021 19:11:23 +0900
Message-ID: 
 <CAE84iWU4=MKr2VK5aK2bZrY_q2xaaX-fVsD=7Z7p6F8NhawrDQ@mail.gmail.com>
Subject: [meta-java] why openjdk-8-native is need to build openjdk-8 ?
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 10:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157279

Hi.
I have a question about openjdk-8 recipe.

openjdk-8 seems to be built using openjdk-8-native as boot JDK.
And the openjdk-8-native seems to be built using icedtea7 as boot JDK.

Why openjdk-8-native is need to build openjdk-8 ?
Isn't it simpler to build openjdk-8 using icedtea7 as boot JDK?

regards


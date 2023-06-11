Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1C5C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 20:44:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.44268.1686516243449940292
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 13:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Jo4bIFM8;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso5526572a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686516242; x=1689108242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c/WcgNcJPTmfufEBj/tAlAl4a76lKsSD2NwXWNqGweM=;
        b=Jo4bIFM8WucUaeOkbGeE68qIJVwkc22ZTpd5nxTlBAmoHSTp8aNQiYh5CaQAauTL4p
         pTbucebeCMEDzMbHaJoiPiyj8ZI/QqvbUJVDCmXrcqfM+1/+v+i9o8Q30oIsiqF0PuKE
         mbglSGpqyiH5h8MI4I0ZRfTr34BsZridjBT88aSAKp1+YbAeyG90/j9HKY/yahuSXZuT
         S/AWcHQ4WvJ98aBW9KggkR6SbcgaOkpx8lDyxxyuY/WGPx59MX2KUbPwFiU4bF0BSJaB
         8JwAGtGh08DQ/hwSJUpjnsl5I08Q5zqdeNyu8SvfUvfq3P7s89+kcCD5bW+3d+eFLec8
         lYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686516242; x=1689108242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/WcgNcJPTmfufEBj/tAlAl4a76lKsSD2NwXWNqGweM=;
        b=JNwZOPtlKkwpAz0KSYRFuGAa/xv6LlKIXVG0asEnDZJmo+8hzcMAplfr7aBMm1PP34
         Vk+pky1fxdXffDBmtOGolj807clwl70Ob1+0SPb0hiJUxjJh11pul3YnSJ+JhNh+3zWP
         VHYgSc5EnB1DtB6IkSw7olFbE40mA1lYb5y1MyiFMeagp7f1k//ZkAj4M1vyJ4q36ySs
         i4RLdC4TJlPMWUjjDz3Pk4cUFJXpl9ySkwrZ5YfTZuVRmm4clpmVhDFQteTTSfQExEh+
         ANUZ0o8MstoTTUOcguPxKe3isWAG1GDpcVnie/kDqWVNyjen/htsszzsm5cJ5dIoh/q0
         plrw==
X-Gm-Message-State: AC+VfDxwF3IsGUYiSiqId9Ijeiv37M0mwl6oeCPdqCdrUE+GtYvfaH7m
	loa2f4cvfDOBFLfvzQET8u3wzATnXIjBHPXQgg8=
X-Google-Smtp-Source: ACHHUZ7Q3AliFyR8Uzr9y4FglOfGRHqdCxKMogZy4gkq3nfnApASvSt/yXiK4djVS86QakGW2MzwQtCMQ+j99dCrTP0=
X-Received: by 2002:a05:6402:160d:b0:50b:f929:c6d3 with SMTP id
 f13-20020a056402160d00b0050bf929c6d3mr3720801edv.1.1686516241669; Sun, 11 Jun
 2023 13:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230602213452.23696-1-sudipm.mukherjee@gmail.com> <2023060712341407b7c7f8@mail.local>
In-Reply-To: <2023060712341407b7c7f8@mail.local>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 11 Jun 2023 21:43:25 +0100
Message-ID: <CADVatmPhiTCfdDVZoNFv4x0f9vLi--sDpk1rbmbkk8=JuQQ+sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libssh2: Upgrade to v1.11.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 20:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182639

On Wed, 7 Jun 2023 at 13:34, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> this doesn't build:

Thanks for testing.

Surprisingly the failure is only with poky and builds fine with
oe-core (which is where I tested).
I am checking it now.


-- 
Regards
Sudip


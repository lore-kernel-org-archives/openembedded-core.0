Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDEDC54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:11:43 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.40632.1710087102223289261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x5O0Klo6;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a0599f6e5so15914387b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710087101; x=1710691901; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4eFk4+iutXZDu7bb7ZH3LBVXfnbSvk05FDtshY41vJs=;
        b=x5O0Klo6Zb0OchJD1cQEVfo4+b+BuyDgrhQwzrI2dQb6fS31TaYHoW2daWE7364QZp
         GLx4Vz5mj/5TLCMGfnNN6sFO7TYkLtDp6m7Kcg8jN44ZbGj+kVaVIL3Z2LNFJsg8D4Ve
         llnf84VdMqc+W8jODQpfsBrDZSeYJ3fjdnuFxqliWIgXAafPVFPBm8vg0Yece/nvf0kd
         RrOBpH7u4xx1J3KQ0b7XaA9UzLIBD0x0Bema8aVFyzzAWLqv1DST7PbOqSGd9wB32kQe
         Y4WH8Ee9CgC3iRiKlO9vRWyZdSp7LuuJVMDExs2iOPDGitdiKMya700xfjf7fc7Ed8G8
         wtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710087101; x=1710691901;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4eFk4+iutXZDu7bb7ZH3LBVXfnbSvk05FDtshY41vJs=;
        b=ld9BP8kgaAPc0FrJgKRFDpbigE4Tgt7qQcDqc9WU1UIlSNiACeA67MuhPlwn5RVosl
         i9izFjeT02ujaHSCwRqSALtJEfH0gsxFIHc+1wSVXe3xvkJk9ZvE+PWnkja+zkgezdzv
         dXLy+hz1dxBxjU+7onBJ4rWpEmIVZ/+rg95mq68mKo5DI548ZLUgQGaVEgKcFVE27juO
         Z4B4Quv7bNin6dTklvi/+quD1GoOAevkQIvoDrbv/HmRp1/dbVcWTurlx3rXjqKP/JfF
         WVeh5z2hsr1GOmKS/FRTXhuiBUczdbaYBVrIg36kRQTYRX2v21TKqhIh9OLnt/Sny/qn
         GSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN9PxH8mezvyq49+Uu//T6avuXcZ1qPBRIoLrxJTeEZKuKmstTozbCnbVa6jb0sHHP4WK2jKzK/AezfHjvGhtGo7z0+9cyc1M7e/HBRj08llH+V+tzsJCE
X-Gm-Message-State: AOJu0YwTer5ILK5WI5nL9vV346HOcYn81XCJifMUC91Wz2CkxDBnzca5
	ot0ohqrwX5W3Ak6p0rQwAyQT6W1R0tCEZi22WwcTRUdp0bRoJmbUcoeW7yj7Zg/SX91wbkouS+I
	SlfArMfWo5Sp/0p5J2leS9/Lr9bu3GF6by7lxNaFXTZXNYw7/ni70kg==
X-Google-Smtp-Source: AGHT+IEubhpWBSPx7fKggvViUC/v65nkr2stNbLRMCYHoFGnz4TnxcK/XUeSEgfKIruPGS/J8tlpcKpsxo39lz5mBlY=
X-Received: by 2002:a81:a504:0:b0:60a:a94:6ef6 with SMTP id
 u4-20020a81a504000000b0060a0a946ef6mr4330386ywg.20.1710087101323; Sun, 10 Mar
 2024 09:11:41 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 10 Mar 2024 06:11:30 -1000
Message-ID: <CAOSpxdaa9X1ySRN2hgnqqEu1Hf34vTSaKGZayUaVxx09GSQOew@mail.gmail.com>
Subject: Final nanbield release build on March 25, 2024
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196900

If you have any patches you would like to submit for nanbield before
it goes EOL, please do so now!

I'll be taking patches until around March 18 in preparation for a
March 25 build.

Steve


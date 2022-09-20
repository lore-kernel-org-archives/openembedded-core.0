Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E691C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 17:07:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.14912.1663693635962742918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 10:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O9/n6no1;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id 13so7771582ejn.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 10:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=5hpGe+52wlU6vr6/FaYKOcaPyKWmk8Wop74FMOXL9cE=;
        b=O9/n6no1vA/tn4tXS+g7tthlejyXrmErE4YWPbRsE5zTRV4TStNXctPYKxn2cyJlUU
         WJcCX69Fd3FGdiMolcYOIm7x/8TedXqyK2sw02ksb+DG9Ly5GiGAor4tRz2do1jPgV1b
         M6qgvjZ0IRrJ54mU2WI5SW5JKAU9OqNsD80gNh/LrlPirzX/qIzFa3MP/X1mEWk8IVr+
         xi9zRinnPVF/OMoHnQq5Ong1PLEdSnw6fyIV0zN5SVT9ftYnwFds/AkJWIcq98dV0z1A
         uPdhfhR3EsdPeicJ04uESlpO27FDiHjK9B+aJQK0Xtg57Q1qTixbPpP4Mzr2fFIPq5nT
         ZD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=5hpGe+52wlU6vr6/FaYKOcaPyKWmk8Wop74FMOXL9cE=;
        b=cQXA2Jdd7eAs5/L6wd1d89CMY+CHlwY8Ct27556CnLAy1AKk8aaNjppbAz6yBMSiZ5
         0Zz+djq1bxCF2jLpmp0Xrteoq09O0spsQyH9ucxxs6Ynq6sYgiVVhD7alnj8YaTuwLab
         hyrIkT817ubQnxGdlgO6BJZ/xcqr96wTASgwv1zQKITzi/4zmUdpOI+yQAr8sERv5FiA
         gNq3ramjMN0PE8vmWFrX6r72+s7jL2aiyG6WdaE9wqp6lu3/r7h0znVVHE9H6fEhvMrH
         wMz+ZWA4J2lJ0zLyD3J4cG+hUh9v9uJtK8zaxlZ+7bAfJh8FA0fWCA/AhFQIA+lJRpwm
         /0+A==
X-Gm-Message-State: ACrzQf0U/15Mp0UrNDLapWJ27w0So1rTVGjes7fxKUy5frj+EunGJ6lt
	MeeSO3C9Q39cT40Sr1LejrRB2OLFipTO7gG3aoQbZhig
X-Google-Smtp-Source: 
 AMsMyM680dOmibJIWuWy1u93EM60fnLwPu4efUGWc+zo3MyiQZ6zYDNY2EyyEyORfDG7UjeGbrKOX2CZSaQHT/gmMnY=
X-Received: by 2002:a17:907:9626:b0:781:fd5a:c0fc with SMTP id
 gb38-20020a170907962600b00781fd5ac0fcmr308484ejc.718.1663693634004; Tue, 20
 Sep 2022 10:07:14 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 Sep 2022 18:07:02 +0100
Message-ID: 
 <CAO5Uq5TDQOobAdyLJHwkr-zvKn4RHgzR6OzHWg-y3b4zYVLyRQ@mail.gmail.com>
Subject: Upstream checks and github
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 17:07:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170904

It looks like something's changed in what github is returning on the
releases page which has broken `devtool latest-version` for recipes
which get their upstream data from that.

-- 
Alex Kiernan


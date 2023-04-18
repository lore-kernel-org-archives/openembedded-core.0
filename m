Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67322C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:18:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.14127.1681834677836596654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 09:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=elUVziFD;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so2633467a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 09:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681834676; x=1684426676;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N0eJ6Ylyr6WWKPTU86KvV0oAbohUk1zQmsvQEct5PKI=;
        b=elUVziFDEZK+qjQfVu2VEe4OG1nDe6MWJxMXcSYdCZqYI+KZBYdjCIsWFPRGu1QHZx
         iPVj8HRCuRkBCU2V1ZaoXGIRXUgC/MdH19XRK8TMk3JvfwFqG2v6AID/oLhF4qv79RKQ
         tkq2iGhIEPgufV+NrIomYtcgyHT3ZSp5ux40vIVIyjx+QHSeAADrp3+uKoQzymoTgL/X
         n2oHx5GApW5mdL0AWq3dFlUiZQpbCrkAttsqVAR7DZeotA3vwWmaaHc9If6lyskre3eV
         h13sMe9AYnurPWrh9B52BAiqyBex2Noh70lIfJR2N7PBPwLWM34I2WLQuQCItgRrslWo
         iqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681834676; x=1684426676;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0eJ6Ylyr6WWKPTU86KvV0oAbohUk1zQmsvQEct5PKI=;
        b=B7AKzurIX9IiaB17o+B+6zLOnqnTUW/zXlJ6jiD0LkhczuaOjZvwiYr3hicA3rf+5Q
         Q7AueJP4YFXzIiJKlknH4Z00SHwgxnimM8uwkdvuYdeeSQcp/pBWf1ynn9f8998xlv01
         J9ImvsFM31TjQvGI2KXFsA15VVjCKWV/Nf4JcHHzD0mROdymCZ+nbQWITIar9W2LZMwA
         O0sGTwN1DfeXlaRi594qaA5VIp2v62sZI7aLhvZMlGBWALrqbwvKU1/4hUg3P9LANn1W
         xL4SSaEvcPVgGqq7mi1WqoyA42HNPxMX2vbgLq9cqCO6pgS/6N4/xmmISvllXE3/JvEH
         696Q==
X-Gm-Message-State: AAQBX9fLkPyjcRzHSAJVwsU6mbv+zQiHyQFiwGU65N4DqRc+OsWwx3ix
	rYdLZyt/ykoSKmEvsIdrut5/QXNFkcF1qdj5AIPF7+RG3SyoKje7hmU=
X-Google-Smtp-Source: AKy350a4LvyQAqQPv2HsvHweYmAc4SJOY0qn/ysawGh6xqZbKCFptLSpVCm8tZfYXfc3W/aiCEYRbmFzBtDlShYYWMI=
X-Received: by 2002:a05:6402:3908:b0:506:beb3:e866 with SMTP id
 fe8-20020a056402390800b00506beb3e866mr1357035edb.0.1681834675875; Tue, 18 Apr
 2023 09:17:55 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Apr 2023 06:17:45 -1000
Message-ID: <CAOSpxdaLQn_AJa4PUFzxtL77jQHcdqBfTnxHRKmyRL-YRnG+Ag@mail.gmail.com>
Subject: Last call for langdale patches
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	bitbake-devel <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 16:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180196

The final langdale release build will occur on 2023/05/01

If you have any patches you'd like to get in before langdale support
ends, please submit them now!

Steve


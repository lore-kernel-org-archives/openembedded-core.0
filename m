Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26351C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 17:58:17 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.20745.1647799095608906343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ejwXu2Uz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id w4so15564748edc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=qLmDJ7iU9Ms3g3+BPKnXWUveitocoO8eGHxxhjfopgM=;
        b=ejwXu2Uz+CfXcUsMhvEnrwfsKEd4oGfvyXECC0MFq8cVHdA5YMv/32QKqH37lUJN10
         sgq6IBE5tRttmWmEdbwlZG2gIimrBsla/EDlYJ8VAjdd2WeHsAanVSCVlDdUf0P5nRAK
         /cKnY+Vp+a3rdyunpTbi2qCbXrMc2G873KiIP/C0zrHuTw1901pv6KUgkENMTKmqkybT
         +VfZ4WwN7jrcVWII332QXR1sPlFi+zl3kq5UkDtqEHMHNcLIRZdW9SlMrSFS5ffyQh5J
         iYL61Tb7zLb8yFeOTlkOQ/aleMUN+moyLxYIxPwjM+DpF7CJ4mh+o5BgYCI+s3EQWypZ
         qBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qLmDJ7iU9Ms3g3+BPKnXWUveitocoO8eGHxxhjfopgM=;
        b=zlq5AZM5Aah8RRPqSF/z9E6t7g2VWQG0n7FSO+ij0cFh2EYIKdwM8W6UBGc5cFggGT
         X+shat88szmtFtP6Z6scpJGwDjFQrBGcG63VFBpAy3gQnp6t0LKsiDGEb+cdfHGOEtJ6
         ozrDQwHKPdbx+mqh+ZJniKuBRg1ylXPjcBHpa7/6apHYiQ5to3QddGyH22K9MwhCWQFg
         z7mrkjd6TotPR+0KXsl30dp6D8YWPC5itFqeZgqBSJqolcN8CuEjDWaz5QDA2i6ng1y9
         2WyZLwkd31OmKlURI/J+tqvukgycYOvywRBO7NBoPF89jTR1JHxwmGtFSfRqDhTt04zR
         o4Xw==
X-Gm-Message-State: AOAM530CL78qI45FzuiJuuaFU/Zyi8UjwvkDivqt5lmpKZjj8J4Q2CIG
	X5K3a4/UhUAzDjv9kGdbzVfgRBT9TUChUXp7n/vxMFYwx4aFk6vH
X-Google-Smtp-Source: 
 ABdhPJzwDmMxSghtEholvft+AuAq908ZAwhbAoekHls6MN3FJIi4hJMD+zl773G9wvZvaO34yxj+5YD+bMnl660zvWo=
X-Received: by 2002:a05:6402:b15:b0:419:fb4:e2e4 with SMTP id
 bm21-20020a0564020b1500b004190fb4e2e4mr12131148edb.147.1647799093501; Sun, 20
 Mar 2022 10:58:13 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 20 Mar 2022 07:58:02 -1000
Message-ID: 
 <CAOSpxdadcVjtbbZJ_F7D4WqXx=d1ec5132btgSTWKr+TpdKSOw@mail.gmail.com>
Subject: CVE reports will be late this morning
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 17:58:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163481

Working though some email config issues, reports should be out shortly.

Steve


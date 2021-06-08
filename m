Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web09.13218.1623163033976424577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZOcdYyZJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so20505655oth.8
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s58jYnk4+geZWCr3zOlnvRfKtczdMoK8AIRYHv1ox0s=;
        b=ZOcdYyZJq2FXWM4CTuxTPqUeJnZ6JKvb+b1Kb7tp5BpTKr24iFmwtp0FleMta9aKz9
         sAWMAL+aySSNxOKVmtDGWlQBJjraayDUUccXfoBmP6N9UghXDNkhbPSjkbOAMUpe79Id
         NhkQ4Qby6WNrztZnwHz90tG1YE2FwvEJ/P9Dpx4kQVkvNPGabIHxKR+nNUEfChxdwHwH
         V43xjSb1hS0UpKcIpivjmQzYy0ORgd1IdicL5ZT7GNl5t9/GkB+IRb1BhjAJHaHlPIcW
         i3LXNNcqz6ekVR9ZDtvrazAo8dhaRU8GScmyPF1/GpbvB5uZXrvim6VAwzcjIRE2NyCa
         L8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s58jYnk4+geZWCr3zOlnvRfKtczdMoK8AIRYHv1ox0s=;
        b=bBAnwe4t7+p69DB/fTKXo9BaAE5hmV5560kyJpV21CGRPZpjUARHAQWdGNGoBM9+KV
         UzwhxbzLgh4HRruyLIP5cbAYW+11X9BV0LaZ5lxu5tjv25FrzKDwfs6XoZSpKvLYU7UF
         dwTdk4g/YnioE8qPvePdhmnncHN1EzmeOPgfhtMHTG8bcFjotJWBBd7zB0e9mf5xw09l
         K8ajVmbP80twgdeT+YTFkPkKujA4XxXy0ut9XfDkNLw3sVO6FTxdqptDj/l3zxSamYDZ
         XgzqCBZR1AY8LCSlCtShavoBuM9xrnAau47IJobCQxFjFCOu4+MEtw9oWSnh7dlDlhmI
         cIpg==
X-Gm-Message-State: AOAM532ZTl7lWcCIXC/tVSWkNMY3XFYTwOlmTGKL0RX/VHDgBPV81rPa
	zxt8eqUXqoYO0/ZIezKDptjgqQnLHbiEz/ymeM4=
X-Google-Smtp-Source: ABdhPJy/6vAJYjFkCQMy9T6elUQkkkXU5MUetfzTr/7QRBB26uU24ojnH5qUwa2u5kLRQfYGM/IBMw==
X-Received: by 2002:a9d:65:: with SMTP id 92mr17736397ota.239.1623163032486;
        Tue, 08 Jun 2021 07:37:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 184sm1354511ooi.3.2021.06.08.07.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:37:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/1] Pull request (cover letter only)
Date: Tue,  8 Jun 2021 04:36:47 -1000
Message-Id: <cover.1623162901.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e990a9ec5d6eaf2c328d61c4de73ea6c270cfa15.

Patch not in master, erroneously applied

The following changes since commit b48cfe9148e8f9bbc942899455215e8f9c8e2728:

  linux-firmware: upgrade 20210315 -> 20210511 (2021-05-31 05:30:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Steve Sakoman (1):
  Revert "busybox: make busybox's syslog.cfg depend on
    VIRTUAL-RUNTIME_base-utils-syslog"

 meta/recipes-core/busybox/busybox_1.31.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


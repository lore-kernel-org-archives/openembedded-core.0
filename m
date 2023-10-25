Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8256C25B48
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 02:29:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.165468.1698200977342602347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 19:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lIvD4RfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-27d2b814912so3609280a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698200976; x=1698805776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MpxKVEqpeOcCuSsAHgUrhf/Y4tTL2LI97d4nzEoGKeg=;
        b=lIvD4RfQ+SA/sjZoWKFudK1WEpKDVhPJfH/OWaE9srsBDnvhwZqBMjrLvvPWIIMdR1
         pX1Cw+5bcnl1Jd1r3KWvQ3ZsXsMBMjNfZIm/UDuakihhyfjJSCJdN8kyRseofX8Vx4/I
         FsMwEJKBQh5saThvLHTfaC9FDP614aZU1LG2J3U0U8AXYcceDvarYxd6ZU78QbTXVvfk
         ulwNT141rxHXlUcwBTlG33SGJNnYpYIs22QNabb4/GO9sYaBNEaSmvtKYOKraIKcr1Iw
         IteRepHJ1KmD4w6qz7XUR2KoeulU/sI73rGgckdZ+vCOVTN7l1uW1GYqNUnp7vXFDr1L
         QwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698200976; x=1698805776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MpxKVEqpeOcCuSsAHgUrhf/Y4tTL2LI97d4nzEoGKeg=;
        b=NkNjF497JLatWy2Y9J6E/Dc/6F3VhgSVumGxdHwA/09kboIv777lVQJ6pfDCPyhRkw
         hjCeIDoamwX4yDJCY7B9KHvop1RZsez43AAYtSIWEYooHFYeEFDHwwi5MEs3C8AyHPaj
         i03q2Xf57PJ/N8Db9B+FvulIgsRW4rxI5Eig+IBx9crnKOGio158PI9puDOAtKjvpkEc
         DiFgsS96Il9CeY7NayRBWn/DxqxYLYTUGTPO7vPooyiAlLYAmVV0eG8z2fcZAqAnmC6u
         FDkVf/SAkcEvvP+c7JpxTearNlla8pRhaLgnSj4U1I88Q7JJ06dIoEIvJUhURGYb55Sh
         KxwQ==
X-Gm-Message-State: AOJu0YzT5nhaurNTi7kzZFs5KAy8WIvufozEohSh20KmR+pGIKjciSmk
	9f3z1kcFrqDzXlPnZyAF/CXjqZCwFsOIF0zN0Zw=
X-Google-Smtp-Source: AGHT+IHWg3TWeFAL4tM6SGT61jGlPy+aRqFm3/41e/3W3pbzCLa8NSet/hmPs7DZy+0AayyWbMxy1Q==
X-Received: by 2002:a17:90a:2c1:b0:27d:30ac:15b1 with SMTP id d1-20020a17090a02c100b0027d30ac15b1mr10303321pjd.19.1698200976113;
        Tue, 24 Oct 2023 19:29:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a388200b0027d0d4d4128sm8538615pjb.25.2023.10.24.19.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 19:29:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 24 Oct 2023 16:29:23 -1000
Message-Id: <cover.1698200772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189660

Please review this set of patches for dunfell and have comments back by
end of day Thursday, October 26

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6098

with the exception of a known intermittent reproducibility issue with the
vim-common package.

The following changes since commit 6b4a583169ae40a8d51e7ffa33785409b5111a81:

  systemd: Backport systemd-resolved: use hostname for certificate validation in DoT (2023-10-16 05:07:13 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (1):
  binutils: Backport fix CVE-2023-25588

Meenali Gupta (1):
  linux-firmware: upgrade 20230625 -> 20230804

Richard Purdie (1):
  resulttool/report: Avoid divide by zero

Siddharth Doshi (1):
  vim: Upgrade 9.0.2009 -> 9.0.2048

Steve Sakoman (2):
  patch.py: Use shlex instead of deprecated pipe
  cve-exclusion_5.4.inc: update for 5.4.257

 meta/lib/oe/patch.py                          |   6 +-
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2023-25588.patch    | 146 ++++++++++++
 ...20230625.bb => linux-firmware_20230804.bb} |   4 +-
 .../linux/cve-exclusion_5.4.inc               | 207 +++++++++++++++---
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/resulttool/report.py              |   5 +-
 7 files changed, 338 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

-- 
2.34.1



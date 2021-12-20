Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3A4C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:50 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.6379.1640013468729089804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C685ex89;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id b67so9627370qkg.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvlvSODxPLcvP5Zvxc3bedi7ulEZIeEu+dHe11qZBF8=;
        b=C685ex891LVBwT2Lng8fnL0L/W7oOFD5wIdVKB7Atdyk5pMLWRcWbkyG5j59ZO+Djp
         w3+aKLUo/o47uyMHsP7biaQ4U+P/iyJn20wDUJOFza1ab4hkltCXOWNysQDkGyGPlnch
         50c6N9ZdURSgg6vM6OQOEOPX0+Ogyd6RWTzS9XqqN2LcPyjXJReF7Px6UX7LKGa/9At0
         U9poZJbXPVC/bEHnGYHhl1BMDTctiMU3aV/qw3efw3tY6vOsdZodGxD6XEv2cj2zVVzg
         g2lvoRcishXzZeDLydTZYb1CpMXTVuuenRBKB2zmQ+6jeS74JRs2McP6ThK+1Bp75qm8
         3u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvlvSODxPLcvP5Zvxc3bedi7ulEZIeEu+dHe11qZBF8=;
        b=SmPUZsoP7xSN4BICjrkO5Cqafr52QGDZoBcP+a7Qwi8W35qsWifg0VqFKaxGVQLWBu
         vKty4L4/7znQYG1VC2UXNHemElmGs+u3m4SjXxoLLEkXdTKy9ytguWFg3hsWq17hkjjE
         jQbA4SjFJ5IHAer0gpXEzpMIISvAhEyTeKl90/b3OqThjZxGaSXiY6EZRKI6xJV/R1MO
         Zxz+ocn5JzE10j0RoU+va6w/xdycCzK4w8JUB1cXONxBXnP6aqX6UXHM8lLtecOcPexA
         Y4igiDCRaj4YNWUIMpV0XM/+rjGtoi8mEPSJ88yuiq5QE9ka4cgpGI2ZAz5Z+XedTiI5
         uVLQ==
X-Gm-Message-State: AOAM533RQo/A+JDzCGVwaSRlhb7Bgz+PH0saY5NDtLbXk9/1mS/brXQi
	vwRbl3af/aK7ycPI2TbLukA5mB2qKHQ=
X-Google-Smtp-Source: 
 ABdhPJzBUbzsgS7hk7pSj6kNVE0kB7rNlZEBRZwA//fieA1Ou/tsXwBfwhboPGZHAx2bsbrvsqAhbw==
X-Received: by 2002:a05:620a:2a14:: with SMTP id
 o20mr9911301qkp.562.1640013467806;
        Mon, 20 Dec 2021 07:17:47 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated -stable updates
Date: Mon, 20 Dec 2021 10:17:40 -0500
Message-Id: <cover.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159883

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest set of -stable updates that I've been testing
over the past couple of weeks. I avoided sending these due to the
project milestone .. but don't want to hold onto them until
January.

Speaking of January, you'll notice that there are no 5.14 updates.
Since it is no longer being updated upstream, I'll send my changes
to delete the 5.14 recipes and make 5.15 the default in early
January .. I didn't want to send that over the holidays.

Cheers,

Bruce

The following changes since commit 4a1ba69eabe432d3c5ea20bf9472102e433de718:

  bitbake: tests/fetch: Drop gnu urls from wget connectivity test (2021-12-20 14:39:29 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.10: update to v5.10.84
  linux-yocto/5.15: update to v5.15.7
  linux-yocto/5.15: update to v5.15.8
  linux-yocto/5.10: update to v5.10.85
  linux-yocto/5.15: update to v5.15.10
  linux-yocto/5.10: update to v5.10.87

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1



Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.1959.1626837703066347980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 20:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UXTZLm+Y;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id t185so901206qkd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 20:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDZk61ssXPOuC1GioQ/yDxJLuqbDgVetjlIfLQf1+zw=;
        b=UXTZLm+YS9K/pr/hdGN1Yca6I2qftClZgXj+Ivm0JauBIQBrcNNMT5c0RCGCKV7ZGj
         i9h8eHV9MbEYCh7dJQnFY9rV4wqHn9DHBz1VBBAHYEE+WmM/enKK8gEIuPBEM3BN3SzJ
         Jums0t3fGsoXQ+F9Z8z6ywcsTIeZAQ21vapsimV6wJUZJmUTJJyvLEvKOx+gh4YCehur
         q0wTi10uxe6zXXsAfbGIXGmpKYfkl4avY55lADhs3WzLA89LJrfiHQk82/lWKv30oBEf
         qHmGQGP0q3QFN6GeSfoLHWyfLfdTEdp1yVP9/5xgdlF5R7afRKrhZSmvaPHd3zmwwQcB
         Ih3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jDZk61ssXPOuC1GioQ/yDxJLuqbDgVetjlIfLQf1+zw=;
        b=mkkT1M2/MJh5ekspmmnQBT8BkrYKZEqJUZmhILoI9EOFMebipVZYuioGfk2v/Z7vCe
         Z25J6Bx9s81kDeZ5/scCJKp9f5LzjF5ZcS89lVdM4y7sabOSZNiL/3Xl3f93G7aZI60G
         V/TCiZVtOZ000mtXNx+UXD2HFJHXRjLqaK9J5d9VqBf3c1vJ/o3iHohdsgAcNcxhmgwU
         L0BG6FG5wPXQLnIFfhCy3pBfPjN2/jKN9hhh01vLfz9cJvGneryEAM/hPh/vUf63cUsD
         RAVaj732/UY7Ser2A1ZRnghlVZaUarf9hQIUizDeBzmtHVLhG/7U+ChOBu5WG+YGNTMv
         +qAQ==
X-Gm-Message-State: AOAM533TqozrRPpIW16Pqf05B4TbgkGhrtjQvLIvc4tfYgAC2P4uCMDa
	h/u1WRcV+S8U/QR4OqvOX+g=
X-Google-Smtp-Source: ABdhPJwptriMBV2+nkE6x/2kYmtrDymtlyI76QmWxKQHkOL08DP1PpQ4yDUOBxEOxANnYAQmfIGbIg==
X-Received: by 2002:a37:9ec1:: with SMTP id h184mr33295927qke.0.1626837702212;
        Tue, 20 Jul 2021 20:21:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h13sm10767892qkg.13.2021.07.20.20.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 20:21:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidate pull request
Date: Tue, 20 Jul 2021 23:21:36 -0400
Message-Id: <cover.1626837575.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi Richard,

Everything looked good on the AB, so here's the next linux-yocto
consolidated pull request.

Outside of the normal -stable updates, I've included Paul's fix
for devupstream, and then stacked my next 5.13 version bump on
top.

Cheers,

Bruce

The following changes since commit 1ad79313a5c3e6a453fbeb44caac5c5bbad46d3c:

  build-appliance-image: Update to master head revision (2021-07-20 19:02:52 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/5.13: update to v5.13.4
  linux-yocto/5.10: update to v5.10.52
  linux-yocto/5.4: update to v5.4.134

Paul Barker (1):
  linux-yocto: Fix devupstream SRCREV assignment

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++--------
 9 files changed, 57 insertions(+), 57 deletions(-)

-- 
2.19.1


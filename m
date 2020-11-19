Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.14211.1605813475543622152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QnDCuG4B;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id a15so3445283qvk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aehGcjQHLMQGQ/KjCW401irXx010FIrSNLZ6gUEKk8=;
        b=QnDCuG4BMqlVuyAhswTe8a106cTb3aG3UDxbV0QJvKdTLtd5qM7fiDe4yPjihrwujc
         obUaLRilT0nH9jziWZBAblzrb+tPKsw/jMwMKAsl5KjcVjNgGVcqc92iYb8zS8OAo6mI
         TgDQVnjlmsqrLFGWL3xPFVfagB1pXLPTkEzVcMBTGPkX8vnejdkT1YVdpmIo64VAi4GO
         vTn6Y1AEwg1cE8pIx9loD8SRYkDh6PL8q2G5fEukBTQKORDXtvMLwHIrKqyq6h3F2m+v
         stLsOzpLuTkmKQNu3cyzpb4i8PP8o50lj5pWPaE2H9fmOoNlj370DLePBZjw1AfrmqQU
         bCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0aehGcjQHLMQGQ/KjCW401irXx010FIrSNLZ6gUEKk8=;
        b=PTcNFJXHPOK2oeHBezRW86bIbEw1ts5CAdunG+qtQUqA432kP2ZyBtRJPOF7f691Vb
         +eVbUiom7j1BNVhhSR90gFheRbJZi1+eEL6RQVd38jE8F1uAgKvvVQ/FLmCVpQWfj767
         YFKxsy8NkHXu22wP6o0wP+HFa8+n660jDquTxNOMCNgE8MsuYp6qlzyVgsZlD2xzX+h9
         Sw9BcV/4xj9UVM1rzCUHESO96xc6BLMwxWQSkMFFL1DQvwWbDqdzZ1k3BYpxM92mJ3pc
         woqSe1amVXRp4Sz/XBpl6nTUrxVHL/wknS/n4z7kaXujGOk6pl/99m/UCyKacPx8xhjc
         psmA==
X-Gm-Message-State: AOAM533nV9n9+SL1MgW0LKlVb0ADCkJ+lBG447UnCgR7JSmDzAUy6uE/
	W67w5x/nIZv/BUyIEfnAFr8=
X-Google-Smtp-Source: ABdhPJxBQiJQJy3OjYVlsGbknuTIxvwa41MiZRHo30cdzU8laBEfRmvubMDoOCDVKD5qr6kGKcj/Fg==
X-Received: by 2002:ad4:5483:: with SMTP id q3mr12120860qvy.24.1605813474548;
        Thu, 19 Nov 2020 11:17:54 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:53 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Thu, 19 Nov 2020 14:17:47 -0500
Message-Id: <cover.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my next set of collected changes for linux-yocto. I built and booted the
5.4 -stable bump .. and obviously it looks good.

I've also grabbed a pending devsrc change, that looks good to me.

Finally, I have a fix Khem sent for perf builds. I kept 5.4 and 5.8 separate
for that fix, so Steve can pick them up for Dunfell as appropriate.

Bruce

The following changes since commit d8f47a68a92802fc47f297de05a0f2817963a7ee:

  kernel: relocate copy of module.lds to module compilation task (2020-11-18 13:59:27 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
    arches with 64bit time_t
  linux-yocto/5.8: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
    arches with 64bit time_t
  linux-yocto/5.8: ext4/tipc warning fixups
  linux-yocto/5.4: update to v5.4.78

INC@Cisco) (1):
  kernel-devsrc: improve reproducibility for arm64

 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 ++++
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 18 +++++++--------
 7 files changed, 34 insertions(+), 30 deletions(-)

-- 
2.19.1


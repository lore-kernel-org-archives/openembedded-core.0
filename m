Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.274.1621289824049329334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H6wBTsrV;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id x8so7470387qkl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a71enwf0zyDh4ASHXwkgvFB/eSAT5LcyBmmjwy1rwy8=;
        b=H6wBTsrVzyFJVAO6CeYy4BrfrTc5JQG01PcMSVvEngzIQVu5i2VlM3ZAR0Axzb/pfJ
         7OBORgdXIuorGg9uyO2145fSRa/WSDn/7rtkWPorsNsiXXlrcRvxuiHr5aYIdljtc2TC
         AmnIS2GK8UUw5UP2/AMgCcCJ04SNdAK56kbwv76TZ0172XVD0jMQtf17KMNHpW6kMdqa
         FPLLsLKI5bNpKqYmkMbDNrGvXMRct75d+OhKPSjtiJTh4BRyz7EfveZSdarAyg8ecBUp
         iVSs9M3E/JGmdjtww7wqOJ2r4pH0cAeMypKQHs7luCQGxNtglR3UbZaLM6BFeE1L+LXn
         JLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a71enwf0zyDh4ASHXwkgvFB/eSAT5LcyBmmjwy1rwy8=;
        b=ro3xxrfPXk/eHe8ImEc/NmdJaTPogxFyYn3QGbJJ+9WOWHcIvxUYZyCOqLVYx4/UJr
         +Z72Bgqc/3hIhHKOV41eXr5YoVKAICzyUgWio48HGxefmgO0e7w+H8hljns/MnWWQDSt
         EP4wRkGqA6iJVe7eRP5HreipkU0Ls9/j6Y5Zzb/Mn5jBHo3t3AvWRors0yej40Z6xNP6
         qy2BFM/nlc7Xf3awMZLPvk+4iYsLNsGKcIiA0//XE0rT1CsVdLPznNzSRJOyVI6JYqPX
         jz+PqrzOFN0LTY8Lp/Lq1dSMRpzhooGQ96W2r8v9cKdNUra7cOrudi/U2xPorKHMM3Y8
         eGaw==
X-Gm-Message-State: AOAM533F6X2Ckyqlyf+l2T52JJc7X3W7kaupYcLj9rXHMYf3bGuY79fo
	tGZospvfZxcZDFw+bpqtLqw=
X-Google-Smtp-Source: ABdhPJzSgYBHgkdX5iKb7dUOoFYWaDcLHntSiaPufCa/OuJic6ukeI+XS/Loja58DqBAMciiCvJv6g==
X-Received: by 2002:a37:a851:: with SMTP id r78mr2205570qke.95.1621289823070;
        Mon, 17 May 2021 15:17:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:02 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
Date: Mon, 17 May 2021 18:16:51 -0400
Message-Id: <cover.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the gathered changes for our active lnux-yocto references, as well
as some pre-work for moving to 5.13+ as the reference. I've also included
a patch to add some BSP/SRC_URI information after the kernel meta data has
been gathered .. this was requested just before the previous release, and
I finally got time to pull something together.

No big surprises and everything looked fine locally, and my AB run was
clean (outside of an arm64 ptest timeout that doesn't look related).

Bruce

The following changes since commit fb26a7c9b86488f46aef707c7836c2cd406d9b8a:

  meson: update patch status (2021-05-17 09:53:15 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  kernel-yocto: provide debug / summary information for metadata
  linux-yocto/5.10: update to v5.10.35
  linux-yocto/5.4: update to v5.4.117
  linux-yocto/5.10: ktypes/standard: disable obsolete crypto options by
    default
  linux-yocto/5.10: update to v5.10.36
  linux-yocto/5.4: update to v5.4.118
  linux-yocto/5.10: update to v5.10.37
  linux-yocto/5.4: update to v5.4.119
  kernel-devsrc: adjust NM and OBJTOOL variables for target

 meta/classes/kernel-yocto.bbclass             | 17 +++++++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 ++
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 8 files changed, 56 insertions(+), 37 deletions(-)

-- 
2.19.1


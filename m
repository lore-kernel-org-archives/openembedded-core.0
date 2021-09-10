Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.9555.1631282881478072473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FcQw7N62;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 22so2053065qkg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7+6wwU/QFrPJCt+RmAuAtMJKJqTwgkwd2Q9ZnzMtc4=;
        b=FcQw7N62VFi7v/cDohxT9IojD3PGPVa9RFbFMSfhTBhEbysoVATu0P4S7ls9vDX2vt
         eHs2DubhvrPfu0fRf0+Y8QvXsSrb6EDZMXMaSnGtGYVf30CnVbeSYQTWNcXjUJ9EjnMR
         hKPxufj9Rl18c+bwOzJwT3seNAoXDM41jg3+HI8ogOFYi6Yutf8Wv81SYzbNHSxSPD9p
         gRpOtYVFQ5JVF9hxqlKySE6qpTWKR8MJlEpX3fvLLc4qqDmOg4VMccvKcKAzcssslgcU
         IOE9ltNTeQk34tuWrosKT1lWI12evQ6rVupX/CaWCrwIhwLpGIftA64SGkctRQQaZ5y7
         Wmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7+6wwU/QFrPJCt+RmAuAtMJKJqTwgkwd2Q9ZnzMtc4=;
        b=ZZIu0Z3cL9i7dcb3BzFZDuGYI/xW7AcnU/y5cklasabzlxrKWUlRFdC0ou2l5/CIub
         09o3bI9iIY1kpgXcPlM5b6Bv+6+vi4OCTFd8aSOgdRvamwVhQCOnIKtX1mmTFTgp0+Rf
         UFNZilr/CZTzqUU0VPjhbzZXWAjFweOS8woN7KJ8fJU4GnPZde42WrJvddvXNlfqTcRs
         Ponye8lmyS9I4U5cv9JbXo+zgNkvz1/6ghc4IG4A2TuJuz/gHi8L7HYOBIhzqBbV0iBA
         6W2XVpD90C9623olpSe6kKfNqVAKQJvwwOmGb1hH6wmkmrKMEpahxNs7RS1/S8cfgLzT
         uECQ==
X-Gm-Message-State: AOAM532HBtlQHwmzNK2uVY/4b8xu59L65Ab/gmXhn4F22KQFtC+zYoBI
	kdC8a5+ybndfPGFf88pRI2o=
X-Google-Smtp-Source: ABdhPJyZmVdkDay2jHg814u5hgItrELXNDiZy+Cs19JpxHP57cH52owB3QtV+FaZITcJ9fNTMlTRvw==
X-Received: by 2002:a05:620a:444b:: with SMTP id w11mr7752934qkp.479.1631282880414;
        Fri, 10 Sep 2021 07:08:00 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3128240qtq.52.2021.09.10.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:00 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: -stable updates
Date: Fri, 10 Sep 2021 10:07:54 -0400
Message-Id: <cover.1631282594.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the latest -stable updates for the active kernels. Nothing jumped
out as particularly risky.

I've kept the updates separeate on purpose, since they represent a test
point and a known good state. Which will come in handy if something does pop
up during integration runs.

I'll follow up with bumps to the h/w reference BSPs shortly.

Bruce

The following changes since commit fd9c3a5a14fb54268707f6ece6a5fa11e4378200:

  bitbake: runqueue: Fix issues with multiconfig deferred task deadlock messages (2021-09-08 15:33:14 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.13: update to v5.13.13
  linux-yocto/5.13: update to v5.13.15
  linux-yocto/5.10: update to v5.10.61
  linux-yocto/5.10: update to v5.10.63

 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-rt_5.13.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 24 +++++++++----------
 6 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.19.1


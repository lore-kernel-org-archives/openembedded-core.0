Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.12988.1598450255736491559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 06:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QHDIzE+y;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b14so1909597qkn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2RIBnRtcbcU0V/ieLQSULm9Ak/1lfd9Yv+d4Nx543E=;
        b=QHDIzE+y0TJ3lcrfrpiACGaGCID1yE0Z2OAoY9T/K6sF1Z3PlrWJTIwUCjJNDFLL1b
         dz6nuyDdTL3GWsAjmAJLr/HifKUvcHA7Kcdz8ymThVjwBhk9Jo+2/FrNlQVMSmyJtR4q
         KFyi25jPLarbKHcjms1S7Po+kxx/e7BYTnsBaGluvscpUwBEl5lCXwIPWy2NdsrLgUc1
         uMz0zIJrgFcuZ1zcrxDpsxo7enO+Kk6+8OXPbt2QrRCG3opUOfX8olz600VAw9OsQpfV
         qlDvYIkVyVJmyphf5/lbwGEAdH/IkhCjqvXpFmyd72waIbdllBYmgMFO4OU1+q4c1DJI
         4oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2RIBnRtcbcU0V/ieLQSULm9Ak/1lfd9Yv+d4Nx543E=;
        b=jJCRY4grkDzUAenq3TjIxFYlAhjFO5ZnrF28lhJOh82D+u/rovoZYOkaPp7fHWl5UU
         98+DZ9eFIuIPEOALmy6l53aMxQOOkKGxr0T3E0kzHQidbvp1+ARdB5UsNRln+nP08fT7
         wZYzBHTBq2VE2yx/aKKYvPAGNloZjRwxHpyab6VwgSvr18YwXVwU3Oe77R+ggit4/C+B
         P4ifjooETnS7u0cTMboXpSK8h1uNyIBQ/CBfwKNFHPMysr3nytwIf/Sh9TOetAhh3Fnd
         n1BqXQmF3rrxFVzD0skjbniapwuNDNXzSvyvAwn8hywEg8bwFLdikIXTMi8LKDJfMDcS
         DA9g==
X-Gm-Message-State: AOAM53349bCQ6MTLdXkve/oXXSg+1I50pqP1a17nc34oRDxg8SiVz2Af
	Zgkg7DFxgBMUpYPqYDPdg30=
X-Google-Smtp-Source: ABdhPJylGiIdvRANNguBNJss4eb3OK8DwZnlpDxbEJJrzE6omEu9i+KDSKrBcyf8FKqtasauFuvzrw==
X-Received: by 2002:a05:620a:144b:: with SMTP id i11mr13744159qkl.485.1598450254756;
        Wed, 26 Aug 2020 06:57:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a52sm1371737qtc.22.2020.08.26.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 06:57:33 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: -stable bumps and config cleanup
Date: Wed, 26 Aug 2020 09:57:28 -0400
Message-Id: <cover.1598450136.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable bumps and the collected configuration cleanups
over the past few days.

With these, we have no warnings on the newly uprev'd yocto-bsps.

Note: that the yocto-bsps configs are stacked on top of my already queued
-stable update. So on the off chance we have issues with those stable updates,
we'll have to jiggle the SRCREVs a bit to just take the config cleanups.

Bruce

The following changes since commit 2b3bd34f9b1f6db9651918532ff5a68de13a93b4:

  bitbake: server/process: Fix typo in code causing tracebacks (2020-08-26 11:28:54 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/5.8: update to v5.8.3
  linux-yocto/5.4: update to v5.4.60
  kernel: config cleanups for 5.8+

 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1


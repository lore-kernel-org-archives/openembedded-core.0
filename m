Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.367.1632496219300736407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 08:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvNpMCz7;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id x9so9787106qtv.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRW++iCZj3RdN/X7HJlPkO8D6Mv1SmXcBGpBhlDroUM=;
        b=GvNpMCz74hPIE778OC1F2vMv0LFp9/N5PnFo0m02ujaGad61v3TndwNL/3Ynk/ZwBJ
         KqMifIjSOaOvrrtw8nBYXNAnCfHg4t+vu2bTnlEfyzX2GjuZkqOF1QyhWYp0gZ5paEI8
         kYV0wthiS9T9HgXsJKumQoB+++d2ynOIDSafbyhcfjl5X/RF+3gwlA/DDX+9avV7rKUA
         aWA+PPx44Egd+SawZhlmyIJP/ZDdgtscM2s4vxKy8mUOHosv6K4uRxOIDLk33x8PK+ne
         HDB9qtcooSAwb5WugtcZmhuW4DwQcRb8q1YvlhjyYgdqxc5SaTj30ahnT71zgFCODLPy
         IIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BRW++iCZj3RdN/X7HJlPkO8D6Mv1SmXcBGpBhlDroUM=;
        b=VZd6M/lsHWJ12jaPpQjdlLG4ZvO45ZF0p/GvuNx8tEzWKW1HjlZ2JYVC4B8R/jjtjx
         tS9rt+p0rhoPbjoGw5bxOMuMS8MuSLocARpl0NmT8X5iTEd1Ok3zpKpbgBMMw9R4bse3
         fTjmPpgEPGQ/N6FFAlJSI04kx157Cb76XaRtOzxBMLho2TIPHsXaKKcMvu+g/kKIQqWI
         l31WcAWKrK/QUBpYhcqc5x5LuGpSKFRUBcqxYn75VN3XciTh+SfguSIsNyBmi0qwgl+U
         Kou3o8vAWcB69E7JhgGrLrY0HBffyNLXXlIEpESOORHYO1cCzkcDKjI+Q8hJO50tVv99
         ejKw==
X-Gm-Message-State: AOAM531wHeurG+jR3YPVcfnqPFQshDqfzEi8UjktEviIvl288HzlO+97
	G6z4VlFfedX8pR4dwl3I61k=
X-Google-Smtp-Source: ABdhPJzQTQ85aNNyu8TJRdbxVh2dUDpIR4FmvCLIPjbXpwvGW4sfAed0BJV2JC1Y7Wkg+NhtB0GdMQ==
X-Received: by 2002:ac8:5e51:: with SMTP id i17mr4632270qtx.339.1632496218385;
        Fri, 24 Sep 2021 08:10:18 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id k203sm6439797qke.124.2021.09.24.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:10:17 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: complete bump to v5.14/v5.15
Date: Fri, 24 Sep 2021 11:10:11 -0400
Message-Id: <cover.1632495931.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These are the remaining patches now that we have 5.14 into master. This moves
-dev to 5.15 (and fixes the associated kernel packages to build against it).

We remove 5.13 from master as well, and I'll follow up with the yocto-bsps
equivalent shortly.

Bruce

The following changes since commit 06dcace68b021b020f14327c35358d58ecc698fa:

  meta-yocto-bsp: Update the default kernel to v5.14 (2021-09-24 10:15:29 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto-dev: update to v5.15-rcX
  lttng-modules: fix build against 5.15+
  lttng-modules/dev-upstream: update to 2.13-latest
  linux-yocto/5.13: drop recipes

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
 .../linux/linux-yocto-rt_5.13.bb              |  45 -
 .../linux/linux-yocto-tiny_5.13.bb            |  32 -
 meta/recipes-kernel/linux/linux-yocto_5.13.bb |  68 --
 ...Remove-deprecated-CPU-hotplug-functi.patch | 394 +++++++++
 ...ile-Enable-Wimplicit-fallthrough-for.patch | 829 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.0.bb             |   9 +-
 7 files changed, 1230 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.13.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch

-- 
2.19.1


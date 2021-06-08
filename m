Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.13154.1623163431001450954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zqF/V571;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id t140so16487681oih.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZaoEu+ogoCss+sKSe2CJd9ZqDpnj+L9CpSAf7M/jnc=;
        b=zqF/V571Mlt/ngSpfbxlwP3kdjY1b8QnDw5Fa8efbDA/Q/KOuP+cEbQIQ/gAT995yZ
         TjjSyK0rJw+LlhG6KOIij4+kICFGjaRA8i9Cy3fQoLQCrmOf/ZFfND/vh+FNmExyOlWy
         ZXZ68FJpgaCuKBnN7QUZ2DdhWLfLq3KDQ9BU4Q9TdIbNdBof2H8udZHqusQyeN4yUYiK
         ai22+aiWIXY+CtbSVtMxQkC29lkh7STqqP5ctp5LJcD4q1KY3E0lEoTyCoJPkjJyUCi/
         W4A+vJyXWSoCtLq2GtmXu+N2OpxP7pZOMT/YSUuHOeESSkeMnaxNOiBcPvWGUot7Xoml
         cExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZaoEu+ogoCss+sKSe2CJd9ZqDpnj+L9CpSAf7M/jnc=;
        b=UXvZGKaIDAYwWd1aqgoqnkMcBImBVz/TXLGLYawALw3QwUTfKEfaY1/zAJpFiRQ9/r
         +Kxqbhrs89ditrJ9/58dLuCsp8a4Eiu2xss2/uoFwld4kgmsckVYmwP2CU18gOCEMPJo
         K8Nh30mplAls3Rq69jk6XQ9jLinQzqPPjvYnFJYnBHGYJDu+H2h8jCkYG0Eu9hmJInXK
         qBhJkPbO9vz+CKMq/cqpzUvOotSfgjPU6kE3ZZuN7HVwPtDCpGwf94EEh0bjN031CN6m
         zg5t9sSujFxtykAtxVAg3p76n1Nvm+vX9XYMnxYFXj9UcmeQpt01Lwv2tEhnJHL87ILX
         5oSg==
X-Gm-Message-State: AOAM532xJ41PoRB2I8YQNhUUsRgvnN+hBGlddSYiBHHBYD09dwYZCvwr
	FfWfUYk1jAtarxFM5u3XYz9pRt873R2fWLXdYHs=
X-Google-Smtp-Source: ABdhPJxCyd+/A1sKCWWvCqbh3ZHH3pHGDZ6tii92UdisSIG9tkDA+Q8jHi4oX58xNn7ZOC8isFpL0Q==
X-Received: by 2002:aca:e142:: with SMTP id y63mr3039704oig.57.1623163429684;
        Tue, 08 Jun 2021 07:43:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:43:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue,  8 Jun 2021 04:42:29 -1000
Message-Id: <cover.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2220

The following changes since commit 090452c5284181f18c32dc33887f4dda20c48004:

  Revert "busybox: make busybox's syslog.cfg depend on VIRTUAL-RUNTIME_base-utils-syslog" (2021-06-08 04:32:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.120
  linux-yocto/5.4: update to v5.4.123

Klaus Heinrich Kiwi (1):
  kernel-fitimage: Don't use unit addresses on FIT

Lee Chee Yang (2):
  libxml: fix CVE-2021-3517 CVE-2021-3537
  gnutls: fix CVE-2021-20231 CVE-2021-20232

Ovidiu Panait (1):
  kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags

 meta/classes/kernel-devicetree.bbclass        |  7 ++
 meta/classes/kernel-fitimage.bbclass          | 32 ++++-----
 .../libxml/libxml2/CVE-2021-3517.patch        | 53 +++++++++++++++
 .../libxml/libxml2/CVE-2021-3537.patch        | 50 ++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
 .../gnutls/gnutls/CVE-2021-20231.patch        | 67 +++++++++++++++++++
 .../gnutls/gnutls/CVE-2021-20232.patch        | 65 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  2 +
 11 files changed, 280 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20231.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-20232.patch

-- 
2.25.1


Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.45981.1606180047299638572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 17:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=li7U6/mu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id w16so3549673pga.9
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 17:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=tJ39mHWiLOOaCzGM/MqJ0a+/+gQ8b8FWVBrl6NlSNkw=;
        b=li7U6/muUptdDLIUMCAxa1j3pyPma2Fj2H0DQxaAfUwjL5fBs9iKqBCtS1ywNmZ8Xw
         inJRkLC8xmCQqgbU81wvLYzxjixgeiJCbUarHDk0fDQLjPn7BnrOz/7pLxL7/P+urEnH
         e0EB3mVKx0D7RN4HzoOXr9cmkN8VR2vbslouhgQ+ph+03S3MKGjTtNuXD2xeBijEoZIK
         FnScRhZdwI0VLVdChigMC+4FMQ4gp39X5lYDZUx9Vjnc8Ve5iGiv/nVNFt3HvHVViF3+
         79H5kA84skdJfvZwrU7TrK8k2R6XvQ3QsvXrGKX/MSeOTSG67lBO/xb7/5np6Wext37y
         L3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=tJ39mHWiLOOaCzGM/MqJ0a+/+gQ8b8FWVBrl6NlSNkw=;
        b=lMQcBm9juOGeecWnh0IByZ+QC+hatCWrSlZAVcL7tn24NtTeZPR1Hg3pjEihYPokYz
         5Oo1+t5KKOrW62MGX04enUDUB6gWcrZ6wKxvWizrJtQLOZ5TRjNwujHIWojHdsGbmSs8
         uWgV5SR1HzMTRIH/vpM2i6fr5kMoGvBvi6V3pf2AGeTYO6dKWhz0mZeqfdDkY5XQHTIz
         yhSn+xX25FpIyorJqkwQUH15YWYmYd5E//hhdZnu9Ci2p0ibwYin6G602XEMZLYdlXN/
         QsEOM9mSkikukfgwir5HQol4skgvrapSoAcFtGJLRkx9ef/cyp79V26kJtBHqQvVF/l5
         K8qw==
X-Gm-Message-State: AOAM5319HlSNTy2q6Pp3iwILNRnCy2MJOZ19rVuGhq5LB5LMY27l9e7J
	764eMEeEvm8lXnc9sNGzHqi3SC58R04Zx18G
X-Google-Smtp-Source: ABdhPJxbgWc2uh+GBuHLmSYP9csar6DGzESfF4o8o3Md7W2cNZ+sfchM3uhdW++JfhcJJrIJ9CEXCQ==
X-Received: by 2002:a17:90b:8d8:: with SMTP id ds24mr1806572pjb.5.1606180046162;
        Mon, 23 Nov 2020 17:07:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d2sm609594pji.7.2020.11.23.17.07.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 17:07:25 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Pull request (cover letter only)
Date: Mon, 23 Nov 2020 15:07:12 -1000
Message-Id: <cover.1606179985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 84e1a32096db9deb98d282a652beec95dbfe80f1:

  python3: add ldconfig rdepends for python3-ctypes (2020-11-17 07:34:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Lee Chee Yang (5):
  libproxy: fix CVE-2020-26154
  bison: update to 3.5.4 for CVE-2020-14150
  python3: whitelist CVE-2020-15523
  python3: fix CVE-2020-27619
  qemu: fix CVE-2020-24352

 .../bison/{bison_3.5.3.bb => bison_3.5.4.bb}  |  2 +-
 .../python/python3/CVE-2020-27619.patch       | 70 +++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  4 +
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24352.patch            | 52 ++++++++++
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 7 files changed, 227 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} (94%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch

-- 
2.17.1


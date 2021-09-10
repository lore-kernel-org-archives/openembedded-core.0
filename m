Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web12.4212.1631242740678686923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 19:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FH9agsOo;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id w144so952811oie.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 19:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CbxS3HY/c4QGrEC9ucXV6xqXQXb9ESokuGwfxsvvJw=;
        b=FH9agsOo2IUA6X3htCc6CXNS3yiA2Oq/NOe/0Lme0qfH5ogKcPMHjoccRAI78C1zEm
         l0jryvOGlp9sD3KvxVQ9SvhGH3SpE6jC0+3iV4G8vwkYD0f30XEs7crWXs4XZojXdh2j
         ZmOl8HmvZod4vu8L+UpTcWYIckdCE9wilDRzNEBfiiWt9isqQOn+JinOZTGpWBmT0JVI
         l6j51Z7m/SjkXBNn0HvH0iVCloei32jeiDYMWmeOZ3SPsT5ebAS3y9eJsLXUkZm6feeX
         1jTEu6r2T5/sRX8r7SbGdneR/9wm2O1vI7DHxNsKB7odglE06efCQEPl9Cs+CcORxfGC
         1EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CbxS3HY/c4QGrEC9ucXV6xqXQXb9ESokuGwfxsvvJw=;
        b=maKSlyyi0VyC0iphsd2DnlQR2fp8qh9J2E4bA9ZaiED+MJaTi2V1YRlBsydw2RGOgx
         znzQb1fvTo0LxvNiZZKhVNViK6SzYdNH+MnKnU8szd8/b1SIErrx/LcrcuLJBNzRxTvA
         eGVL4GqdlH6rUjscitz7iF2Ct3Z2O3AMPgjXbBHz/3M7VDgc3HvDp+IAnsIfcjHWZppT
         tajdk6RSqFO6Z9eF9TOGoFx1y6sApP32B9T8LUR1auMi/FSu1Ia0csCSMKOaiGGpXc3c
         iwnXCHmnbBlKrEDrhYL+fCb55E8iCz4eS+cTBF4kBni9BEUYyVIWXF2MitYTabycW/Oy
         JbWQ==
X-Gm-Message-State: AOAM533+zaCsbKqKyHPWMf11/MH3SKZZy+RZhZvgZNkbUaUQySEJv+BF
	aVi2D9eL52L887JBUZ6evsGXsyUChR3SXwP2
X-Google-Smtp-Source: ABdhPJyClSASSAfgoAESCDo+q/85UJ8FOim5M0KQX2fx74ZxO9YOVuLjZo3JxUpNBEaHG/sjLlPIpA==
X-Received: by 2002:a05:6808:1283:: with SMTP id a3mr2429571oiw.99.1631242739422;
        Thu, 09 Sep 2021 19:58:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id u27sm1002449otj.6.2021.09.09.19.58.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 19:58:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Thu,  9 Sep 2021 16:58:39 -1000
Message-Id: <cover.1631242610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b46b059a306b2823624e64adecded9f76430471a:

  layer.conf: fix syntax error in PATH setting (2021-09-03 04:05:12 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Changqing Li (1):
  gdk-pixbuf: fix CVE-2021-20240

Martin Jansa (1):
  default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing
    failed task output multiple times

Nicolas Dechesne (1):
  rt-tests: set branch name in SRC_URI

Purushottam Choudhary (1):
  lighttpd: Add patch for reuse large memory chunks

Richard Purdie (2):
  xdg-utils: Add fix for CVE-2020-27748
  oeqa/runtime/parselogs: Make DVD ata error apply to all qemux86
    machines

 .../distro/include/default-distrovars.inc     |   6 +-
 meta/conf/documentation.conf                  |   2 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   2 +-
 ...or-pcre-dependency-instead-of-config.patch |  10 +-
 ...-mem-chunks-fix-mem-usage-fixes-3033.patch | 224 ++++++++++++++++++
 .../lighttpd/default-chunk-size-8k.patch      |  35 +++
 .../lighttpd/lighttpd_1.4.55.bb               |   2 +
 ...9813e0eb0246f63b54e9e154970e609575af.patch |  58 +++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 .../gdk-pixbuf/CVE-2021-20240.patch           |  40 ++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
 meta/recipes-rt/rt-tests/rt-tests.inc         |   2 +-
 12 files changed, 372 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch

-- 
2.25.1


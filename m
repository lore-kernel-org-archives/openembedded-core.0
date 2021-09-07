Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web08.217.1631025875476856706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vJNWxpXX;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id v2so13076879oie.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgDwIc7us5dfyTgbgV+Xj44rBguQb24AV00g0Wzlauk=;
        b=vJNWxpXX9c1QgYJ80phAh1YVs5ePrTDQiMirfb0O1uMFgXXhVkztayK7yCeQnHVJjf
         zVsfFwWZGsSEqUOwvNrh7ysadC99WSXk2GWz3/X9OKma3Z8IvpDu11ynRkVF/O+Miy4P
         TM4Jk+tgKx7Bmo0fyHAEmtyDREsYDn6Jk/I1IzR407YM8pFjPPSSpi2htlEdVr/5ZaGa
         Pnty2SWINVFYGrkkpJFe32I/4YggN3XSp7Q3ovUa6q7iXfIpgwjjoD3EfyP899Q8cK5A
         L2lBTSB0OMfoVTK9j+Vm51l0ZN1Is9DrTcnlfflugjxny4Z7ZUnMVsvd3VMSEJA1bexs
         6xCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rgDwIc7us5dfyTgbgV+Xj44rBguQb24AV00g0Wzlauk=;
        b=MSIeo31UFUyRE3ebhQO85hmzwHVCcYK63CULGrAnfy7e4RH7enXodJqc5M6hwqIvDg
         aoiK9qBKYiavrh2F+Np4Nxbw1JfIruKfTKiRQALbwmDOrJXrweRirEnz5GU+64oufVXB
         rMoWrxHC4ZbgNSaT6UAAU4J2KdfGX9NbrQgfxcjDgc0stEKuhEADpypKWMk/He9PiKUC
         g7EFNy0CpUkGMXzCciHLD+JJVPXoT8agOKx7Dii6F+REt5aG8pUKHpPUBUwL0QF4y1Bm
         4OAVyWscu5PqF+aFfgvaWfiblMD4zTa5V/sTNIFludyE8wu1t3rF0a9Q3i2hzO2vIEmi
         aanQ==
X-Gm-Message-State: AOAM531pA+oRjyl0FNNJoDQxTYzcZjw/hQ3QOmpOiN1VmfAy8pKrpsLj
	gkRb+FVAoDWg2MZVLvrn9ukvt2Owfm7Zdxos
X-Google-Smtp-Source: ABdhPJwBpNbvd+Nys2rFrcjVnyxPCd/sm35sW0pfZb7MSc62F3OedEPyERZWT6d/+gSWExt9YXMEOA==
X-Received: by 2002:aca:4557:: with SMTP id s84mr3112655oia.77.1631025873771;
        Tue, 07 Sep 2021 07:44:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:44:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Tue,  7 Sep 2021 04:44:03 -1000
Message-Id: <cover.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of changes for dunfell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2554

The following changes since commit b46b059a306b2823624e64adecded9f76430471a:

  layer.conf: fix syntax error in PATH setting (2021-09-03 04:05:12 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Changqing Li (1):
  gdk-pixbuf: fix CVE-2021-20240

Martin Jansa (1):
  default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing
    failed task output multiple times

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
 11 files changed, 371 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-reuse-large-mem-chunks-fix-mem-usage-fixes-3033.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/default-chunk-size-8k.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch

-- 
2.25.1


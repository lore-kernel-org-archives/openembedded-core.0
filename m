Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.622.1596818403723732171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 09:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NUAG/AzL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id m34so1156429pgl.11
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 09:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=tav9G6t25X0KDA8u7ncEhy4tsUCxWO9xiqdjZBpY//I=;
        b=NUAG/AzLrxVCZaEatcPX/QtWuzhelYXlLmsmoO0dQwLb8SNWbAdI+9WYmhhwjnbljZ
         sdwJlcDHTokUjJxOc9o/Gix9Y7lyh7yFKM45Fn42Fd6UHVFN+vdn/VIzuYoKAq3Ke2te
         oLRCj/CfUeAYb4fb9F69SgbTHyeWBlph3IVr2bdJ1lRv8dAML8m26VMLlqz8qPUqRii8
         EpNntSO/mfDll9SKqorZx4js0ddru3Xm8Cm0wzRCo0L54qSLWKyp3mj9Vn/OKCEqk3ZA
         kjaYMfN+TBvojuIwSTuxAZCDOHF4AgprPOQHhcSG866pceFQz0cV82c67It+O1lHeh8X
         XSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=tav9G6t25X0KDA8u7ncEhy4tsUCxWO9xiqdjZBpY//I=;
        b=m31tJdziIO7k8eBXUmQJeeVnLUtFYq8Ml2DZ5WVsduZkoSHLeIj1CznpQfAaI219Je
         qA692k2226rf3wmSS8vc7HPuQ5nicAR0kBJcjH+adx9wm03xOIXa6PbXiHxX8lWJvKRu
         WNDqwITviCiMPdum8l3vWFvWPvGguij1wsD2CKaxOcRvfPAUHaFt3wK0gC8Fjs1LAA5n
         OKAnHm4v689qjqfdufahUQRFI+cyNN0iJQvR4az63XE4dnglcyOnaPnou7vDbkYiUyc2
         Mn/ukWyYCxr+dLQKExZQpBNsz3u/ruwuPonPnrY2snJXSs5xBGpM/wIpCvcuSyhwaTs+
         ohSQ==
X-Gm-Message-State: AOAM532vXRLvT+A4Qu/N0OEuse01t7k3zFpATs7kXxEqyjAhpw42uTwv
	JRyAbWDMbreJKWnn4FZyvzlmhibW3fXHyA==
X-Google-Smtp-Source: ABdhPJx395LZ1BmTsrGwUATyyHOSctUtBu38++JP34KIvmcCPpsOy7WataX6RrmXX/vR547dW5ELUQ==
X-Received: by 2002:a63:e057:: with SMTP id n23mr12032073pgj.368.1596818402412;
        Fri, 07 Aug 2020 09:40:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gz7sm10973702pjb.45.2020.08.07.09.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 09:40:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Fri,  7 Aug 2020 06:39:51 -1000
Message-Id: <cover.1596818262.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 7ce425fa1295a9dca48f8474be58db3ac8aa540d:

  glibc: Secruity fix for CVE-2020-6096 (2020-07-27 12:15:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  gnutls: upgrade 3.6.13 -> 3.6.14

Andrei Gherzan (2):
  initscripts: Fix various shellcheck warnings in populate-volatile.sh
  initscripts: Fix populate-volatile.sh bug when file/dir exists

Konrad Weihmann (1):
  cve-update: handle baseMetricV2 as optional

Lee Chee Yang (1):
  checklayer: check layer in BBLAYERS before test

Matt Madison (1):
  cogl-1.0: correct X11 dependencies

Steve Sakoman (2):
  glib-networking: upgrade 2.62.3 to 2.62.4
  Revert "gtk-icon-cache.bbclass: add runtime dependency"

Viktor Rosendahl (1):
  boost: backport fix to make async_pipes work with asio

Yi Zhao (1):
  bind: upgrade 9.11.19 -> 9.11.21

zhengruoqin (1):
  gnutls: Fix krb5 code license to GPLv2.1+ to match the LICENSE file.

 meta/classes/gtk-icon-cache.bbclass           | 19 +---
 .../bind/{bind_9.11.19.bb => bind_9.11.21.bb} |  2 +-
 ...ng_2.62.3.bb => glib-networking_2.62.4.bb} |  4 +-
 .../initscripts-1.0/populate-volatile.sh      | 80 ++++++++---------
 .../recipes-core/meta/cve-update-db-native.bb | 13 ++-
 meta/recipes-graphics/cogl/cogl-1.0.inc       |  2 +-
 .../0001-added-typedef-executor_type.patch    | 54 +++++++++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
 ...se-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 90 +++++++++++++++++++
 .../{gnutls_3.6.13.bb => gnutls_3.6.14.bb}    |  4 +-
 scripts/lib/checklayer/__init__.py            | 14 +++
 scripts/yocto-check-layer                     |  9 +-
 12 files changed, 225 insertions(+), 67 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.11.21.bb} (98%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb} (88%)
 create mode 100644 meta/recipes-support/boost/boost/0001-added-typedef-executor_type.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.13.bb => gnutls_3.6.14.bb} (92%)

-- 
2.17.1


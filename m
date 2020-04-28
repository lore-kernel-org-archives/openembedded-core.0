Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.187.1588040159996807939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jltOiKVP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id j7so9563242pgj.13
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=to54hRR2sxNQkhbZtmMoCF0i4+mWyQsebenzEVJG9sw=;
        b=jltOiKVPDSBiS2uLfcZR6+pIIgCcSirkNBBeLiKDxQjIAkRD+qkN7YZX+fWMt+jJFF
         PKk09iNV7du1YkcL4ZgK1R30a1vdJgs4tJCtLRH+x5NO3DDoY1M6ChX1hSNAFIVFXJ0O
         LxiTX6yML4UaPOpTiY41KE1fjd2GmMaD+QklKIc4sOrj2Y2cOCmZ9JXEVRyCJHDRTSFB
         7Bc/j9mnL3kuSsKgaYujtbrZ9saY3wY8Bo6SVhZxWUGOZmrpAacUWlYuZkUFMph+aoRz
         wGl7cRdJ63R7tdM+AgTdXPHclEYQaS6SP6x220WKdByrVAS5siYKPXwsH+So02zRMhH1
         mWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=to54hRR2sxNQkhbZtmMoCF0i4+mWyQsebenzEVJG9sw=;
        b=RTyBhcp2mYrdSfAt9e8XMrRTZsV6BlnyOS39BIU+4esrPGoHggTu35nSEf4B8PLMqS
         XX6yAFjxWVRSpDTknDA7QXzpKsDhjmeuuT0IFzB1XyDA393frlqWpJT0uv5r28GytD3n
         RSaxNmN7oPBIzGwrLHzcnDUHhB5ZeIW20WIJ3JZYUbe9eBaJPeCN6f4V26tPAD3yLk+j
         ifotQXc2MNSUU6znux2nOBudOq80W95c2E4GnlX3LBZn/Wi9Z7K0sAKpQWeqXBFrrSf4
         vy2wBbM0XgzVIUV6IUQKQAfxehBlzu0s1GsAiAkl2EHh4AuoKgjtAEG8YiqeWHTDnC6O
         aDhw==
X-Gm-Message-State: AGi0PubCTcnMZnFxfFZj4LyJaC2HZEWhrLcey8vU9drr6VPlNyUiEHVZ
	6sBU5hwcHM89FRX7ajf2qDZzXhBU
X-Google-Smtp-Source: APiQypI829Bf+CAhxnIRhu8M+sIdCnkOVZpuBFbThXk5OijIlsK3iMF/AeVaKyN61xckKg6+e0jroA==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr26738433pgm.322.1588040159212;
        Mon, 27 Apr 2020 19:15:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.15.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:15:58 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 0/7] Merge request
Date: Mon, 27 Apr 2020 19:15:49 -0700
Message-Id: <cover.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please consider these changes for zeus
The following changes since commit 5ac98c776f9b77804a0ee812f47f3ecf593e432f:

  kernelsrc.bbclass: Fix externalsrc support (2020-04-06 15:17:05 +0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Adrian Bunk (1):
  openssl: Upgrade 1.1.1d -> 1.1.1e

Alexander Kanavin (1):
  openssl: update to 1.1.1f

Denys Dmytriyenko (1):
  openssl: recommend cryptodev-module for corresponding PACKAGECONFIG

Lee Chee Yang (2):
  cve-check: CPE version '-' as all version
  wic: align layer plugin path

Ovidiu Panait (1):
  inetutils: Use alternatives to avoid manpage conflict

Richard Purdie (1):
  pseudo: Ensure we use our own libsqlite

 meta/classes/cve-check.bbclass                |   2 +-
 .../inetutils/inetutils_1.9.4.bb              |   6 +-
 .../openssl/openssl/CVE-2019-1551.patch       | 758 ------------------
 .../{openssl_1.1.1d.bb => openssl_1.1.1f.bb}  |   6 +-
 .../recipes-core/meta/cve-update-db-native.bb |   2 +-
 meta/recipes-devtools/pseudo/pseudo.inc       |   2 +
 scripts/lib/wic/help.py                       |   3 +-
 scripts/lib/wic/pluginbase.py                 |  11 +-
 8 files changed, 19 insertions(+), 771 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1d.bb => openssl_1.1.1f.bb} (97%)

-- 
2.17.1


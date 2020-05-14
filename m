Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.1020.1589490314405717088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qAuW2Yco;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id d7so305898ioq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ebVXxPXassaRqjtTXxhw9zCw45Ny8RhbdulgfM/mLYA=;
        b=qAuW2YcoZrY4SJXZDuCMQgabuNecTeBEI4bpEjn78vb8sEESV6SmgUxcLZjhKbhKFm
         6INbWfMqV9es4/j/z3ujf/3OEooPulIxgRUvLOhEQtuBeFq7gnVAlgurOeix6vtPT3IN
         P7UFC4FMRxQUMUbTFVPKnawRcodym4gGaVK92O1TBAnE2Bo5OF1LhFk9D4/M3Mk7S5Gi
         bu5r17Z9NxzYlIUUak75IqHs/GKcScpXUisr5Du7u0i702RES0BMXVLycqv3iFn+91ER
         8y43iyMZIDoepeOBiMqV1xCXNAY3SkFnnD0/7BfHD4sKNFS4bjplNZuu4uqVcDwk17Mn
         pUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ebVXxPXassaRqjtTXxhw9zCw45Ny8RhbdulgfM/mLYA=;
        b=EjaHS4UzNsWWWBYlGMiTGKa/IzJVCZrZ65vxrr4/JYdxw7pfrJvL/DtRq8eBPnv9FX
         B3xXsZLmMeoMZbddu+pQaZ1i0qz2PTWjaw3Ou6seWPIwjiKbTWh/fsb1/Y7EOSnQDnJC
         uKfURNoGaHU4MoemnbwfA0GgjL96dhygb6t8Q65yvSRcTTDHxBXpFBL44fNwj2Lxsoe3
         Fz6KFp8zS7dBmuvwee+9JSG7pXsWTTPOZ+0bzgIbm8ix3yhW5N/PDIwOLObF8AWqID+3
         bmd1pmO00W+qfJfyxfec4alXlMyI9lPunSwzvbRupB9QM8K0FRSP6orZJTeOOtI4Bk3K
         poMQ==
X-Gm-Message-State: AOAM5338MhOdvRJiIX2RieY8Lf8FI2vG4AqBbw+4lizXbX9ZzqVZXN/8
	IpbkeYtlH8QBKUxsumqw1/cdXmkwSbU=
X-Google-Smtp-Source: ABdhPJww2+1WXayfqf29mZ+4zhoxYWPQUZB4YV7/LuDg08/SNZMS65D5bRvH7lN6G/u0md59LqfZuQ==
X-Received: by 2002:a02:9103:: with SMTP id a3mr146361jag.87.1589490312087;
        Thu, 14 May 2020 14:05:12 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id t20sm52356iob.27.2020.05.14.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:05:11 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jdmason@kudzu.us,
	denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/4] Import recipes from meta-python
Date: Thu, 14 May 2020 16:04:54 -0500
Message-Id: <20200514210458.33543-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

Imports and upgrades pycryptodome, pycryptodomex, and pyelftools from
meta-python.  These recipes are commonly used by other layers (e.g.
meta-arm) so putting them in oe-core reduces layer dependencies.

Joshua Watt (4):
  pycryptodome: Import from meta-python
  pyelftools: Import from meta-python
  python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
  python3-pyelftools: Upgrade 0.25 -> 0.26

 meta/conf/distro/include/maintainers.inc      |  5 +++-
 .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
 .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
 .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
 .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb

-- 
2.17.1


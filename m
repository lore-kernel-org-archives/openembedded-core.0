Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.7985.1623852303059752589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Gu+mp+ki;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id x196so2630442oif.10
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKpnv0r/d21uFzK166/3NWHhAxMArijXRtrxVvnKcgE=;
        b=Gu+mp+kiK6pkF6Pe732JpDrf/cKAxQ2DO+au9Yd/+mLU4ZZ5dtQgCm9N1cZir3pgG8
         ULp/A2sIOnUHgmhGBDOd35naRBS2PG647vzYC4ezWyBK5maQULvQ6O3JZmTHU9tPpJhV
         MtGoGFwmxS74abTo+13mmBBbxX/OWduj+gVmxhh1TaIvjgbZDhpHK4auQoqCvFIAH3FG
         MmX96jF/tfnncV5thjhrjRsihn9dZLdHAleyLW0RU4c1MrwIDryNtyekJPVGR4chW7SA
         RyO1Ve5vQklelnRUHaPkJlhqtHnve5gopQAdX5EADB0rRiQcn5oWfJghFh0MxaXfWbhp
         qRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKpnv0r/d21uFzK166/3NWHhAxMArijXRtrxVvnKcgE=;
        b=fzbiglC9qsuiR2wgthdlhb35MUpNs9ZMO8ACO7UFZgctZbmZMw8iQZ7aFMU3umORyE
         rD94ouXcQ2K0zi6OS+1UOmTTip40ZIhXlYaj9PZqApn3MYpO2QmlAIeVJT54dpHANg2G
         +nW/wW+N5l/fAoqacgOdOJdb0yPyycZGAVHyEfPDQl+GZaOSukbHIBnurPqin8gYq5++
         Xlq43uPoZ620hbNs68Fl5YyqXIYYQIlLhqjc0gddx+2/68EIzOfIsBJwSOe25qpNy3Wk
         aaQs3upSOxiB1IbzD9YuGGuwKmrN8wl7AlDV5IoF0tu1+WQmP0Zkh9uT884gjfjgOTuB
         YxWQ==
X-Gm-Message-State: AOAM533RVU/dOVPhGqFTRbnQ2xGTUBlvZyPoldCfHRRALzIUqALQLlQe
	iuJ4O59Ju6IN8/DV4jJBNW3NloPySKWdyrn3YTo=
X-Google-Smtp-Source: ABdhPJx32OQDtajlgXbvNw3Ev/sT+ENkN/gkExK3Zd3dSaCLceaSPe/ZR5ZGnho5Dkn08emWE3Y7kw==
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr7032937oia.102.1623852301786;
        Wed, 16 Jun 2021 07:05:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.04.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Wed, 16 Jun 2021 04:04:23 -1000
Message-Id: <cover.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dundell and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2247

The following changes since commit 2246b0d7a71c69eb2e89c55991d1387069895466:

  kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags (2021-06-08 04:32:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Andrea Adami (1):
  kernel.bbclass: fix do_sizecheck() comparison

Kai Kang (1):
  valgrind: fix a typo

Lee Chee Yang (4):
  gstreamer-plugins-good: fix CVE-2021-3497 CVE-2021-3498
  bind: 9.11.22 -> 9.11.32
  ruby: 2.7.1 -> 2.7.3
  python3: fix CVE-2021-23336

 meta/classes/kernel.bbclass                   |   2 +-
 .../bind/bind/CVE-2020-8625.patch             |  17 -
 .../bind/{bind_9.11.22.bb => bind_9.11.32.bb} |   5 +-
 .../python/python3/CVE-2021-23336.patch       | 530 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 .../ruby/ruby/CVE-2020-25613.patch            |  40 --
 .../ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb}     |   5 +-
 .../valgrind/valgrind_3.15.0.bb               |   2 +-
 .../CVE-2021-3497.patch                       | 207 +++++++
 .../CVE-2021-3498.patch                       |  44 ++
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   2 +
 11 files changed, 790 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.22.bb => bind_9.11.32.bb} (96%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-23336.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb} (94%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch

-- 
2.25.1


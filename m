Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.24265.1623633488066294957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 18:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o3OavsGA;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id u18so5070484plc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBzfkOwrUXftrI2SWv403Ej4++jd8X+I+7MUhB3eRjk=;
        b=o3OavsGAwIm7SnS/PGKTQ8g0Szo6X2idAJc0+UpN/d59MT4LsZrbBjNrk9DgPk6sq5
         tLQE/JCao3Oe/noSFiwvKU+xkA1S2jBojq5DHXAbgMgHBivD9x+S2oGWu7xLdcOmdSDZ
         YUYH462upwH54jq6mbTpIHwMA77qMvw0frb1+mQVz1W5+dCX7NegVJUPEO2PcqmOphTr
         Zr0tsZ5yY+mJF2ADKuKJG9beGlTNTIN5MNUVBNAFg7YZDuUZh0G2Saeb7z7+2JUQYaar
         CADgqR8wSjsbCJBxRFxco+aeyOkp5wU3Klh58r3/RDVg9u+C6PPROSzc7kTsC8E0oC/6
         4M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBzfkOwrUXftrI2SWv403Ej4++jd8X+I+7MUhB3eRjk=;
        b=XHOCPlCYvptONarD0QnrdLYzKSwq932SPXfyRMmrvXUR4jLyz7zd25frRBJp/mP95G
         78IZpHiXC1EJwOB43tFpFbZTLIzPn1eXmX44WmagA260cf/KQLXtMVkSfMFDlfbqz0CB
         icZbzLHCEznMk9qWU+iaVsNgsMjgpeSrYBlJhchKGTKbPFJRjRf/cjinsxMLvmMwNZrC
         uidKIvAlqgx8w9VcfNPnpAsgQPidlVATPmClm0L0JKQvbfxzUHJdBUGKSbWNJqPeqiix
         I2vuRAL8bVZV9ViBdM+I/Qvw1V4a+FhfTAMHZQXDN0qoAgiNO2TqqDCj+M9ECzwRUElw
         iS9w==
X-Gm-Message-State: AOAM5312qsnTOPFkvshL9akSBsAP2udtXNominMzg+9LI+JDJvT73RR2
	Tk9Zq1DhlmVPMj4QUyG/tIFW5jMsbzFkeg==
X-Google-Smtp-Source: ABdhPJxg8dDVG4d1PEUH4EKKEbL+6aIr262KIn/PCodD4IOWMLZRPxHSTzw39fF7rUnwIXtdT47OIg==
X-Received: by 2002:a17:90a:8816:: with SMTP id s22mr16477217pjn.231.1623633487246;
        Sun, 13 Jun 2021 18:18:07 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:fceb:f044:c379:f400])
        by smtp.gmail.com with ESMTPSA id 60sm10487557pjz.42.2021.06.13.18.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 18:18:06 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 0/2] python3-hypothesis upgrade
Date: Sun, 13 Jun 2021 18:17:58 -0700
Message-Id: <cover.1623633335.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AUH upgrade for python3-hypothesis.

This turns out to add RDEPENDS on python3-statistics, which previously
had not been a subpackage. Rather than falling back to python3-misc,
create a new python3-statistics subpackage.

The following changes since commit 75110a9cc5e6840c65ed24bcca7d4cf1748ab67d:

  gcc: Fixes for ARC (2021-06-12 22:53:32 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib timo/recipe-upgrades-20210613

Tim Orling (2):
  python3-manifest: add statistics subpackage
  python3-hypothesis: upgrade 6.13.14 -> 6.14.0

 ...is_6.13.14.bb => python3-hypothesis_6.14.0.bb} | 12 ++++++++++--
 .../python/python3/python3-manifest.json          | 15 +++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} (54%)

-- 
2.29.2


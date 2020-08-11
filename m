Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.1537.1597170792830920935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQbrNkwi;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id kr4so2309707pjb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6xdFrH6UVISZSV9PCpA1g/brTHl7QzAJ7a7E+AANriA=;
        b=PQbrNkwiqV8a0qCIezCvdfJLjnio33/4qO0wq7EeCJpPB+ILpvSXlFhewQ5EkdmMzX
         Zi7eQgmDv5lvt6eos5XuA/rGjJDHcpufBk8jpQEl7XA0GVAx/0BdLgJ2pXc+CR0fQQzL
         Br/RUj0dxSCX8Ikg/mOSGrC9ua7LbxdWFlj8fGMsCrbkZc0BRcjdKIBmiX0Ms6ySW1pb
         2JfCoz4vCKdV4FkboMsqjUdiMBGcimSgaLPs1EUuWvQ2YChb6qReZYC6g64uLilWEX+i
         Pn/V6JKUjR/gMMnl4V72yGbocG9lw09ZQNoMIzfPKyCULh2uEUAmTW+anTujbTwGQG/A
         28+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6xdFrH6UVISZSV9PCpA1g/brTHl7QzAJ7a7E+AANriA=;
        b=S284IbDXRroeHfZeFh4gqrelLHGs+Ry3qyH4hHHTOxKPSg+Jh+2UmUWzVmfBGqbB7k
         AwQ+ZEOrpX+s4/iTy6U50ChIiQ4FzXs9eKcsPy1Rn73qwFKoPv/bBJwH2hHo4P9FjtvE
         a73XcFRCSvZIHinQ6Es7xxjELtxaI6eHzPV8k8tgf9fFl71xV+JEITArZNJQgdg1g4Fi
         wwH6pFMEZy1Ep5K1auwuvfl8/TUJIv7Fu/uZiU1nyXS+7nsfd5o/IgMkqmt7kFTAhLO8
         PLPQsip8Zp5YTUi+3fU//ypOiy7NsF5PS8+WiKjFUWhqKzPsjza6maYK9IuaPOCeRDVn
         cVIw==
X-Gm-Message-State: AOAM532ZuCkmFFLXzs4qFZ9jax32YUTsCX1i0oybzvVBG/P+QWmUKwzo
	NUXFi3f+frhETVgwLtcoIyCdY9/SFJk=
X-Google-Smtp-Source: ABdhPJxVYj4YMnLgtVokEK7heqJg0oGnHdbOmoKxbvB/PEZgK/I/iyEUxVvqShZs7OVpBU+qiSv6vw==
X-Received: by 2002:a17:902:8498:: with SMTP id c24mr2088456plo.332.1597170791545;
        Tue, 11 Aug 2020 11:33:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id 198sm26130286pfz.120.2020.08.11.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 11:33:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH] gcc-9.3.inc: Mark CVE-2019-15847 as fixed
Date: Tue, 11 Aug 2020 11:33:07 -0700
Message-Id: <20200811183307.2640768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not have explicit patch to mark it and cve checker gets confused,
so help it out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index c9eab911d3..526e81089b 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -23,6 +23,8 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
+CVE_CHECK_WHITELIST += "CVE-2019-15847"
+
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 #RELEASE ?= "5a5ca2d"
 #BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz"
-- 
2.28.0


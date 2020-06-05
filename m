Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.13616.1591370980455738268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NInV9y0+;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id o26so7804241edq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6HuU14OXMirGK0gBsipTuYClmxFCzyu+BGNZc5B2Qu0=;
        b=NInV9y0+CGhsFCzeJc81cjnbEuBraAOKakhjIBiP0vpeUm8/IxnNAC2GQT+IMKHgSZ
         LCP7SOPj9GbkRvIpnY1euz2RiLAKXeFXzjOyjeICz11LBtEBPH7x/Upwfqh3JRYwosqJ
         fSWKufcJoOXtZNMBZeb6dkuGkc8AVZWWzdjzZWn9iQv7Xhb25EEzQC+OKiPtOD5nDYMj
         vwSPZvrNWXRCyeRNRILTeK1i3N4cSuSNQIMJ/ht7V5SSyUfeLQXSiPoK6QhVkd7EFkhi
         NPaiV4gqYEqLinDC6d8DqbolS/Hw2MLhSvf1QyX/9Y0w9Y/ZHcBKYWHibVwZjzbAAoh+
         9ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6HuU14OXMirGK0gBsipTuYClmxFCzyu+BGNZc5B2Qu0=;
        b=gqS/U11WtuDCYNR26tptiBodJ6tXb9DvUZvfofGphH0eW3cJ5cTeP9a66O9QiPIL4a
         gbLFi2yPesYJ5gyV2wlinNUAcuymeiClwv5EyC/6XUgIf9JF1n8wBFCWTU8xeLDUhZeh
         CDmUytchIa1kT2rSuNPotgUr22Q1EoLrUt59057gn3xF/bgaPU8XExfM96q6g9m9VpAi
         xsh8ybB6omtdlo99oK4U9qn1wo3rSVGE0hRSi4rf8icmwXaf6N1ZGZiU88t68/USJd5j
         O7AgSxDp+PogqmXD5Cpwysoy1zPlaKzaRXUdgioSaaFzMKgPTmZmqUNV1reoMY8xzrMB
         q1cA==
X-Gm-Message-State: AOAM531u1wMv5iuCm3B8VTWaVh288LLqBtr4dhUC6kkxDwUcO5Hppeih
	GDvCFrdijRawj4J/FY3Oell9K3Zxlpw=
X-Google-Smtp-Source: ABdhPJyTGUXpLJvgbscoed8v7vmfFG8HRul8qmGDS5TqelG++38aYN7Vqe4uItXGUM/VBCgaAbXxtg==
X-Received: by 2002:a05:6402:1bdc:: with SMTP id ch28mr9595861edb.19.1591370978777;
        Fri, 05 Jun 2020 08:29:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id o12sm5189609edq.7.2020.06.05.08.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 08:29:38 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] sqlite3: upgrade 3.32.1 -> 3.32.2
Date: Fri,  5 Jun 2020 17:29:27 +0200
Message-Id: <20200605152927.3428858-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605152927.3428858-1-schnitzeltony@gmail.com>
References: <20200605152927.3428858-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../sqlite/{sqlite3_3.32.1.bb => sqlite3_3.32.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.32.1.bb => sqlite3_3.32.2.bb} (68%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.32.1.bb b/meta/recipes-support/sqlite/sqlite3_3.32.2.bb
similarity index 68%
rename from meta/recipes-support/sqlite/sqlite3_3.32.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.32.2.bb
index d6081f10ad..8de74aa221 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.32.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.32.2.bb
@@ -4,8 +4,8 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[md5sum] = "bc7afc06f1e30b09ac930957af68d723"
-SRC_URI[sha256sum] = "486748abfb16abd8af664e3a5f03b228e5f124682b0c942e157644bf6fff7d10"
+SRC_URI[md5sum] = "eb498918a33159cdf8104997aad29e83"
+SRC_URI[sha256sum] = "2dbef1254c1dbeeb5d13d7722d37e633f18ccbba689806b0a65b68701a5b6084"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.26.2


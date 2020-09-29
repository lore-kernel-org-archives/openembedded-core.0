Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.1724.1601402855588368666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 11:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=azRXXvkC;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id l24so2276650edj.8
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkKLhH/BuvgLRlpk28ZT85m6ajqe4UMd2B5p4049d20=;
        b=azRXXvkCStTB18GFQVmyEmUll8IoMFtdRgOJAYONFGopfUyVutd3TTj1Zyh4FfgLAd
         f3ytFPpJufJAeqgjo8qVvYSwSKYiJexcFs+A4FrwFPTy+MoydXwQ1WWU2Ck5DpmDNaqk
         t2q3mzIncvtKP/N0GxbC5qPBOT0QIiFrBVe5hP1dMt5YFd4iy7W3HNpEmPu5/EmLz+VZ
         jiJDNLkz0EBfjfOOK4Uk6Ws5CfLjCV8SZo/p2zYBQouKSPb8LUqSxXrmw5xKRXoY1iO/
         pEmAhdog25Ta8EjqlyIYsvuzu5Jb3+Sd4VXiJDdPf7W1M848pxRc7vcJwIL3ZKw7RvsJ
         WekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jkKLhH/BuvgLRlpk28ZT85m6ajqe4UMd2B5p4049d20=;
        b=hKPR37qU5JIgAf3ntnJATXSLCD5PVKEEi4AKMM3/77eTBaUQHqidjMKjCggL3DEJ5q
         jtQxKdM9Sjcbwec4rLr0m/XqoagWcI6/ohtdajg+gf6g7WzW3UbVrPovLMnzzPz2JWYt
         znNETpX4ib+//LWNsjOmryAsPcLyn6Ixh64oRtmahsICJ3E2NBxsZ/7Opb8coirhg785
         /G5K/TiLycm7bUSMe5s2zxZ6v/hp8n40l0EnWYI/02SkCM/ie+f9v4XXdX3H3o32E2v0
         0ZrkccksjCksXDXRR7c4O3U/RbfBeOVnTLK1ZvJFPUUQdtbxrbFtg3ncNjrUh0EbWtXR
         yfHw==
X-Gm-Message-State: AOAM532ctBU7zM0pNMmEyyO7OdMeBPg7R5hOhoJuRrcQGzCsOmwBdREm
	Paz1rW7r6XxnFiTEDaYyR5rNU7VNIYM=
X-Google-Smtp-Source: ABdhPJxAJdkHz8Z+jDtZDksAMYwEOzURuCm4bekAMfSWyiEfqXiaR5cYHxssE5QSOI+k6zTd5DklBg==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr4827091edm.100.1601402853761;
        Tue, 29 Sep 2020 11:07:33 -0700 (PDT)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf370e0015ade9fb9385734a.dip0.t-ipconnect.de. [2003:cf:af37:e00:15ad:e9fb:9385:734a])
        by smtp.gmail.com with ESMTPSA id o15sm5635859ejr.1.2020.09.29.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:07:33 -0700 (PDT)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: pidge@toganlabs.com,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH 2/2] Map license names PSF and PSFv2 to PSF-2.0
Date: Tue, 29 Sep 2020 20:06:59 +0200
Message-Id: <20200929180659.7060-3-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929180659.7060-1-toertel@gmail.com>
References: <20200929180659.7060-1-toertel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to SDPX.org "Python License 2.0" is the overall Python
license, which is comprised of several licenses. "Python Software
Foundation License 2.0" is part of the complete Python license, but is
also used independently by some projects.

So far the license names PSF and PSFv2 found in LICENSE are mapped to
to Python-2.0. This patch maps PSF and PSFv2 to PSF-2.0 und thus
corrects the impression that Python-2.0 and PSF-2.0 are synonymous.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/conf/licenses.conf | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 751424d1b6..5b309eb385 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -45,9 +45,11 @@ SPDXLICENSEMAP[MIT-style] = "MIT"
 #Openssl variations
 SPDXLICENSEMAP[openssl] = "OpenSSL"
 
+#PSF variations
+SPDXLICENSEMAP[PSF] = "PSF-2.0"
+SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
+
 #Python variations
-SPDXLICENSEMAP[PSF] = "Python-2.0"
-SPDXLICENSEMAP[PSFv2] = "Python-2.0"
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
 
 #Apache variations
-- 
2.25.1


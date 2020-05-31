Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.17630.1590940426022536515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qc9IXJ9s;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c35so5416868edf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yo/qdo+ejwNiADcZvfXwi1ONGVbJxC0hesuB2/jKdq8=;
        b=Qc9IXJ9srYx5Vabta6zWh+zPQJ50p68XWDWML2gUXzyQfBAKv+de56opKH7aYCLbIa
         IwGLi6KSXifAZrj0IDs7ppVr/YKkGIxSHdxWoaMgLL2CiwkD2foAIv1VZvJvboKsLPPl
         M057kcqrrGocyH1BV5vW23eCQnLcwQfiSaNpfY+sTRoQ2tf3XrV8P+ZOy/RzdUmrCpUj
         QVpFLqi1Yo1l7gm1PDeLU+3j0nbFILSIdLPub0xF76Ll2UCL6qglTFa5uKYrQVcl3rMN
         9wCZeK4ugdKR1QMSmRapmLBVxUXxCfT0/3umfEjlfqkIAFT3bwA9DZJyQa8H8T+OERaa
         90yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yo/qdo+ejwNiADcZvfXwi1ONGVbJxC0hesuB2/jKdq8=;
        b=sUQRS9/SzMgiru5sIrkTYCnqvlN6C0onuOgoUqfzPzp4B4nOi1Et0DUf1CvGf30fHB
         AcVoUMh+tpuNmL3mj3B9DvvG8nNXOa7YYVVI/g+1b68CTMWAoKZ21+740nxMzafwzNgC
         EvSXcPFjbWdxvonxqfFU6zd1GztfXYbs4vqAFe6PvLsZlrfu+In502V6ug6hJjufhu/f
         YOiD2q9yI0w8XwXD3Jfatri7HBOvA8PLO73hp0UDD2c8gtm9pBm9yTOpAhWtJZhw0NoC
         p3DBuao/VBILaEqOqbvnAyIBGN7MyDwnYR22dzpAQ+G1uGjUSEWjcOQSUv5z105JWFLU
         co7g==
X-Gm-Message-State: AOAM530ZXzRxHq1bWH1mANPlFCKT47RqEOJcJyb/+KK9QSxdeg2s+769
	RAjXgt3rsM5d1kdTkh1IOZMS/RxP
X-Google-Smtp-Source: ABdhPJwFXj0iH2tFce7PdW2z8M6hnNvgBECq2akVB2p0WShbl0qvIaigocwSBMgnY4K9Fp0+tYJcCA==
X-Received: by 2002:aa7:da8c:: with SMTP id q12mr17860393eds.334.1590940424451;
        Sun, 31 May 2020 08:53:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/70] gawk: upgrade 5.0.1 -> 5.1.0
Date: Sun, 31 May 2020 17:52:04 +0200
Message-Id: <20200531155254.10283-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/gawk/{gawk_5.0.1.bb => gawk_5.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.0.1.bb => gawk_5.1.0.bb} (91%)

diff --git a/meta/recipes-extended/gawk/gawk_5.0.1.bb b/meta/recipes-extended/gawk/gawk_5.1.0.bb
similarity index 91%
rename from meta/recipes-extended/gawk/gawk_5.0.1.bb
rename to meta/recipes-extended/gawk/gawk_5.1.0.bb
index e79ccfdebf..0d005cd43b 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.0.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "c5441c73cc451764055ee65e9a4292bb"
-SRC_URI[sha256sum] = "625bf3718e25a84dc4486135d5cb5388174682362c70107fd13f21572f5603bb"
+SRC_URI[md5sum] = "f719bc9966df28e67fc6ebc405e7ea03"
+SRC_URI[sha256sum] = "03a0360edcd84bec156fe211bbc4fc8c78790973ce4e8b990a11d778d40b1a26"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.26.2


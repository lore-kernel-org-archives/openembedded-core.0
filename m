Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.20365.1607112475439962425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kGQ9rslG;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id qw4so10408979ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59BhNX4VBeq3WoyfzH6/AO6k4WoZlwvRxZ/Ssm9ywMs=;
        b=kGQ9rslGWlWAIVOfqkMGjJIVR9eGBSppXiUz7UoS1chpYp4rRCFpNMEFiKUvSpwa3e
         42BpCWBS+d6wOX97Z+T35JQzbKvewfXmcpmvQu/d7zJsZwJJdpF/q9j3Wvz8erUrI94K
         +idcVIMhnCjM71D3X9K3NqvJaDzqKghmA1cFYag4m+MtSigKcE/b6FpBFJVl+Okmwf56
         NC55t49Bp2nAcIiXsDGKs0xdIWRs1wx8A7CwqigOYFhIGPFHrNBzyYmDqfB1an4CgtkP
         SZlwa71MR9VKNi2cQwbF7k1HDFJpr1UdgSTna7ysqs9AcGmFLrU4gOEjsPzZmPqSp4cz
         UE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59BhNX4VBeq3WoyfzH6/AO6k4WoZlwvRxZ/Ssm9ywMs=;
        b=StXLUPi5FJJzqF8XlMJL2G9QxAkmDI4pb+S6bJWgx/P2UOSpFEXhtjutT09LbRie8z
         jBP8ANB9XsbOnFwDK17h+S7w249P6WeTsXUPp/9mGMNxQ31AWeQbC6WZWOqLId6wK7kR
         Qf4le5VrZ9ma7rntA7MthG5vMuu4GNtNEQAJloCInDGGHX5y3PCPiNAzg9Zp+5JmVYdl
         Sq2cMEhsEjek/uPkKrc3Qp0HupKut3dP5+RVseX3OZYTCvDnAm/8QGja5PXT7XAyphOv
         PMgyjyZFeAXPI8Acn7P1+c7U2c2XedJk2CFCy/Sq0pDcOERCIQXwgiCSY3sWA8k1S5Ss
         am0g==
X-Gm-Message-State: AOAM531liq6O1i4K5kMciIp9WSn7EhwyRfL0WZaYlz0Cgc8HfqszD+UP
	a0pY3GWAf+mS4gMWmjnlH20qBUhpgr2/Mg==
X-Google-Smtp-Source: ABdhPJxROglAIVuC8nOtBoLAI0bz6AYFs3NK/6k8/elFCCcqW+ccrfbGwNVC7kQYXnn2+IvJCod/CA==
X-Received: by 2002:a17:906:1744:: with SMTP id d4mr8877887eje.176.1607112473852;
        Fri, 04 Dec 2020 12:07:53 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:53 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/23] ifupdown: upgrade 0.8.35 -> 0.8.36
Date: Fri,  4 Dec 2020 21:07:23 +0100
Message-Id: <20201204200737.7072-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ifupdown/{ifupdown_0.8.35.bb => ifupdown_0.8.36.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.35.bb => ifupdown_0.8.36.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index 53cb971d33..5b425da95c 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "4af76318cfc57f8e4a44d357104188666213bd4b"
+SRCREV = "c73226073e2b13970ca613b20a13b9c0253bf9da"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2


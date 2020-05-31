Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.17632.1590940429566774673
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAGPyIgl;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id k19so5396716edv.9
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iwZ6UCok2sRONaizJ7RfhHPP4fQlL+KNqJ0bYviJCkU=;
        b=RAGPyIgl5PtTwuXKKmtKS416ctLQjVK8XJcqUDPBbQfuvse4cs2cn0a9uMuyAlSoKu
         xvNnc+xdOX1h2lWmGXwoRi3Enx+ydyDAMh6AC7eupXj4pI9RrzqVxJH3tlny09VooO84
         NZoc88v+7HRA/YN4swqgjCMtQqn71DkiGuOpkiuf2CHtICPjYeOSWI+yG7Ixsy4Isa9S
         iNyt36ae1EyRDCBOd/chA9hFvxVTD7OXcTZ7r7kKgZMfVE0ShEDuL4XrJwtOY00FemRh
         AcqPkSRjVTmjL20xow5qOz7w74OnxJE5/6miCgMTkBVEATmM7ij88eZ0XbdFIirqzTZT
         PsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iwZ6UCok2sRONaizJ7RfhHPP4fQlL+KNqJ0bYviJCkU=;
        b=f3oG/JqFlCfSsaPUE/FXg4/H6j9FUjRggCfdcnX1gMv6B9pX9aAItgS/oqpsAutosN
         ECSztWaUbtztWJ80ntdnJ6dQfB9nDO/lzrUZixFVyDQbH8LdjyWqtJt7KzDkK9iltA+p
         9V6gXT06xm+RQAUl/lIMKA6MFSMwSI5Zb4CyDsVU8343NVELswS0CcBZkf/HytR3eYo2
         i9mIYrabN66VLX0JlfP8qqds+Cq+8Z0ZpuLPf3obfRY/U7Jay6EgEzlxAfwL+rQKdViW
         C9Us6o03ZMe5LX57YBOAmRse56z0FX+qyOntQSrNw2fEEPcBLycgWfCRcMYKg7yOfprL
         7H5w==
X-Gm-Message-State: AOAM533o7j1k0Vb7/RvIr5Lrn9qlbpgraqWXcRB6ueGWJUoNRO1M2LdM
	2fa74I/75HeWpKABYNfMH70NVwJi
X-Google-Smtp-Source: ABdhPJwB972q3qoEgb3NWspYidyHsaflegxsNvaCzR5nJhL8xTceg1kwxMMxxHrASWPRLy7b9u84sg==
X-Received: by 2002:a50:fb14:: with SMTP id d20mr10404805edq.209.1590940427999;
        Sun, 31 May 2020 08:53:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/70] stress-ng: upgrade 0.11.01 -> 0.11.12
Date: Sun, 31 May 2020 17:52:08 +0200
Message-Id: <20200531155254.10283-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.12.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.12.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
index 3486be1b03..ba93efc4c8 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "a558fc7fb9d0a851afe6de09080b5401"
-SRC_URI[sha256sum] = "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b77527549a7736f65494"
+SRC_URI[sha256sum] = "0ccf437ca1876a3e8a55986c6481697045203a17f5994cb2f5096cd461d18031"
 
 DEPENDS = "coreutils-native"
 
-- 
2.26.2


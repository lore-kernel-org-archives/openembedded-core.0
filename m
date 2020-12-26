Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.19489.1608974882680577473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mKrV3DhB;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id jx16so8270920ejb.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMi5wPFwlL0VfkP+si7zXyTGhFC9Vkikp4dACgXLJwE=;
        b=mKrV3DhBXyGi+QnaeH/UmCEGh862lwe8H9obYcA3+EvllB8k8YRAEfOcXMNqCr76uV
         zhuBl1QbfPM0xTj0bt55FcPDjooEP4lrHQE257JXgPJwFKLJjx5o3jfybdhCpZeSGBuE
         tTkcQxWPK/tMwPpweS9stVwxOmokmTYB7YJVc1ikzrRPICyR6LtDyoHddrlRfMckJCuY
         9ZBGg7+yvN2p818Ju2xKPFHQTXnyLgIwDMq+1vnXZuSwnMC61v1pC0uAxEBhQip7PzOF
         JayMttdwgQ5dHxTtjblT5SFkxtR/fAG3yWpQ9qy8/BfLmeHRSvM29AuS6RdRts2f9le2
         IBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMi5wPFwlL0VfkP+si7zXyTGhFC9Vkikp4dACgXLJwE=;
        b=dWjwyCnkaBj3sTkZE8c5EY2hAo79vJJqNIGjDVSuZ1MAvnJTTgfBAjvqM1rerjBn0f
         eEaCHgFMn87+5eorLpEPZBNbufQtHTmNnZCA1bp5q3fMf2sIXXwA8+S90r7/LRpTZiYV
         VaofYToRP3recPLWFJJQVyYlNiDQvPvrXp4QCiydfrf9Q46YqOy9H1gC9/wggrGI0rni
         ss1j607JhXJYbGFwVxio8zd3K7F2aZbr2FXl0QE7lHZ2+ju30s91byhbHTXXVBg+imLl
         HKsAHyz7VzirhBZ4YFdN3Q09fP8dt5v7HZybVlP96qM6skkm3uKCdrj+ot09fvwI+9k9
         cSqQ==
X-Gm-Message-State: AOAM532+WosCqYXTmbgTZXZBTL2B9QB7BneTCK9YNLPlwNWoMJRbtJVB
	2ajLy3tw0JMvOC6O19m8swVcuFp1L6g=
X-Google-Smtp-Source: ABdhPJwlh+VeMoCLuVylITINuY+++mXrCCAhi2lD8STImmGTOucGvZGdRVl5ppivnQhWsoMNGFbPsA==
X-Received: by 2002:a17:907:1047:: with SMTP id oy7mr34625831ejb.134.1608974881358;
        Sat, 26 Dec 2020 01:28:01 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:00 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/48] python3-setuptools-scm: upgrade 4.1.2 -> 5.0.1
Date: Sat, 26 Dec 2020 10:27:08 +0100
Message-Id: <20201226092732.52323-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...setuptools-scm_4.1.2.bb => python3-setuptools-scm_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_4.1.2.bb => python3-setuptools-scm_5.0.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
index 5b83b55385..406404ec69 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
@@ -2,8 +2,7 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
-SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
+SRC_URI[sha256sum] = "c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.29.2


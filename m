Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.17499.1590940421529754728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jcPjTXTv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l27so6906764ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rH9Vw6W/qacLxucCJVUBpvhaSmgutxrtw+NRMdJvWcM=;
        b=jcPjTXTvAq2wixz35yiCP/Gqmq/4phdUcKw78TIxtjZyXwIwgljTCy0zdLTksHJz3p
         RKE2qmpwv1f9lOu92yBeFAkalA5omi1J57xe2yoCuwKGU6SlY0Po2KYoa/VLUz5aqA6i
         RhAoOPIpPBosc9ISedslJo8verrh/2D+6mUNX6yRXIaKeemMkm6VsedBRQYsbRCqMnKu
         jbXaPT0eLFfTI49VkACbSZFU38a9w/9XH/VnGOMdm6dYsEHk9kjFQfibgQzDQLE+uwB+
         fNTPuIgz5JUVuKUNzjKB5XxOKr8dq3Prkjz5Lsu991/HxopXh/O7xhBQyHpJmyHPDaFW
         51aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rH9Vw6W/qacLxucCJVUBpvhaSmgutxrtw+NRMdJvWcM=;
        b=PgmrnsR7UqY4GylU7nSLSU8Lv+9rukeu3tD/Wv0piPcZZHFWDu+xiXWgfL+rydhBTq
         0FVShvAamDC/mONYgtY8dLimOTVS9xLNmPYvh5AaxPHHqexVsu4MGEsFaFUbVvtpLpEi
         CW9MqbvMTX0XN/SAAMR804FPbMVLzNthPmfeTyidSii3fsGx0fMVaP1kDt+jwwLhN073
         ntcseAjs1wi+jcd5NZ+YWFMS1zTi9OaIT/pPppsCoRvth9uBg7uVUc5V5gwpZqGlRTth
         7GgNAe0EAF7U9dfyQ9WmBSp5c0zcb1GznUeAxN4K8RtzYNYQhKL7hF/gR8PbCYpGOVoB
         iFBw==
X-Gm-Message-State: AOAM5335p6rQogbt5E30SsENXgXYwESMA5GoJL2WZfh5Rm/AYWtOeVW2
	+KhNTPNRXlhM5VtfADe/M6VWU35J
X-Google-Smtp-Source: ABdhPJzx4ZQSCrErburMLCwMg/oyyMENH1hGcT0kknkX7n+SDM/ynb6/VuQP5WEb7ZCYzSJ9zbrBPg==
X-Received: by 2002:a17:906:6094:: with SMTP id t20mr16951279ejj.359.1590940419952;
        Sun, 31 May 2020 08:53:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/70] python3-testtools: upgrade 2.3.0 -> 2.4.0
Date: Sun, 31 May 2020 17:51:59 +0200
Message-Id: <20200531155254.10283-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-testtools.inc             | 4 ++--
 ...{python3-testtools_2.3.0.bb => python3-testtools_2.4.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.3.0.bb => python3-testtools_2.4.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index d0b2e46d7b..f1f1e26468 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
-SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
+SRC_URI[md5sum] = "e8fc7185b47cfb908c641f8c4b2a6add"
+SRC_URI[sha256sum] = "64c974a6cca4385d05f4bbfa2deca1c39ce88ede31c3448bee86a7259a9a61c8"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta/recipes-devtools/python/python3-testtools_2.4.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-testtools_2.3.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.4.0.bb
-- 
2.26.2


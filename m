Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D1FC43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.6590.1635842591191442752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eD6JSYtp;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id v127so14911820wme.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t3Cyv8QUKdrI9CvZ0DTzw4q9XtUNJQOvLrpWxYzpzC4=;
        b=eD6JSYtp72TWLnTNbjW+o35wvrlYXZWeGhfaKmhXsjHXa6k3Ow9AxmDatpZrU6JNR8
         6lnZ1tZ7BK69GaP9rUZL9qVyOxAtVwPD3YYaZQldMLm09cHM8Bm5W5I2CYDmDCQRzhE7
         odsCKFRz3rTD4iJsCrGPe+YCmsNI1titstSVI8DCJlHCpOdNYLhWyn18of3YVwJwKGoB
         PMuJkRdwXp2nBdttiCHSZIRUlVvfBX1m3Fe7jxuLeYTNppm8aTRDL7mP0HgSedbpvrHp
         vxAdF+m/2H3vov9P+D1q2/f8c2uLvM/GRmHNYmSS7+K7y+TN51aT0z5YTgWu4dkiuB0+
         qACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t3Cyv8QUKdrI9CvZ0DTzw4q9XtUNJQOvLrpWxYzpzC4=;
        b=AS6Q6zyOKwFaZ1lD3cHGOWDdiOhVR/QYhA/EgsA5VoSUJhIMXgKoPOrV/qnzuQdERB
         QB5jVua5P6eglnVfdThHMySFnoSuoW2KhHZ+DpS8jxJi68r0uSXwD6fPvCyhmoN0jh3h
         mgf9I1b18ygzBXMZwcEW8xG5y5lC0O0tyAH9icfpoHFwEJFEF6fzpUSgviMjouia3PSc
         d9JAM0CmFV4w/wSyyOg6+99TG/Bxz57qoKYT7NSVVLzfT0RO1Ql3HNEgmm5lvv0OTir6
         MqGA63FFZKQiGTF/cb2tyXF7vrlRKyD8pPg7sBOywI5thW7LMGGPQ6TM0D2HZutzllwu
         wivQ==
X-Gm-Message-State: AOAM532MMQArKZ4RU/vEMisKYs93R0Poo3j8Pf8OFlFQXNzJGr9gGHXR
	pVawhevR082aDni2pjtHdkXC6i2AA04=
X-Google-Smtp-Source: 
 ABdhPJxVXSN1RkvEkqio1vXUm2JDiIt74LTO3Bi2Q0yjATaLBjPXSdrtUxykYCN1gYWEhzkHokYEuQ==
X-Received: by 2002:a7b:c153:: with SMTP id z19mr5120731wmi.171.1635842589861;
        Tue, 02 Nov 2021 01:43:09 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/33] python3-gitdb: upgrade 4.0.7 -> 4.0.9
Date: Tue,  2 Nov 2021 09:42:38 +0100
Message-Id: <20211102084303.2974802-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157746

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 2 +-
 meta/recipes-devtools/python/python3-gitdb_4.0.7.bb | 4 ----
 meta/recipes-devtools/python/python3-gitdb_4.0.9.bb | 3 +++
 3 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-gitdb_4.0.9.bb

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 5b24a1f4a3..9482964f30 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,7 +8,7 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "96bf5c08b157a666fec41129e6d327235284cca4c81e92109260f353ba138005"
+SRC_URI[sha256sum] = "bac2fd45c0a1c9cf619e63a90d62bdc63892ef92387424b855792a6cabe789aa"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
deleted file mode 100644
index 988d67b5f1..0000000000
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.7.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-gitdb.inc
-
-SRC_URI[md5sum] = "3f52187435ab0b6e64a15782ffaf29ab"
diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb
new file mode 100644
index 0000000000..2dcd9c8aff
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-gitdb.inc
+
-- 
2.20.1



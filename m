Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3849.1628251612997564927
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 05:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qj3qWdmC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id m12so10756413wru.12
        for <Openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idhYy4uBeKG6gq9TC3tPvb5qBxBbwqMVRuWpqYn12ZI=;
        b=qj3qWdmCRsJzo1W/cQ74kISB1NYOO6AIeoqXd941c1Ax9NhiwT+B1/GYxwGAuLvAqT
         faeMUlmu2a4xFiv9J5Cx9VvDJDFwbME4b8+WeRljI7+xENpLbc/tFDo/KdbBPj7LIKSl
         fYvX+Eh891pUvQwoSiCLHJJceKpTYw4+7a/otB8d4DpgpRsFnU5L7YxYVo2HIEb+jVfC
         qfPddZdUT8K0T3FDSpzO5IljjC/HryNxMDFdEV+qFnCaxfvxsrPnuGKQsEllkeQ4lZ5h
         VcVrjWM93bccXveB4wB6rlGfewGoNij4bjX6O8/LY+t/gxL0iJlJLtezufm8l9U6RzCk
         inIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idhYy4uBeKG6gq9TC3tPvb5qBxBbwqMVRuWpqYn12ZI=;
        b=VDnrdML269WfHpoSR0LDWevN91/zVKI3g8L6OyPbaC1SuE9UXiWeIEII1AZMYS/iXN
         ZCsB2rl9uQnEZ+sl4FGgEA/uXt3gOg7ImFJ1QDgN003QdMyQPl9B9cMVU87UpZssOm2T
         XM+QhGjs4Dg4t0xL/+MBH+KeG0WgJqmbdaJbeAa+9pLSA36Xiz0yfkv2YOTuK6UGS+sm
         R6fjs42V6W4sI3ER7h5VC8JY7dLgHhWvZGkrWR196hqKHgATOlH6XispDrGQ3G5V7yZ3
         n2u/K/iPJfw0bOzaWF7tss9wTHp+d+CZqxnqhiM/JqCilp/uO2nwToH9TFvqDitFQdHS
         iwnw==
X-Gm-Message-State: AOAM532wxFKnchtfDTzaFt6OYi17OvXsh+lH2uUQd/OlEWB4+Ob9jHVK
	aPAbttXd6ZiEA+v7l2nAg6TH80Gitzy8dG6V
X-Google-Smtp-Source: ABdhPJwbvP5Hz+BqTlrIyxsmvre8qr9t9BnPtV68Ffrppa0LLZtQLNvMMQ1U0vbFl/1IGYpT39gRVQ==
X-Received: by 2002:adf:ec10:: with SMTP id x16mr10252775wrn.375.1628251611373;
        Fri, 06 Aug 2021 05:06:51 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.70])
        by smtp.gmail.com with ESMTPSA id n11sm11093049wrs.81.2021.08.06.05.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 05:06:51 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v4 5/7] overlayfs: meta-selftest recipe
Date: Fri,  6 Aug 2021 14:06:09 +0200
Message-Id: <20210806120611.124246-5-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210806120611.124246-1-uvv.mail@gmail.com>
References: <20210806120611.124246-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe demonstrates example usage of overlayfs bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../overlayfs-user/overlayfs-user.bb            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
new file mode 100644
index 0000000000..60405067de
--- /dev/null
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Overlayfs class unit test"
+DESCRIPTION = "Contains an overlayfs configuration"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
+include test_recipe.inc
+
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/my-application"
+
+do_install() {
+    install -d ${D}/usr/share/my-application
+}
+
+FILES:${PN} += "/usr"
-- 
2.28.0


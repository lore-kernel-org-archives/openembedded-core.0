Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.8691.1626082835230386218
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 02:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=asbnbFAW;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id b40so23141024ljf.12
        for <Openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQ/WIPrhxwf84CXsd+AOJm5rFBBX2I/iWAXQigom/j4=;
        b=asbnbFAWixyzkDpNJ20T/Vva4O23YFq7m8pAAiiqMTY7CuVefOx9XUDo7FdgF5O3oN
         9DNhBN5Nsjo6v0OkV0ZEd5CH7tsfn3E99LwklXvqngW2McrHdb0CqfHkbhWD4vjCNWLS
         7ElEyQaOuiz8WjZ235SjEpnKysSPamQmGNx9nO6VRCsyo2zhJlq1qeWDmMkCTRaaMUl6
         A6OSj4PtwU+Ok4VEDddPW3XLAs0VDUCGY/gF+OR2ykNWC87Pq79dp1mVVllsXb37PVP3
         WHdErKzUKgolUlA9pbhFz1PUw7EysJDI/LOsM/RLshSucukLtTZFdtcPaSdx99IWKp5j
         oSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQ/WIPrhxwf84CXsd+AOJm5rFBBX2I/iWAXQigom/j4=;
        b=KiMFjivRV0TaBr0Hh3hLBzx8nr3gpV3WrLw7bzsnXjGqJ/CJBsfxkdL7HynXFivXQ8
         jCH2ByAluBplWb66O1Og95o38wNFpFBr2niH1zD/63FIU1IiJEyhcmrdmTSfdXFCN31c
         SWqTgKumjACypsKbHKLZJRDjjPY9HLJDlg3Sg9UVrAwpSLF13B8WhJTg1hDGubuqXsTG
         039E9gWBPDr/ZVWMdAXw/S2vu8MfKyIHp25c6YEu03WnLeac1Yvj6K8riRffpwoDHpVz
         DR69jKvnUO9TuB1moVu0eNBgd45eowG6KQZWma5KX4lVtscKsvgCyVmxmF62pAQIl5Hu
         dyAQ==
X-Gm-Message-State: AOAM530OqeKN7gs5rt3eLHLLcjclZLFysZO/AJ9jeEM3aaV/Mu0BI2jx
	Hpb3MxU59kVSlrVWhl2vtI1SfjXHHunTzwx3t2w=
X-Google-Smtp-Source: ABdhPJxU8aIQcKWSrNc+p8lIhPJI8IqL2NRmMtOW4+OBTK6lKKgXt6jkDezXgLVxF9z+8CyqO0q8hQ==
X-Received: by 2002:a05:651c:1066:: with SMTP id y6mr4923706ljm.292.1626082833082;
        Mon, 12 Jul 2021 02:40:33 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([185.253.97.14])
        by smtp.gmail.com with ESMTPSA id e5sm1525519ljk.51.2021.07.12.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 02:40:32 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 6/8] overlayfs: meta-selftest recipe
Date: Mon, 12 Jul 2021 11:40:13 +0200
Message-Id: <20210712094013.41243-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <16901C1C2FD82522.24921@lists.openembedded.org>
References: <16901C1C2FD82522.24921@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe demonstrates example usage of overlayfs bbclass

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../recipes-test/overlayfs/overlayfs-user.bb     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-selftest/recipes-test/overlayfs/overlayfs-user.bb

diff --git a/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb
new file mode 100644
index 0000000000..65fbeebc56
--- /dev/null
+++ b/meta-selftest/recipes-test/overlayfs/overlayfs-user.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Overlayfs class unit test"
+DESCRIPTION = "Contains an overlayfs configuration"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs", "", d)}
+
+OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/my-application"
+
+do_install() {
+    install -d ${D}/usr/share/my-application
+}
+
+FILES_${PN} += "/usr"
-- 
2.28.0


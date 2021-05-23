Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.14025.1621798559001862054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 12:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z6rbBYhn;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id e17so8470570pfl.5
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=018QJY//VGfFNHEzoixt+klD4PkZRtlYFNjjzfVrC9A=;
        b=Z6rbBYhnTgRf0bKquo1w4UoLcka+YnOIpBpWs+4PCDPL61BdILMtFa+NHIV1wi4Cwu
         I9QFDfXMr1lWAX11Qdp+Rn/9rSiXG7alkc2f7nUANddIQ7sx6ZaYYBwMPMIhh7TckQhN
         Dz4VE5AccT0S+skSdWYsMI5mRGJPF24d66lJXpSUH/J3ixwbmfblv0OfO7l+fDKosbmG
         JRqaS+KN40ue2jeIxg6KRdf1coTRzL5NJYbPa1nwVJgTu6VRbkgNjrJ3UTRBWz9Y0Pr/
         pzL7YNOtvYVG2lG7x43RB8OFHW4a0CvU+zWSjzPrvnkhuVbrFVcstM67qDmGfPb8kJT7
         ykVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=018QJY//VGfFNHEzoixt+klD4PkZRtlYFNjjzfVrC9A=;
        b=EQwwJmxHPUoWL2kc3efHMh9nOCIqN4e3qOeutCaf/o1BTEr9zEJ+8EuCmEyuqARwq1
         xqvO2gBLVGtGpTHf9hL3cvY4GPi2j4zk2PRl5YCpHNjms0mMQ3VlRfkbNgPAhlbn1A5F
         6Rbd3Vo7Oa6va6KytvFoL4+XHWsfXU56oNO67uraOkkbgJ6CgtV055nYf/ntI8bJwkQF
         exk3XmZpiZNSqdedfC3TfUgVeA0U/oHKI0FAP6SW2ty+VZW7Cxq/vArl7byXhxBkPpAI
         ktnj0yYC8gFSqANYyN1ENGVhCMdh6G8MTwYq4t8KuxeDW8R67wq8twZPKmWR6utIGZc6
         P1tA==
X-Gm-Message-State: AOAM530jCNqQgmMzkm6tYuqCuoPI8PPYOyjyL7pGgs8mxpX47Y03HFAX
	kd7ZVZXTk/Hvyz8mBMau/12l59reUPV0kg==
X-Google-Smtp-Source: ABdhPJx5KMEpD25by/epdNk+XTtO+d4kKDIXGKPeTFXA+DKJHOoVHH+xUS2ahfLenttr9/mnwhIlDw==
X-Received: by 2002:a62:cec9:0:b029:2e3:9125:c280 with SMTP id y192-20020a62cec90000b02902e39125c280mr17936371pfg.11.1621798558281;
        Sun, 23 May 2021 12:35:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::db30])
        by smtp.gmail.com with ESMTPSA id b124sm9142857pfa.27.2021.05.23.12.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 12:35:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Update to latest on release/gcc-11 branch
Date: Sun, 23 May 2021 12:35:55 -0700
Message-Id: <20210523193555.480529-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There has been 150+ fixes made available after gcc 11.1.0
was released, details of these fixes is here

https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;hp=releases/gcc-11.1.0;h=9ee61d2b51d

Instead of switching to use git fetcher for whole repo, just fetch the
delta as a patch, since it will be checksummed so it will ensure that
patch is not changing on the fly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.1.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
index 713002266a..92d3a53fa6 100644
--- a/meta/recipes-devtools/gcc/gcc-11.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
@@ -6,7 +6,7 @@ PV = "11.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.1.0"
+BINV = "11.1.1"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -25,7 +25,13 @@ LIC_FILES_CHKSUM = "\
 
 #RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
 #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
+
+# This is latest commit on the release/gcc-11 branch
+# used to generate the backport patch w.r.t. latest minor release
+LATESTREV = "9ee61d2b51df012c659359873637cc2162ecccf3"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
+            https://github.com/gcc-mirror/gcc/compare/releases/gcc-${PV}...${LATESTREV}.patch;downloadfilename=gcc-${PV}-${LATESTREV}.patch;apply=yes;name=backports \
+           "
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -67,6 +73,7 @@ SRC_URI = "\
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
 "
 SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
+SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
-- 
2.31.1


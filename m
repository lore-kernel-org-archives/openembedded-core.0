Return-Path: <maxin.john@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CFBC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 04:50:40 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.5440.1713415838481867726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 21:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGqUNlqF;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: maxin.john@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5171a529224so452112e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 21:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713415836; x=1714020636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EeAsvH2GqLByG4LoDZ9Yi3H6ogUP4vZrBf3EE/QK7sg=;
        b=EGqUNlqF2kUK4NLXNjt+wOrl3uoF0NHX+zEPzwIylPbwyeq7yohwHpvsLMMlWL7/oU
         B7n5YH9cFaKSKdFSyJAQEwCBaXCSqL7Yi9wSlnbk06PUZgj6A/g/zaLunSd0L67+PtP3
         gnsyyEWwSbi098ZDmjw9pKAq7ZLwOoyBID22fSQNPgPBYS4HBq/QCp54X41rftwwc3PN
         lla7v/NEE601cyGOcMFQZYN/ZYbFJeuWhgpx32x1nORdVMVSpeUSKArIdodfecEiXAqf
         F+zEuHr2Jkd+A1NTFKr3WOQRZGrbkLLbgf/Ik1Q2VtoEcOr9h+nj06Ra0vC1O4ldgUBw
         k9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713415836; x=1714020636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeAsvH2GqLByG4LoDZ9Yi3H6ogUP4vZrBf3EE/QK7sg=;
        b=Yg/BnrQ0NL0nK9aqhS4K+kcUMaX1Urf6rWex6FLYibV1B88tC3w8fOoCVHFEWoC4RP
         Jm0mi8xaeLdmIZfEFma3VpYXohD8r4OahLitXm1N9YUxiUpddy4lNhbdjulpbTqtpXUi
         RdRgPkD67ygOnzb+UkNDUR156UK3H0wbIF/ZxBKQ3k4fsliCYxCQ4FZ9uTrBh7jKGbmT
         zlUsLJdWqg0OL8tQYTk2wt045QexspGd6Oz4YR7GwH2M6y025L293Ol4wIHSeu7JKUOf
         BhnqBgmfYKLs+hIZdvohd5AozyZdmuDaQg+eejPA25bBoIdc+D/f6rF7H3z4Xsfa+vGF
         6UQg==
X-Gm-Message-State: AOJu0YyZu32mA/gnuXAruv/HjkbSKbxugrH0GhnTfvQ0j2TOqas5zvW6
	wIyY6i+43z9sN6tiSUv9KvvFk56xzXj18FGk8oRS2di0s9UE4fQi9QB2ZA==
X-Google-Smtp-Source: AGHT+IHS4DIaobVxitbCb4neSOsi+x92lsEyscn5NK1VRxVVv8OoN33gi/M6Q3U0I8B5+WUwbITkvQ==
X-Received: by 2002:a05:6512:1388:b0:515:bee6:5e8c with SMTP id fc8-20020a056512138800b00515bee65e8cmr803066lfb.40.1713415836156;
        Wed, 17 Apr 2024 21:50:36 -0700 (PDT)
Received: from Thor.lan (81-197-102-119.elisa-laajakaista.fi. [81.197.102.119])
        by smtp.gmail.com with ESMTPSA id e28-20020ac2547c000000b005194bc487a6sm97089lfn.92.2024.04.17.21.50.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 21:50:35 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] iproute2: drop obsolete patch
Date: Thu, 18 Apr 2024 07:50:35 +0300
Message-Id: <20240418045035.29707-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 04:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198496

libc-compat.h fix for musl was obsolete after 4.16.0 release of iproute2.
Drop it.

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 ...01-libc-compat.h-add-musl-workaround.patch | 39 -------------------
 .../iproute2/iproute2_6.7.0.bb                |  4 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
deleted file mode 100644
index 74e3de1ce915..000000000000
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 22 Dec 2016 15:26:30 +0200
-Subject: [PATCH] libc-compat.h: add musl workaround
-
-The libc-compat.h kernel header uses glibc specific macros (__GLIBC__ and
-__USE_MISC) to solve conflicts with libc provided headers. This patch makes
-libc-compat.h work for musl libc as well.
-
-Upstream-Status: Pending
-
-Taken From:
-https://git.buildroot.net/buildroot/tree/package/iproute2/0001-Add-the-musl-workaround-to-the-libc-compat.h-copy.patch
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
----
- include/uapi/linux/libc-compat.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/uapi/linux/libc-compat.h b/include/uapi/linux/libc-compat.h
-index a159991..22198fa 100644
---- a/include/uapi/linux/libc-compat.h
-+++ b/include/uapi/linux/libc-compat.h
-@@ -50,10 +50,12 @@
- #define _LIBC_COMPAT_H
- 
- /* We have included glibc headers... */
--#if defined(__GLIBC__)
-+#if 1
-+#define __USE_MISC
- 
- /* Coordinate with glibc net/if.h header. */
- #if defined(_NET_IF_H) && defined(__USE_MISC)
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
- 
- /* GLIBC headers included first so don't define anything
-  * that would already be defined. */
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 8c460adf731d..d571c7ad2a4c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -11,9 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "flex-native bison-native iptables libcap"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
-           file://0001-libc-compat.h-add-musl-workaround.patch \
-           "
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz"
 
 SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
 
-- 
2.39.2



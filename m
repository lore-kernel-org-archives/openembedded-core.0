Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0F4C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.9291.1635325661163718141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9DEdpcD;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u18so2879426wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NevRiCWluM0Ilcm6qIolCUlH54EpfXjrZ7Fs8Wbn92o=;
        b=p9DEdpcD4r4WpDlS5HhIXWYo8IL15MeCn544czLPEgSrrs8eWPN0AmultYE5Cp5IP9
         bMyaFUHsX7DDyJucyShsr8hocM5DutaBRaQh84WSrllMdBwp/x5hE9kUxLnt9HB4Q1wY
         VRW46m7+BJoedf64oz2kqxUJcr16gGOGS7B+2j9wvDmoCBGFhPCMXv1OljvarQqldvT6
         p7o5fa/W1I1fV2lpdE8lAw5e4ejSj72CdXdokM9MS1lyjDwjOyUZVfxJvTv7bgJIs8cU
         H67CSciMNBVe5Jq0hHnhqbPZ9VtvwsqH1DvKGcGVXC2WyON8wlzyRbVUiweafinLn4gt
         gwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NevRiCWluM0Ilcm6qIolCUlH54EpfXjrZ7Fs8Wbn92o=;
        b=SnzMMZKL5KDCBPEpPof8B/NbqojDrBNEwGqzjGUAgJBR8Z6f6CU6Hj0w5x/SdKcofj
         GnZr+5rABh2SPB5aoSY3IJZ/kzdmQmRXeIqSUOtVodYWrLHiYeA7+hwe/PrN5Uq/tCwQ
         obyj2tEOfUe5Upm/oQe8zO5e2x0V63peohRTDJKgHu7JIKHJzb+9x2KzbtZs8eYXlUns
         XlIlXpGOFdWE9QtK7TKwmJ8Lwc3jiXp4gCCzsq3bzYofkNscRsNOTXZ6J82JnCFkM5sf
         sEfwZKmIg4ipqVl2ta9SjTAIA0r9YbcyqFcnTsxL6YCwprIzLLbBf9qmC6+SoV7CxzGx
         wNLw==
X-Gm-Message-State: AOAM532hnCw50uowoVCJn9kmGIAz4/C2ODks8mKhrpRLFw+HjvA2uL7+
	ZYNyeIb6xNSh2AQSHoVijQ+YtqyRYkk=
X-Google-Smtp-Source: 
 ABdhPJzz1w/DcUxz78JdYwxDJQ/LRBxYa/OptQ0fN154p/LgI0KLTEdKhOPincjl4vqFZppiMjFPHA==
X-Received: by 2002:adf:ce8c:: with SMTP id
 r12mr27535674wrn.176.1635325659717;
        Wed, 27 Oct 2021 02:07:39 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/30] stress-ng: convert to git, website is down
Date: Wed, 27 Oct 2021 11:07:08 +0200
Message-Id: <20211027090736.2546759-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157478

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...write-the-timestamp-into-compressed-.patch | 26 +++++++++++++++++++
 .../stress-ng/stress-ng_0.13.00.bb            |  8 +++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
new file mode 100644
index 0000000000..21a410f605
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
@@ -0,0 +1,26 @@
+From 2386cd8f907b379ae5cc1ce2888abef7d30e709a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 23 Oct 2021 20:20:59 +0200
+Subject: [PATCH] Makefile: do not write the timestamp into compressed manpage.
+
+This helps reproducibility.
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/156]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 886018f9..f4290f9c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -468,7 +468,7 @@ git-commit-id.h:
+ $(OBJS): stress-ng.h Makefile
+ 
+ stress-ng.1.gz: stress-ng.1
+-	$(V)gzip -c $< > $@
++	$(V)gzip -n -c $< > $@
+ 
+ .PHONY: dist
+ dist:
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index 198f7e87c7..5889569e50 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -1,14 +1,16 @@
 SUMMARY = "System load testing utility"
 DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
-HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
+HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
+           file://0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch \
            "
-SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
+SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
+S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1



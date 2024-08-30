Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CA6CA0EFF
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 10:42:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.10181.1725014548456941972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 03:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=in7490He;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so1156285a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 03:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725014547; x=1725619347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZu0Vxq15qeHCw2yI0VTthhXy6zHN6lxaqBqfj3LmE=;
        b=in7490HefAU/liqePje1gMd4Ohkvoo30IJ1VmaDsGVz/UvsAmPdJho386EHMfcZFb9
         bZlDkZlvlCV49LWsRnHUl4I1sLPSi7uw0AG37G8MnDt1AL3CzB+8OZ5TfcgtLgu9EBnb
         gwXSfNwAKUX52S7nkT949potid4i1h9/fhfjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725014547; x=1725619347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsZu0Vxq15qeHCw2yI0VTthhXy6zHN6lxaqBqfj3LmE=;
        b=wvwXf7gsEhsCnHvEGdOKNsUUGznaDlvq7OXf9IbaZdH1c0PynE5gOs5w5Z2zP4tM1a
         1/18xCzkhagDeBy9ErbJmNLWC6Sf2DAxYplNb0asnyzOdHnKkU6o4bzCBDCTNSPfYu/X
         g9FaXGhkmKEqDCLP3TOLjLNhfUSu0LS/Anfq95yuUOzLa9tViF4dACx3Ia1s1Jqd1TBe
         ZIryZMdzW1unEgYYIFRAFWZggfVmKsnBIb0sUyI78g7yautjYBx2/4Bs3et27x439VZ/
         4i4T6pREq5Jn81MS+5LwGCbMcJCUJglZaaerf982h53smbZ2i5DiE+CmFxPN9JN9QugP
         gmIg==
X-Gm-Message-State: AOJu0YysminosjQyk2lf86MjgDdzpnWVBbVWtWKObkgdm5s5K43Y32E6
	tCWosjUy5p9J5MDf2kwZ7NkaIBodHlqxg7lK2LDid4Pdg5rw1giKSlbPg6mZ/Kvg1GyNugmD+E3
	QeHo=
X-Google-Smtp-Source: AGHT+IGZ3OZwjVwPdVIJqSMXKGewcPe22WXUVOYCLJ4dwzV2n3CO73X5+BDkZ5JB59BM5wr+XiVEAQ==
X-Received: by 2002:a05:6a20:9e4c:b0:1cc:d9a7:a2f3 with SMTP id adf61e73a8af0-1cce0ffe3e4mr5086104637.6.1725014547193;
        Fri, 30 Aug 2024 03:42:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882c:804:2d1c:7889:c995:bd9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152cf29fsm24480755ad.99.2024.08.30.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:42:26 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][master][PATCH] apr: upgrade 1.7.4 -> 1.7.5
Date: Fri, 30 Aug 2024 16:12:18 +0530
Message-Id: <20240830104218.1610412-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203957

From: Vijay Anusuri <vanusuri@mvista.com>

Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch

Includes security fix
CVE-2023-49582

changelog:
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
 meta/recipes-support/apr/{apr_1.7.4.bb => apr_1.7.5.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.4.bb => apr_1.7.5.bb} (98%)

diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index a78b16284f..3480deaa4d 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -34,7 +34,7 @@ index 3663220..dce9789 100644
 -#ifdef HAVE_SYS_MMAN_H
 -#include <sys/mman.h>
 -#endif
--    int main()
+-    int main(int argc, const char *argv[])
 -    {
 -        int fd;
 -        void *m;
diff --git a/meta/recipes-support/apr/apr_1.7.4.bb b/meta/recipes-support/apr/apr_1.7.5.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.4.bb
rename to meta/recipes-support/apr/apr_1.7.5.bb
index 4df741c766..78796476e2 100644
--- a/meta/recipes-support/apr/apr_1.7.4.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -25,7 +25,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
            "
 
-SRC_URI[sha256sum] = "fc648de983f3a2a6c9e78dea1f180639bd2fad6c06d556d4367a701fe5c35577"
+SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.25.1



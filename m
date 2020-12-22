Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.11774.1608647318537723224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qkhCIvCF;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 22so11936235qkf.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8pzu+ztbDd+SE3FVGtE37AOb20eVNj7PGo6AESXbak=;
        b=qkhCIvCFhsJOrmno/0mbUQDntKjvi0AhDPE5SfjvqAHtuLN1H/Z/0+Ts+h4DCCT0ry
         0bQydz1mMUU5FobukG+nxT0Ka0cAoG8tP66u4sEkHcgukqytJxmszMoEOZeH7fKRboec
         B4rzagvwd401COymeqwfpZSeiDhOWJdODmhaxWd4Xy1FASBIdpsjIBxVgHbuuJtfkKMo
         WiL8fb+XVZmROhTCtGW1Azb3SnYvHkrk+jaJZi8QwsRTMLmJOxBf9dW7R/oJTR/3Uh8v
         RCb7hluUZHkR+QCyGO1ZAEj86LesPRAt77LaqBUgkd6z9P4H3IHlPEQSbppIRJoUl9hF
         16ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8pzu+ztbDd+SE3FVGtE37AOb20eVNj7PGo6AESXbak=;
        b=TOxPhxdG23ZtwpbeBz4PZ6SZw1Dwf+BzDpxyIoX83Dv+KerwNwo2qJLnY3xaku1XAE
         +g+RluBnxEErqM5QznUXHrRXwziYiwWLcOzHRdtVW6MeuX8r6FmzlJvFXGn1pQAm2jHD
         4vRj8cD2hCXmVJxE30L1JYqGk5bqRTIu2azWM/Vn/+MvgVnYysb/9Ncstz3jMhkescCt
         Nw5rOfLaw6FKoLb1TNNI7yq44WtNoaLwvRa8PXjVF4Zc8y8uo9sZ/QdM1sdPUtRGh1PN
         1x5gE+u+oLvIECJjsrRUSRJjq9bIM+w2XGH8TyUgdcHUq1CUgPLQh5C31KBDSd1sjhYY
         ijXQ==
X-Gm-Message-State: AOAM533w0SKuHMn1Jg6xwMwU/ND3GhpF08X6G2/+OAEkud2CSD1N8vVr
	dO61sDNv0OeWpaz5y9Cf+Bw=
X-Google-Smtp-Source: ABdhPJwnOmeUz2BKVVbeTLKw/UMEwDwGlxCRYbNQQ4BZ/Q/GF1c0AerhA1TCKwjp3SK/lIGv3iZwzQ==
X-Received: by 2002:a37:73c6:: with SMTP id o189mr22270726qkc.169.1608647317700;
        Tue, 22 Dec 2020 06:28:37 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:36 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/9] systemtap: upgrade 4.3 -> 4.4
Date: Tue, 22 Dec 2020 09:28:25 -0500
Message-Id: <858a185c7f949d4fd92c4e950101b89dc77b7f37.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@cn.fujitsu.com>

The test log of oe-selftest is as follows:
2020-11-23 15:48:49,144 - oe-selftest - INFO - test_crosstap_helloworld (runtime_test.SystemTap)
2020-11-23 17:06:55,949 - oe-selftest - INFO -  ... ok
2020-11-23 17:06:55,951 - oe-selftest - INFO - test_crosstap_pstree (runtime_test.SystemTap)
2020-11-23 17:08:07,921 - oe-selftest - INFO -  ... ok
2020-11-23 17:08:07,922 - oe-selftest - INFO - test_crosstap_syscalls_by_pid (runtime_test.SystemTap)
2020-11-23 17:09:20,084 - oe-selftest - INFO -  ... ok
2020-11-23 17:09:20,085 - oe-selftest - INFO - test_crosstap_syscalls_by_proc (runtime_test.SystemTap)
2020-11-23 17:10:31,349 - oe-selftest - INFO -  ... ok
2020-11-23 17:12:58,052 - oe-selftest - INFO - ----------------------------------------------------------------------
2020-11-23 17:12:58,054 - oe-selftest - INFO - Ran 4 tests in 5051.537s
2020-11-23 17:12:58,054 - oe-selftest - INFO - OK
2020-11-23 17:13:08,416 - oe-selftest - INFO - RESULTS:
2020-11-23 17:13:08,417 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_helloworld: PASSED (4686.81s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_pstree: PASSED (71.97s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_syscalls_by_pid: PASSED (72.16s)
2020-11-23 17:13:08,418 - oe-selftest - INFO - RESULTS - runtime_test.SystemTap.test_crosstap_syscalls_by_proc: PASSED (71.26s)
2020-11-23 17:13:08,432 - oe-selftest - INFO - SUMMARY:
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest () - Ran 4 tests in 5051.540s
2020-11-23 17:13:08,432 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=4, skipped=0, failures=0, errors=0)

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 56fa51d61e..ae735025b7 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "82b8e1a07a31bf37ed05d6ebc5162b054c0be9fd"
-PV = "4.3"
+SRCREV = "988f439af39a359b4387963ca4633649866d8275"
+PV = "4.4"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.19.1


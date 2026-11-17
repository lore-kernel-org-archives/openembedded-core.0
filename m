Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.585.1794942299005094867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 11:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gjPjDOO5;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so113732f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942297; x=1795547097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7uqjpZSCK5iv7MTR9Td9Z3k5RpsQFdHviA9XIrM01iE=;
        b=gjPjDOO5QWZdlWSLFOIPnK7ypZVlFLJEjgB0YXtjqZ1NLxZjzU25eahFKZCZ8aak+x
         FEuC5VuQahULXZ4ifBwgJmEFrdtIY9tTewVucoFLmVkuO/Qd3btkZ6jDAJ1+3+mpmF/c
         tGTeKdRMQnnFjtMtfrttT3VCP6B5fN/n6Vrkj9K1f9vQ10nZQOQnhtFBWxFDYdCXjH8k
         M6r5foF/HLs3GcuLz/liddMpuDm3IUlLUbLhdYUWonk2qJyDTcsALB+0sq3+zMUe5CSj
         A9PsJc1Ufa5OWlf6E6wQEmtE2HomSv/dzeIszXbCKCh7JH2U/AjtP9pvElyhznICjzQg
         ni4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942297; x=1795547097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uqjpZSCK5iv7MTR9Td9Z3k5RpsQFdHviA9XIrM01iE=;
        b=SGFDsXfCvN3Nzm2nnqo92lBeJoTH+FFwdQKSQGShVlejdngFXxw3GqgMOPzyeUSX2c
         2EkMbz6Hk5pPsoBdK20c0FLv7GrJ/ViLH10KuLHb8eQ9Gddn1lQBnCYoKy8F8mIdBzLG
         2MgzCAMy1b85Egp46OWNrkP3c8vVexaSTCo3lB5kX2tFvyW7c/hYndEVIpe0Qq6X+cQC
         7OiKTfX2YTwAYD3CU3U+6o70TJMt20HmNCOKSe4vhIeLP1DZaRlbY9JJAw9WJN+0roUd
         Wu9gB4SFexvyH5ba0gpeOdlAuaw11kizkUToopuGTbgZd8JYKyslg/I3q8ArW1xZglbE
         xnWg==
X-Gm-Message-State: APuU4Z8+vgJnBA5L40GYXwFxIDAumGaIsAmszdhBbh65MM2aOR48fnCD
	Ld8YG4JoAglCYh4LPKP+WIX9FhYLb5qCscrlYwFa1NRYwNgv0MVkbiLTGXMQKQ==
X-Gm-Gg: AYBFou1fOXfwkuTvGw35/h+daFkd7kKLgFXvOTsOfGaPQ2wUkIZFex8H8hJVXujNO1R
	32c0UXv2npgSSUcWr7iSSlUhbR5IQC8+3FkG01onP1pgX9skSh4gLwt1rDwrqGb/LMvhlQwORIi
	YDbWzB9UJ9zb9s1NTL4HZcxJWUF0KN5NMbYEzvhzHpQ5vnbLLNXrUTC+Y0iobMDRqd9HvVhVJY0
	O3mz7EJGrwAeLjLwxYGA93RRTug22VU1wSKU8nIoinw6u4uV09etZftttVM6II3VwMTmG5eZ21w
	zshKi1HBK5lmDIJJJ6CsKYjm1OIjTs+UnqPCOZ0HEq/M8NScOW4JGaJAU2WIbMMQ2oMWWXMHsCO
	fZ5T+h0fbbgMEqy76q/wDexWc0+Mbch7YxaVVpaSPuHIjZHWNxjQR6/F7tRpenvIt6wq+rv1J+z
	HzQEa4r++9Z1yY3twE+cXLvUwjwJQ47mhJUW6z1Knk+Rtx+RvqUhCdDfouGuC6eGcXnZlUMPTjO
	A8Kz80xHm+IxERh7b+VdsnYdxokFUVtJzoq5aYAQel7zAWEOWVCOivva+wtk+DzrVz5qIgNdcbr
	s9TI/6OTvUySMbXeh0mt3KiW69J0/HXcbaXPmgnGXyudeS5IfLBPtKMBGrsM1ehMlw==
X-Received: by 2002:a05:600c:6746:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb7d5d41f0mr2721755e9.3.1794942296972;
        Tue, 17 Nov 2026 11:04:56 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28fa46sm4103125e9.3.2026.11.17.11.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:04:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] acl: restore ptest
Date: Tue, 17 Nov 2026 20:04:53 +0100
Message-ID: <20261117190453.3968101-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 19:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250486
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

There was a regression in 2.4.0 version update where no tests were run anymore
and that wasn't detected, as acl test harness (./run) returns a success code
when passed in a bogus testcase name, and run-ptest then prints PASS: for it.

Upstream has renamed tests from .test to .run, adjust accordingly.

Obtain a list of tests from final Makefile, as getting them from automake
originals also silently returns nothing.

Add misc.run to the list of problematic tests as it now fails
similarly to the other excluded tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/attr/acl/run-ptest | 2 +-
 meta/recipes-support/attr/acl_2.4.0.bb  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
index f28d8c12122..88dae09fbd1 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -4,7 +4,7 @@ failed=0
 all=0
 
 
-for f in *.test; do
+for f in *.run; do
     LD_PRELOAD=$(pwd)/libtestlookup.so ./run $f
     case "$?" in
         0)
diff --git a/meta/recipes-support/attr/acl_2.4.0.bb b/meta/recipes-support/attr/acl_2.4.0.bb
index d470989acc5..a257542185a 100644
--- a/meta/recipes-support/attr/acl_2.4.0.bb
+++ b/meta/recipes-support/attr/acl_2.4.0.bb
@@ -37,16 +37,16 @@ do_install_ptest() {
         install -m644 ${S}/test/*.acl ${D}${PTEST_PATH}/
 
         # Install the tests
-        for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+        for t in $(makefile-getvar ${B}/Makefile TESTS); do
                 install -m644 ${S}/$t ${D}${PTEST_PATH}/
         done
         # Remove the tests that are expected to fail (they need a NFS server configured)
-        for t in $(makefile-getvar ${S}/test/Makemodule.am XFAIL_TESTS); do
+        for t in $(makefile-getvar ${B}/Makefile XFAIL_TESTS); do
                 rm ${D}${PTEST_PATH}/$(basename $t)
         done
         # These tests need a very specific user/group setup
         # (https://savannah.nongnu.org/bugs/index.php?66927)
-        rm -f ${D}${PTEST_PATH}/getfacl.test ${D}${PTEST_PATH}/permissions.test ${D}${PTEST_PATH}/restore.test ${D}${PTEST_PATH}/setfacl.test
+        rm -f ${D}${PTEST_PATH}/getfacl.run ${D}${PTEST_PATH}/misc.run ${D}${PTEST_PATH}/permissions.run ${D}${PTEST_PATH}/restore.run ${D}${PTEST_PATH}/setfacl.run
 
         ${B}/libtool --mode=install install ${B}/libtestlookup.la ${D}${PTEST_PATH}/
         rm -f ${D}${PTEST_PATH}/*.la
-- 
2.47.3


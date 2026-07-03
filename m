Return-Path: <sivakumar.bs@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEC4C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 07:00:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86996.1783062053487176048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 00:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oieKtSHS;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: sivakumar.bs@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3812c718debso182632a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 00:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783062053; x=1783666853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF8YlAEkuQ0OpVH0fZJlgB608P3TPo8rfb9RBKuYrEY=;
        b=oieKtSHSNy6/K0fkU7tY0UGEl8ncLlMpurq7r7PvTa8/HwZWzXCTCWzy19NkxPeeF8
         DVMBLr5IOt/fP3MKrKStdRDBpUc4yXG9irY0jkBb7F7LO29ysbWUivQAw0W2eN/qwxA/
         aUD/GlFOXkbIoIzAuhYZE38H/v/78DqafZBSHt/UkzkHhAX84tBsHr+VjS5i0mQdpr8u
         xLxV9qz7zDIvjhVlxufmMiboIYZdpdXBjO88Xh8pyS590OED6OKOUbZP8Ji2r9PDdmIm
         Bx1+tKqhCSIAWHZEwy1dtOM2YRwDEMRD6THFDb/vPlGwBE4ULac3/omIHymrEGnNLQ5t
         VdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783062053; x=1783666853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF8YlAEkuQ0OpVH0fZJlgB608P3TPo8rfb9RBKuYrEY=;
        b=qH1+PLX52M3PEHNgmEl5WFM1VphSk2u39wcxlYLfmtVdw51EgvCLuLa1Lx+zW/1Z25
         ISRZ8UpxmMomyJieJZ+jpHaD+GVGCKfL15d6Vv/Jv5hUVwZggBuWwKgNhVJ5nl1Q0PON
         9UpiacCHXFRedhmEpMpbt/8PHbgoFuKgIqHiBPRZUOLT+l9xSQd94wGK7zNajKfkcvph
         Usf4jjpvtgg9SsVaA6LTMvjqu51iW/CH7SCfH87mDnHH4yy+2VnG0pLieelhvg7VW0/0
         2rCBtAu4RVnFiVnmpJslsNZw2WfIBte1QbPISEfytFyvDZ5xgYghfq7htZNdOCoMXRn/
         D+7Q==
X-Gm-Message-State: AOJu0Ywtow6+ktpLxsvMkXEKz7JoX+QQiq2yGQE2P4FQqfORjM6H2x6V
	xjWFlEf4NcyCYqd254VWd0vr4BUA4bKEXZn+4bo50simZrMWUSMZAMLJgvODJtcg0TlDeA==
X-Gm-Gg: AfdE7cks/oQ5I9F2A16u8HdiAFZoFKVMDdCCB540qAEhLflthp1GhA90t30Ex2cmuNE
	eFPNnD+5DvMQEgILSVaee5+jq0oDVtheEw24UQqg6/E6FxwNPuuw5B7SLl+xbKjETrtvEDfZ9Fr
	ZA1m8oN1GjiDh1BzJC33qyzhvhyK89s7KsS4u8iegKW++8cjObFprc9qbHrQQtqc22p+7ZiIJ1q
	5ZDywoXpDYVyNpHbGXDbixub4Ye7VO2jqW/PF8RDHn4il+dZNTa7yNQXQL/AENKkUl+N1WQhsoA
	iKpxx9sflKiSu1QUE33Mt9/bvZ4HRkKQZD2kayGdXd532UzBsYHouSOcwDPxZJe8nnDDLTonkp/
	ZenYW4pSuGXbuVZodP43EPy592+O4Y+CG++NlhMXeWK1DXZe7HmSQzd5Cl9mntT0/ebICJuCKIX
	sE4P9s6j+owRcR6+YFwDImkzhyS5jXUbI92spHAQjI5roRlx61gZ8roD90vg==
X-Received: by 2002:a17:90b:58ce:b0:381:1b66:4734 with SMTP id 98e67ed59e1d1-3811b664f25mr2692400a91.6.1783062052735;
        Fri, 03 Jul 2026 00:00:52 -0700 (PDT)
Received: from naduvan.timesys.com ([117.98.163.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b8e3dsm19566503eec.6.2026.07.03.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:00:52 -0700 (PDT)
From: Siva Balasubramanian <sivakumar.bs@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: joaomarcos.costa@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	tim.orling@konsulko.com,
	JPEWhacker@gmail.com,
	Siva Balasubramanian <sivakumar.bs@gmail.com>
Subject: [OE-core][PATCH] libarchive: skip fuzz tests in ptest run
Date: Fri,  3 Jul 2026 12:30:42 +0530
Message-Id: <20260703070042.3221380-1-sivakumar.bs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240077

The libarchive fuzz tests (test_fuzz_ar, test_fuzz_cab, test_fuzz_cpio,
test_fuzz_iso9660, ...) run 1000 randomised iterations per archive format
and are intended for dedicated fuzzing infrastructure rather than routine
ptest execution. On the time and memory constrained autobuilder QEMU
targets they regularly time out, e.g.:

  158: test_fuzz_iso9660    Timeout! System state:

Upstream provides the SKIP_TEST_FUZZ environment variable to skip these
tests. Export it from run-ptest so the fuzz tests are skipped rather than
run, while the rest of the test suite continues to execute normally.

[YOCTO #16340]

Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
---
 meta/recipes-extended/libarchive/libarchive/run-ptest | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/recipes-extended/libarchive/libarchive/run-ptest
index 6a6eb0748b..d6b4c3f934 100755
--- a/meta/recipes-extended/libarchive/libarchive/run-ptest
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -1,5 +1,11 @@
 #!/bin/sh
 
+# The fuzz tests run 1000 randomised iterations per archive format and are
+# meant for dedicated fuzzing infrastructure, not routine ptest runs. They
+# regularly time out in the time/memory constrained autobuilder QEMU targets
+# (e.g. test_fuzz_iso9660). Skip them via the upstream escape hatch.
+export SKIP_TEST_FUZZ=1
+
 for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_test; do
     ./$t
     if [ $? -eq 0 ]; then
-- 
2.34.1



Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 94E41782D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:18 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id x63so52405297pff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LLF31kdM3ZxNOoBGLMIbn9lXAzeXpbjn18lIn67hUDM=;
	b=qR/mjmBbRan1GPzfQNRp7nJwzEAzb8ghi/W/hU6hdPswRjLl7mKk7AIcnu+AZWJWcQ
	PTo2ypj79DEYyPwp5baZGqWxL6hyH2Pa20yV0AAlQ6txS3M+6pPksZ1y8IJWUzuNTJvl
	Y7HD886eQQMIQdVZW3cOEepk7wv6+oMqpIBchCOYzVK8Um04bGzTst+SsedaIEW3Rvj1
	6rnl3X4Hxt9p/c2Ye372CPjgZB2t+se4mSJCqr3wQ2jU3KGFA3kL6Kiwkw0hMuL0zp83
	b2pDKUmFkWf03lru1kcsaNHKbNcDIa+ebnILIoHO28gh9IQEHpLDv1/C+5YpsSjN1NpW
	Bvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LLF31kdM3ZxNOoBGLMIbn9lXAzeXpbjn18lIn67hUDM=;
	b=IOuPBwK+8u6iBHZ/a02OOV5wuBDD8mw4WdfQim0kpLaxpNDyuTFai5Kf9ZcMvhQ3jI
	TIG8XS7WDdNHUEktmpArg79qFiYRJqWCL12LFXtrsmmc2FaPgHkHnCXctEyp7pHfNBQu
	V8v9y9PVTcX7oIUZaxWGidk+m2DNbhqmg6KrCOmc0nyWEVqhrjJ1Wzmd0DPEi4mkNIgI
	YPqXupCsna5A6QQ+KhI710Eoxd3WT/Eo/rM74bnYqjT9q9/R6YrCfSvtAh33aD2/aTsM
	auRWMswPE/ytQIOuNz6/5QqLAVMD4W4p8eGzhFfYSpJwxAFCvzCR6SPQ2rluOHt+HObB
	dovg==
X-Gm-Message-State: AODbwcDgOMLZv2sm5jVJT+dTcdawWeB8G/gFlwgx48V9zaja5CbXAUUd
	ZLlmQQbTiSpKBX/S
X-Received: by 10.84.174.3 with SMTP id q3mr56431030plb.52.1497279559276;
	Mon, 12 Jun 2017 07:59:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:03 -0700
Message-Id: <641a9bf59b213e6f31546db6afb4ddefa132a002.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] ltp: Include stdint.h for uintptr_t
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jun 2017 14:59:19 -0000

Fixes build with musl and upcoming glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   | 34 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch b/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
new file mode 100644
index 0000000000..5c73be440b
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
@@ -0,0 +1,34 @@
+From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 9 Jun 2017 09:32:13 -0700
+Subject: [PATCH] dirtyc0w: Include stdint.h
+
+uintptr_t is defined in stdint.h
+
+Fixes
+| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
+|    lseek(mfd, (uintptr_t) map, SEEK_SET);
+|                ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
+index 5328a9bc4..49abdd6ba 100644
+--- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
++++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
+@@ -23,6 +23,7 @@
+ #include <sys/stat.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <pwd.h>
+ 
+ #include "tst_safe_pthread.h"
+-- 
+2.13.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index 012c43de35..31f339461f 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
+           file://0001-dirtyc0w-Include-stdint.h.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.13.1



Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3713.1793582311473242132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SqIgrFmB;
 spf=pass (domain: konsulko.com, ip: 209.85.216.47, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1461600a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793582311; x=1794187111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EIH2VGD5K7NbTjGG3UFhP/uVIFD3ouRXG5zTPfiYY/4=;
        b=SqIgrFmBhFqutDVF+AC8592Lu7aY5h/cnmGzC+6FdLJviLeMGise+JDAq9pkELx/wz
         52jdiOKivMZzSssXlsVbouNJAAI9a3YoUQTtg23Xi8Qlr0fVqVXUIy5ivOw27bPazDac
         bT8xXCpIwSloATP2qBY7Nm9D+Tsf+aDM0wnBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793582311; x=1794187111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EIH2VGD5K7NbTjGG3UFhP/uVIFD3ouRXG5zTPfiYY/4=;
        b=iNaOM+iK4mGytkf1cuTFu39zYUJb6RwA1EWxOXMKtQRB5FGDwZgLt7Z7de4btaS+qg
         wnd8aggUlumE+lN1ES/r8tTV51hPPv1JQDHnj6CAZcfy11uD8c244b3N7HLG5mz4Ea/0
         7NzcMF5P1tmz4CxakQKSPl7Y2yMCIJaStvWf3bLnlSxS8KEhZDxYbvVvJx0xq+gFcITS
         BCa49fAo5DQIbXGR60i/g6xsCrNWodr7R9ZwRFoTHKXhL/Pew06B19eZDjaUsbBIcfY1
         hIYBTQ5ib2ZoCFoDiKw/dWKrbnAjp2FItxgrq+kQX3fOoZ+WZSuVbf5on1aezo1WdUKP
         Jx9g==
X-Gm-Message-State: APuU4Z/PjXHz2/oajsavmCQx8564kO9GSOOakGIx3xNNzqYY2LcSBSgU
	ujdCj5F2blsEg0fXNKaeV70P8P84tzoW1uh0RCCJdZPKjZdJSc5S5h3COnsLyO8dZfjzkMtaoSf
	lq35m
X-Gm-Gg: AYBFou1mogqQBqYGIdxRxmCX09iiknN8ji1Q+SDBgKIqqlELq/kI88PPBUXC3aaPZJc
	R8sCibLuoc4/v1C/pTPqf6jM4JID80Dmf/nxyL8luFIsCZ20hJ8FMz0rV1PAp8vzhuiPFbkHg3A
	xP9MsqtapJ6151usOiQqvXAJch4ugoDfiHkMOl2vMNXPxmTEzSOO5S7MCMLmNhEhW4Tgtb41mdn
	5H834ouz7HBqARNzP3dLF1MF9/zMJj2qigMsJXnf1Dc8i93rLyVICtCcie+hg8v9ciUJZxhv98K
	xxsLudXpGYZRMkCW6Alj/UH2RSAoh/iuH/NWPkXJFzUV1XGVvaQGvGTdeEzebpaf7esBwgKg2dc
	CT/7UBZar7A7kmVVuY9fARvNO9+r947LjLl5Aqu58wbpmN9vNNsMFEgwG4SCqqWWJHVZVPtxWXn
	eNMv3bE7EHhJdWeemIZsXpm5QyP0VaNLIKbILTzA2flZJ+FGMIoiOwL99vXoolZX5Ub0VjB3FPL
	PseMzGAkdzBHhkBLgmPcPvamd9zAi7cvuOJ+griKHzptB9ZJ3R2Z82hjNL1963eIc3L2LOQafvo
	U+7EdfTeWO3ONAP9gBANjS3FSqx7i8EgFr/2T9A+4td9CuaUhuDOmxpMTb/pC1ho/1H10lZrXRf
	4c4jS2zm3JYnuzflEAllEU9oFP4NIuD3fCF+OWvuq8BS7D2aG
X-Received: by 2002:a17:90b:4b89:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ae897e2a73mr7079099a91.41.1793582310807;
        Sun, 01 Nov 2026 17:18:30 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm16436533a91.7.2026.11.01.17.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:18:30 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 4/5] python3-websockets: enable ptest; use git fetcher
Date: Sun,  1 Nov 2026 17:18:15 -0800
Message-ID: <20261102011816.3710992-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102011816.3710992-1-tim.orling@konsulko.com>
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249168
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

The PyPI sdist prunes tests/, so fetch the 17.1 tag from git. This
re-enables ptest, reverted in a0488f2e1d when the sdist dropped the tests.

Upstream advises packagers against running the suite because timeout
tests can flake on slow build farms; under ptest it runs on the target,
and it passed repeatedly on qemux86-64.

tests/trio is ignored because python3-trio is not in oe-core.
python3-misc provides tracemalloc for the test utilities. Set
CVE_PRODUCT to the NVD websockets_project:websockets, since the pypi
default no longer applies and never matched.

Tested with core-image-ptest-python3-websockets on qemux86-64 (kvm):
2031 passed, 75 skipped, 0 failed in 82s, so add it to PTESTS_SLOW.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/ptest-packagelists.inc   |  1 +
 .../python/python3-websockets/run-ptest           |  3 +++
 .../python/python3-websockets_17.1.bb             | 15 +++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-devtools/python/python3-websockets/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50b971bace..7ec75757bc 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -155,6 +155,7 @@ PTESTS_SLOW = "\
     python3-cryptography \
     python3-numpy \
     python3-uvloop \
+    python3-websockets \
     python3-xmltodict \
     strace \
     tar \
diff --git a/meta/recipes-devtools/python/python3-websockets/run-ptest b/meta/recipes-devtools/python/python3-websockets/run-ptest
new file mode 100755
index 0000000000..a71ba0b951
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-websockets/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+# tests/trio requires python3-trio, which is not in oe-core
+pytest --automake --ignore=tests/trio
diff --git a/meta/recipes-devtools/python/python3-websockets_17.1.bb b/meta/recipes-devtools/python/python3-websockets_17.1.bb
index b5ee3ec661..d1bec373e0 100644
--- a/meta/recipes-devtools/python/python3-websockets_17.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.1.bb
@@ -4,12 +4,23 @@ HOMEPAGE = "https://github.com/aaugustin/websockets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
-inherit pypi python_setuptools_build_meta
+# The PyPI sdist prunes tests, so fetch from git for ptest
+SRC_URI = "\
+    git://github.com/python-websockets/websockets;branch=main;protocol=https;tag=${PV} \
+    file://run-ptest \
+"
+SRCREV = "e87ea9be0373edd5065b5e94dfa714cfde23023b"
+
+CVE_PRODUCT = "websockets_project:websockets"
 
-SRC_URI[sha256sum] = "acfea4c20bf54384883ea33b1240fc1db4f52e190823a4e2b334bc3e8bfca96a"
+inherit python_setuptools_build_meta ptest-python-pytest
 
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} = " \
     python3-asyncio \
 "
+
+RDEPENDS:${PN}-ptest += "\
+    python3-misc \
+"
-- 
2.47.3


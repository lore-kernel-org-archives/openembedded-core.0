Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3532.1793750805297069349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 16:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FQWfaBKJ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e7e742a2c7so381485ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793750805; x=1794355605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASdy4wuXrbU7Wp8eYSSURymXzbRt35Q4TgVifCKDNk=;
        b=FQWfaBKJiB+mHkSZmP7Yw2NPJq96lM4VYgR1ZDBhFhwuifMJv10QIjGRjC8r8pooRX
         gtWicUF9c2cVU3kke58E2sA+vcGM9zKs92xiyt+IXc2s+fVqgQot5atjSMaytrv6X2y3
         qzzhZvMIVubcCHQ16KnMuhgD3xY/z+11AxFQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750805; x=1794355605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aASdy4wuXrbU7Wp8eYSSURymXzbRt35Q4TgVifCKDNk=;
        b=ymHrUpBMmlqVZe/PbQ/gF60XEINKfkfbRfxg7BiT6SROrQEZHvpBJH2zV5B8hOaadr
         QQVRyWeiKc00M5keTEs5SaG6Sz63Y5g3wEdZe2C9Ne43I4o4WAopbKh0XIxvUKa9IVQa
         skediOKyYnpvxke9l2fTeKo/QCl9k39o6eghhd5vKfonD9YfCfjvHZ3SsArT8puEm4Ue
         3w/5yy9DsnoSvGiGlhwKK0g9p92nuEHlbK/cDZ+HTHIK2flNc1suu2bS1Mu9891SmtoL
         RjYI4cbiyEmRrNuVu722iiunpv5wFPhDkQNhDSRIWjan5UsvHAqVx0p5uri6a7r2gtO9
         SmJQ==
X-Gm-Message-State: APuU4Z+p2d7jZhbN4l5b1LRvd/I5oa5YBVCvzRJi9L0oqrvanSjGED54
	RjkUuYN+p3Oep8mY+SbNX5KI371UPRN/PuQxRTIUDH5Yzq3R2AFgAb+1dP5p1RP1wNBiZX69BGk
	7Z3Qy
X-Gm-Gg: AYBFou0NPxLrFDP6CsKyCTLDIHSs452IMhYO6s8cEI+lmWRCRc/9jJczVIdJJv3cePu
	o7L188w+oDoX7V1o2e1M4kYkdsDM9OVVyDNfTtzOT0Mv4fbBogMDiT34mqXB9+LvZdD0zBqsNuu
	IhQrsmXBSJBEfm+viRCKk+L5HrTJ+cN9e1oWYkCPGy7kkZIj/esZlS3hSFkpwu4Gb6hzoiIR/dJ
	3bUuP5bS3nnvxDFqRb8mTqnq+7mnAbQwOUlWtuUYpjFnabOdE5w4SxGfxn+v1YAjCfh3S153Gyf
	tFTcgNALz2ERtpZ4+9qqaUirGpd0qy6Y1FEhf3NZgyn+xFjD5MBs45iIoPfyhyzBqzg97mmITaz
	USCTNKqo4ietT2Y3/4wJtt/WCN7LeHg6CNG69Ul2SFpsIjVPVMrZGpR+KEPx9mj8ceVcckeODaM
	LsBBIg3M6K14vGjoefTDpKuus7pfkL0+Qr9jv+0FwLb6Ksgrj8PXbY0qzmpXNLBt0kf3RYy53z6
	Z/VsN0zKjZJyiFBoY2RwEjXsm9lQiVHSru5B774fp//mA533jnlmwOTVQWVD6b9NTpDyizl2Osk
	xgg16jO/ORflSN5laE9lfIqY5KnEx0HyH9ZPq7xX6nQmgPp7ycDhlfzi4J1/aq5GE7FP/xG/FSJ
	Mu+oiIfwy/KGDNIRt0aFxEmuAhHY=
X-Received: by 2002:a17:903:32c3:b0:2e9:484d:693 with SMTP id d9443c01a7336-2eb1aab52d9mr123449925ad.5.1793750804605;
        Tue, 03 Nov 2026 16:06:44 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:d453:884b:8607:3eb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed088a624esm588985ad.0.2026.11.03.16.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:06:44 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 4/5] python3-websockets: enable ptest; use git fetcher
Date: Tue,  3 Nov 2026 16:06:28 -0800
Message-ID: <20261104000629.3345377-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104000629.3345377-1-tim.orling@konsulko.com>
References: <20261103193829.1806542-2-tim.orling@konsulko.com>
 <20261104000629.3345377-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 00:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249312
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

Tested with core-image-ptest-python3-websockets on qemux86-64. It takes
over 30 seconds, so add it to PTESTS_SLOW.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v3: none

Changes in v2:
- Drop the test counts from the commit message

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


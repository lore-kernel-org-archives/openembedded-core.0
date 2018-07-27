Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5B21778D2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:08 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id o11-v6so5639276wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Zp+HexAIxv4wjFZrbrKC6ZGE7U3w/qDMtEPkwjYFXIo=;
	b=KDJXJGuokdsPVznYoo1S/+W4r/qqTVVkS7pc9dTfgwPv7eBRcDC4kYDtdFB+Qoq5l6
	euFSsXsEvjHmbU+nhOSsuz9ER6f/p46XQ3H9tJ9nMCJ78NdsH1EAa7nuQ4++DBu6ccJv
	yuokg0gypWObHf9zbZgMMtuqgwTvLDDjavtNq+R5xYz3O0uuxe2y3SaCUEGUnz5aqmxG
	Gq1TZi+yqaac1Ec6Nej2jbFE3OVgBaA75EjAj+yBNy6Y3gtamWzwDga8i9u1mjP6vz62
	hS+Xlo8kjuto7i3qb5KbSwAQCFy+kOKh8xZHaAifHNEFY412NvbDFpcZchSL5Y4GYxS3
	nhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Zp+HexAIxv4wjFZrbrKC6ZGE7U3w/qDMtEPkwjYFXIo=;
	b=sDag0Y/yhyclc11UozGPr9a7n9/G2+vL/VEDgkOE1PRDSgKNV3xy/wwoprdz6EpJqL
	8S5CWptBT6XN2A8jxJxpTRTYkZmviRHBCQO9WzopcsIBWxA/IzhI1HHaTlS2LL32n5sZ
	8hB1hCLFcGPhPtSxu9ufQjGQzIJgtCRwSBx7jsz8A1bLOvvU7mqMQVdhbCWWAq0g7WA7
	xfo1G414hDTA7bpOfz1X5JgiEHMPEb576QQay8Dwietw/7C9G6ohWrGwWfG24qiOtJGS
	UaA+dj2Oh/Pzxgfrrpp4Uqnoq37yKMtNTAboGJGn1x7Il/2j36E3UBRSFGji7Ns8NlB7
	S1fw==
X-Gm-Message-State: AOUpUlF8C3A5/apEOYpRhlp+0o0OUHJN9bBaTqqXOquii0t36iQDC9IS
	TXSgFynKOd0rct5UjTh0B99itp0bSd0=
X-Google-Smtp-Source: AAOMgpdEeZci+I4mNAuEv1uJD4O7mGvacCTBbEppt1XQKx7bT/KxzOOr/Q4gUG9M6g8ApkMXzVq8eQ==
X-Received: by 2002:a1c:ec06:: with SMTP id k6-v6mr4931564wmh.39.1532705588803;
	Fri, 27 Jul 2018 08:33:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:47 +0100
Message-Id: <20180727153248.22838-15-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 15/16] oeqa/runtime/scanelf: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:08 -0000

These tests are intended to search for bad RPATHs and text relocations, but we
do these tests at buildtime and as pax-utils is never installed in any default
images the tests are never executed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/cases/scanelf.py | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/cases/scanelf.py

diff --git a/meta/lib/oeqa/runtime/cases/scanelf.py b/meta/lib/oeqa/runtime/cases/scanelf.py
deleted file mode 100644
index 3ba1f78af9b..00000000000
--- a/meta/lib/oeqa/runtime/cases/scanelf.py
+++ /dev/null
@@ -1,26 +0,0 @@
-from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
-from oeqa.runtime.decorator.package import OEHasPackage
-
-class ScanelfTest(OERuntimeTestCase):
-    scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
-
-    @OETestID(966)
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['pax-utils'])
-    def test_scanelf_textrel(self):
-        # print TEXTREL information
-        cmd = '%s --textrel' % self.scancmd
-        status, output = self.target.run(cmd)
-        msg = '\n'.join([cmd, output])
-        self.assertEqual(output.strip(), '', msg=msg)
-
-    @OETestID(967)
-    @OETestDepends(['scanelf.ScanelfTest.test_scanelf_textrel'])
-    def test_scanelf_rpath(self):
-        # print RPATH information
-        cmd = '%s --textrel --rpath' % self.scancmd
-        status, output = self.target.run(cmd)
-        msg = '\n'.join([cmd, output])
-        self.assertEqual(output.strip(), '', msg=msg)
-- 
2.11.0



Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F04F2787E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 20:00:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 15-v6so7892814pge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=t6o+94Ce39PnejAH0Wq/LTyAhs7A8M43uYDMMGT4dd8=;
	b=f98TAU5Sxkyt/gkX4ebgT+XPU0sCfMCUQj7ekJYSuk/QfvQOGLa7Qgvk7rRGW7Sk7X
	Z3en646aI1ebHYWJWUum3NhekjVtKM1SahLCL9YseeolB1ich8v0ihb53wlmJhnq+rKz
	pWQDUQdMK/q2La4Q2MEUOGWx30B8dIXd3CWg6soMu59l9spWUmbt/FONdRKvLuSf7ZSQ
	Ci27BbpyWiyea6r7Hee5Ae8Op7I0sNW/8avE6ZKhWC1NfL7SJ1/tF7fABCcPw8knb/iw
	4ep/7CsLq5ZQZhTBYwlGfBnS1Rm6D+1z+qL2M4xi2EqNU/Uauq8hJvjq2qGUOc7mz+8h
	CMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=t6o+94Ce39PnejAH0Wq/LTyAhs7A8M43uYDMMGT4dd8=;
	b=Oby3oxswsqhhS8whUJLK6r2PSa2CcjvDXFYDHKlqVKuuVqrzdYkQegZBzyOFe41ey1
	4eK0oqhnlUFQ4sj3xlVoUgGvc1JnMGa6TGAwoQjxWpbyAbJjBWXpP/oQSUnUtn9KIiX/
	tJRo6AYCl0QyrolCneiPi0YjeY6Z0nid0U2isiEUHM2tLch6dvwensEijLJ47WBAyqGf
	PY48gg7r8lF4Kxa1p2tRfPtt+z8j4loh/TsJgllbF902DAU3VJHENZvEBYRoBGoT7BXF
	fg6/g4CQdl8MuQSIZrJHn1TP8+L8G/N+4fZtmvq+QONKxA4SHSgBl96fy/eYz6LlomyW
	sfMQ==
X-Gm-Message-State: APt69E3uEceL3jXICxfV9cBXtRxIkltjluv/hEFLGHbCn7T69TjsU7Mu
	QBT7Wep6LZX46YkHdr2i/qU=
X-Google-Smtp-Source: ADUXVKK1b9imn6cFHBdBSuoL5PQrx80NJyd8UFOCep0an8AxHeQuNNCC+F4ls+lqX6wzykTanr1MAw==
X-Received: by 2002:a62:8552:: with SMTP id
	u79-v6mr11377487pfd.201.1528574451121; 
	Sat, 09 Jun 2018 13:00:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:34b1:53bf:ee45:2976])
	by smtp.gmail.com with ESMTPSA id
	68-v6sm102469622pfk.46.2018.06.09.13.00.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jun 2018 13:00:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2018 13:00:47 -0700
Message-Id: <1528574447-21755-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
References: <1528574447-21755-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] selftest: add cmake oeqa portion
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
X-List-Received-Date: Sat, 09 Jun 2018 20:00:50 -0000

add boost
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/cmake.py | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/cmake.py

diff --git a/meta/lib/oeqa/selftest/cases/cmake.py b/meta/lib/oeqa/selftest/cases/cmake.py
new file mode 100644
index 0000000..aaf7f95
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/cmake.py
@@ -0,0 +1,43 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+"""Test cases for cmake."""
+
+import os
+import sys
+import unittest
+from glob import glob
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runCmd
+from oeqa.core.decorator.oeid import OETestID
+
+class CmakeSelfTests(OESelftestTestCase):
+    """cmake test class."""
+
+    @classmethod
+    def setUpClass(cls):
+        super(CmakeSelfTests, cls).setUpClass()
+        bitbake("core-image-minimal")
+
+    @OETestID(3000)
+    def test_boost_vesrion_check(self):
+        """Build Hello world with boost support"""
+        result = runCmd("bitbake cmake-boost-version-test")
+        self.assertEqual(0, result.status)
+
-- 
2.7.4



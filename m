Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBBA70030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:37 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id o4so12485118lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EBJoFDeMzx9vhLJiWIsbHQXVW+fdpM5Q1cJ6nmDvyzY=;
	b=ft64t75/LGNWVYawYAQIiurOhLKfEJwiYyPdQ8s3eIHpbOcATY/b4Gj6B78XFMxVOm
	vdA+vi3bqpd5pXYMkBzQDapTuCSPY9fNgJwlPJvNn4xGRv23D0cWyWAaqzOepPrt2ASm
	/KfSIIE9nSlfsBRBaTEwdD+5dj26Z3/q/xDg4cy+O477ixy6stYKo2PKregbT+vDVnZW
	MeEuH3VlcI7VVXVMVzXOLqO2I8tfxJVbxT6iibumuLeSy2T4JT572yX8oGd1xnVfWN4s
	+hz4rLlOMiZ2uPs0PV5H2uiicsZHHVaFNtCtz88JrTsXt/RchdrO4CSrJL+WMe3GgaJA
	CcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EBJoFDeMzx9vhLJiWIsbHQXVW+fdpM5Q1cJ6nmDvyzY=;
	b=hWmJBjd7T5+3uLcLLiEBwBDrGsgOvaV5OgDx/0jSIBDH57BW52aDEcyHu/FLhd3Ros
	aF4orkQqVVJcMri0pC1lziQWFBxk+yFRO8o/sABJNhIB6n9KRzoMF41S/k4Zeqs5A1E2
	YKOHKMReKw/A3zSoLPhleZt6kJdXlHeZTXxC8JSjTzTTROZyFaCnitIzm6eHnYPa1bMM
	VTbcGhIsoevnOegaeRPN2OM3S3Auxbefyu6YiNoxPk5EWv0YSoUjKfZq8XUh4zv8jktQ
	3vqUkLUh9iJx8AF+goKRNbeNL+nWcvFeDDKGbqP5jDqhNGuxtJQfF/Bg8fzmRJ9TjtwE
	2rOg==
X-Gm-Message-State: ALyK8tLWjHFvG83krH8Z7ns5higaofIhdU1Nuxw3ekB6xLuHZLY+Nl3HiaOKtM0RBoCXxFNG
X-Received: by 10.194.191.135 with SMTP id gy7mr19969905wjc.125.1466519977716; 
	Tue, 21 Jun 2016 07:39:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i74sm3272374wmg.21.2016.06.21.07.39.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 15:39:30 +0100
Message-Id: <1466519971-5127-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
References: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] oeqa/sdk: remove buildsudoku test
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:38 -0000

This application needs GTK+ 2 which we're trying to move away from for Sato
images.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/buildsudoku.py | 26 --------------------------
 1 file changed, 26 deletions(-)
 delete mode 100644 meta/lib/oeqa/sdk/buildsudoku.py

diff --git a/meta/lib/oeqa/sdk/buildsudoku.py b/meta/lib/oeqa/sdk/buildsudoku.py
deleted file mode 100644
index 5abbbb8..0000000
--- a/meta/lib/oeqa/sdk/buildsudoku.py
+++ /dev/null
@@ -1,26 +0,0 @@
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import SDKBuildProject
-
-def setUpModule():
-    if not oeSDKTest.hasPackage("gtk+"):
-        skipModule("Image doesn't have gtk+ in manifest")
-
-class SudokuTest(oeSDKTest):
-
-    @classmethod
-    def setUpClass(self):
-        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/sudoku/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
-                        "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
-        self.project.download_archive()
-
-    def test_sudoku(self):
-        self.assertEqual(self.project.run_configure(), 0,
-                        msg="Running configure failed")
-
-        self.assertEqual(self.project.run_make(), 0,
-                        msg="Running make failed")
-
-    @classmethod
-    def tearDownClass(self):
-        self.project.clean()
-- 
2.8.1



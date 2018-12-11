Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E65976C108
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 18:20:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a18so3346453wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oYLBsn2+epQ8kSmlMKaIH72HaxFjhYuVbOHzsAtrD1s=;
	b=1qMwmCYSWU3PBzkZNbvousi04xKpZhyh6AHU1o1bBXMAoSEc0Jkb/APd8DBA5ZGUpy
	TJ12LKeIzltM56VnE5ykd1LEXsBv6bnZdFZrE4nHWWwXOcj1HlerESa/AUCwG/F8m7q7
	2L0RTEx0N07GS9Lb7p08i2lR2w/3IBoVaZ8jshqAFHeVJh9D8OqSe6SRmtyw9/CLbcTT
	RFdpegnraPQW8vY4ACklOS3gyPzPuN7kVDvwoxn/kwovknxCkxKK/wJKGAYoahdwQNGz
	q1IT9huQI6W90wMmF75ncQ2Y6qlt0HX08agSstMacy8jJRWU/W2QX4F61cF2kKz0KrdI
	DLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oYLBsn2+epQ8kSmlMKaIH72HaxFjhYuVbOHzsAtrD1s=;
	b=KwuIxgC8ebULZJqrDU2p8rpFBq1vefIUlPej8VBdwWcMbvTlPtUj7X5uytfWjOQ6Vn
	Ue1g69oNndXkJq7AoaXaf4OHzGCLCTj6NcKHHmVhmnYuOaYkV7F/Vyt5I+D1Clhm/WdR
	7SN6LgLoBlU00wJ0EI/xT6CYohchVWpAQqdwc6ldb4gC2yiKK+ZeF0W4YzKEVPf5/Lje
	W7yHKujOdRm199ox6o9qP6kegf1JnK0P2GmpScdn3nTtM2hF4OqJDrfN+SY8LAf/oflu
	x4B+iL+/PhWJruHYdE8QGC3OcuDq5J10H9rP2O4ynG7gb/gs3xtV5KlXH8H618CkZvAa
	zF6w==
X-Gm-Message-State: AA+aEWaek4MzdErhh1Zqf+lqyh4RVV8SdaZdbkKB/zh6dRI1Pwc8L9US
	Lm+n8B2k6w39CK2fLCanxwZTMJ1QB9o=
X-Google-Smtp-Source: AFSGD/Wwk2aHDUQa5kfdx6wjv9CTQyt+Y83kWMhRsA55mFeik+S06p7Z6x7zJ4K1ylNKmod0+elvOA==
X-Received: by 2002:a7b:c04e:: with SMTP id u14mr3431936wmc.113.1544552433369; 
	Tue, 11 Dec 2018 10:20:33 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b18sm16253616wrw.83.2018.12.11.10.20.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 10:20:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 18:20:23 +0000
Message-Id: <20181211182025.20381-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211182025.20381-1-ross.burton@intel.com>
References: <20181211182025.20381-1-ross.burton@intel.com>
Subject: [PATCH 3/5] oeqa/sdk: clean up galculator test
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
X-List-Received-Date: Tue, 11 Dec 2018 18:20:33 -0000

Drop redundant imports and variables, and use os.makedirs() instead of
bb.utils.mkdirhier().

(From OE-Core rev: fe49be0608e8beac45be2335f1ec970db8ea5e1f)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 7beb55884d3..164a695637a 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -3,17 +3,14 @@ import subprocess
 import tempfile
 import unittest
 
-import bb
-
 from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
-
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
 class GalculatorTest(OESDKTestCase):
-    td_vars = ['DATETIME']
-
+    """
+    Test that autotools and GTK+ 3 compiles correctly.
+    """
     def setUp(self):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
@@ -33,8 +30,8 @@ class GalculatorTest(OESDKTestCase):
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
             self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-            bb.utils.mkdirhier(dirs["build"])
             self._run("cd {source} && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
             self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
-- 
2.11.0



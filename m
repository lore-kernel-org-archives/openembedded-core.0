Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 59B386140D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k11so16660795wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BOxkwcjxwrQNBeJYAq6tjQt36SQjldPMsAEZx7P6y3w=;
	b=IPnclYkrCDPUC52cbhttiZ0UD4e43Rye42S+4HqBV5AFAhtvyazsgFcBuHla2o6YNe
	A5wA0/4xgD57jMd1LF6J39ApRSMK6H6hFurRFM7mIPoEDwHAN5YmLra+TN3/aNLTi2T4
	P4adrhrrWvNUkVRuLyqGxbqJUDPiNAgQPdfuV7rfzp9luoUlSDSsBQoYGnrWx3g1L2mO
	CaAT3JzFriOx7K3IFQl76uGyF+BApq384wnG/7lr5q4Kdiid+oPyHM/3+8WjD2QVdF1f
	lf2Eut3kOROCJlaiQlFrXuwFaCZuONzCWlgmeTbJB/DYyHvgIUX2a9MdDU/GMVzAO/4C
	DPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BOxkwcjxwrQNBeJYAq6tjQt36SQjldPMsAEZx7P6y3w=;
	b=Zde18p/rBsnffd+tRsS4kww0oVoCAVziVvrsGVGG3uw2iZoOTFstnOfMzybSqV3eQE
	kpp9Ar77rQNRBWQNfgM6pdJH8p9dzMabmNWx+xcn1Wxt3ORSncFK2/PLPFcK5R+6R7Wz
	f9ReSZBR9YZD+hhWCiF0y3LM53YgspRJKBdWIkXShtpzctbhfaE1DkPkWvpbxc5Knkv6
	GKveFfU4S/TATttXtY5lbFOznc2uDKLXOp5/vMmirLWfaKHefPKismf3UjpE+DXzkdtz
	sEZ+tZQ48Ih7b0dZAVWvc62WAScaw57PpXhj08UqBYVLV5zVTSO3XaaqBoqD3HJiifce
	lbig==
X-Gm-Message-State: APjAAAUOma9VF1gVYP8DI/z5ojESkyEKjYhiNfRn17cir2sDiyhe1884
	bOExJXJVL43aWsiXxG4LK0Bh7CB2
X-Google-Smtp-Source: APXvYqxLMZTkBJTG2gznsCDlpl+scPnGnDrQmr0Ukr2xzz73kQ41+shewc5e3dJ9JgF0E2buL/9hgQ==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr16417694wrq.412.1581868267974; 
	Sun, 16 Feb 2020 07:51:07 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:11 +0100
Message-Id: <20200216155015.21738-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] weston: add a basic runtime test
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:08 -0000
Content-Transfer-Encoding: 8bit

The test is checking that weston is able to start.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/testimage.bbclass        |  2 +-
 meta/lib/oeqa/runtime/cases/weston.py | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/weston.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 75f0f2c3e3..9588f2c4f8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -57,7 +57,7 @@ BASICTESTSUITE = "\
     ping date df ssh scp python perl gi ptest parselogs \
     logrotate connman systemd oe_syslog pam stap ldd xorg \
     kernelmodule gcc buildcpio buildlzip buildgalculator \
-    dnf rpm opkg apt"
+    dnf rpm opkg apt weston"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
new file mode 100644
index 0000000000..f32599afc3
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -0,0 +1,19 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class WestonTest(OERuntimeTestCase):
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['weston'])
+    def test_weston_running(self):
+        cmd ='%s | grep [w]eston-desktop-shell' % self.tc.target_cmds['ps']
+        status, output = self.target.run(cmd)
+        msg = ('Weston does not appear to be running %s' %
+              self.target.run(self.tc.target_cmds['ps'])[1])
+        self.assertEqual(status, 0, msg=msg)
-- 
2.25.0



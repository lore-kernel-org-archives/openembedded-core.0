Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4322.1794732549170850980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GOt45eer;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so12443415e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732547; x=1795337347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aPcZS7rE6fRziMQObKw2iNHYwWSbT/mH6fA4iDEF2Dw=;
        b=GOt45eersgCNwEe/k2l8XF/YU0tkLCsYtGO9BPNIfES++fqVJkRSbhrCOp9ltsTmLb
         imIXPrYoLqg+SUuCsFJyv5psgvg1/W7fXYyrne0Pau4kPPJFe2QekalXlDWt3Gb5ScO2
         ShdY+kz19yBzj8Br7OF7FBRbu2l7anaMAWh/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732547; x=1795337347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aPcZS7rE6fRziMQObKw2iNHYwWSbT/mH6fA4iDEF2Dw=;
        b=ObskzVZaCmjZm3W72GP9qlrxqK6RK3WbtqOHiZyyJ+Zfgbnn9NBN7eplfGd7YMomIB
         zJZP4lYgi139W4JI3WMTG31zVUeFVI1FmGAj/lw4gyBhWM7vo6PUiMxZn/qzkXM8UXkk
         2Foqifaw4iJ0nbK2TbeqIUyifUKAq6jDUgIHY82Nz7sVAQHK2q87yZlxuljo25S5s8fh
         1PacnujJPNArG6i59rq8zLon00XWg3HEYAVwxbrgak+6lpBaJ9D/iOH4YGKqEshnyEE8
         jlRA0tZVNJd/IVMR3fmc4lCIwQfeQoO3kGqDkmJnM9W59EKgXQoMGbHNOUFrTq2Za6eX
         NFsQ==
X-Gm-Message-State: APuU4Z/vmhaVzrpJdKz3PRZS7ZR6FHphGkYGt5aIVh/A9XQDDv8rfDty
	wjVkNnjLF+4aSn1nnRX0kpjJ6jHersoemgwjpXXpLWuzJQySQ8/gTdIpGXCSpzdFh1qstgI5pKp
	igVfXb5M=
X-Gm-Gg: AYBFou1EF645FnJ8C4t3Qw3BKYjqp5ACXlouZiEU1KwTi5Yz+32hxL65vWWD8lMZxTj
	3Y/gR0Mva57Po2FcO8R6mMvNS+dz7eb81HqkiOZsd390YccrEXWzcCn4AXWiCKirXs/Q98WMgq9
	Xx2A2L0rvnUXV26kYxaWBQsLpJGYV7TW936MVQAuP2xw826UR6yqSYbDp83YOWnmusHS9hoxyPO
	sX3PvwNNY0CK/iJCvqtDgQ4Lyqk42xL1OQnk/M2rgyQNFoNungKfVU5pGhanRFUAX2wjw4e3dXK
	iRdp/qDEkwenY3zou1F+gaN+JEN9nglVGuMRVrvWf3/b4LUvXAFqbWrT4/+Aipt1+6FexWT8X59
	CPDMQU/NITC7feZvOtVsQLKF5aJCOaW1Dr6RV5ZnIkg3As5HBX9Pyv/IeuO9D75uAxSckxIkvOU
	u1ExKAgSq3olIVoCIjgvNKBXWQ3Q0eXF4Yz18D2HgvWj1z1ek8U3F+74Hujxpz2qtHz6gaQK25b
	41SCKuxlzsc933ObLYj+SbPgFWmK1WwSHklsOKHcZGP3aHPgeIk22WCLSewJVXuS41QHJltaX9y
	yfHM9B+wz4sg5eAPDXxoFb5PRpoEZXiHg3PnCHbshTqUbeSt7hVb2c4dtw==
X-Received: by 2002:a05:600c:6091:b0:4bb:6a2d:b426 with SMTP id 5b1f17b1804b1-4bb6a2db60amr27405875e9.1.1794732547244;
        Sun, 15 Nov 2026 00:49:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/41] oeqa: Drop redundant .keys() calls on dicts
Date: Sun, 15 Nov 2026 08:48:14 +0000
Message-ID: <20261115084845.701136-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250242
Content-Type: text/plain; charset="utf-8"

Dict membership tests and iteration work on the dict directly, so
wrapping in list(d.keys()) or calling .keys() is unnecessary.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/context.py             |  4 +-
 meta/lib/oeqa/selftest/cases/manifest.py |  4 +-
 meta/lib/oeqa/selftest/cases/pkgdata.py  | 56 ++++++++++++------------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 891910d218c..f00e40eb6c6 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -34,12 +34,12 @@ class OESDKTestContext(OETestContext):
         if regex:
             # do regex match
             pat = re.compile(pkg)
-            for p in manifest.keys():
+            for p in manifest:
                 if pat.search(p):
                     return True
         else:
             # do exact match
-            if pkg in manifest.keys():
+            if pkg in manifest:
                 return True
         return False
 
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 2c103c06fe3..08b0ceca05b 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -87,7 +87,7 @@ class VerifyManifest(OESelftestTestCase):
                          host = 'nativesdk-packagegroup-sdk-host')
         try:
             mdir = self.get_dir_from_bb_var('SDK_DEPLOY', self.buildtarget)
-            for k in d_target.keys():
+            for k in d_target:
                 toolchain_outputname = get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
                 mfilename[k] = "{}.{}.manifest".format(toolchain_outputname, k)
                 mpath[k] = os.path.join(mdir, mfilename[k])
@@ -113,7 +113,7 @@ class VerifyManifest(OESelftestTestCase):
                     .format(self.classname, mdir)
             self.fail(msg)
 
-        for k in d_target.keys():
+        for k in d_target:
             self.logger.debug("{}: Check manifest {}".format(
                 self.classname, m_entry[k].file))
 
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 8accf1be097..082c69f8a0d 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -129,15 +129,15 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe-space package name
         result = runCmd('oe-pkgdata-util list-pkg-files zlib-dev zlib-doc')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files, "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         # Test runtime package name
         result = runCmd('oe-pkgdata-util list-pkg-files -r libz1 libz-dev')
         files = splitoutput(result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files, "listed pkgs. files: %s" %result.output)
         self.assertGreater(len(files['libz1']), 1)
         libspec = os.path.join(libdir, 'libz.so.1.*')
         found = False
@@ -150,12 +150,12 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dbg', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', files, "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('zlib-locale', files, "listed pkgs. files: %s" %result.output)
         # (ignore ptest, might not be there depending on config)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
@@ -163,36 +163,36 @@ class OePkgdataUtilTests(OESelftestTestCase):
         # Test recipe, runtime
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertNotIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dbg', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', files, "listed pkgs. files: %s" %result.output)
+        self.assertNotIn('libz-locale', files, "listed pkgs. files: %s" %result.output)
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])
         # Test recipe, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -u')
         files = splitoutput(result.output)
-        self.assertIn('zlib-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('zlib-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('zlib-dbg', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-doc', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-dev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-staticdev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('zlib-locale', files, "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['zlib-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['zlib-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['zlib-staticdev'])
         # Test recipe, runtime, unpackaged
         result = runCmd('oe-pkgdata-util list-pkg-files -p zlib -r -u')
         files = splitoutput(result.output)
-        self.assertIn('libz-dbg', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-doc', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-dev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-staticdev', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz1', list(files.keys()), "listed pkgs. files: %s" %result.output)
-        self.assertIn('libz-locale', list(files.keys()), "listed pkgs. files: %s" %result.output) # this is the key one
+        self.assertIn('libz-dbg', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-doc', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-dev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-staticdev', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz1', files, "listed pkgs. files: %s" %result.output)
+        self.assertIn('libz-locale', files, "listed pkgs. files: %s" %result.output) # this is the key one
         self.assertIn(os.path.join(includedir, 'zlib.h'), files['libz-dev'])
         self.assertIn(os.path.join(mandir, 'man3/zlib.3'), files['libz-doc'])
         self.assertIn(os.path.join(libdir, 'libz.a'), files['libz-staticdev'])

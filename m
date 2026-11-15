Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4379.1794732558291589331
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hDl6cfsn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so960284f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732556; x=1795337356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3oS7/UZLfkLqvDEUodlzuQQA4oMoTA9Wh9Y+MDqldu0=;
        b=hDl6cfsnbnNz0FdH4m3y7BBm8Y4zVtTUZa5idGHPLQFNwm4GUQ8JvLFBAs8/0Mdqu1
         xzQzjQKqT0rMRkrLl11jIh7uvCpFadcrmYOh2L66nlnHkULzKTAIPxrrMREmKuqp/pka
         5kROYAlJW82cPzx/pqVNXBMrBypvOKw8nivY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732556; x=1795337356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3oS7/UZLfkLqvDEUodlzuQQA4oMoTA9Wh9Y+MDqldu0=;
        b=vZy2o8DZ5CRK4olXpskLbT0XkCFO989umrnhvKWXvFqf8m/4gXfpHlfBor5U8hQWK7
         whKaU7YonleoAWZXZ4Go5LYoDzFcqrcv00VnMCEXQyK4zGOtlJi62Ip84HqPkJCZH6yX
         AW5ZbA6o56mKwHOluF8jGPe5BE8ayDJQD55jX88SnLchrSOfry1OYuZ34zcqKmnMRhyo
         3hqv7+YnsKUPpH0zQ9ZbbElOakjiXhcnhn0lwIO4f+InuDwhwj6oEZJ3YjhDs+LYHfOf
         NR4nk75aj3ld4y60EDnOEpTMyfv8f1G8DdO2Mn/2yg6uL0S40JVGzdd1e3J6kVs1TCJu
         sObQ==
X-Gm-Message-State: APuU4Z+KsMZMwmWiUaeU8QEpYbzyIwjawAPfMhy9HUS48hHjYZsOo+LU
	6jsFbnXxeYdqkrRUFBkaQjdNtJpL1LqN7LUIBomYx1gsqpoSQGLe+uws6cGPyQ0XU9HhMB5AiVA
	9p+L2/Co=
X-Gm-Gg: AYBFou2+z+lS4WG856ugtsJ2gLwJgXa9nIvFup8DNWKIMa2lscNpVyXd/zqdL7Ibb+/
	yI6xupbiBuK+LEcpgfy9Q1EQ0ke2qV6UBdyE3wTieduXJ6yqZssjnHVVfAEOsAld3V1iH415eGF
	MWxUurHcjRWzuqWODGKz3heK3I80GzeE8es0O+Uz431xyLcOavV2IM+eKTy0ForFZh8VF8OwBro
	+YCrjNa3SnltC6ChZ7ioRjTkdH7xqu0s6L8+OH+dqVe9JFo2yaAh+OH/onNYZHSMv3LGPK7xGxm
	2klu82z9lQiStOS2f7DAP6W8f65dPtV1wVIxRkW9wtEUb7WTBM8dz31rgnqVcBn5WK5h25xCKm0
	+kiglfg0qvwWTi5Hv+6ZnBFdTW1BxCZkhnlAkDjYt4Q4X7sBgJT5+8Dm4TpM3QFlbAROjChfxiV
	X0dfV1GHNr13Q+nhFCDGEbc6Y77qW/iYK2hkH//XVchhfIcZQp7atulA2fdAmBBCUnGbBwY0zY3
	MQu1sASf1hWNrTI/qAMzZhQdFraH3l/fnXaoEgZFT/LcOg3tSVdOEtGSzRrbHFq+quiYbpRV7Mx
	anIC9AHiHHcT3vpN77h1MLoInIusJJt5j3zk2vHs76Yu7s3xHIIcZ40y1g==
X-Received: by 2002:a05:6000:981:b0:48e:1f08:4f05 with SMTP id ffacd0b85a97d-49c72306696mr15489893f8f.33.1794732556376;
        Sun, 15 Nov 2026 00:49:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/41] oeqa/runexported.py: Remove file
Date: Sun, 15 Nov 2026 08:48:20 +0000
Message-ID: <20261115084845.701136-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250248
Content-Type: text/plain; charset="utf-8"

testexport.bbclass uses scripts/oe-test to execute tests and this
script hasn't been updated/used in years. Remove it as we don't
need multiple ways to do things.

Fix various comments to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testexport.bbclass       |   2 +-
 meta/lib/oeqa/runexported.py                 | 153 -------------------
 meta/lib/oeqa/selftest/cases/runtime_test.py |   4 +-
 3 files changed, 2 insertions(+), 157 deletions(-)
 delete mode 100755 meta/lib/oeqa/runexported.py

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index adcc36c0622..b2b4a358c43 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -9,7 +9,7 @@
 # - First build an image. i.e. core-image-sato
 # - Add IMAGE_CLASSES += "testexport" in local.conf
 # - Then bitbake core-image-sato -c testexport. That will generate the directory structure
-#   to execute the runtime tests using runexported.py.
+#   to execute the runtime tests using scripts/oe-test.
 #
 # For more information on TEST_SUITES check testimage class.
 
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
deleted file mode 100755
index 982d8affa03..00000000000
--- a/meta/lib/oeqa/runexported.py
+++ /dev/null
@@ -1,153 +0,0 @@
-#!/usr/bin/env python3
-#
-# Copyright (C) 2013 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-# This script should be used outside of the build system to run image tests.
-# It needs a json file as input as exported by the build.
-# E.g for an already built image:
-#- export the tests:
-#   TEST_EXPORT_ONLY = "1"
-#   TEST_TARGET  = "simpleremote"
-#   TEST_TARGET_IP = "192.168.7.2"
-#   TEST_SERVER_IP = "192.168.7.1"
-# bitbake core-image-sato -c testimage
-# Setup your target, e.g for qemu: runqemu core-image-sato
-# cd build/tmp/testimage/core-image-sato
-# ./runexported.py testdata.json
-
-import sys
-import os
-import time
-import argparse
-
-try:
-    import simplejson as json
-except ImportError:
-    import json
-
-sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
-
-from oeqa.oetest import ExportTestContext
-from oeqa.utils.commands import runCmd, updateEnv
-from oeqa.utils.sshcontrol import SSHControl
-
-# this isn't pretty but we need a fake target object
-# for running the tests externally as we don't care
-# about deploy/start we only care about the connection methods (run, copy)
-class FakeTarget:
-    def __init__(self, d):
-        self.connection = None
-        self.ip = None
-        self.server_ip = None
-        self.datetime = time.strftime('%Y%m%d%H%M%S',time.gmtime())
-        self.testdir = d.getVar("TEST_LOG_DIR")
-        self.pn = d.getVar("PN")
-
-    def exportStart(self):
-        self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
-        sshloglink = os.path.join(self.testdir, "ssh_target_log")
-        if os.path.lexists(sshloglink):
-            os.remove(sshloglink)
-        os.symlink(self.sshlog, sshloglink)
-        print("SSH log file: %s" %  self.sshlog)
-        self.connection = SSHControl(self.ip, logfile=self.sshlog)
-
-    def run(self, cmd, timeout=None):
-        return self.connection.run(cmd, timeout)
-
-    def copy_to(self, localpath, remotepath):
-        return self.connection.copy_to(localpath, remotepath)
-
-    def copy_from(self, remotepath, localpath):
-        return self.connection.copy_from(remotepath, localpath)
-
-
-class MyDataDict(dict):
-    def getVar(self, key, unused = None):
-        return self.get(key, "")
-
-def main():
-
-    parser = argparse.ArgumentParser()
-    parser.add_argument("-t", "--target-ip", dest="ip", help="The IP address of the target machine. Use this to \
-            overwrite the value determined from TEST_TARGET_IP at build time")
-    parser.add_argument("-s", "--server-ip", dest="server_ip", help="The IP address of this machine. Use this to \
-            overwrite the value determined from TEST_SERVER_IP at build time.")
-    parser.add_argument("-d", "--deploy-dir", dest="deploy_dir", help="Full path to the package feeds, that this \
-            the contents of what used to be DEPLOY_DIR on the build machine. If not specified it will use the value \
-            specified in the json if that directory actually exists or it will error out.")
-    parser.add_argument("-l", "--log-dir", dest="log_dir", help="This sets the path for TEST_LOG_DIR. If not specified \
-            the current dir is used. This is used for usually creating a ssh log file and a scp test file.")
-    parser.add_argument("-a", "--tag", dest="tag", help="Only run test with specified tag.")
-    parser.add_argument("json", help="The json file exported by the build system", default="testdata.json", nargs='?')
-
-    args = parser.parse_args()
-
-    with open(args.json, "r") as f:
-        loaded = json.load(f)
-
-    if args.ip:
-        loaded["target"]["ip"] = args.ip
-    if args.server_ip:
-        loaded["target"]["server_ip"] = args.server_ip
-
-    d = MyDataDict()
-    for key in loaded["d"].keys():
-        d[key] = loaded["d"][key]
-
-    if args.log_dir:
-        d["TEST_LOG_DIR"] = args.log_dir
-    else:
-        d["TEST_LOG_DIR"] = os.path.abspath(os.path.dirname(__file__))
-    if args.deploy_dir:
-        d["DEPLOY_DIR"] = args.deploy_dir
-    else:
-        if not os.path.isdir(d["DEPLOY_DIR"]):
-            print("WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"])
-
-    parsedArgs = {}
-    parsedArgs["tag"] = args.tag
-
-    extract_sdk(d)
-
-    target = FakeTarget(d)
-    for key in loaded["target"].keys():
-        setattr(target, key, loaded["target"][key])
-
-    target.exportStart()
-    tc = ExportTestContext(d, target, True, parsedArgs)
-    tc.loadTests()
-    tc.runTests()
-
-    return 0
-
-def extract_sdk(d):
-    """
-    Extract SDK if needed
-    """
-
-    export_dir = os.path.dirname(os.path.realpath(__file__))
-    tools_dir = d.getVar("TEST_EXPORT_SDK_DIR")
-    tarball_name = "%s.sh" % d.getVar("TEST_EXPORT_SDK_NAME")
-    tarball_path = os.path.join(export_dir, tools_dir, tarball_name)
-    extract_path = os.path.join(export_dir, "sysroot")
-    if os.path.isfile(tarball_path):
-        print ("Found SDK tarball %s. Extracting..." % tarball_path)
-        result = runCmd("%s -y -d %s" % (tarball_path, extract_path))
-        for f in os.listdir(extract_path):
-            if f.startswith("environment-setup"):
-                print("Setting up SDK environment...")
-                env_file = os.path.join(extract_path, f)
-                updateEnv(env_file)
-
-if __name__ == "__main__":
-    try:
-        ret = main()
-    except Exception:
-        ret = 1
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 0e7ccf45856..f431f58c66e 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -20,8 +20,7 @@ class TestExport(OESelftestTestCase):
         """
         Summary: Check basic testexport functionality with only ping test enabled.
         Expected: 1. testexport directory must be created.
-                  2. runexported.py must run without any error/exception.
-                  3. ping test must succeed.
+                  2. ping test must succeed.
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
@@ -44,7 +43,6 @@ class TestExport(OESelftestTestCase):
         self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
 
         with runqemu('core-image-minimal') as qemu:
-            # Attempt to run runexported.py to perform ping test
             test_path = os.path.join(testexport_dir, "oe-test")
             data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
             manifest = os.path.join(testexport_dir, 'data', 'manifest')

Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29838.1793868249343816763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=grn8sdz+;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso10412325e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868247; x=1794473047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tG2ESOmikz6UvNRqUdiJf+Vit+UzAtyfc/OuATEVPWk=;
        b=grn8sdz+ci8Dw+swvzjthVPybkv1jmE1oOxYSFYNKcVM/2+quu3ohOwiO2qM0l+bak
         6HXVZvs7EW8bymO78QyOuG/UWLAnb3ri15zd8NTcCMvIpuh68dxHznWUWZpwurp1g4Ax
         +JJCHbjykX5s3hiErEGRn+57RWqQL3vVSgVeEDEm8Iw1yIS7q/9pJlgGbltPJiB3Uffx
         IcaRoBo+RoONF87gql347HKkV/hoeUcbR401FNj9i7WFWOJE7JxHW2pOp/nivsTGXuN0
         BRAeoFgDWuBKf5tGBzYOGjdaOCpiikyG7+ID8/S91T/OHFT9CU7GjMg0Yi2w4vjnNy6T
         efbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868247; x=1794473047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tG2ESOmikz6UvNRqUdiJf+Vit+UzAtyfc/OuATEVPWk=;
        b=MAFU4I+mNZxI+idSJy9NrQVuUfGFKtxs3/CmepN9tR6SpT55ofaFFbiAjoiHZKNHRu
         Pga8ZtwGZDJqG8daLtFwIZMj6meZSZ5mRr8HaYUGDTXsG218Mb9iYb7J55tp7NqUdwME
         GNQE0Jp68i/xkLZkzBy6sBGfoAfu3T61rLVVo6U5tZoju7Q4L0xlTI1WgQ5KOXrstQwm
         fnOjmynW7jVwT3omoZ4B5K38ncY8RKiqoHI3Xu5lDWu4kjwCIUHQkIdicMB5lYeJg+lF
         P/UZk+mYPL8585S91sM7zvgNzxwnd9i93FuRMWzlZrIWFOqF3yHratzbk3TGPIs+3I72
         J7dg==
X-Gm-Message-State: APuU4Z8IA1nteM69wQdZYaudVaih+BJcX9/M66wrxxVJYJZzCD3KhMNb
	IXX6WkaieabvnZTEU+I77cWWLsQaFAFCfPURtXaQrN0TJn9EmgVSExC1m/1DhJtNrbztANmL+q+
	Scf95/dE=
X-Gm-Gg: AYBFou07fDK48RbkrP0VDb2uG1nanB4dqf5dkHHVnVyKlejksodXVO6JcehijMAcB5O
	JtB09XgbR/OJfNlgnmwYcJ/8yMfdjcTlw3TQuuboJdWzCEQrdoj96aQnFkRb5fzr3K7PDDqsxlJ
	B4Tq3dv7XQQOVId2blQKNJ7TEj7D3q6ImeLGZJVfMCZ7Em5/9ADL03a6x9dEAXn+D6GSRQuPU49
	V6ArJvEtT/9va2GaH/No3e2OB4VuBK/xtqjTgZ3FTfOUbjP4Akr0PHH925qRsE5b6rfJLmuefXW
	O/k2UP3PazT2OVWQXM7Jkay8VKCFE371R5ZxEtW6MUfk+N0qk/ueNIcKsOULVrSVBAP1NnByPQ9
	bLCJkO8jU7jfSIHKEAwa1vgcIpiq5Ebtmd0YFkk6EvGd1GhV3bVYNyBn0L9OvCVY2xyPdsqq8iv
	nEgDeTnupnBptehHYx2uYGNDoeMnrAtPNHmNcmJG6rBfcE2YVXTbKAG12OdTXAn2go0m92JPJEI
	z1XfWjvZDHIRgFUr6z4DFn4vdaixuQiHXiEvwk6jZVfW984zwX+IbjVhqNi4aV7sk73CMXoojVg
	Thj1qSprgWS51xab5RuTdLus+6PxdEtsOW1eUTogECJv7II5FnmJnAvo0GZVdWVKW8Fgtr3x1X9
	7+ENs9vvPIgZnxKwbjApyIPi+hgSL
X-Received: by 2002:a05:600c:474f:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ac1793ed87mr411541515e9.24.1793868247572;
        Thu, 05 Nov 2026 00:44:07 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 56/60] oe-selftest: devtool: do not add ide-sdk test kits to the user's CMake kits
Date: Thu,  5 Nov 2026 09:43:15 +0100
Message-ID: <07d8a26686a90d1ff0c365d70b74d0c7c303af16.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249515
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The shared sysroot test of devtool ide-sdk adds a cmake-kit with the path
of the temporary test build directory to ~/.local/share/CMakeTools. Every
test run adds another stale kit, which is never removed again. Use a
temporary XDG_DATA_HOME for the test, and verify that the kit is added
there.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa83da7da277a641c3a997d3da26041fa46d48ab)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index dbe039f8e6e..436eccafb93 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4556,9 +4556,14 @@ class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
         # Handle the workspace (which is not needed by this test case)
         self._check_workspace()
 
+        # Do not add a cmake-kit to the kits of the user
+        xdg_data_home = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(xdg_data_home)
+        ide_env = dict(os.environ, XDG_DATA_HOME=xdg_data_home)
+
         result_init = runCmd(
             'devtool ide-sdk -m shared oe-selftest-image cmake-example meson-example --ide=code',
-            output_log=self._cmd_logger)
+            output_log=self._cmd_logger, env=ide_env)
         bb_vars = get_bb_vars(
             ['REAL_MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'], "meta-ide-support")
         environment_script = 'environment-setup-%s' % bb_vars['REAL_MULTIMACH_TARGET_SYS']
@@ -4570,6 +4575,11 @@ class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
         # Verify the cross environment script is available
         self.assertExists(environment_script_path)
 
+        # Verify the cmake-kit is added to the location where CMake Tools looks for it
+        with open(os.path.join(xdg_data_home, 'CMakeTools', 'cmake-tools-kits.json')) as f:
+            kits = json.load(f)
+        self.assertEqual([kit['environmentSetupScript'] for kit in kits], [environment_script_path])
+
         def runCmdEnv(cmd, cwd, output_log=self._cmd_logger):
             cmd = '/bin/sh -c ". %s > /dev/null && %s"' % (
                 environment_script_path, cmd)

Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5689C54EE9
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:22:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.9370.1662016912160956631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZLN1M2aH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay12so8511327wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7tpAiVgnBxqL4M/Y+0zyRJYaZFInzFUbeaX/lgt/FuQ=;
        b=ZLN1M2aHXBLYkdB2vWuxXJTroPv93ZtqwHNUBW0tPcO/5WfROFUAswfJeFdOyzmvB8
         BJ0woKaaNi/g5EHmDQME3+tN6d2vnWzNX+FNQnEpZi5DWvH9k6gXLHjXxsfZroiLX9vc
         OgXX4a7GS9Hn8UJUM6YH9GAwewgG8iQKQiHl1ysoKhrRBLNkimBfsSfs9lqxBdouxlsK
         p1Kny1XqpD51IHyh2c5IYSKyzpYcaX0nhQIgrcSBi4Rg/tpTwg0KQ42FBxINY4VPaQvD
         6PPb2lT6Ik6Bzv1ow/eLcsrF+kETQM59u8ECJlrf/t6ZTgKx45p4APAEKqXRveOC8SWd
         sxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7tpAiVgnBxqL4M/Y+0zyRJYaZFInzFUbeaX/lgt/FuQ=;
        b=HHwmusSF+Mh8p9FVLMKw9YAVKL0BU9svtVPRmcPMwXXQG9M+7PmeMTi6hgfBsKuT1k
         BeWgmnbcDBMq/Zx7cleJXCdi42Z77XDjRZOltlH/qBWp6ZAeMUKqPVqGzKK2ebpWmgZp
         tqo1W10+yNTyqYD2eAKL4ZDhNdWRxlIfJW8hS/FTXOlDwQiccG9yFYVJNNhc1+xUgT0n
         hyk1vswPXajm7f7V8e+fZ8seGPM1SxRn4rmEkHPSBnuzd2/vM4tpEJssbyFMPuXc33Gg
         JBumf3AWtvKhYAMCgSyMf0VZ/TNDw4m1C85klm0iEVEVdMITJej+WP6aWrrti2ydOmiE
         g7hQ==
X-Gm-Message-State: ACgBeo16ConADMlvp5RWISyJQxMms3xAw19th4Oa3+fEFHF7zRM66iBk
	1qn5+hFazfmH9lJTcSvCkGgLTQSY+34=
X-Google-Smtp-Source: 
 AA6agR669ojTVNNbkzhhsSlxRaa5NLQz7XbGL6OLf20TfMfrD8bMjRV6WnrYaFuC4TZVWjl1n7GWTQ==
X-Received: by 2002:a05:600c:19c6:b0:3a5:ffb3:d527 with SMTP id
 u6-20020a05600c19c600b003a5ffb3d527mr4164410wmq.106.1662016910646;
        Thu, 01 Sep 2022 00:21:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/14] python3-pip: remove unneeded reproducible.patch
Date: Thu,  1 Sep 2022 09:21:25 +0200
Message-Id: <20220901072125.3366367-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:22:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170156

Since "python_pep517: use installer instead of pip" pip is no longer
used in builds, and therefore doesn't need to behave reproducibly.

I have submitted the patch upstream; upstream have suggested that the
way it had been used previously is non-reproducible by design, and
if pip is again brought into builds in the future, we should use
specific options for reproducibility:

https://github.com/pypa/pip/issues/11424

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pip/reproducible.patch     | 83 -------------------
 .../python/python3-pip_22.2.2.bb              |  1 -
 2 files changed, 84 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pip/reproducible.patch

diff --git a/meta/recipes-devtools/python/python3-pip/reproducible.patch b/meta/recipes-devtools/python/python3-pip/reproducible.patch
deleted file mode 100644
index 4742a8352b..0000000000
--- a/meta/recipes-devtools/python/python3-pip/reproducible.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Pip installed wheels are not reproducible currently. The direct_url
-files encode an installation path and the installed wheels compile
-the python files at their location, not their final install location
-which is incorrect.
-
-To fix this, simply disable the direct_urls and pass the "root" to
-the python compile function to strip that path out of the compiled
-files.
-
-A version of this patch, perhaps stripping root from the direct_urls
-may be something that could be considered by upstream.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://github.com/pypa/pip/issues/11424]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/pip/_internal/operations/install/wheel.py | 5 ++++-
- src/pip/_internal/req/req_install.py          | 5 ++++-
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/pip/_internal/operations/install/wheel.py b/src/pip/_internal/operations/install/wheel.py
-index 1af8978..3e48f9b 100644
---- a/src/pip/_internal/operations/install/wheel.py
-+++ b/src/pip/_internal/operations/install/wheel.py
-@@ -434,6 +434,7 @@ def _install_wheel(
-     warn_script_location: bool = True,
-     direct_url: Optional[DirectUrl] = None,
-     requested: bool = False,
-+    root: str = None,
- ) -> None:
-     """Install a wheel.
- 
-@@ -610,7 +611,7 @@ def _install_wheel(
-             with warnings.catch_warnings():
-                 warnings.filterwarnings("ignore")
-                 for path in pyc_source_file_paths():
--                    success = compileall.compile_file(path, force=True, quiet=True)
-+                    success = compileall.compile_file(path, force=True, quiet=True, stripdir=root)
-                     if success:
-                         pyc_path = pyc_output_path(path)
-                         assert os.path.exists(pyc_path)
-@@ -721,6 +722,7 @@ def install_wheel(
-     warn_script_location: bool = True,
-     direct_url: Optional[DirectUrl] = None,
-     requested: bool = False,
-+    root: str = None,
- ) -> None:
-     with ZipFile(wheel_path, allowZip64=True) as z:
-         with req_error_context(req_description):
-@@ -733,4 +735,5 @@ def install_wheel(
-                 warn_script_location=warn_script_location,
-                 direct_url=direct_url,
-                 requested=requested,
-+                root=root,
-             )
-diff --git a/src/pip/_internal/req/req_install.py b/src/pip/_internal/req/req_install.py
-index a1e376c..4c3f1bb 100644
---- a/src/pip/_internal/req/req_install.py
-+++ b/src/pip/_internal/req/req_install.py
-@@ -779,7 +779,9 @@ class InstallRequirement:
-             assert self.local_file_path
-             direct_url = None
-             # TODO this can be refactored to direct_url = self.download_info
--            if self.editable:
-+            if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-+                direct_url = None
-+            elif self.editable:
-                 direct_url = direct_url_for_editable(self.unpacked_source_directory)
-             elif self.original_link:
-                 direct_url = direct_url_from_link(
-@@ -796,6 +798,7 @@ class InstallRequirement:
-                 warn_script_location=warn_script_location,
-                 direct_url=direct_url,
-                 requested=self.user_supplied,
-+                root=root,
-             )
-             self.install_succeeded = True
-             return
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-pip_22.2.2.bb b/meta/recipes-devtools/python/python3-pip_22.2.2.bb
index 9ef6d51cf5..5b6cccf7ed 100644
--- a/meta/recipes-devtools/python/python3-pip_22.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.2.2.bb
@@ -33,7 +33,6 @@ LIC_FILES_CHKSUM = "\
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
-SRC_URI += "file://reproducible.patch"
 
 SRC_URI[sha256sum] = "3fd1929db052f056d7a998439176d3333fa1b3f6c1ad881de1885c0717608a4b"
 
-- 
2.30.2



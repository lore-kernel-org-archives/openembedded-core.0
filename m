Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14963.1794777580052180964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fnXCRrhz;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5280188eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 13:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777579; x=1795382379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgzwkwCyPNTkP9morMbGDJVXDJlN98Y8cFYT9VgMYdU=;
        b=fnXCRrhzaf3U6u3JwIX8WfFcmoCl5v3hGB8wON7rPVNqYiUu4lDHoJEQgeB6x7Z/Nr
         qAIPbi7HOcsUaqS2CF9WyhvwfoUet1CLo3wY2gtjKdRfOupgl5697Rwg2eJc6t0JkuGO
         S/wW/gBJGvXpb3+YrxmPXj+HGgT0ZJlN0PuIiafYMbUflHkYbrG+UX8SMzlQhKLRCvxN
         M4l2/9XAX/PfbExB+zxSOlQ5oG42SJhDjlVhv9Q/5jX2y7qUf8RSGwa2DbVOXvRne0ud
         NAr+wyJlPXEw/ljXi49G+anfNx1qpbhZe55pxTZH9ttHRgWI+LwgKqvuHyql1z44qjuJ
         0W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777579; x=1795382379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgzwkwCyPNTkP9morMbGDJVXDJlN98Y8cFYT9VgMYdU=;
        b=Oo7zwdAPsJR2HE0/lf/ZKnvn6k8DADXFtk3HfzuZp5Brsp4Q8njCMxOsEVgAFPfePD
         sVtQ0evP1I9suq2VuFCZtGb6Eq7Adu6ngGW8foVZYQteVA1j6psInsW5VKxUBhtOO2tn
         Qgku3yY//AqORpF1XV+hCWp90yhN5+tGCqWqH/b9e5HkSg8HMpPaoCHCzCUTqZF1GZ60
         YdZDG+EMqVTsY2N5wZClehbntxDPoKVB+psR8bGgjswdBDWJFCAM8Ct8J5GQaFMYABGc
         r6caFv7ZFszaHNuEK1lnvMJ1rwGHqpsuD6mGzpr0JIWwpDtzJtKFV6eXnXntcQ47SMj1
         r5Ag==
X-Gm-Message-State: APuU4Z92ZRc8/B74+z2/WWMAX7SefXM4k8K0JeBfnyKUnkfkJS/t6fin
	OH+G7NyZkr/KGbh7OtlsoHJpTpNcJ8f1S3bNpDEagF+3VJcc0tJcVFH6jB9w13xC
X-Gm-Gg: AYBFou1Szfjd3uY8/8hiVfTyryB8zrf02WJPmNqRPT2DN1x8hRJo6YG2NiuvbgO7JnU
	qJyg2Aw0P/6bGCNvmv4lgzGEdDH17QnYl8p6hRsM76oeyQG+nZP67Yvn3gvP8Uvk41hwhzmOhkO
	VKStM0Kd363Ejv+aogy7/mfVhxxVgzi2zxKRAAoBRw+WZslbjYf6PvpX1HfV5iqR3UAbSPjI1BZ
	AdAeaLOTqJ3GsBzDKXMgyh7z2KgRZ56JozN3prntgLYnj/w5Xr7Ul4A+34aphorrJNmRgnFOMav
	kNlJM0iGUYokkJi2l5NKsKMee7rVcRHkR+/m286k2XpRxInC8X9/AwyF5L5p+H69Qk1PpQnMa/C
	PHd+TmaHn2rjlZ8bDggpMZkHmbOi761zbPwA0C344t4zntjofAKEHCSZMMkLFj0geddTRrKDMQO
	z+BTYo0NMm0NU2EUo3TRIDCXI4AL+MxOyyR1KpBEyqcfk+bRQT1n6s/EnqMwxJgx5O94UkqTHcj
	+RbjXoFbjgcnmR3WC/Fzea6CTh4pQrcqUJfvaF9sf6vmadhm60BfTJAgNOOJzq1bw5etd0y5tXp
	YJI2g1mgv9LuhEPPnSoLpTUT+Omyjj3BCMJAYldEHTtuGsHG6oqMKqr3tSk17w+rFP40gUy8xem
	qrLyil7rd2Z4EpFDndp3OaaPAB8vPzWWVJMtYc1MBHjkGkj4sgB3UWHRRFL477NAMuZMKfbe6nX
	yQH6T2pRvYWwp+nWP5kNDb88Saz0+4JHSrrZ5lE81T5OkHWCA7GbWn8FhEJOPlylF0hnKo9p9Em
	HxuV91vIE6stDQBicVrUyyYJCIWrdPSXKnQBk4IDN44rrwrb2a4nHF6+8UlMleakKv/fs2q0IoK
	DPTn
X-Received: by 2002:a05:7301:5f0b:b0:378:7434:a526 with SMTP id 5a478bee46e88-3796628f413mr8315373eec.14.1794777579106;
        Sun, 15 Nov 2026 13:19:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm55075499eec.20.2026.11.15.13.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:19:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH] create-spdx-3.0: Install deploy task SPDX into the task's arch directory
Date: Sun, 15 Nov 2026 13:19:36 -0800
Message-ID: <20261115211936.3574127-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250282
Content-Type: text/plain; charset="utf-8"

Deploy tasks write their SPDX documents to DEPLOY_DIR_SPDX/SSTATE_PKGARCH,
but the sstate manifest of a machine specific deploy task, such as
do_deploy, uses the stamp-extra-info arch (MACHINE_ARCH). For an allarch
recipe with do_deploy, the documents therefore land in the shared allarch
directory while each machine has its own manifest, so building it for a
second machine in the same TMPDIR fails:

  ERROR: qcom-partition-conf-git-r0 do_deploy: Recipe qcom-partition-conf
  is trying to install files into a shared area when those files already
  exist.
    .../deploy/spdx/3.0.1/allarch/deploy/qcom-partition-conf-do_deploy-deploy.spdx.json
      (matched in manifest-uno_q-qcom-partition-conf.deploy)

Install the documents into the directory of the stamp-extra-info arch
instead, falling back to SSTATE_PKGARCH. The arch must not be part of the
sstate object itself, since an allarch recipe shares that object between
machines, so write the documents without the arch directory, through a
task scoped SPDX_PKGARCH that is empty, and add the arch to the sstate
output directory, as do_deploy itself does with DEPLOY_DIR_IMAGE.

Fixes: 1b77fe51ec ("spdx: Add ability for deploy tasks to create SPDX")

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass |  4 +++-
 meta/lib/oe/sbom30.py                | 11 +++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 0d0bddcc67..f214448a1e 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -426,8 +426,10 @@ python () {
         new_postfuncs.extend(postfuncs)
 
         d.setVarFlag(task, "postfuncs", " ".join(new_postfuncs))
+        d.setVar("SPDX_PKGARCH:task-" + task[3:].replace("_", "-"), "")
+        spdx_arch = d.getVarFlag(task, "stamp-extra-info", False) or "${SSTATE_PKGARCH}"
         d.prependVarFlag(task, "sstate-inputdirs", f"{spdx_deploy} ")
-        d.prependVarFlag(task, "sstate-outputdirs", "${DEPLOY_DIR_SPDX} ")
+        d.prependVarFlag(task, "sstate-outputdirs", f"${{DEPLOY_DIR_SPDX}}/{spdx_arch} ")
         d.prependVarFlag(task, "file-checksums", "${SPDX3_DEP_FILES} ")
         d.prependVarFlag(task, "dirs", f"{spdx_deploy} ")
         d.prependVarFlag(task, "cleandirs", f"{spdx_deploy} ")
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 520f9df3ef..62e181b970 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1043,6 +1043,13 @@ def load_jsonld(d, path, required=False):
     return objset
 
 
+def get_pkg_arch(d):
+    pkg_arch = d.getVar("SPDX_PKGARCH")
+    if pkg_arch is None:
+        pkg_arch = d.getVar("SSTATE_PKGARCH")
+    return pkg_arch
+
+
 def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
     if deploydir is None:
         deploydir = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1109,7 +1116,7 @@ def write_jsonld_doc(d, objset, dest):
 
 
 def make_jsonld_link(d, fn, subdir, name, deploydir):
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    pkg_arch = get_pkg_arch(d)
 
     link_name = jsonld_arch_path(
         d,
@@ -1136,7 +1143,7 @@ def write_recipe_jsonld_doc(
     create_spdx_id_links=True,
     create_task_link=False,
 ):
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
+    pkg_arch = get_pkg_arch(d)
 
     dest = jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name, deploydir=deploydir)
 

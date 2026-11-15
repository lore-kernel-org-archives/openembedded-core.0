Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14598.1794776135826108287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 12:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=E1xs14CE;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2886144c88.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 12:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794776135; x=1795380935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojMU9TsbWhZ4jHR5NoFPMnZYH2BrCbRfdGVa3R2fJls=;
        b=E1xs14CElABXU56AbxDqXKEWGCT2nwlZR35gpCB0MeL8ReyS6782L+xC/DlC4yNjU3
         oVgUIRM4Bx6FB+ZNp6uDe2vU/rhS0ogOSmYBDYEq3AzT0taOFQ7LQ8rPopnNehEnb2Ic
         0wxS6hqIfJpyFqVYNqaYWTDGbYya/Kj1w8mtUKEo9UCS8SpuxmQ9pzxQ0xUiETza4jVE
         2dCfONHrRxzQZV9lWrZ9O0tP/tl/3zYF4DrrKpDX+fLqjVozSZX6awf3nY5Tnr1ZSpx2
         rqdAal7LJdyZ+GDdXZR6atUrNcrW1jsloip4hrVfWflwcFI1SgjXHiCt7Qcfca7PFBom
         boKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776135; x=1795380935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojMU9TsbWhZ4jHR5NoFPMnZYH2BrCbRfdGVa3R2fJls=;
        b=ybhP8ut4dTZ97JM61dRynnjBu8uwJnqHdxinzj2WUuovu4M7NhjkKMTjty2ImLG85b
         ksJuxj2j7MP1O/hliXm3qzgOG74Fx4+zw9J+ipKnUXrT+zj/uc6/NthJoiEO2/08aRjY
         uoiKXsJktAkA6YLp2OBeNjx8lhnJaWWFXieibVVrDU/jOvJlcSQZHvFy5J5yPuFtiY/j
         0tZAFR38mUYOKt20WVUrJh6wIOaZkCYrpK9G39CfSVbZlwhj7zgcAC5PIJyO1B0ij9QB
         TBKx9g3qeU2xDrv6k9XbODpeDkHgLQz0/JymmhiExFuE3g2k72hqzzoIH8umk9ix8kL6
         G7sQ==
X-Gm-Message-State: APuU4Z81WvwTup/VMJwmouj1NmYtFH1RLGEiSEAMClVbl9/uP4YWPo4Y
	zNdt0/XmzHiedTjTrfOm9rUpt95zCdLDPE77SZFI80RcLcijS1K5HHf6YYulz7Ry
X-Gm-Gg: AYBFou3u/8D1htRaZNsbzXFB6BwN8vY/bleeYePDKGXCvOhrdVmIUWka7Vbpw4ufC/Q
	GrKVo8k+diWpMO4pxBjMb7+p89w5a9rAiuGnfhFOW1KW/YTTf/Ep2jkPcF1+G2TrLCjz3FtfxuI
	nbYKezNcnx72MHhP6ME3U8Sk6gxr52Jiw2VzpRJ1e+ZI8H61BTxWdM7CQK34I8nBHpag0zJ1hCG
	IP+YwkPjA/IgpDY+G2CtAvl4KUDDnecsplAeowBfuR7MUoJzW/purVw3huiMEuo4Zm5MzKJ88Ft
	/Z2mEUC9PkZXLY+k5HKE8GiOGABSLYaIn3HbgD3OHHDXFC7YOmOfeIyCc1eCPBzDWQPuPy8p713
	+cevCSyz9ZmNzgx/Rf/hr6WYxAAKZncF1sfALsns1d2EH16CI/zD4YYU9iO7Mqu+35hAeZdeAe4
	Hr7JJ+KVs2WqiLFpIhwlKo7HA8Y5wu1ghbqgkolOyrybFxb9zdSyTF9L4koQB0CcdcdLGrVQpm5
	xPPvMNKqAh7uXSfHITCsz1Y/nsVx4JNokiuz7mwCRJHt4Q/ThkoB6LeRAkpQkx5hLLZRP8BELNz
	I2YPC9PUF0/LCSEGkd4xC9fsL8rJ65bM+ux+9NuM1kvebzpW2ITq7+TI+Ya1yoftK1lK5laMder
	1ebvm6EzitExZAVCihdQLKenq16EPOnjm8N+BH5wEEZJgqoBTYWqrVUJuJUunJuCnhPtX0D1oFp
	njCOtxzRpbUCVSPH+3L7QVFL+g+q0J+oDJFBM2kLA+jKvW/M80A0gZrcdiI/gSWFhpcRiXziRvk
	qI6FQXOz85FtKQv+GNIvn9zT9DpjeUi4eO7LNIinoaq+4t3EoW52eiSAMx9tvtlqL9FZ+ETc4do
	wa/i
X-Received: by 2002:a05:701b:2810:b0:1b2:4e2e:d95a with SMTP id a92af1059eb24-1b503068e0cmr7899404c88.2.1794776134847;
        Sun, 15 Nov 2026 12:55:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm27645507c88.14.2026.11.15.12.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:55:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] create-spdx-3.0: Install deploy task SPDX into the task's arch directory
Date: Sun, 15 Nov 2026 12:55:31 -0800
Message-ID: <20261115205531.2712321-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 20:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250279
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
 

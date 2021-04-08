Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.6054.1617877827411004014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 03:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=urUmYhTW;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.49, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f49.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so964465wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xcrJ2FYGJSytN5L9f1ZU4bu/n6FMH0ritk8P1Ek8aAg=;
        b=urUmYhTWmgtK+UnVtTgNs7tV3hR/Lt6xvqcNS+xe99Pf8a2Gl7m8MNXPsHkUvvmBvh
         KpaMNE5u5yvx5sueGQGfbi9CAuGbeopyVPKHPk8L/G7FpI3dGg3vJCmy5Yk2zxk0e19f
         Wvoti43F6HcuK1AKX4NSiGoNvoIsMpcJ6+TU2gc9+koMH2c0W0o2zOmuEJIWSlP0sgvl
         vjTz48DhO1uZw5dHzqM8BPErLMfncml7WU7zLjz/OR1KQiAGOee5SSyTWAqJujFMt0nF
         O4xPEd68uFNIFTmGK653xxoAAn+j8/zqKImleTDzZQ5VBPEMoqaBqC8zQHl5UbwYTqba
         brSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xcrJ2FYGJSytN5L9f1ZU4bu/n6FMH0ritk8P1Ek8aAg=;
        b=JR4emBcPm6n2vB1oleBukkkpm7JQluIVoHI7phYXGOAE4VkqyZhLa6YL1clAikgDtZ
         WaXuqXFSMdSFh22MthDXaoTAPK6Wyq1n4+mINCbRhklhBARuRPi2/uMYDqBLfI2ozIbk
         ++uhDnWLvxRDed0LKXFZAqpyhKWLh17iv2+ANOWTrht0/Ek08fdKRQBa7U9HAFoddjL8
         C9YHhCgELqvDU4TExz8haNmPEZ5banPgC5Tvy4xJFHpir4TFHah7F/Mn3GKVPq/VnZgz
         WtPtrmjCAEqMmxZKsVOi7yoV/HpU9fI3hg4Lb92nsGo7thXc1hoS0/PubU4uFnTtjjLG
         KlFw==
X-Gm-Message-State: AOAM531vgsYKwVP86TveykRuEEJ6H5Kv9REwJqiuFBeYlGe4l/P0TbJV
	PtkOmpU9eJiQx99q0J0N+w4Tu2GVzAoG1iIO
X-Google-Smtp-Source: ABdhPJyY+Oam8VgkkCf3Dxv0+Vr0A8GNXdlsfC78FtU3AWcdnEJHMA2fL2J5VwS4X7qWp/yJUkbvEQ==
X-Received: by 2002:a05:600c:219a:: with SMTP id e26mr1347486wme.64.1617877825826;
        Thu, 08 Apr 2021 03:30:25 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 7sm7867124wry.60.2021.04.08.03.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 03:30:25 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] archiver: Fix typos
Date: Thu,  8 Apr 2021 12:30:11 +0200
Message-Id: <20210408103012.2313-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 meta/classes/archiver.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 858507b343..a3962306b1 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -118,7 +118,7 @@ python () {
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
     elif ar_src == "configured":
         # We can't use "addtask do_ar_configured after do_configure" since it
-        # will cause the deptask of do_populate_sysroot to run not matter what
+        # will cause the deptask of do_populate_sysroot to run no matter what
         # archives we need, so we add the depends here.
 
         # There is a corner case with "gcc-source-${PV}" recipes, they don't have
@@ -163,7 +163,7 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
 }
 
-# Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
+# Take all the sources for a recipe and put them in WORKDIR/archiver-work/.
 # Files in SRC_URI are copied directly, anything that's a directory
 # (e.g. git repositories) is "unpacked" and then put into a tarball.
 python do_ar_original() {
@@ -463,7 +463,7 @@ python do_unpack_and_patch() {
     ar_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
     pn = d.getVar('PN')
 
-    # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
     if not is_work_shared(d):
         # Change the WORKDIR to make do_unpack do_patch run in another dir.
         d.setVar('WORKDIR', ar_workdir)
@@ -505,7 +505,7 @@ python do_unpack_and_patch() {
 # of the output file ensures that we create it each time the recipe
 # gets rebuilt, at least as long as a PR server is used. We also rely
 # on that mechanism to catch changes in the file content, because the
-# file content is not part of of the task signature either.
+# file content is not part of the task signature either.
 do_ar_recipe[vardepsexclude] += "BBINCLUDED"
 python do_ar_recipe () {
     """
-- 
2.20.1


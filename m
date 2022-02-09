Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C42C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 09:30:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.24343.1644399020645072587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMVHMLyP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso1652664pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=7hRfZ7l/oL1treRF+Lx/+gRIemNJQOiZJrfQlrjcuwQ=;
        b=VMVHMLyPgPYIPLBQyLX6w0zV/Pl/whIX/oNeLKTMfx1+qsh4fVfNrwldCRbIWAWvLf
         eDik81B4JAEgmJ9i9XylZJ7vVchkWc3YTz7ydOW/lABiUDRSZY4QM8v2+sUhOjv4Z5xl
         Aw3YEuLPtm7M5f/erqFPESIGnGZCgOLkZftzU88f1uItVeuJH/ha7ZQ3e5JgqmAra01S
         xVxqIi5iAkOmkYPpp4rPcyPfftPR7XTTkAlUQU6JBl8D+Fbc+ODvdyPMfUvHY82SmAol
         ZqyOmu2j7axCtdcDBYuCprw/vzOoFR2MQpzjqo86vQ63dXKJ4RpqGhBOEV0PsghDB+ux
         4Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7hRfZ7l/oL1treRF+Lx/+gRIemNJQOiZJrfQlrjcuwQ=;
        b=nGf47XCQx3+xfreCam74svdrkyRAvW48cYhIkfqHdJwb3ntQaWoDgMK9/DUlfHtysE
         FAWj9ebkQJzl9+z2vh5MrZj9SRPLv9w0CXyUBX4hx+eVaiZPwkfGLdPFMVe2PWgFjvzZ
         W1DpurU+l+hMUHT5RGmqW2Zy5o90LCCV04w3sw9THp569pP7Ka+NI5D+ewh9t5jpIKqV
         BGNcgdFvxHVZP8NWPCsgcajPdOjojUvNnk6HVLeyuG9jV0IKgxwSvNmiGKHdIWyNokzK
         ciQ0YW6f4aasi2Nc8NfRaOkjOKPQIbGLqAqXOvSAEFd3LaqLnvUHQ5FCcAW+XJg7VU1x
         5M6A==
X-Gm-Message-State: AOAM530mjdzP+Wu39GUFF+NK+RFmFm+pnv1UWcw94HLRDKBvS04vAVln
	YAPfBB3AaxoOlpkFeq2Z04fbcDStGZM=
X-Google-Smtp-Source: 
 ABdhPJyBe/rDPt8U9zQGj1aTGvpemQUiXRmuRti5hak1hlhCjGHzmuNGYabhCL5KuCwEg2tos9YbzQ==
X-Received: by 2002:a17:902:e309:: with SMTP id
 q9mr1233999plc.69.1644399019583;
        Wed, 09 Feb 2022 01:30:19 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:54e0:830b:8827:cd16:3dee:a408])
        by smtp.gmail.com with ESMTPSA id
 i3sm4099175pgq.65.2022.02.09.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 01:30:19 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][master][PATCHv2] buildhistory.bbclass: Enable exporting more
 recipe and package data
Date: Wed,  9 Feb 2022 14:59:47 +0530
Message-Id: <20220209092947.25677-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 09:30:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161545

Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
data to the latest file of buildhistory and sorted it alphabetically.

This makes extending data in buildhistory git tree simple and avoids
patches to it for users who care about things like SRC_URI and like
to track it in buildhistory git tree.

Now we can add additional information as per our requirement to the
buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
by appending them in a recipe or distro specific conf file as follows:

BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 meta/classes/buildhistory.bbclass | 111 ++++++++++++++++++++----------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index daa96f3b63..377b325518 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -69,6 +69,11 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+# Set BUILDHISTORY_EXPORT_RECIPE_VARIABLES and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES
+# to export recipe and package data to the latest file of buildhistory
+BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES SRC_URI LICENSE CONFIG"
+BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
+
 #
 # Write out the contents of the sysroot
 #
@@ -264,12 +269,11 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pe = pe
     rcpinfo.pv = pv
     rcpinfo.pr = pr
-    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
     rcpinfo.layer = layer
-    rcpinfo.license = license
     rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
-    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
+    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
+    rcpinfo.export_recipe_variables = export_recipe_variables
     write_recipehistory(rcpinfo, d)
 
     bb.build.exec_func("read_subpackage_metadata", d)
@@ -323,6 +327,9 @@ python buildhistory_emit_pkghistory() {
 
         pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
 
+        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
+        pkginfo.export_package_variables = export_package_variables
+
         write_pkghistory(pkginfo, d)
 
     oe.qa.exit_if_errors(d)
@@ -370,17 +377,22 @@ def write_recipehistory(rcpinfo, d):
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
 
     infofile = os.path.join(pkghistdir, "latest")
+    export_recipe_variables = set(rcpinfo.export_recipe_variables.split())
+    ret = []
     with open(infofile, "w") as f:
-        if rcpinfo.pe != "0":
-            f.write(u"PE = %s\n" %  rcpinfo.pe)
-        f.write(u"PV = %s\n" %  rcpinfo.pv)
-        f.write(u"PR = %s\n" %  rcpinfo.pr)
-        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
-        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
-        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
-        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
-        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
-        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
+        for var in export_recipe_variables:
+            if var == "PE":
+                if rcpinfo.pe != "0":
+                    ret.append("%s = %s" % (var, rcpinfo.pe))
+            elif var == "LAYER":
+                ret.append("%s = %s" % (var, rcpinfo.layer))
+            elif var == "CONFIG":
+                ret.append("%s = %s" % (var, rcpinfo.config))
+            else:
+                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
+        ret.sort()
+        for element in ret:
+            f.write(element + "\n")
 
     write_latest_srcrev(d, pkghistdir)
 
@@ -394,32 +406,55 @@ def write_pkghistory(pkginfo, d):
         bb.utils.mkdirhier(pkgpath)
 
     infofile = os.path.join(pkgpath, "latest")
+    export_package_variables = set(pkginfo.export_package_variables.split())
+    ret = []
     with open(infofile, "w") as f:
-        if pkginfo.pe != "0":
-            f.write(u"PE = %s\n" %  pkginfo.pe)
-        f.write(u"PV = %s\n" %  pkginfo.pv)
-        f.write(u"PR = %s\n" %  pkginfo.pr)
-
-        if pkginfo.pkg != pkginfo.name:
-            f.write(u"PKG = %s\n" % pkginfo.pkg)
-        if pkginfo.pkge != pkginfo.pe:
-            f.write(u"PKGE = %s\n" % pkginfo.pkge)
-        if pkginfo.pkgv != pkginfo.pv:
-            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
-        if pkginfo.pkgr != pkginfo.pr:
-            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
-        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
-        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
-        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-        if pkginfo.rsuggests:
-            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
-        if pkginfo.rreplaces:
-            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
-        if pkginfo.rconflicts:
-            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
-        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
-        f.write(u"FILES = %s\n" %  pkginfo.files)
-        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
+        for var in export_package_variables:
+            if var == "PE":
+                if pkginfo.pe != "0":
+                    ret.append("%s = %s" % (var, pkginfo.pe))
+            elif var == "PV":
+                ret.append("%s = %s" % (var, pkginfo.pv))
+            elif var == "PR":
+                ret.append("%s = %s" % (var, pkginfo.pr))
+            elif var == "RPROVIDES":
+                ret.append("%s = %s" % (var, pkginfo.rprovides))
+            elif var == "RDEPENDS":
+                ret.append("%s = %s" % (var, pkginfo.rdepends))
+            elif var == "RRECOMMENDS":
+                ret.append("%s = %s" % (var, pkginfo.rrecommends))
+            elif var == "PKGSIZE":
+                ret.append("%s = %s" % (var, pkginfo.size))
+            elif var == "FILES":
+                ret.append("%s = %s" % (var, pkginfo.files))
+            elif var == "FILELIST":
+                ret.append("%s = %s" % (var, pkginfo.filelist))
+            elif var == "RSUGGESTS":
+                if pkginfo.rsuggests:
+                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
+            elif var == "RREPLACES":
+                if pkginfo.rreplaces:
+                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
+            elif var == "RCONFLICTS":
+                if pkginfo.rconflicts:
+                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
+            elif var == "PKG":
+                if pkginfo.pkg != pkginfo.name:
+                    ret.append(u"PKG = %s" % pkginfo.pkg)
+            elif var == "PKGE":
+                if pkginfo.pkge != pkginfo.pe :
+                    ret.append(u"PKGE = %s" % pkginfo.pkge)
+            elif var == "PKGV":
+                if pkginfo.pkgv != pkginfo.pv:
+                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
+            elif var == "PKGR":
+                if pkginfo.pkgr != pkginfo.pr:
+                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
+            else:
+                ret.append("%s = %s" % (var, d.getVar(var)))
+        ret.sort()
+        for element in ret:
+            f.write(element + "\n")
 
     for filevar in pkginfo.filevars:
         filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
-- 
2.17.1



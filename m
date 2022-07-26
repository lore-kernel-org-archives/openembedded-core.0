Return-Path: <rustyhowell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC33BC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 21:13:35 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.12422.1658870012919801503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jPpUwJjg;
 spf=pass (domain: gmail.com, ip: 209.85.166.175,
 mailfrom: rustyhowell@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id 1so7877847ill.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVmYkokvpy/yJwFTlfvv3xd44Hf1lXpDpWihBOMol1Q=;
        b=jPpUwJjg1clDpL6JO5rWo6Yu+HaIaNC2HcHQYJvgLZsclXcNt3Xn4Wqr/19NafueRQ
         in+ENL7zPuKaPi5OQQfnQUYRbzypYmNEuPPIAfleBZOCi3J+KfQ23F62WyMxuyQJ/1Ef
         hkteb42QrlH8IGDNqTIjTrNjQite5UaK3Zw9QHBjn22I+d/nFklhxeVuWOtyNgNADSXc
         cnvOUBju+VdTo4a0kGhxnIISDgvli16ktx6H+cW0bc36cMcI81uZFYC/SxRxjd+T2gjz
         wEQQv14jsLtc15cR+DD3jx3GpZRfPFdMv+3i8Lh+oBCQEIzmJHOVmpe894DO0LIiLseG
         ZJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVmYkokvpy/yJwFTlfvv3xd44Hf1lXpDpWihBOMol1Q=;
        b=O12h89DJ7i3ahds1jK4gDYoagcrNdI45WCn5GBqkvrVbxSIkY8NPuazv9kbhLgEGmm
         6kvAhczdz4CrwTdrSGYfib3OB468bFvDEWFBlr1b/fw5DUoB0U2wrFfAUUH6Jivvmuj0
         BRYul+BUbTgy6y3WBr8QjnL97nAzOxd4qfXNGpfcJUeM+f5Lul9WDp50Od7JGRvBfaDC
         ODIBjaVB/a2Q6xzyUHGnoe0M/F0tNmLeiwKHT49FfCPTOzXqAfz5qShkrEkB7JaSTgRv
         H+9R4esQYRig8fjnpjMT0X1lPQpisQWmeXsawAZ3TRR/akuFVWF2BM9hcj37n5YrWbzJ
         xp2Q==
X-Gm-Message-State: AJIora9fEydV0syotSQmOrZJa7UayrSFa4Depgn9JVE4+xYckNxNTly2
	2/leswsKvCG8Yc6BBECDMDUA2WzDLsE=
X-Google-Smtp-Source: 
 AGRyM1umw9OrgNOx9Zze/BarvyawAuS/j3OxYG/fTlclk6YuuJ2Qcj6Fm3zBea9blWCXs5pSGXiHmA==
X-Received: by 2002:a05:6e02:188c:b0:2dc:a00:3222 with SMTP id
 o12-20020a056e02188c00b002dc0a003222mr7039458ilu.43.1658870011863;
        Tue, 26 Jul 2022 14:13:31 -0700 (PDT)
Received: from sirius.control4.com ([2605:a601:a937:b200:4ab8:8bba:4dee:8b77])
        by smtp.gmail.com with ESMTPSA id
 y13-20020a02730d000000b0033f1fb23d9asm7229590jab.137.2022.07.26.14.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 14:13:31 -0700 (PDT)
From: Rusty Howell <rustyhowell@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Rusty Howell <rustyhowell@gmail.com>
Subject: [PATCH] debian packaging: set md5sums for conffiles
Date: Tue, 26 Jul 2022 15:13:28 -0600
Message-Id: <20220726211328.2122681-1-rustyhowell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 21:13:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168515

Currently in an image created with debian package management, dpkg is missing the md5sums in
/var/lib/dpkg/status for files designated as conffiles.  They are just listed as "newconffile",
which is an intermediate state when dpkg installs a package with an conf file.  Also, when the
device first boots the script /usr/sbin/run-postinsts does not cause /var/lib/dpkg/status to update
those hashes either.

The problem here is that when using a package feed, all the conf files are listed as "newconffile",
which will indicate to dpkg to replace them all on the first update.  dpkg will not follow the rules for
confold, confnew, confdef.
---
 meta/lib/oe/package_manager/deb/__init__.py | 42 +++++++++++++++++++++
 meta/lib/oe/package_manager/deb/rootfs.py   |  2 +
 2 files changed, 44 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 2ee68fefb1..fabb955558 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -3,6 +3,7 @@
 #
 
 import re
+import glob
 import subprocess
 from oe.package_manager import *
 
@@ -216,6 +217,47 @@ class DpkgPM(OpkgDpkgPM):
 
         os.rename(status_file + ".tmp", status_file)
 
+    def set_conffile_hashes(self):
+        """
+        This function will populate the md5sums for all the conffiles listed in /var/lib/dpkg/status
+        """
+        status_file = self.target_rootfs + "/var/lib/dpkg/status"
+
+        with open(status_file, "r") as sf:
+            with open(status_file + ".tmp", "w+") as tmp_sf:
+                status = sf.read()
+
+                conffiles = glob.glob(self.target_rootfs + "/var/lib/dpkg/info/*.conffiles")
+                for cf in conffiles:
+                    fname = os.path.basename(cf)
+                    pkg = fname.split('.')[0]
+
+                    bb.note("Populating md5sums for pkg %s" % pkg)
+                    conffiles = "%s/var/lib/dpkg/info/%s.conffiles" % (self.target_rootfs, pkg)
+                    md5sums = "%s/var/lib/dpkg/info/%s.md5sums" % (self.target_rootfs, pkg)
+                    if os.path.exists(conffiles) and os.path.exists(md5sums):
+                        conf_hashes = {}
+                        with open(md5sums, "r") as md5s:
+                            for line in md5s.read().split('\n'):
+                                m = re.match(r"^([a-f0-9]+)\s+(\S+)", line)
+                                if m:
+                                    hash_ = m.group(1)
+                                    fpath = m.group(2)
+                                    if not fpath.startswith('/'):
+                                        fpath = '/' + fpath
+                                    conf_hashes[fpath] = hash_
+
+                        with open(conffiles, "r") as cf:
+                            for fpath in cf.read().split('\n'):
+                                hash_ = conf_hashes.get(fpath, None)
+                                if hash_:
+                                    status = re.sub("%s newconffile" % fpath, "%s %s" % (fpath, hash_), status)
+
+
+                tmp_sf.write(status)
+
+        os.rename(status_file + ".tmp", status_file)
+
     def run_pre_post_installs(self, package_name=None):
         """
         Run the pre/post installs for package "package_name". If package_name is
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 8fbaca11d6..06e99158de 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -186,6 +186,8 @@ class PkgRootfs(DpkgOpkgRootfs):
 
         execute_pre_post_process(self.d, deb_post_process_cmds)
 
+        self.pm.set_conffile_hashes()
+
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-- 
2.25.1



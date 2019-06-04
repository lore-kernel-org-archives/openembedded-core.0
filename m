Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4917D58A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 18:48:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v22so1139507wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jun 2019 11:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NaSR+NSexeENec0UugIzEXOGIV43ThwHOuq2mnT67KY=;
	b=C0TwKZSl3Fnwe49VSQUbmwbXRXmX3bZt9Ng06AjMYr8qaIPp86ydy4laUk6Pgd99Yv
	a7MSzmLKbNKKoQUKpOxnBpd2W+PYot4CpYo3g1PiXyZqDO6hC1W8Bb2qvKjzTx8XTH/d
	/SVl3U0/mLzBtwzpm988AsFhugWEa/rrZdA0vS0Aq17OsqB0IHOjAeyvIZE6drnykxIK
	3fl/vlda+NndzLeL7D3EGrWuIHgTRoiUlMTUoTMYwHASh2sjLx3PjLCBrNMDDlb2vY3i
	NMuIuJwed66iQf2oR6FahF/Zsxd07W0fmlTPLtHIrBsBFbldbNAHzcx42jcv72P7iNQ1
	uLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NaSR+NSexeENec0UugIzEXOGIV43ThwHOuq2mnT67KY=;
	b=Ovvo9KskWoCxf7IC12asQEqQsAAKZQGXXx6CmhXdMLrNf/c6zxumwrWG9hde9J5Z5w
	/2bL+aXnB4MRpZdcge2fHP+NLNBmIp6pSj4NcJpx5QHgUm5DVAnSG4yJG8oH3vWl/M0L
	ycdFvzXFIsuzAz+Cnx4tLCj7BYneO/GJCT3DHSsv7KSYuewGklZjQv/oAc/Ziu7Idh09
	nNQ4NIdkhIGFRJQ2TGo0gHCPc902ny86JrEBC3ZLxxMX6ifFGX40/kr2dqd3Lbn4meI8
	74cyW0jYlhBsKV6Y4s+zCmedk5r3pSE05cD6KIzVHBpxbJAT3IRVtWFDdcQlbuzKq/Ep
	NipQ==
X-Gm-Message-State: APjAAAU+8SkbDU/2/S3R3MwrCMvuKktsZ7NG36gZxQPrcLNLmiUdfmul
	8bE16NwuO5VA+EF7ys9/j0Qq8WYR
X-Google-Smtp-Source: APXvYqwZDZ8G+iypJjmWX6PNOrWYDkVhsx/7ARofN1I8zKpM+Sb+jFJ4qDvwM2ZNbQBT+B8Ldk4NgA==
X-Received: by 2002:a1c:c583:: with SMTP id v125mr5173564wmf.158.1559674116339;
	Tue, 04 Jun 2019 11:48:36 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v67sm2854496wme.24.2019.06.04.11.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Jun 2019 11:48:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2019 18:48:41 +0000
Message-Id: <20190604184841.1816-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] opkg-utils: fix opkg-list-fields script
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
X-List-Received-Date: Tue, 04 Jun 2019 18:48:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2: Upstream-Status changed from Submitted to Backport

 ...fields-fix-to-print-the-fields-again.patch | 41 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.0.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
new file mode 100644
index 0000000000..deaf561d1e
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-list-fields-fix-to-print-the-fields-again.patch
@@ -0,0 +1,41 @@
+From df675c91f4b33490f0fa831b11162bdb0e2ff550 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 23 May 2019 20:50:45 +0000
+Subject: [PATCH] opkg-list-fields: fix to print the fields again
+
+* printing opkg.Package directly doesn't return anything useful now
+  <opkg.Package object at 0x7fd49e9f2780>
+
+* we need to call Package.print() function and specify which checksums
+  to print, we can include both md5 and sha256 for opkg-list-fields
+
+* it was changed in this commit:
+  commit 601d691dd80ef494aef069017edc5bf80aa883a1
+  Author: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+  Date:   Wed Dec 19 11:40:15 2018 -0600
+
+    opkg-make-index: add sha256sum support
+
+  which replaced the modified __str__ function with print(self, checksum)
+
+Upstream-Status: Backport [http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=5163a74a59d54b2a8374414435ece9d542dbd5e2]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ opkg-list-fields | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/opkg-list-fields b/opkg-list-fields
+index c14a90f..8a5a588 100755
+--- a/opkg-list-fields
++++ b/opkg-list-fields
+@@ -11,5 +11,4 @@ def usage():
+ if (len(sys.argv) < 2):
+      usage()
+ 
+-print(opkg.Package(sys.argv[1]))
+-
++print(opkg.Package(sys.argv[1]).print(('md5','sha256')))
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
index 9a3e06b92e..b2fb760267 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.0.bb
@@ -10,6 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
            file://0001-opkg-build-do-not-set-mtime-on-data.tar.X.patch \
+    file://0001-opkg-list-fields-fix-to-print-the-fields-again.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 


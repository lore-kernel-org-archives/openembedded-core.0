Return-Path: <martin.jansa@gmail.com>
Received: from mail-da0-f51.google.com (mail-da0-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2A29C60897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:39:57 +0000 (UTC)
Received: by mail-da0-f51.google.com with SMTP id h15so496526dan.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9aNUJ1zzbeoXXdNuAZ7Gf3JYYFED4R2tiaiS5b6KJO8=;
	b=dyEFuDQAkSY60lVhYEY93vKQFVkQfSSygGh1qLpdUW8/rMdKfQuCEGHeckhnWyjOrc
	qq05Ys4+fRZM+FlT/1EnEfXujunv8bsOjrm3hLWgKOZeJGpMtwqgmSjPc3HVD20jDdpm
	RK7abwYWU7FuiSGTbynFVwHHc5n7QnkIWNMCQ+oMSmzDgzPbn8H0proOsyo8o+hBn4+q
	LVk5e0hmRAuP2vKZpGZV74z7OPXpvLnZTSmqAqL1rQZdAuFcyWSP9Kzmqy6bSoPSlRXs
	x768HYM0dGTgsWWcFf/vrGyj3b5hgk8Q7Rogaa64uchjiKyqSEMyCOLuEWOP/hOszGBw
	CdVg==
X-Received: by 10.66.248.68 with SMTP id yk4mr3891888pac.137.1369150798300;
	Tue, 21 May 2013 08:39:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	j10sm3172630pbh.23.2013.05.21.08.39.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 May 2013 08:39:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:39:47 +0200
Message-Id: <1369150787-21878-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] kernel: Remove unnecessary cd and rm
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
X-List-Received-Date: Tue, 21 May 2013 15:39:58 -0000

---
 meta/classes/kernel.bbclass | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3320747..47a96c5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -378,13 +378,10 @@ kernel_do_deploy() {
 		ln -sf ${MODULE_TARBALL_BASE_NAME}.bin ${MODULE_TARBALL_SYMLINK_NAME}
 	fi
 
-	cd ${DEPLOYDIR}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
-	cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
-- 
1.8.2.1



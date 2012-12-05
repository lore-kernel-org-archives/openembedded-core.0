Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJu6-0006W8-KA
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:41:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3064473eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pV+lFBIRHDpnctArd9p4wmciuX+lM5bpyrIyl4+49JY=;
	b=xaCPmxBxYrfX2ZmO/T43M7YOIfrjPO/s9ZyYHRZpMV6G5NUahzPNLHp08bpmai8Es+
	ELqwffilVIiFfOboecTwwRylTlC2hCLRDUAArQpl33M4Fz6YLmDu7jNZyLimV3w/y4Pv
	9Ff/NKHIOWvwdMJOh55R4ICoPc1bjYDkPA2/TgP6xxxczL5baUAigD+4GRLVjaAwPKUn
	ACkKtPTObhnY3Kn3ANF5bCWJonH0Ce4m6zeiE7VYbTdns2k4NjJr976yaqNn5RrZ1PN2
	DyqlfMRkPsEKhnt7z2lkIHF2iUTsbuGCOGGC/oYgBY8iEc4wqUTw2ZZULnKQguToOljJ
	XAbQ==
Received: by 10.14.175.198 with SMTP id z46mr63263356eel.26.1354732004727;
	Wed, 05 Dec 2012 10:26:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm10651915eep.12.2012.12.05.10.26.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:07 +0100
Message-Id: <a713a0395df34f4d6543069b6c7538bea7fc33c0.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] python-smartpm: don't try to remove /usr/share/share twice
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:41:08 -0000

* distutils.bbclass now removes that directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 254318c..b896c89 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r1"
+PR = "r2"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -43,9 +43,6 @@ PACKAGECONFIG[gtk] = ",,gtk+,${GTK_RDEP}"
 inherit distutils
 
 do_install_append() {
-   # Cleanup unused item...
-   rmdir ${D}${datadir}/share
-
    # We don't support the following items
    rm -rf ${D}${libdir}/python*/site-packages/smart/backends/slack
    rm -rf ${D}${libdir}/python*/site-packages/smart/backends/arch
-- 
1.8.0




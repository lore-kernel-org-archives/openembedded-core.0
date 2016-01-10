Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB3875E80
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:09 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gi1so30413253pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=EDT9QSiABEj0NYsDQyh7t3LpNaXd0KDk4fgSY7xxgEM=;
	b=vgEyeXcZZoQTLf/pg/AlfPclXPMsIME797gHsJo0xBRAuIjEaqXxuUrX4vUgvRJY5/
	fcGz6KtQ/0AXW8VE7s7ar2p0JEJO1yJOF7Ssd5xI5Vopc35+qQGDtPWJnIDLNHv//UBd
	CGhHOsCDT9BqK9f1eJyPdazKwae6Lj3nnxoQDIVWxshDczeMLbFDa5TLfUbo6Ub+rvmX
	MzuvWIteWXtGw+/nHfHr6BGQuWef/b1wCru+jGChVUgzQ0GgPvGTKp3Fuz639V721fZl
	H6xXlLB30A4lUFV1356GnqSPjC+j3Jky3AOXhGqtd1eHf4yFFbP+asBpEF/JJcqd3C/5
	bljQ==
X-Received: by 10.67.4.100 with SMTP id cd4mr97443936pad.59.1452385870885;
	Sat, 09 Jan 2016 16:31:10 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	v26sm13700040pfi.56.2016.01.09.16.31.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:01 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id DCA87FCC844; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:38 -0800
Message-Id: <4d342c4babf25ee750accb8cb190a91a5e9bf223.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 12/20] glibc: use patch for CVE-2015-1781
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:10 -0000

From: Tudor Florea <tudor.florea@enea.com>

Patch added to the repo wasn't actually considered due to a
erronously way of specifying the sources.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.20.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index a0736cd..2ab4083 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -40,14 +40,12 @@ EGLIBCPATCHES = "\
 #           file://eglibc-install-pic-archives.patch \
 #	    file://initgroups_keys.patch \
 #
-CVEPATCHES = "\
-        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
-"
 
 CVEPATCHES = "\
         file://CVE-2014-7817-wordexp-fails-to-honour-WRDE_NOCMD.patch \
         file://CVE-2012-3406-Stack-overflow-in-vfprintf-BZ-16617.patch \
         file://CVE-2014-9402_endless-loop-in-getaddr_r.patch \
+        file://CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch \
     "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
1.9.1



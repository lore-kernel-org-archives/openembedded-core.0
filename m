Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5CA816011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 02:15:41 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Nov 2015 03:15:38 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 0AB2A28FA82;
	Fri, 27 Nov 2015 03:15:38 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Nov 2015 03:15:36 +0100
Message-ID: <1448590536-58100-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy] [PATCH 1/1] glibc: use patch for CVE-2015-1781
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
X-List-Received-Date: Fri, 27 Nov 2015 02:15:43 -0000
Content-Type: text/plain

Patch added to the repo wasn't actually considered due to a
erronously way of specifying the sources.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
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



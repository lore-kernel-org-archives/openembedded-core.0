Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6517.1591155831611222995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 20:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0533hJo8010744
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2020 20:43:40 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 2 Jun
 2020 20:43:24 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vte: add missing runtime dependency for vte-prompt
Date: Wed, 3 Jun 2020 11:43:06 +0800
Message-ID: <20200603034306.19886-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The /etc/profile.d/vte.sh in vte-prompt package requires
vte-urlencode-cwd command which is from vte package.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/vte/vte_0.60.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.2.bb
index 4a33f6e4d0..7c7bc3864b 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -53,5 +53,6 @@ CFLAGS += "-D_GNU_SOURCE"
 PACKAGES =+ "libvte ${PN}-prompt"
 FILES_libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
 FILES_${PN}-prompt = "${sysconfdir}/profile.d"
+RDEPENDS_${PN}-prompt = "${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


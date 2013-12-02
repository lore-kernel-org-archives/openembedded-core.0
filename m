Return-Path: <Yanjun.Zhu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 921716DEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 07:13:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB27DMZD019295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Dec 2013 23:13:22 -0800 (PST)
Received: from wind-OptiPlex-780.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sun, 1 Dec 2013 23:13:22 -0800
From: yzhu1 <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2013 15:13:33 +0800
Message-ID: <1385968413-18202-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Modify the path of env in CA.pl to make export-sdk successfully.
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
X-List-Received-Date: Mon, 02 Dec 2013 07:13:24 -0000
Content-Type: text/plain

---
 meta/recipes-connectivity/openssl/openssl.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 3bfe569..de10d17 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -154,7 +154,7 @@ do_install () {
 
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
-	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
+	sed -i -e '1s,^.*$,#! ${bindir}/perl,' ${D}${libdir}/ssl/misc/CA.pl
 
 	oe_multilib_header openssl/opensslconf.h
 }
-- 
1.7.9.5



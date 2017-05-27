Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71FB177F7D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 07:49:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4R7o0x0031414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 00:50:00 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sat, 27 May 2017 00:49:59 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 May 2017 15:45:03 +0800
Message-ID: <9ab14ecb65cab88d22f28fc77c9f91617ecfef75.1495871042.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1495871042.git.kai.kang@windriver.com>
References: <cover.1495871042.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsof: clear setuid
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
X-List-Received-Date: Sat, 27 May 2017 07:49:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Having 'lsof' as a +s (setuid) binary could lead to security issues if
a compromise in the binary is found.  It is better that it be -s by
default as a precaution.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsof/lsof_4.89.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index b732cf0..650b34c 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -53,6 +53,6 @@ do_compile () {
 
 do_install () {
 	install -d ${D}${sbindir} ${D}${mandir}/man8
-	install -m 4755 lsof ${D}${sbindir}/lsof
+	install -m 0755 lsof ${D}${sbindir}/lsof
 	install -m 0644 lsof.8 ${D}${mandir}/man8/lsof.8
 }
-- 
2.10.1



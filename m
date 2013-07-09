Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A97E3612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:30:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r69CUhtn022346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2013 05:30:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Jul 2013 05:30:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 20:30:36 +0800
Message-ID: <626ac2f7b8f351240a6eae4a75a632914eb28207.1373372649.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373372649.git.hongxu.jia@windriver.com>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] nspr-native: add version 4.10
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
X-List-Received-Date: Tue, 09 Jul 2013 12:30:42 -0000
Content-Type: text/plain

It is required by nss-native.

[YOCTO #4096]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/nspr/nspr_4.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-support/nspr/nspr_4.10.bb
index 3936d67..fcecb95 100644
--- a/meta/recipes-support/nspr/nspr_4.10.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.bb
@@ -173,3 +173,5 @@ FILES_${PN} = "${libdir}/lib*.so"
 FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
                 ${includedir}/* ${datadir}/aclocal/* "
 FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.2



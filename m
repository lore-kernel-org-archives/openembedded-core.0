Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0771360780
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:03:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A83lAR015310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:03:47 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 01:03:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 16:03:38 +0800
Message-ID: <583291288ed3fbd31f629b588ec929b733814251.1373443071.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373443071.git.hongxu.jia@windriver.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] nspr: add native version
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
X-List-Received-Date: Wed, 10 Jul 2013 08:03:46 -0000
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



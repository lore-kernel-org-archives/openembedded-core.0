Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB69F76E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:11:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8N9B4h6017466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 02:11:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 23 Sep 2015 02:11:04 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Sep 2015 17:04:37 +0800
Message-ID: <5993b8b026b856120c0dacff24fd9b0069792e93.1442999001.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
In-Reply-To: <cover.1442999001.git.kai.kang@windriver.com>
References: <cover.1442999001.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] p11-kit: configure without trust-paths
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
X-List-Received-Date: Wed, 23 Sep 2015 09:11:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Configure option --with-trust-paths is only used for test scripts
trust/test-extract which is not packaged by default. If the option is
not provided, it checks 4 files on build machine. If the files don't
exist, configure fails.

Add configure option '--without-trust-paths' to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index 7ad9626..ee77951 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -10,6 +10,8 @@ SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "4e9bea1106628ffb820bdad24a819fac"
 SRC_URI[sha256sum] = "ef3a339fcf6aa0e32c8c23f79ba7191e57312be2bda8b24e6d121c2670539a5c"
 
+EXTRA_OECONF = "--without-trust-paths"
+
 FILES_${PN}-dev += " \
     ${libdir}/p11-kit-proxy.so \
     ${libdir}/pkcs11/p11-kit-trust.so \
-- 
2.6.0.rc2.10.gf4d9753



Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84F296C1C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 08:40:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5B8eVl6017383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 01:40:31 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 11 Jun 2019 01:40:30 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2019 16:29:18 +0800
Message-ID: <20190611082918.19741-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] tune-thunderx: Set the correct PACKAGE_EXTRA_ARCHS_tune-thunderx
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
X-List-Received-Date: Tue, 11 Jun 2019 08:40:30 -0000
Content-Type: text/plain

The value of PACKAGE_EXTRA_ARCHS_tune-thunderx should be based on
PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto instead of armv8a-crc-crypto.
Otherwise we would get some sanity check error like this:
    OE-core's config sanity checker detected a potential misconfiguration.
    Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch armv8a-crc-crypto thunderx qemuarm64) for DEFAULTTUNE (thunderx) does not contain TUNE_PKGARCH (aarch64)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/conf/machine/include/tune-thunderx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 92adf2df1fce..aa4d0501d400 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -15,5 +15,5 @@ TUNE_FEATURES_tune-thunderx_be = "${TUNE_FEATURES_tune-thunderx} bigendian"
 BASE_LIB_tune-thunderx = "lib64"
 BASE_LIB_tune-thunderx_be = "lib64"
 
-PACKAGE_EXTRA_ARCHS_tune-thunderx = "armv8a-crc-crypto thunderx"
+PACKAGE_EXTRA_ARCHS_tune-thunderx = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} thunderx"
 PACKAGE_EXTRA_ARCHS_tune-thunderx_be = "aarch64_be thunderx_be"
-- 
2.14.4



Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB11E6D750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 10:20:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQAKUBG014265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:20:30 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 02:20:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 18:20:28 +0800
Message-ID: <1385461228-9326-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Cc: Yue.Tao@windriver.com
Subject: [PATCH] tzcode-native: Replace fixed version with PV
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
X-List-Received-Date: Tue, 26 Nov 2013 10:20:31 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2013h.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
index 5cdc7ef..b51e303 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8
 # note that we allow for us to use data later than our code version
 #
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013h.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata \
+"
 
 SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
 SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
-- 
1.8.3



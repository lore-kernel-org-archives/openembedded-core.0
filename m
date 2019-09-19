Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7049008A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 02:41:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208";a="75683758"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 10:41:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8687E4CE14EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 10:41:13 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Sep 2019 10:41:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2019 10:41:04 +0800
Message-ID: <20190919024104.8957-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 8687E4CE14EB.AAE59
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bison:upgrade 3.4.1 -> 3.4.2
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
X-List-Received-Date: Thu, 19 Sep 2019 02:41:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/bison/{bison_3.4.1.bb => bison_3.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_3.4.1.bb => bison_3.4.2.bb} (90%)

diff --git a/meta/recipes-devtools/bison/bison_3.4.1.bb b/meta/recipes-devtools/bison/bison_3.4.2.bb
similarity index 90%
rename from meta/recipes-devtools/bison/bison_3.4.1.bb
rename to meta/recipes-devtools/bison/bison_3.4.2.bb
index 7946e20..46f0f90 100644
--- a/meta/recipes-devtools/bison/bison_3.4.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.4.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI[md5sum] = "201286a573b12da109df96282fe4ff4a"
-SRC_URI[sha256sum] = "27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d"
+SRC_URI[md5sum] = "d1ceb9dfde2d03b24a4c1137f7f1b572"
+SRC_URI[sha256sum] = "27d05534699735dc69e86add5b808d6cb35900ad3fd63fa82e3eb644336abfa0"
 
 inherit autotools gettext texinfo
 
-- 
2.7.4





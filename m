Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B9C86731AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 05:11:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10537978"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2016 13:11:37 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 626D0403C868
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 13:11:35 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 2 Sep 2016 13:11:35 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Sep 2016 01:11:32 -0400
Message-ID: <1472793092-1371-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 626D0403C868.A4887
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sysstat: 11.3.5 -> 11.4.0
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
X-List-Received-Date: Fri, 02 Sep 2016 05:11:49 -0000
Content-Type: text/plain

Upgrade sysstat from 11.3.5 to 11.4.0.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../recipes-extended/sysstat/{sysstat_11.3.5.bb => sysstat_11.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.3.5.bb => sysstat_11.4.0.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.3.5.bb b/meta/recipes-extended/sysstat/sysstat_11.4.0.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.3.5.bb
rename to meta/recipes-extended/sysstat/sysstat_11.4.0.bb
index 0dfeea3..69f83fc 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.3.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.4.0.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "be990a83663e419e7d46eaf6e43103e9"
-SRC_URI[sha256sum] = "aa06ab8132d618ed7737346ac882732d54c9f2956f6ab3c9d36657c5e1923709"
+SRC_URI[md5sum] = "ee7b8c0b139a11a7a3418dc0658ca1be"
+SRC_URI[sha256sum] = "b8518ca88acfcbc474a406022ee9c0c3210ccef4f0ec80e5b3e8c41dda8c16f2"
-- 
2.7.4





Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C42B26FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 03:21:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18839096"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2017 11:20:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8B68A47E64CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:20:48 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 15 May 2017 11:20:54 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 11:20:27 +0800
Message-ID: <1494818427-18931-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 8B68A47E64CE.A8F80
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libnewt: 0.52.19 -> 0.52.20
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
X-List-Received-Date: Mon, 15 May 2017 03:21:02 -0000
Content-Type: text/plain

Upgrade libnewt from 0.52.19 to 0.52.20.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../newt/{libnewt-python_0.52.19.bb => libnewt-python_0.52.20.bb}     | 0
 meta/recipes-extended/newt/{libnewt_0.52.19.bb => libnewt_0.52.20.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.19.bb => libnewt-python_0.52.20.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.19.bb => libnewt_0.52.20.bb} (90%)

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.19.bb b/meta/recipes-extended/newt/libnewt-python_0.52.20.bb
similarity index 100%
rename from meta/recipes-extended/newt/libnewt-python_0.52.19.bb
rename to meta/recipes-extended/newt/libnewt-python_0.52.20.bb
diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb b/meta/recipes-extended/newt/libnewt_0.52.20.bb
similarity index 90%
rename from meta/recipes-extended/newt/libnewt_0.52.19.bb
rename to meta/recipes-extended/newt/libnewt_0.52.20.bb
index de76ce2..65ce70c 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.20.bb
@@ -25,8 +25,8 @@ SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://0001-detect-gold-as-GNU-linker-too.patch \
 "
 
-SRC_URI[md5sum] = "e4aa0f7943edd39c52481a87f68f412a"
-SRC_URI[sha256sum] = "08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80"
+SRC_URI[md5sum] = "70b288f821234593a8e7920e435b259b"
+SRC_URI[sha256sum] = "8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
2.7.4





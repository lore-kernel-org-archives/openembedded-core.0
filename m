Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 84432719D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 08:45:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13686590"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Dec 2016 16:45:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id AE34E4670495
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:45:46 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 7 Dec 2016 16:45:46 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 08:45:33 -0800
Message-ID: <1481129133-52088-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: AE34E4670495.A3362
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v2] dhcp: 4.3.4 -> 4.3.5
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
X-List-Received-Date: Wed, 07 Dec 2016 08:45:54 -0000
Content-Type: text/plain

Upgrade dhcp from 4.3.4 to 4.3.5.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/dhcp/{dhcp_4.3.4.bb => dhcp_4.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.4.bb => dhcp_4.3.5.bb} (81%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
similarity index 81%
rename from meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
index 4151eb1..678c29a 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://remove-dhclient-script-bash-dependency.patch \
            "
 
-SRC_URI[md5sum] = "0138319fe2b788cf4bdf34fbeaf9ff54"
-SRC_URI[sha256sum] = "f5115aee3dd3e6925de4ba47b80ab732ba48b481c8364b6ebade2d43698d607e"
+SRC_URI[md5sum] = "2b5e5b2fa31c2e27e487039d86f83d3f"
+SRC_URI[sha256sum] = "eb95936bf15d2393c55dd505bc527d1d4408289cec5a9fa8abb99f7577e7f954"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.7.4





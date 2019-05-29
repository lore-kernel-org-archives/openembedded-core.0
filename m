Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E2897D25F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 07:46:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T7kiU2024908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 00:46:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 00:46:31 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 15:46:30 +0800
Message-ID: <1559115990-153069-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] inetutils: fix wrong package name
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
X-List-Received-Date: Wed, 29 May 2019 07:46:44 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below error:
file /etc/xinetd.d/telnet conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
file /usr/sbin/in.telnetd conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index ec1384e..ac2e017 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -200,7 +200,7 @@ RDEPENDS_${PN}-tftpd += "xinetd"
 
 FILES_${PN}-telnetd = "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/telnet"
 FILES_${PN}-telnetd-dbg = "${sbindir}/.debug/in.telnetd"
-RCONFLICTS_${PN}-telnetd += "netkit-telnetd"
+RCONFLICTS_${PN}-telnetd += "netkit-telnet"
 RPROVIDES_${PN}-telnetd = "telnetd"
 RDEPENDS_${PN}-telnetd += "xinetd"
 
-- 
2.7.4



Return-Path: <jma1@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 441857D245
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:47:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4N6lU97004792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:47:30 -0700 (PDT)
Received: from pek-lpggp2 (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 22 May 2019 23:47:29 -0700
Received: by pek-lpggp2 (Postfix, from userid 20544)	id BD4157211D6; Thu, 23
	May 2019 14:29:54 +0800 (CST)
From: Jiping Ma <jiping.ma2@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 May 2019 14:29:52 +0800
Message-ID: <20190523062953.10582-1-jiping.ma2@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH]dhcp:"dhclient -x eth0" action is not correct.
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
X-List-Received-Date: Thu, 23 May 2019 06:47:29 -0000
Content-Type: text/plain

The action of "dhclient -x eth0" and "dhclient -r eth0" is
same when enable ENABLE_GENTLE_SHUTDOWN. Disable ENABLE_GENTLE_SHUTDOWN
that will use the default signal hander.

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
index 19524cb3c9..275961a603 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb
@@ -5,7 +5,6 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0003-link-with-lcrypto.patch \
             file://0004-Fix-out-of-tree-builds.patch \
             file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
-            file://0006-site.h-enable-gentle-shutdown.patch \
             file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
-- 
2.14.1



Return-Path: <yaoxp@cn.fujitsu.com>
X-Greylist: delayed 633 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Aug 2014 09:26:42 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A085465C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 09:26:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,260,1406563200"; d="scan'208";a="34143159"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Aug 2014 17:13:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s749G3gd001411
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 17:16:03 +0800
Received: from localhost.localdomain (10.167.226.250) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Aug 2014 17:16:05 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 17:15:20 +0800
Message-ID: <1407143720-1213-1-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.250]
Subject: [PATCH] tcp-wrappers: install /etc/hosts.allow and /etc/hosts.deny
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
X-List-Received-Date: Mon, 04 Aug 2014 09:26:51 -0000
Content-Type: text/plain

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index c7954e7..034b33b 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -117,5 +117,10 @@ do_install () {
 
 	install -d ${D}${includedir}
 	install -m 0644 tcpd.h ${D}${includedir}/
+
+	install -d ${D}${sysconfdir}
+	touch ${D}${sysconfdir}/hosts.allow
+	touch ${D}${sysconfdir}/hosts.deny
 }
 
+FILES_${PN} += "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.deny"
-- 
1.9.3



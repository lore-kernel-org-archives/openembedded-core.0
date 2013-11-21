Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC6E6DA27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 17:47:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rALHllIl019214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:47:47 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 21 Nov 2013 09:47:45 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 11:47:43 -0600
Message-ID: <1385056063-31540-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [dora][master][PATCH] util-linux: Package readprofile into it's own package
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
X-List-Received-Date: Thu, 21 Nov 2013 17:47:48 -0000
Content-Type: text/plain

readprofile was missing from the alternative configuration, which was
causing readprofile to be packaged into the base util-linux.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 5d1dcd1..8a1e78a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -204,6 +204,9 @@ ALTERNATIVE_LINK_NAME[mount] = "${base_bindir}/mount"
 ALTERNATIVE_util-linux-umount = "umount"
 ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 
+ALTERNATIVE_util-linux-readprofile = "readprofile"
+ALTERNATIVE_LINK_NAME[readprofile] = "${base_sbindir}/readprofile"
+
 ALTERNATIVE_util-linux-losetup = "losetup"
 ALTERNATIVE_LINK_NAME[losetup] = "${base_sbindir}/losetup"
 
-- 
1.8.3.4



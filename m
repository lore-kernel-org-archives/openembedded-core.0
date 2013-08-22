Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD0D6A8B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:56:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M9uv6Q019469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 02:56:57 -0700 (PDT)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.169.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 22 Aug 2013 02:56:57 -0700
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 12:56:46 +0300
Message-ID: <1377165406-21978-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.169.187]
Subject: [PATCH] busybox.inc: Add -f to rm of ${D}${sysconfdir}/syslog-startup.conf.${BPN} to not error out when the busybox config used does not have SYSLOG enabled and DISTRO_FEATURES does not contain sysvinit.
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
X-List-Received-Date: Thu, 22 Aug 2013 09:56:57 -0000
Content-Type: text/plain

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 8b38c1a..454d7e3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -277,7 +277,7 @@ do_install () {
 
     # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
     if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
-	rm ${D}${sysconfdir}/syslog-startup.conf.${BPN}
+	rm -f ${D}${sysconfdir}/syslog-startup.conf.${BPN}
     fi
 }
 
-- 
1.8.3.2



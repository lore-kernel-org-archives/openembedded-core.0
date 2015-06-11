Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36742758FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:08:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B98jDI013246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:08:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:08:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:08:42 -0700
Message-ID: <5958f85e68ae5909f4689807b2d9a9d2f665774b.1434013682.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013682.git.liezhi.yang@windriver.com>
References: <cover.1434013682.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bluez5: remove alsa from PACKAGECONFIG
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
X-List-Received-Date: Thu, 11 Jun 2015 09:08:44 -0000
Content-Type: text/plain

The PACKAGECONFIG[alsa] had been removed when upgraded to 5.12 since it
was not supported any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67aafbb..ae9402f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -12,7 +12,7 @@ RPROVIDES_${PN} += "bluez-hcidump"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
+PACKAGECONFIG ??= "obex-profiles"
 PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
-- 
1.7.9.5



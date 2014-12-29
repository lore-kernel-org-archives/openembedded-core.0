Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85E0F7265F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:04:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBTC4ZNw014711
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:04:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 04:04:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 20:04:38 +0800
Message-ID: <0c335371a36ab95904e0f14b2eb5f2d7392e38ea.1419854463.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419854463.git.Qi.Chen@windriver.com>
References: <cover.1419854463.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pciutils: change default value of PACKAGECONFIG
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
X-List-Received-Date: Mon, 29 Dec 2014 12:04:35 -0000
Content-Type: text/plain

Default PACKAGECONFIG value to "hwdb" if 'systemd' is in DISTRO_FEATURES.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
index f544919..b713512 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7
 
 inherit multilib_header
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
 
 PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
-- 
1.9.1



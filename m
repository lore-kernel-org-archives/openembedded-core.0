Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6906C739C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:50:45 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 16:50:43 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id B9C272800CE;
	Thu, 12 Mar 2015 16:50:43 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Mar 2015 16:50:37 +0100
Message-ID: <1426175440-16095-3-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
References: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 2/5] u-boot-mkimage: remove unnecessary 'protocol=git' from SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 15:50:45 -0000
Content-Type: text/plain

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
index 57989c7..076dff8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
@@ -12,7 +12,7 @@ SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
 
 PV = "v2015.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



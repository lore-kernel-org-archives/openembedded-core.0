Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEA526DED8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 10:27:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB3ARIpg005266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 02:27:18 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 02:27:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 18:27:05 +0800
Message-ID: <c6ae72c3a4eea9827ffa218ff05c43285c8e4999.1386066250.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386066249.git.hongxu.jia@windriver.com>
References: <cover.1386066249.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] syslinux: add ability to compile with nativesdk
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
X-List-Received-Date: Tue, 03 Dec 2013 10:27:23 -0000
Content-Type: text/plain

For regenerating and ISO or EFI boot image the nativesdk needs mtools
and syslinux.

[YOCTO #5623]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 538be56..1c240de 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -65,4 +65,4 @@ FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*${SOLIBS} ${datadir}/${BPN}/com3
 FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.a ${libdir}/${BPN}/com32/lib*.a"
 FILES_${PN}-misc = "${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir}/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.2



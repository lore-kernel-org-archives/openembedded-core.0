Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U35hi-0000ZX-4S
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:10:28 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so673663dak.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 05:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=rvzyIggyJXaNsRW+j7evmVDPUiXUKvdbU/v0+14akoE=;
	b=Q98HbqoelfAnrz7tm4Yr0gG+AAA9jATuXu4NqBVTAJ01Coov1SKGSbWfz+70gMoYjJ
	KA7fT8MaiCHhj6eC9cikpfDjbbngQqh6h0ORX1rESb59ncfQatfyl2clS/q/vPh/M2Dn
	7S6iax/UIuxo8GuZWuEkv1NUARLbLtrjhB/hKlBoDe2rJuWAkMtF5lpTYNS/gPsoRhGN
	sBm5yNg26TCG98RGwgZlfLyNN3E8/vuW9MnRpiopUL5SA/jVHHSVtrCXZzwr9vOUslfG
	lCCfzNYOH7b+qllwTe6Sg24LnawrYLSmphpO4vTSlEaEsNGBE+lwakUJZtdcnYtiiNHl
	mh1Q==
X-Received: by 10.66.82.67 with SMTP id g3mr75480969pay.58.1360158874391;
	Wed, 06 Feb 2013 05:54:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a1sm37940446pav.2.2013.02.06.05.54.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 05:54:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 14:54:24 +0100
Message-Id: <1360158864-31557-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libxscrnsaver: improve RREPLACES to add libxss only for PN
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 14:10:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
index f97fd8f..0c15557 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=21fd154ee757813632ada871a34113fb"
 
 DEPENDS += "libxext scrnsaverproto"
 PROVIDES = "libxss"
-RREPLACES = "libxss"
+RREPLACES_${PN} = "libxss"
 PR = "r0"
 PE = "1"
 
-- 
1.8.1.2




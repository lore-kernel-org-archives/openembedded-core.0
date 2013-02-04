Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2TQU-0000zu-MP
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 22:18:07 +0100
Received: by mail-wi0-f173.google.com with SMTP id hq4so3445212wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 13:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=R49fhtW8v0U1InBJhVBeXjdeHDjCuME/Vdsc0Oi7M+Y=;
	b=d19/u0dtfPufczlA4Veho+Uq1wq06/6z9eSDpwEFpmVJLwdP2t/E0klOa8/tB/UPJt
	VyQ/6D7xjE9YYw1f1Qgky6ya01bPyIaNpl/cdvXoLCzH60Uz9VcIFppzxy/l6XuhgHMZ
	mYs7v/1qJloyrtUmWc4Gh7pChONpa8klGdiIUs8iBu9pToZN6htn6xocSMZIFxp26AeA
	AGpcAQaA7pd53a3Nq09G1LAsMKpLFe28uoSYXfLGkG5zV3ZInuV0vnKY8syd/SP8s73a
	az3IUPRNksth47VGZhTA280JsFCUlBdreGe3Rr/7MmZy39SsEYkTJRhj+UxfK/bEuE3e
	oexQ==
X-Received: by 10.180.97.102 with SMTP id dz6mr13062085wib.3.1360011738151;
	Mon, 04 Feb 2013 13:02:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q13sm1558232wie.0.2013.02.04.13.02.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 13:02:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 22:02:14 +0100
Message-Id: <1360011734-9796-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] sip.bbclass: improve RDEPENDS to add python-sip only for PN
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
X-List-Received-Date: Mon, 04 Feb 2013 21:18:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sip.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sip.bbclass b/meta/classes/sip.bbclass
index 074d4dd..711f851 100644
--- a/meta/classes/sip.bbclass
+++ b/meta/classes/sip.bbclass
@@ -4,7 +4,7 @@
 STAGING_SIPDIR ?= "${STAGING_DATADIR_NATIVE}/sip"
 
 DEPENDS  =+ "sip-native"
-RDEPENDS += "python-sip"
+RDEPENDS_${PN} += "python-sip"
 
 # default stuff, do not uncomment
 # EXTRA_SIPTAGS = "-tWS_X11 -tQt_4_3_0"
-- 
1.8.1.2




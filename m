Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2MUy-0007If-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 13:49:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so737015eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 04:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.26.17 as permitted sender) client-ip=10.213.26.17; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.26.17 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.26.17])
	by 10.213.26.17 with SMTP id b17mr5589114ebc.115.1330432879473
	(num_hops = 1); Tue, 28 Feb 2012 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nnkbi1CjoouZupKuOU//WxP/DNXivgEbfdjN1jGbJSU=;
	b=Lq981bkymdburBrIvBMgl5v2XHlSX7YvuqTUUXY/mEWQTzrc4r9DqqEeGFWT4FTjwO
	L1dqV1JbX3Dn1TraFpczkxN/rTsilyQGEBT2UhYE1598Z+0gi3buDNMagRFBCZ8c4vPq
	skBZjkiP6aauwicelv2TAlx0AMjCNde+XKz7c=
Received: by 10.213.26.17 with SMTP id b17mr4160470ebc.115.1330432879340;
	Tue, 28 Feb 2012 04:41:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm69942710eef.10.2012.02.28.04.41.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 04:41:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 13:41:11 +0100
Message-Id: <1330432871-12325-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] lsbtest: fix quoting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 12:49:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index d932c83..1191164 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "file://LSB_Test.sh \
 		   "
 RDEPENDS_${PN} = "rpm"
 
-S=${WORKDIR}
+S = "${WORKDIR}"
 
 do_install() {
 	install -d ${D}/usr/bin
-- 
1.7.8.5




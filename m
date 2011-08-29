Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1Qy1mE-0001KY-Q1
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:21:22 +0200
Received: by fxg11 with SMTP id 11so4560358fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 06:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=4FjWk72IumaUWmDAN02WQFQg9Kbcy3gb+JFvr5VSxiI=;
	b=tK4g6Pgr22H1gYnrIG6I21YhBNebifXpBbvN1D1mhnrxnQWM/Au0jcd9X+9kJb+yiI
	1yVoQo9mgyZdYJtPtCHyIRESZEM2LCXGLzGTxxoC9wirkQ1FlvgXYpp40xj8DFLnELRS
	kWawSH94flLiKiv78NqdQQHRdLT7CFU15vJaM=
Received: by 10.223.98.130 with SMTP id q2mr7007383fan.137.1314623790993;
	Mon, 29 Aug 2011 06:16:30 -0700 (PDT)
Received: from localhost.localdomain (esq70.neoplus.adsl.tpnet.pl
	[83.20.136.70])
	by mx.google.com with ESMTPS id p3sm3752696faa.33.2011.08.29.06.16.29
	(version=SSLv3 cipher=OTHER); Mon, 29 Aug 2011 06:16:30 -0700 (PDT)
Sender: Sebastian Krzyszkowiak <seba.dos1@gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:16:23 +0200
Message-Id: <1314623783-17767-1-git-send-email-dos@dosowisko.net>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libidn_1.22: add SRC_URI checksums
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
X-List-Received-Date: Mon, 29 Aug 2011 13:21:22 -0000

---
 meta/recipes-extended/libidn/libidn_1.22.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn_1.22.bb b/meta/recipes-extended/libidn/libidn_1.22.bb
index 6a1059c..9bdb322 100644
--- a/meta/recipes-extended/libidn/libidn_1.22.bb
+++ b/meta/recipes-extended/libidn/libidn_1.22.bb
@@ -12,6 +12,8 @@ PR = "r0"
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "893a1df0cf3b28b72d248382eaeaca71"
+SRC_URI[sha256sum] = "2f765e868795f5478900ec9f42cb0ecc6ca22e2a85a62763c0b13c7da2f588ed"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+
 # so package command into a separate package
-- 
1.7.5.4




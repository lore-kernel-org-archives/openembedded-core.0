Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmTbr-0004A7-VD
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:43:28 +0200
Received: by weyr6 with SMTP id r6so1804876wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=FkSEayywcf0/XuxmoE1dE5i/gya8U/4Va8WalDAlJjE=;
	b=X7KLIdas/1+KQ7xKbzAWViB6XFb6pDhpcq4g3ZSCXoPWw00c8mGqXOAc49GccDcQ2Y
	Crno4Ikxl/XJX5QOvmT03rSyFiuYYvtv3uFR71Drd8pNAdYL18PksBjajsYDCpItaBsd
	xg9uKohmkDBBAst54fby2iNTiVbpIhWy0/9uMKYVcaC77nrjZdZzqUaCufJQdwm9oTez
	7L0ghQy6ZDKz8dpZ8DVXLnUMp3tfquzCc62JoeXT6bWP2El4cihIZuE97JKgRe4SM2Yp
	dTBt7OaSfzSXdzDTT4cGqfLtFowR2uEiMagbbvbIC6c0KaXcz98I8QC35IJksB1w8+lP
	qlCg==
Received: by 10.180.105.6 with SMTP id gi6mr42079837wib.4.1341423144805;
	Wed, 04 Jul 2012 10:32:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eb8sm37908909wib.11.2012.07.04.10.32.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:32:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 19:32:13 +0200
Message-Id: <1341423133-6634-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1341423133-6634-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120704172446.GG15100@jama.jama.net>
	<1341423133-6634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] matchbox-panel-2: bump PR because libxcb-util soname was changed
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
X-List-Received-Date: Wed, 04 Jul 2012 17:43:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 12e4392..52ccc6f 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
-- 
1.7.8.6




Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW2Om-00053y-UG
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 09:53:46 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so1870623eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KdBuQ9wn+3FEbpfUJu/OmTUYw76UAnSatdczVQkOvXk=;
	b=frx3LK//gt09cyHLYkikFRCSGGdZp9M8zBaBOMB2gWp98EppAZj6TJXuKCIwcit9FD
	o6qtGeUMpRd0TEQaamrxv9nqIx1CK6uGw5sDRIWvMD6JvtshbVFqJi6gNlvXy5eiG5gz
	P3nJts/aQ0RLb1Q5kekya3Hd8NSTUe24Y3qxY=
Received: by 10.213.110.9 with SMTP id l9mr937724ebp.118.1322729226039;
	Thu, 01 Dec 2011 00:47:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 8sm15310614ees.2.2011.12.01.00.47.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:47:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 09:46:41 +0100
Message-Id: <1322729201-11290-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1322729201-11290-1-git-send-email-Martin.Jansa@gmail.com>
References: <20111201080213.GE29875@jama.jama.net>
	<1322729201-11290-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 3/3] matchbox-panel-2: add unpackaged .la files to PN-dev to fix QA warning
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
X-List-Received-Date: Thu, 01 Dec 2011 08:53:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 41ba8e1..78111f7 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
@@ -32,5 +32,6 @@ FILES_${PN} += "${libdir}/matchbox-panel/*.so \
                 ${datadir}/matchbox-panel/brightness/*.png \
                 ${datadir}/matchbox-panel/startup/*.png "
 FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
+FILES_${PN}-dev += "${libdir}/matchbox-panel/*.la"
 
 inherit autotools pkgconfig
-- 
1.7.8.rc4




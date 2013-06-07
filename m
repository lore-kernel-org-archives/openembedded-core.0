Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id DDFC46A886
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:10 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so4210391pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xOJ7689yG5K4EWSj94uHDEMgChpFn2FoAGy3LD4acww=;
	b=TfQEVNOjYWkcYeOTfdVwEM/pVlVmLI7xHAGSi2H58zJh1sY5f6o6Ss1sdmAg7GtsSZ
	lSEICKCDtJYdtWHFjxXGasFMMR7tSZBvVtNUGDhxVi8RX7ta9wZB/wEem/EZhlF1nAHc
	i30uI9y9fshY+UTFC6JK85jD1e3qGyUEoUXdavgFc8w/fp/x+NTEfejE24Yb7pPlPVod
	f4oXsNfiFnb8/3erLqL9cWIQGUlD/b732HCUcB4q28Md8X6W6fj5qGhNjgwoN4SxEn8H
	3HtxAp3qJpYsFFmy0w9ajJqiAwMm9AJGUhowEcjjK/0nRejOWZXQnd+eejqPUNw2XZwL
	Kn3Q==
X-Received: by 10.66.159.195 with SMTP id xe3mr1135092pab.49.1370583192193;
	Thu, 06 Jun 2013 22:33:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	al2sm75968676pbc.25.2013.06.06.22.33.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:49 +1000
Message-Id: <1370584012-28002-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370584012-28002-1-git-send-email-net147@gmail.com>
References: <1370584012-28002-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/5] qt-mobility: update HOMEPAGE
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
X-List-Received-Date: Fri, 07 Jun 2013 05:33:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index 1db1438..b0e4278 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://qt.nokia.com"
+HOMEPAGE = "http://qt-project.org/"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
-- 
1.8.2.3



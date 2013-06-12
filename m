Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 896B76A998
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 01:07:04 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so6458791pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 18:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DRnKp8/8rzxI8N9Hr8HXbdBa5M6yHp/FdY0D4aMwVk8=;
	b=xdQyCnol4cmFxWkd3ZWTo83PhYuC14s0BcDQeWrajkSs3ZQ/fYRD2kEZ3qS2X2AfIh
	4bWYA1nXdI/RpDFBursia+OzX4JHkeBgQYBiRBeSq8rlWm/rYj0rWVOdmh50YyqP4SX7
	zfoKmDBAzX8mTHYuWfHKjpQ9By3II7uuHdFH/TPRPR+OEMXZugMXkesoCJWOy0AxBwCs
	NmRxnTWCa98yB3Pr/3XlbtrLvIhuTKlx/ZaRo8WF9DMP0syCE/YqxtmFn26vxdRsGn16
	a27pBD79hdeab+UqNYAQSuAcpJ1kxCJFRoPFKgHjQairofHxoCXIpRhKJ57N2RcVzWnN
	7iVg==
X-Received: by 10.66.216.198 with SMTP id os6mr21046075pac.145.1370999225679; 
	Tue, 11 Jun 2013 18:07:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vb8sm16794597pbc.11.2013.06.11.18.07.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 18:07:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 11:21:04 +1000
Message-Id: <1371000065-23866-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1371000065-23866-1-git-send-email-net147@gmail.com>
References: <1371000065-23866-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/2] qt: update qmake2 class to export qconfig.pri mkspec
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
X-List-Received-Date: Wed, 12 Jun 2013 01:07:05 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is necessary when Qt applications want to know variables such as
QT_MAJOR_VERSION, QT_VERSION, QT_MINOR_VERSION, GCC version, etc.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake2.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
index 35aaebb..6e73ad2 100644
--- a/meta/classes/qmake2.bbclass
+++ b/meta/classes/qmake2.bbclass
@@ -6,6 +6,7 @@ inherit qmake_base
 DEPENDS_prepend = "qt4-tools-native "
 
 export QMAKESPEC = "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++"
+export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/qt4/mkspecs/qconfig.pri"
 export OE_QMAKE_UIC = "${STAGING_BINDIR_NATIVE}/uic4"
 export OE_QMAKE_UIC3 = "${STAGING_BINDIR_NATIVE}/uic34"
 export OE_QMAKE_MOC = "${STAGING_BINDIR_NATIVE}/moc4"
-- 
1.8.3



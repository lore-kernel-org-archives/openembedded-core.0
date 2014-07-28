Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id E7E72701BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:07:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,748,1400018400"; d="scan'208";a="55617922"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Jul 2014 14:07:02 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Mon, 28 Jul 2014 14:07:00 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.174.1; Mon, 28 Jul 2014 14:07:00 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 14:06:53 +0200
Message-ID: <1406549213-4532-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B29DEA@COSNADEXC13.usr.ingenico.loc>
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B29DEA@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
Subject: [PATCH] libav: fix PACKAGECONFIG for theora and libvorbis
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
X-List-Received-Date: Mon, 28 Jul 2014 12:07:06 -0000
Content-Type: text/plain

Switches must not be in EXTRA_OECONF anymore.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 1d617a2..5c327df 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -60,8 +60,6 @@ EXTRA_OECONF = " \
     --enable-avserver \
     --enable-avplay \
     --ld="${CCLD}" \
-    --enable-libtheora  \
-    --enable-libvorbis \
     --arch=${TARGET_ARCH} \
     --target-os="linux" \
     --enable-cross-compile \
-- 
2.0.0



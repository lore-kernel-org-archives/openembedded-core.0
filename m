Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 4B67466095
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 11:37:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51552493"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 13:37:53 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 21 May 2014 13:37:52 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 13:37:52 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 13:37:57 +0200
Message-ID: <1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Wed, 21 May 2014 11:37:53 -0000
Content-Type: text/plain

Use PREFERRED_VERSION_libav in your distro definition instead.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav_9.13.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav_9.13.bb b/meta/recipes-multimedia/libav/libav_9.13.bb
index 7bfbc48..bbefde0 100644
--- a/meta/recipes-multimedia/libav/libav_9.13.bb
+++ b/meta/recipes-multimedia/libav/libav_9.13.bb
@@ -9,5 +9,3 @@ SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
 SRC_URI[sha256sum] = "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca"
-
-DEFAULT_PREFERENCE = "-1"
-- 
1.8.1.2



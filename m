Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.41443.1591029633611475958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=moNa4BBM;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 2D8C16012F;
	Mon,  1 Jun 2020 18:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591029631;
	bh=iFr3EBvny6J+LI2+qcsP3sh6CFFQN/w7jqNJJHJHFzI=;
	h=From:To:Cc:Subject:Date:From;
	b=moNa4BBMNqNJZUnOmpGxcFyI9F6ihOTMubEFGGIpMgKdUvblfNALGXpdbkNdl797R
	 h7a9urw0fil/y4x+MTD8J+sFoPmKM5S9dNeeh+YQFwcrl5lmQ5XJa0JDrvL32ULE1T
	 hME3pOnJ47hSfoQ2eL79Ti+QGUH7Ra+KHbKGvOwTmINfuDaSnUIkyZSNBB++JsUk+V
	 jpAxcRt4Hvs088QbYceKbyOrC+x56+xFDvFhvxRyhzr8fQq1SUQUrbEtQv3C8fcAbb
	 4cFgHVKuzLgMgGHUmWk8RCdKeIxXpEcNp/smYOsn93DXUSndNR4iAzF5zp6MaJ/K8X
	 6XBsM6JW/kzLQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br,
	Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH 1/1] libarchive: upgrade 3.4.2 -> 3.4.3
Date: Mon,  1 Jun 2020 18:40:25 +0200
Message-Id: <1591029625-8136-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/libarchive/libarchive/releases/tag/v3.4.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../libarchive/{libarchive_3.4.2.bb => libarchive_3.4.3.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.4.2.bb => libarchive_3.4.3.bb} (94%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
similarity index 94%
rename from meta/recipes-extended/libarchive/libarchive_3.4.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.4.3.bb
index 0ab40fc..dbfc067 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.3.bb
@@ -34,8 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
-SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
+SRC_URI[sha256sum] = "ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.7.4


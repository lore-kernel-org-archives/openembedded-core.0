Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5DA578651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0s9bS022226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:09 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:46 +0800
Message-ID: <c0421af2b74fab772ba2c7041bccbdd459a243b2.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] liberror-perl: 0.17024 -> 0.17025
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:07 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../perl/{liberror-perl_0.17024.bb => liberror-perl_0.17025.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17024.bb => liberror-perl_0.17025.bb} (83%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17024.bb b/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
similarity index 83%
rename from meta/recipes-devtools/perl/liberror-perl_0.17024.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17025.bb
index 6ae0e7e..251b131 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17024.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "7e3676a7fb14f65f568f12d4b40a2a72"
-SRC_URI[sha256sum] = "074db7c783a67b0667eca64a4f6a0c3de94998afc92c01d6453163eb04b9150d"
+SRC_URI[md5sum] = "1a2ee7f0dc44f9ee76661a16bbbc0c48"
+SRC_URI[sha256sum] = "6c9f474ad3d4fe0cabff6b6be532cb1dd348245986d4a6b600ad921d5cfdefaf"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.7.4



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5367757EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:48:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t52EmsOk027727
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 07:48:54 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 07:48:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 07:48:48 -0700
Message-ID: <87bf3bce34ee177a23c3b3a05647a7d83e1a0e9f.1433256486.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433256486.git.liezhi.yang@windriver.com>
References: <cover.1433256486.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] liberror-perl: 0.17023 -> 0.17024
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
X-List-Received-Date: Tue, 02 Jun 2015 14:48:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...or-perl_0.17023.bb => liberror-perl_0.17024.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17023.bb => liberror-perl_0.17024.bb} (83%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17023.bb b/meta/recipes-devtools/perl/liberror-perl_0.17024.bb
similarity index 83%
rename from meta/recipes-devtools/perl/liberror-perl_0.17023.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17024.bb
index 87684e1..6ae0e7e 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17023.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17024.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "98524ffbd268013e00697a5826a83d37"
-SRC_URI[sha256sum] = "af48e19077d8837c6377d8a9ba2ce473c100caf5eeb7b53606c3f78a0e8b5d37"
+SRC_URI[md5sum] = "7e3676a7fb14f65f568f12d4b40a2a72"
+SRC_URI[sha256sum] = "074db7c783a67b0667eca64a4f6a0c3de94998afc92c01d6453163eb04b9150d"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
1.7.9.5



Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6761732
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QSRk1qStz2J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 15:36:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582468562;
	bh=DIaGB6u87CBqRtIS81Qbhn2W3VNMbO1f45GySdisER4=;
	h=From:To:Subject:Date:From;
	b=eNCPPlVyEkyz0GOc4ycsQHNJtfCp8UWz6d5acyGE0XcH/R3k5DdpS7CfC1YGew5qK
	04E4+ONSuNIHCZkJVdXMyTN5VNWmo2a9Dkh//IIMwNPA/zRmPocC2kNF1trW8VjPH4
	LYzM4zPeioAw+Odlh1vwDfTByLZXLtzAOoAyKqE9m2A4CFYArUKlWHLfqHz3Q2kcf/
	DRoNoOw8ZvMiunX1LrVXbf/UW37a0uVfFNhnUhWRdsi3crmz8DICBWBqCa2IczZwuv
	WXyL3Wg0mbn5L4Uy9EtPIU4mURL3OSHVnnOTZP056KL0MkbL1D3p4NZoXp6pHutKtj
	TV9XKg+Prs5tHI1P1GiFjQwXwCs2JQ6TBaJwYbhr/5z4U6vO0mk+WKVOYQjWqDU42c
	U6dC0NDZb7+b4QWmZwy1VD6hgjOdkmsbceENihoBPy+Cs3HVlErlKgjYIAXx6F8XzJ
	NnY7g/orWkc3nHpRBAWOBj8A6VsF6CpE5J204AH34VnKJtqjkhjK1gJXejnFt0uOa8
	GCn3WpvD/BMkOUsM3sajRrZHDXaIDEDP5t6zRWYKzzoQhMrOBKiFBJWSnV+/5yp37q
	6MSB/OJh27q5XKLdhkG/NoF2NkjwGZZ5udAXwZuMtomH5Sb8ki3/TK20qZAy39dvYs
	oFbwD4YJ/sDqc2blla3qcpOE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 16:35:58 +0200
Message-Id: <20200223143600.2282-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] apt: Inherit upstream-version-is-even
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
X-List-Received-Date: Sun, 23 Feb 2020 14:36:03 -0000

Even versions are shipped in Ubuntu LTS and Debian releases.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/apt/apt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 50c4d8484a..13f5969f86 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 
-inherit autotools gettext useradd
+inherit autotools gettext useradd upstream-version-is-even
 
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
 
-- 
2.17.1



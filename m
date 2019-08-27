Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EAF5B7E53A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:52:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HdLB1V1Nz56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566885122;
	bh=kLX2WKg/XRwfXNXzFNlMRvooqYtqckCrp02k2zI7Epk=;
	h=From:To:Subject:Date:From;
	b=oElQ70GDDuFZ00fKRK7EFRAeNNxz2zNajZcXxCCcScqsKxfdcP98Ufv4yC9DtelfM
	sFaD8gYmsJUYdquIc+AniDFvIi92y8GwZJoq3Ixu7xSXMrB7dx8ef38ZdJtat32blO
	8qS0SWQ3tMBcSgvkfOTwtf2LQPz4k/MBgJ8BJbCl0dX+JwHSjWkAZvxXal4MBeGl9K
	ZB+5jNMEfXSyUJv3o4dhyvc1hDk4zISyg3p5DZ7Vsn4m75Qbb2azo5YdukHmnUGbvh
	dnh0+XHp251E48fVum7EUBNyuIX+SijWXHnz3bZkoxKPIPdE+HtBSf8oWR+QyIzq+k
	xmvau1iUgvibb6HOvSgpiN/VTzWREyy8pqYTqkbeLTPQqesOn7+jctTKwuPDm2KjdA
	PQwDiqFyjafIA52iElCy/EvLcE37yNgl1+5uOAQB9eBJ4mvn1X7qB8+3iwWy/nwj/7
	s91hMhk/x8NAg6hh0OEcrnCKifUjWX7D8SofE49f76CZPsu6pMwZ6r6yPZjUQFOKzG
	c+mDgj46NPlgxnJTlYQshETWAe5E+lY38LMbDZsYklFttu1GzltqMFBeHtAScSgRI/
	m2YunZhZT4uLf8pQU/ZW2kYnAI90l4GeNOOMgsQl6wMNvh6UaCL4veAm5ShsaZSXii
	3loq+JnV0NqbO0zl9evx13fY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 08:51:57 +0300
Message-Id: <20190827055200.3690-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glib-networking: Upgrade 2.60.2 -> 2.60.3
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
X-List-Received-Date: Tue, 27 Aug 2019 05:52:02 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{glib-networking_2.60.2.bb => glib-networking_2.60.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.60.2.bb => glib-networking_2.60.3.bb} (87%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
similarity index 87%
rename from meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
index 4d4fe64916..d893b7a3a1 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "bf46d1208ac00d78a45fbf621d459025"
-SRC_URI[archive.sha256sum] = "c022f3d10f55a5b7c31676fb001b4cb6401db8ab9f6e8418c69de00d0f268732"
+SRC_URI[archive.md5sum] = "e8fd0462a82269fb4bbd6c07a1e7d0f4"
+SRC_URI[archive.sha256sum] = "d50183046a4ff955d8cc7e953067cdfc94f14dbfda3024bf377ff37a3121dcd5"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1



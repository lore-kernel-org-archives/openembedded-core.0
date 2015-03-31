Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id E04C073C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 19:44:06 +0000 (UTC)
Received: by ierf6 with SMTP id f6so25185583ier.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=LB14ztcoMqHd7EKADiCPR67dbuxREtw7HVnKIQKxrEM=;
	b=dnGUCrncN8ulCDgh5SiQ9H2oV6JGWeTZmZlguowrB1wQHlQPrGO4PmWvS5rM4LezmL
	LoPsymaUmUygEbtIK3IUcAkVWXPw25XkW8d8L5IMmloD3OBruTkJrC8Ns0UVF4lbPv9R
	SNJ9aV3jvCTV758el+DITj6lGG209YbEvpKeKuKgELdBFUj+WN4LBWwWYTwk/ufJ8n+X
	bnZKsYcJRaVUZMqKUtEkw2F4xA3mYbxgwt0Z+TWyAMq0ZzIdPMtShqbVQXFhAU66kmXI
	XurCLk1hGzYoSxfa/zHt3+hLtOc5ZXOciNPF4nqZksg9D2KlUOEdJr7h25NeP/F7DPVa
	W+mw==
X-Received: by 10.50.49.43 with SMTP id r11mr7044273ign.18.1427831047523;
	Tue, 31 Mar 2015 12:44:07 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id y6sm10683088igw.21.2015.03.31.12.44.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 12:44:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Mar 2015 12:43:55 -0700
Message-Id: <1427831035-20334-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [master-next][PATCH] pinentry: update to 9.1
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
X-List-Received-Date: Tue, 31 Mar 2015 19:44:10 -0000

Fix build problems on AIX.
Update to automake 1.14.

remove "PR"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pinentry/{pinentry_0.9.0.bb => pinentry_0.9.1.bb}               | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry_0.9.0.bb => pinentry_0.9.1.bb} (86%)

diff --git a/meta/recipes-support/pinentry/pinentry_0.9.0.bb b/meta/recipes-support/pinentry/pinentry_0.9.1.bb
similarity index 86%
rename from meta/recipes-support/pinentry/pinentry_0.9.0.bb
rename to meta/recipes-support/pinentry/pinentry_0.9.1.bb
index 10b329b..08588dd 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.1.bb
@@ -8,14 +8,12 @@ HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
-PR = "r1"
-
 inherit autotools
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "40a05856cb3accf6679987b7899b0f5a"
-SRC_URI[sha256sum] = "90045a07ab8e1a8e1ecf5d19b51691f195525e579fa5d71d7e92c120b05490ab"
+SRC_URI[md5sum] = "d224d031130aedb44b05164cb04ed88b"
+SRC_URI[sha256sum] = "9cd08e856b395df3adc7124170b53f77c6d5c8bf88e899e818648ec70d3e9695"
 
 EXTRA_OECONF = "--disable-rpath \
 		        --disable-dependency-tracking \
-- 
1.9.1



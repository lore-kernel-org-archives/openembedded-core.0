Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BA9F76102E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QPQF3FZgz2J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:19:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582460373;
	bh=OCRcyvCWoa8Tg9ykkwCkPLIeWzF2dmATP/HDR/umwsU=;
	h=From:To:Subject:Date:From;
	b=IW9sjts2wuxyPyJPS48vp+4hPds49hmUdD5gdGi653ISssRM1cKGgH4DgXB0PTI8U
	NIYPCELAUVEs8aKioPDV55PvYYSw7GnE9XsKE6ltBsagNg28mcRpNgjDoKuhLMMyVr
	acxs89IqjqFWoROF/LhEdxN51fLo8TgCBAfaXvvQxFsYojqpjcFbirDWqjDuHXB4NM
	FvOiWcpjy7D7xvSg4rB8n27tktU8TZeioWSANZuYiqqbZ3/6SHdsDivxNocRhUzt+K
	873UarmEZsqAqtLg1/F4GnnCSr5tBEhLaVMjRmuBdo2VvkT1SWY4hBqNGbz9nugMcg
	5BSLljulwYNgBbPZftzbO2vfgbHxsQXZ0/utFCJypGq97IJSFfFKQxAE4z4SfyHiGU
	4SgIGD7EhEz7wuYzeQxH1URc8C+gfKHyHb78phC7cHDp3rZlKkO0MD0GFnEsvfRan4
	F4BBpE9A9k26ULsaRAmgDcoILnLYQwStYASHh8ff1gSY0Fhjj3xKTRPppDu2+rropx
	7q+zP0xI72MYA8AB6M56I5fkLmbEOKqdsTwFQ3RbU5KjgH+Uuj5j0IgG5zyA5ksru7
	+2889qRuSbXy1BXPyz8ORxSrvyJkZqv+gO/lTraQPJcXtzMGuGx2lQvSHDGFOJmHsn
	VALziJmL5OT4AR+5cLl0kh+E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:19:32 +0200
Message-Id: <20200223121932.9327-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libcap: Upgrade 2.31 -> 2.32
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
X-List-Received-Date: Sun, 23 Feb 2020 12:19:33 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-support/libcap/{libcap_2.31.bb => libcap_2.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.31.bb => libcap_2.32.bb} (93%)

diff --git a/meta/recipes-support/libcap/libcap_2.31.bb b/meta/recipes-support/libcap/libcap_2.32.bb
similarity index 93%
rename from meta/recipes-support/libcap/libcap_2.31.bb
rename to meta/recipes-support/libcap/libcap_2.32.bb
index 97959c1025..d78a58f7d2 100644
--- a/meta/recipes-support/libcap/libcap_2.31.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -12,8 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[md5sum] = "52120c05dc797b01f5a7ae70f4335e96"
-SRC_URI[sha256sum] = "c6088de41e1c97fa8047e2e7de0e4ee0cd13e6cc16538022230ae76727a87c46"
+SRC_URI[md5sum] = "7416119c9fdcfd0e8dd190a432c668e9"
+SRC_URI[sha256sum] = "1005e3d227f2340ad1e3360ef8b69d15e3c72a29c09f4894d7aac038bd26e2be"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.17.1



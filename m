Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 993478FFE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YT4N1WChz56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568831284;
	bh=9l+vZZl220UbofHAYG/xxr+a9To92hBG+HWYgYGXLdg=;
	h=From:To:Subject:Date:From;
	b=q84RbJY5zdvpUt8M+p2/hBt6RE8Rrk3VGFOKSGWenfd+jje8hFkUyfdS3TT1Eaf5A
	0+KYwWnfZDA5H7r+t+8dDxgE5+wQ8+K9VSuEO0uCOVZJyv5HFx42hAnAyRHu1UueOY
	uFQqRWGaAYjt4WecwwsJzlErA9WgEhnPlKwfRPxGaqy9CgL3IOb9Aj0Iq9Jvk/K8aR
	mNUTfYFRY2RZSrs/VNQNR0MXmOUm/tpGRXut33t4ouG244BMBjVp+8zIASgqmM3DQz
	umXAU7aE2FlOOeMYFhd7GS669UtR+uLMzBamY7RW9ypwquSpePjyiX0tnUYtr6DC5e
	CF4JycIgn6QQfzLS6fVxKZ3FqigVmZQ3SxYXQW9DQUj5WFkxW1v4t6yVJQQP8gseDd
	hJtlbcK/VxCL4dWzqAOGGXJuj73JTGqdSgmH7umWv97SbKsYdeVmAlpCYz0djfZxSh
	7vi2jAAoVlQqt2mMil50YFdOnILlmZs5ZNedeQlhSp4ycYOcDuOEsNCRZb4MWY3KyK
	qDjhGJPXK+PEx/S4CUcPoshKb4yjdvUbQTRQ38piBKwUe/nr7hKSfK0JgRO5DGfa1z
	4gZmR4N/yAYCi9PjujuHRVAw5e8TxhxmHYA7ZHYElC3Kzl9Hjq93I3kyebuMpzGwYC
	vF+Nj+fv+OUQFOgdJj/705SY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 21:27:59 +0300
Message-Id: <20190918182803.29170-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glib-2.0: Upgrade 2.60.6 -> 2.60.7
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
X-List-Received-Date: Wed, 18 Sep 2019 18:28:06 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../glib-2.0/{glib-2.0_2.60.6.bb => glib-2.0_2.60.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.60.6.bb => glib-2.0_2.60.7.bb} (88%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
index a3c5a09d41..740473719d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
@@ -21,5 +21,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 SRC_URI_append_class-target = " file://glib-meson.cross"
 
-SRC_URI[md5sum] = "cd6865d8ce40db5e4c12b7d180953de6"
-SRC_URI[sha256sum] = "ff8fab8d8deaa4fd0536c90f90d9769a09071779c7e6183907f6855645bffb6c"
+SRC_URI[md5sum] = "f036f78a7fca330d9f7d939fcf794bde"
+SRC_URI[sha256sum] = "8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310"
-- 
2.17.1



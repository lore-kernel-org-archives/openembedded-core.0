Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9B47CF88
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 12:47:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47W5hF3Mj0z44
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 13:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575809261;
	bh=g+uzYVMwfmZDUQMA32uNvjJ40GRhGzJ+gTdKG0/7iqs=;
	h=From:To:Subject:Date:From;
	b=FlL6depT4cvxedu3xIjpVPrPm3k0JWO0lJo1C67t4QAsdVJzEHhhHEl4J8DpiFMme
	MyrP8tcwQhBTfzrC6X/JH3SvShqO7lTckibn10E8MZ9sED5/lvJiPaGY0WAt47oEqB
	ZmpmP9RvYu1Uo9prIhxkVX5aFzMV4c8/xBoaE9ZqbzOd+6K//dhKmNS039g8FnPxYN
	T7w1hl2aWsvqKzZ5M9Bvyf3GFBtrsoKb7hcTihSP6wzRp8UEgS5kkMrVAdgb8fFvNL
	hQ1c8e7W8IwzLFoZK2VflC2MnY5hrCC/xzjqYl3FbdGYOZvk8pdcfmM+RRf3+07UFF
	DG1dh8EpB99yTzdA/RfB6bfEchjV/7cRd2aW0/0g9393WdJj4YM985n9bbvay2eucW
	0KKM/sPvjeNuFfcTZk3hHg9tJ3JUiAUhR3vdjhx/euKk67iyOGy00ICFrm0+fovRyH
	9J17lqaBb885oGckdrTbUzquGBcAcqblBPL3YxJwyoGXyzGQO/ickz8poipnmTPvNY
	OeTNPwTUBjYDBQInzSF3lSnUfICct46wyKdNDVN3kKjkJ5Snj1M0qODqb+R7dpJwT6
	nWMzs2PPezxE2iZiWZCGLWbJs80CWRMPEw2yD2W2cAZZ70J2SRLi/z5b4cGb9wWBii
	GmAAqFoQZoRbDr1LQSpFchCI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 14:47:40 +0200
Message-Id: <20191208124740.13379-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bash: Don't DEPEND on virtual/libc-locale
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
X-List-Received-Date: Sun, 08 Dec 2019 12:47:43 -0000

For ptest only RDEPENDS is needed, and packaging glibc-locale
slowed down builds with ptest disabled.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/bash/bash.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 039b8687a2..1ebb33bdcd 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -25,7 +25,6 @@ RDEPENDS_${PN} += "base-files"
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
 
-DEPENDS_append_libc-glibc = " virtual/libc-locale"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " \
 	glibc-gconv-big5hkscs \
 	glibc-gconv-iso8859-1 \
-- 
2.17.1



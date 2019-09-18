Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 965468FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:28:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46YT4N414Cz5c
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568831284;
	bh=HqFY2WXofi2ZtapstuN/sn+iS8JLwy+XLVSdOnIeG9o=;
	h=From:To:Subject:Date:From;
	b=QMpF97K2ZSFF2i6sETdLNSlsHUeLyZB15RrNpZoJDCM1Rt0lFlazK8DulfaC58DtO
	ETfDpze1vbLvG8Nuj9DZmTOdi67nb3Gpev0Y6+QPVQaxkOc5QcLWbEfW2Olqwkztqj
	GvBsq++9Smr08vwDl0EoChZ3RfB1dega9HxTzPejba5+M1vyAMcj4gcMy2KDcRhrlu
	V6u1FpcSa/F2EUfJdQXMMhwqIK9DI8fCQf91h/jC2U0UXwonNIBP4NNz8FAQVvbu/t
	0CpiF8J6MGnFXYPkCt5dyY/6jU6aZ49A3xeP+bYbL+40vzYLHlvvU0HWIh0tRlzQKz
	ZPfPYwHYFPUERDZIeOO6iNuBjxw3mMwjrRHfi4aDKL+lTNhZuyxYNSsKa5j5y57Mom
	mdM7SK8jkXB/5CcZUMbEvJCT2gckj3XHAm455522xJzcntRl3EpAmg6ETfbYZ478KS
	uSna71rMvfqxUY4KdrC/TtMSiNjdiV55Mu4osGR6t8+iDOGnk0rAXsbwNb0ZooLbbB
	wbXhtkLW/8WUxjtYMIOJbKmMqwypanSfoxpNoqJUBk8Os4U5o2UX5HoLocfXXo6DhW
	tEY1UDmL1Hsa7neeLAG+0LwnCmydVDZUIB2FCrxvVbkBPaDVepkTofKZMWN9B9oIuO
	UBbtF3LEjw9GN3YNf49CMA+o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 21:28:00 +0300
Message-Id: <20190918182803.29170-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lttng-modules: Upgrade 2.10.10 -> 2.10.11
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
X-List-Received-Date: Wed, 18 Sep 2019 18:28:05 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{lttng-modules_2.10.10.bb => lttng-modules_2.10.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.10.bb => lttng-modules_2.10.11.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
index dccc4b9842..789a3be850 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.11.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "07c0b1ea4c1dd9d3edba8dc980fd93dd"
-SRC_URI[sha256sum] = "e0d031005eef337c62de530a3b5b3e8fb1c732846eefcb23b8978edd2091f6e4"
+SRC_URI[md5sum] = "c618fb646514dfc1bf910cfd7cda4256"
+SRC_URI[sha256sum] = "7f91e39b2e8e46d8bbba2b4c8c1614f1fb380611cd1a1fccc1d1859be26112f1"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1



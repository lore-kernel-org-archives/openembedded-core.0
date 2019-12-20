Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 346957FE6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 04:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47fGXw1jZ5z6W
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 05:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576817472;
	bh=jHV7HZwg4JxPtj8Zt3NR7n7P5VYidnAijCttjh8lLJg=;
	h=From:To:Subject:Date:From;
	b=ohh0RNN0YYoN5uNuzwk7vcm2Em77gV/pkKmNqndMAUyFwwirhqKx95pGeHaRnouZB
	OT7XSDjOTNUXq8wBWu8hqRY/O2PVmOcq10VZVpqO/JnJrEpjNZa4wV8bpEGyEOIlRr
	yoFrVR6FDmfjzhSkQ0JWZUANBJCYuamM4odrVYGZ3WGeviP1Z5sPbmFW7qS9sbhtAb
	wwxw3v2094sA0F9FE+QBdFdCUdf/VGKujh0MZ7osjvOeTRvgaC9PrtHwWIFhBrTA8U
	6LgOcvnNTI5j9+8FvqxgJFkXSoyEUdUdSm66qTM6KpVdEW4Z3UFDbQJkPqK2YT1f5Z
	szIYpYpXEtDzOIOnWrZNz44s5IOrsIDaHi3GaI2OPljjDXCAx1+Gr2Gi8h/dACyYjq
	LAp2nfjJLjbTy+dgFca1/aJ4OIh+9QYsHT/Hdkl+5mp9saVXqSEsgN5Qvr6UxYFvwL
	yxN2uOj1W6USgrY7PfGjFQ8uP+vBCy5Q+NWl/3+msnVHnFDWR70VrVYLcLtpZg/Mkg
	m2sfs/4xKqVLgeL2y4ThBYtNwvFq2xW/o5jt7YlJ6meEbXYS4k37ngSGaR3QIh9jxE
	+hzqFVZBsTPOs5dn5J0wl2RQ2Mlz6cWxOygpD7Fxj+MPk+Dk5Zkdm8SBR81D22Im3f
	/fcQ5lGOIXPrEGZbgXPIkwas=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 06:51:11 +0200
Message-Id: <20191220045111.12387-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: Upgrade 3.7.5 -> 3.7.6
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
X-List-Received-Date: Fri, 20 Dec 2019 04:51:14 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../python/{python3_3.7.5.bb => python3_3.7.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.7.5.bb
rename to meta/recipes-devtools/python/python3_3.7.6.bb
index 57eaaea5e7..bd23da87d6 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -39,8 +39,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "08ed8030b1183107c48f2092e79a87e2"
-SRC_URI[sha256sum] = "e85a76ea9f3d6c485ec1780fca4e500725a4a7bbc63c78ebc44170de9b619d94"
+SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
+SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1



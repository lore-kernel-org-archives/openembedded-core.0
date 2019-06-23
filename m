Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 31FC37E52D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:28:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45X2X755nJz4X
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 21:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561318103;
	bh=pqe2IeRC39KNbXANtNb+zmvmtt9WJ2OmidrOIUEHGKc=;
	h=From:To:Subject:Date:From;
	b=kPLXbEhtpsCTRx9tF4hXCaxidyXr3GpNoXkjo33RO7AJJ1EtULzBov2K7ouB+aMKM
	fyu2JdrGmAz/tYkKoTuNtv5WBMOJ8dal1DDccOC5UfDjjkB2KEYsoqugTW4jzo9v0N
	HLQOi8iRjjuMiTRl4HJLOFepjEYn3HVnXjUJLoMuW+z8TldkXU/+H5j8Hw1y28ljf8
	guYx+gBqhZQjRVoov/vDrmMB2oya8dPlhZSJwsRfIC1iYazaDMROetAwnA6xH4gC0g
	B3E0zFQp+3HdAVJFiUTqh08t9qalYv0MPnUsfCw1eIzSbcP/qqYEPV48DHuEMBaaMP
	yJOeX5/BNJ1Pi0fk1dluN2dSs4GOb9XOI/EZ26lkBf+o118pprAYdorwmlWqSlG7m5
	xxbWPfKyE1Y6frxmOcB0OeyjOKZLHaj78701MYzdePhD0dR43ugMThcQmk7ySyiy0K
	8Mt3dcud9RYDfwYgOrKGGajveBo2gPCNdVmOdwL+3AXXhUdvciJolBzqFWRuP+GFYB
	Ps0FzuEgsas+tPU5FFKY0xeAE8b6/+cSfyDvygj6UA4buqk2AwzrsApvqQY5E+QP6F
	wdKQ9/iAyKPec9rzBinfn4ZX7++t4/Q6eWKJxA/q5QydG8/esmq+A65diqTXBmIOgR
	9fJwPoN3uaobwAIFH/KYqdyo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 22:28:22 +0300
Message-Id: <20190623192822.16387-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] valgrind: Remove dependency on libx11
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
X-List-Received-Date: Sun, 23 Jun 2019 19:28:23 -0000

It doesn't seem to be used.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 85f0ff7562..4e89c604d6 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
-X11DEPENDS = "virtual/libx11"
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)} \
+DEPENDS = " \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'boost', '', d)} \
         "
 
-- 
2.17.1



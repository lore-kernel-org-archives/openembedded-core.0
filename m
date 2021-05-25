Received: from mail.inango-systems.com (mail.inango-systems.com [178.238.230.57])
 by mx.groups.io with SMTP id smtpd.web10.8303.1621941848832286706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 04:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inango-systems.com header.s=45a440e0-d841-11e8-b985-5fcc721607e0 header.b=KSoDdLP3;
 spf=pass (domain: inango-systems.com, ip: 178.238.230.57, mailfrom: n.papenkov@inango-systems.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-systems.com (Postfix) with ESMTP id 0BFE51080B66;
	Tue, 25 May 2021 14:24:06 +0300 (IDT)
Received: from mail.inango-systems.com ([127.0.0.1])
	by localhost (mail.inango-systems.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id S_1lTLI6Lf5p; Tue, 25 May 2021 14:24:05 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-systems.com (Postfix) with ESMTP id 6D35F1080920;
	Tue, 25 May 2021 14:24:05 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-systems.com 6D35F1080920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1621941845;
	bh=5Sw9j362OWHk/4se2H4LEAWqSOmf5KtCaJB/N43hKZE=;
	h=From:To:Date:Message-Id;
	b=KSoDdLP3LthahPNFXGtsswnagkcSclKnR8t2YZkas6vuxZ8CrlUrkkPk/2i8M5XgX
	 tqglu5bZkLt23a/b1RkJkU6oFg0qMu5RAEfaXVQMsYyiY5fpwooRBlIXatia1YnpXy
	 UKdDNpjGQ88B2y1dIf0UrhZAy7/k7ApggNUTGw4AaF8ovbg+eQTPl7skYvSaZXPgpk
	 Pk5TfDjlOEByDIcdvT7LE9VPYOihw3cPcNtvp2UHGKoTsuRlYyd7gP7JFm+hH4OXmv
	 uNjOVYo1UOetH+d+G2scixbqEReeK9l6Pjz+fBT5nQZwpyl/wNqr5PNsNhu3Al7swI
	 qzI1N0EkVI3hw==
X-Virus-Scanned: amavisd-new at inango-systems.com
Received: from mail.inango-systems.com ([127.0.0.1])
	by localhost (mail.inango-systems.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9RoKgj6wsuWU; Tue, 25 May 2021 14:24:05 +0300 (IDT)
Received: from 6ad87882b0eb.inango.loc (unknown [93.109.15.169])
	by mail.inango-systems.com (Postfix) with ESMTPSA id E934710808D3;
	Tue, 25 May 2021 14:24:04 +0300 (IDT)
From: "Nikolay Papenkov" <n.papenkov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Nikolay Papenkov <n.papenkov@inango-systems.com>,
	Dmitry Kisil <d.kisil@inango-systems.com>
Subject: [OE-core][PATCH] flex: correct license information
Date: Tue, 25 May 2021 11:23:26 +0000
Message-Id: <20210525112326.1193-1-n.papenkov@inango-systems.com>
X-Mailer: git-send-email 2.17.1

License-Update: Corrected license information

flex package is under two licenses:
- "BSD-3-Clause" is provided in top-level COPYING file; the license
  actually include third obligation (without the actual "3" numbering)
- "LGPL-2.0+" is explained by src/gettext.h

Signed-off-by: Dmitry Kisil <d.kisil@inango-systems.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1d43d2228a..54e7e01729 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
-LICENSE = "BSD-2-Clause"
+LICENSE = "BSD-3-Clause & LGPL-2.0+"
+LICENSE_${PN}-libfl = "BSD-3-Clause"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067 \
+                    file://src/gettext.h;beginline=1;endline=17;md5=9c05dda2f58d89b850c399cf22e1a00c"
 
 SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
-- 
2.17.1


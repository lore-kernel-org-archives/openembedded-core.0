Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.42805.1629221969314955906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 10:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B4C5640C53
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 17:39:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzADfSk7n0Ru
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Aug 2021 17:39:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A715F40BA8
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 17:39:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 58230174664;
	Tue, 17 Aug 2021 13:39:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] grep: upgrade 3.6 -> 3.7
Date: Tue, 17 Aug 2021 13:39:27 -0400
Message-Id: <1629221967-12203-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

GNU grep 3.7 has been released with a fix for a bug causing
"extreme performance degradation" in certain types of search.

https://www.theregister.com/2021/08/16/gnu_grep_37/

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/grep/{grep_3.6.bb => grep_3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.6.bb => grep_3.7.bb} (93%)

diff --git a/meta/recipes-extended/grep/grep_3.6.bb b/meta/recipes-extended/grep/grep_3.7.bb
similarity index 93%
rename from meta/recipes-extended/grep/grep_3.6.bb
rename to meta/recipes-extended/grep/grep_3.7.bb
index 750575e..b0b89de 100644
--- a/meta/recipes-extended/grep/grep_3.6.bb
+++ b/meta/recipes-extended/grep/grep_3.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e"
+SRC_URI[sha256sum] = "5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.7.4


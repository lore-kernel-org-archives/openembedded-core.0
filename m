Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXk-00066g-16
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:20 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507855lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fNqxwmXqMf6IY1MZ5qML5gJkGwPHzEZJY1QbzOd1hEo=;
	b=vZb/ZGTYT4RdnuzFclnhT/mL2OQs08qL0yEPKgMHa3hC/P2K3ej7JuTmZuOj3rhRpJ
	2jciZsVVhy8ZeqnGdJRIcIpV0pIqcWI5jaAwO8RoMX6TZ2UcEX9wprVkEacaXBc+aW09
	/XJg20SwfjcziIx0wHrQ31GH3QuO35GG0e4ilYsZweCJ9Ns788UCqIsmnQ0FQjlU4bZ3
	K/JbuoCU+Fs6JXoysxDev1PZBCtgHPeI1M39pSXOKkEKPFNL7pz1Gxfqiy75rgljqo8O
	AePbEmHBB4u6rq2BLxurTAGJd2+G8iXpHVHy/b379uZZwQ6cANJZ5VwkbTfU5TOiGD84
	cljA==
Received: by 10.152.128.9 with SMTP id nk9mr1600556lab.17.1354288562931;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id sq2sm2107381lab.14.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-0002yk-GC; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:41 +0200
Message-Id: <1354288544-10778-8-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-7-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-6-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-7-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 07/10] coreutils: fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index ffdd2af..1b25320 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
+                    file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
 PR = "r3"
 DEPENDS = "coreutils-native-${PV}"
 DEPENDS_class-native = "gettext-native"
-- 
1.7.10.4




Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjbWp-0004jt-Rr
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 21:06:47 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1831970bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iPikHotw8Su0/Gm1votT1cIe947hKQxDO010GSvpo6E=;
	b=ah7ksGF+EllqN5FGMCWnwPmctOrT+kKh3Ek1+aS5Z3LClFzcUkcRzc7Zj1yg/MiIL5
	xvUKlld+lzP5Kylt47T6+LAPPzK/6+0yXicQwXJjlraV7LbptaS7vybhqSRoS3fQ0C3e
	j+F6EPObFWaCy8reaeLZZ3K+WCKB4s7DOdfl81qyO+vYX1tLOEi2I0xR7fZLudqdPF1u
	HpY1FqlxlzdY2LBtBjo58/Rd7a5Y9pUE85UKayjVIXgfh1Jkrfns7Q+r07s1ijLg366i
	HiND41ADM8/ESPzTsyB7prK6s1T7g0huKcEFX4QWd3n6+aZDkqnbyIZKrrv0GswAzHMu
	o7bg==
Received: by 10.204.153.15 with SMTP id i15mr3339341bkw.64.1355514723187;
	Fri, 14 Dec 2012 11:52:03 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id o7sm5540023bkv.13.2012.12.14.11.52.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 11:52:02 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjbId-0004Md-W4; Fri, 14 Dec 2012 21:52:00 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 21:51:59 +0200
Message-Id: <1355514719-14798-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] coreutils: fix license segment md5sum boundary
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
X-List-Received-Date: Fri, 14 Dec 2012 20:06:48 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated
from the beginning of the file, not beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 3f58cfd..04c9eb2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
+                    file://src/ls.c;beginline=5;endline=16;md5=2e9acd8818fe6db4c2981d20ca632553"
 PR = "r5"
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
-- 
1.7.10.4




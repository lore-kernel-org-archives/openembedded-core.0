Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.8121.1599831166431898788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 06:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: stacy.gaikovaia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08BDWOFu011916
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 06:32:35 -0700
Received: from yow-sgaikova-lx.wrs.com (128.224.141.57) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Sep 2020 06:32:14 -0700
From: Stacy.Gaikovaia@windriver.com
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] bison: uprev from 3.7.1 to 3.7.2
Date: Fri, 11 Sep 2020 09:32:13 -0400
Message-ID: <20200911133213.2647567-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

a0bc06b7 (tag: v3.7.2) version 3.7.2
5e33dfe5 build: disable syntax-check warning
2a4e9a35 gnulib: update
f7b642cf build: fix incorrect dependencies
3da17724 doc: updates
68e3e442 gnulib: update
e432619d tests: beware of sed portability issues
a1b7fef0 c: always use YYMALLOC/YYFREE
067e35a8 build: beware of POSIX mode
0522047c doc: history of api.prefix
3724b50e CI: intel moved the script for ICC
b801b7b6 fix: unterminated \-escape
b7aab2db fix: crash when redefining the EOF token
89e42ffb style: fix missing space before paren
6aae4a73 style: fix comments and more debug trace
7d4a4300 style: more uses of const
31d4ec28 bench: fix support for pure parser
0a5bfb4f portability: multiple typedefs
12d0b156 style: revert "avoid warnings with GCC 4.6"
cb7dcb01 maint: post-release administrivia

CVE: CVE-2020-24980 fixed by b801b7b6
CVE: CVE-2020-24979 fixed by b7aab2db

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 meta/recipes-devtools/bison/{bison_3.7.1.bb => bison_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.1.bb => bison_3.7.2.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.1.bb b/meta/recipes-devtools/bison/bison_3.7.2.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.7.1.bb
rename to meta/recipes-devtools/bison/bison_3.7.2.bb
index a765a2380d..f7bf70fff3 100644
--- a/meta/recipes-devtools/bison/bison_3.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69"
+SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.25.1


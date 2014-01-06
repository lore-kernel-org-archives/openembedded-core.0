Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 475D06B7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:23:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s062N4wQ013005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2014 18:23:04 -0800 (PST)
Received: from d9010-u1204.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 5 Jan 2014 18:23:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 10:23:09 +0800
Message-ID: <1388974989-4126-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] guile: fix the depends for target recipes
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
X-List-Received-Date: Mon, 06 Jan 2014 02:23:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The depenency on guild-native and libatomics-ops is missing
in multilib build, fix the depends with class-target.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 4c3fe28..9845682 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -33,7 +33,7 @@ BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi"
 # add guile-native only to the target recipe's DEPENDS
-DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) != 'guile']}"
+DEPENDS_append_class-target = " guile-native libatomics-ops"
 
 RDEPENDS_${PN}_append_libc-glibc_class-target = "glibc-gconv-iso8859-1"
 
-- 
1.7.9.5



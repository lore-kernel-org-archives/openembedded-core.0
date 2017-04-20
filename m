Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80D5C71AD6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 06:39:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3K6dUep017299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:39:31 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Apr 2017 23:39:30 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Apr 2017 14:38:55 +0800
Message-ID: <1492670335-245540-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bash: CVE-2016-0634
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
X-List-Received-Date: Thu, 20 Apr 2017 06:39:30 -0000
Content-Type: text/plain

A vulnerability was found in a way bash expands the $HOSTNAME.
Injecting the hostname with malicious code would cause it to run
each time bash expanded \h in the prompt string.

Porting patch from <https://ftp.gnu.org/gnu/bash/bash-4.3-patches/
bash43-047> to solve CVE-2016-0634

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-extended/bash/bash_4.3.30.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index e398e87..b40059f 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-044;apply=yes;striplevel=0;name=patch044 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-045;apply=yes;striplevel=0;name=patch045 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-046;apply=yes;striplevel=0;name=patch046 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-047;apply=yes;striplevel=0;name=patch047 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -68,5 +69,7 @@ SRC_URI[patch045.md5sum] = "4473244ca5abfd4b018ea26dc73e7412"
 SRC_URI[patch045.sha256sum] = "ba6ec3978e9eaa1eb3fabdaf3cc6fdf8c4606ac1c599faaeb4e2d69864150023"
 SRC_URI[patch046.md5sum] = "7e5fb09991c077076b86e0e057798913"
 SRC_URI[patch046.sha256sum] = "b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
+SRC_URI[patch047.md5sum] = "8483153bad1a6f52cadc3bd9a8df7835"
+SRC_URI[patch047.sha256sum] = "c69248de7e78ba6b92f118fe1ef47bc86479d5040fe0b1f908ace1c9e3c67c4a"
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.9.1



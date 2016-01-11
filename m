Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2E7373D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:11:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B5BcG6009678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:11:38 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 21:11:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 21:11:36 -0800
Message-ID: <4f5f10ebe2593fb40fbb637978480d87d9697f40.1452489034.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452489034.git.liezhi.yang@windriver.com>
References: <cover.1452489034.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc-initial.inc: use relative path to run configure
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
X-List-Received-Date: Mon, 11 Jan 2016 05:11:39 -0000
Content-Type: text/plain

Avoid potential build path in output files.

[YOCTO #8894]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc-initial.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 8e81f09..cb2f8dd 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 do_configure () {
 	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
 	find ${S} -name "configure" | xargs touch
-	${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
+	../git/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
 		--prefix=/usr \
 		--without-cvs --disable-sanity-checks \
 		--with-headers=${STAGING_DIR_TARGET}${includedir} \
-- 
1.7.9.5



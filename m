Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2532677016
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:17:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DH206020871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:17:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:17:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:59 -0700
Message-ID: <4e2d74713a6e54751e2d46fce49a294be4e785bc.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] glibc-initial.inc: use relative path to run configure
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:02 -0000
Content-Type: text/plain

Avoid potential build path in output files.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc-initial.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 3500848..a09e8a9 100644
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



Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE81D612E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3I2vAfh010771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Apr 2016 19:57:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Apr 2016 19:57:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Apr 2016 19:57:07 -0700
Message-ID: <ecd13789dd643443c04e6b174e33b82324d4cc8f.1460947932.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460947932.git.liezhi.yang@windriver.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] buildtools-tarball.bb: fix unexpected operator
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
X-List-Received-Date: Mon, 18 Apr 2016 02:57:10 -0000
Content-Type: text/plain

Fixed:
run.create_sdk_files.45747: 131: [: =: unexpected operator

The SDKMACHINE is not set by default.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 7186ac4..d39bd9a 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -58,7 +58,7 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 
-	if [ ${SDKMACHINE} = "i686" ]; then
+	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
 		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
 		echo '[ $? != 0 ] && export BB_ENV_EXTRAWHITE="NO32LIBS $BB_ENV_EXTRAWHITE"' >>$script
-- 
2.8.0



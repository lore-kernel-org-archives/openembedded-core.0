Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQzTV-0003T6-Fw
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 13:50:17 +0200
Received: by mail-wg0-f41.google.com with SMTP id ds1so2641103wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=czmiR4sIF5mCopylxrRLZUiAUQXGPFcEglHbU0y9uAI=;
	b=q3gYks8ojY9TEdETgcLGPYrOjqt0uMxV9aIZZvVTGIWq0wJq2nszbvSBxUnxur9x/5
	cxaowGNggLEeMqX0LZ2y37D91/vB/PwB+Rf1oRMku1Sv5LFUza2rBePvHy58i0rJZbCU
	kJYHxybPKb9hTO7r0+0ncaqPobL7Jn0GgGA0gzn8GkD6IkHb9jB+tyKRkhRqRcnZQv8M
	4olqlgh0056dI4TWEqoOrCJdjsEArCUxHi6B3G2fS4UM8uyYp5at+kbbHCGnfC9aqJVx
	7GiNvZFAGUiTBKBep0zwJLa2X2kU96WbB9doDFIQWFtBe2LfVcVmtT0sF95C+DkKudEn
	OL7A==
Received: by 10.180.75.161 with SMTP id d1mr5213008wiw.19.1351078610432;
	Wed, 24 Oct 2012 04:36:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eq2sm4465630wib.1.2012.10.24.04.36.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 04:36:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 13:37:05 +0200
Message-Id: <1351078625-24627-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH] opkg-utils: bump SRCREV to latest
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
X-List-Received-Date: Wed, 24 Oct 2012 11:50:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 92e6624..1dd500e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
-SRCREV = "49cc783d8e0415059d126ae22c892988717ffda7"
+SRCREV = "f1a9d6701993a6f6b1930b4c2bdb71525aa25320"
 PV = "0.1.8+git${SRCPV}"
-PR = "r0"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
            "
-- 
1.7.12.4




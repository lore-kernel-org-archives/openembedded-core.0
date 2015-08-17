Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id EDCA5759CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:50:34 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so98011311pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QYLxjk5/VULv4XYXL9NieICVX3vnUH54UTTr19lwzq0=;
	b=S2e0Sj+lrTRxyr4LRjEnAt6OOxPP7l9v79RqI5v0WpOYc43cmlNFChIuhlNFXor4Oy
	982F1dssE7WXwjuwVxsiWvFvJ0fv4EZfymKOKZjmmRqAoYUqRp3bJ7/yByrJAt9OMI2p
	72++26bX7woFh5wOaTVYtdNhq5IPTDf5TEBP1YLlOknEMbs/75b1bWgmNcssfZXX9WJt
	pKROVbYmp+pG0e0H2ZoEEH33O314o6a3JD74H0Lst3DFU+0dKkxFQP/b792K/uQ3MJYE
	Im54Bg3HoZg9DmmvYeBfs0NuEROJpzEw9uHJyxRmJWW4GkgU9s0BlvXCHEC++BTLTTkZ
	Dg6g==
X-Received: by 10.66.220.37 with SMTP id pt5mr72708508pac.62.1439779834995;
	Sun, 16 Aug 2015 19:50:34 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q7sm12732589pdj.31.2015.08.16.19.50.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 19:50:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 19:50:27 -0700
Message-Id: <1439779827-15189-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
References: <1439779827-15189-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] lz4: update to 131
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
X-List-Received-Date: Mon, 17 Aug 2015 02:50:37 -0000

Clean up SRC_URI and convert to use github mirror variable.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 0b0c632..39edeab 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -4,11 +4,11 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
 
-SRCREV = "5780864c0ce08622238a267c46fb489d7066cad4"
+SRCREV = "d86dc916771c126afb797637dda9f6421c0cb998"
 
-PV = "128+git${SRCPV}"
+PV = "131+git${SRCPV}"
 
-SRC_URI = "git://github.com/Cyan4973/lz4.git;protocol=http"
+SRC_URI = "${GITHUB_MIRROR}/Cyan4973/lz4.git"
 
 S = "${WORKDIR}/git"
 
-- 
2.3.5



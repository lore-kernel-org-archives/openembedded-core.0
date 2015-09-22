Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 37E0F73CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 01:13:58 +0000 (UTC)
Received: by igxx6 with SMTP id x6so1267874igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 18:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZB9pTxJ/mS1+v6Ju9Ak9xEzg11ILboxaPV/oKyTnK40=;
	b=GoWawLBp/vD5winFNUs6s/gsJT9NINe7hrcu8YaXx9KmoHA/i2BaElZuKvaEcjYJpZ
	xj6n9fv7zTGwgReqLnkOi74JLGRH41A7HNMRtKRqS1WFIDr0PwOCQrnQfJaX+yCXY6U+
	2YOLCcxM8yLMBZL+wXUejmqvM8+Z1GrwMIrZ5uRfiDyD/70PX0FFVlR3C7H7IWzCyM9W
	HIGgxm4iJ9T5iMu3fI8rPtDA5bCwSWws3/bK0SZznnLQcE6ogPUNlf68q9hA9SKCCDdd
	PePYK8jf6L5U36UzUndtlU/3uM06BZ1tYklQNWTylY7bxGxluelB/GN/gTgm1nRVXZiB
	agog==
X-Received: by 10.50.122.68 with SMTP id lq4mr9405074igb.87.1442884438601;
	Mon, 21 Sep 2015 18:13:58 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	p142sm323413iop.4.2015.09.21.18.13.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Sep 2015 18:13:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 21:13:12 -0400
Message-Id: <1442884392-15185-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.5.0.234.gefc8a62
Subject: [PATCH] libksba: fix pkgconfig patch
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
X-List-Received-Date: Tue, 22 Sep 2015 01:13:59 -0000

Add '$' to fix a patch which adds pkgconfig support to libksba.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index b5886c5..d28dfd9 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -51,7 +51,7 @@ Index: libksba-1.3.0/ksba.pc.in
 +Requires:
 +Version: @VERSION@
 +Libs: -L${libdir} -lksba
-+Libs.private: -L{libdir} -lgpg-error
++Libs.private: -L${libdir} -lgpg-error
 +Cflags: -I${includedir}
 +
 Index: libksba-1.3.0/src/ksba.m4
-- 
2.5.0.234.gefc8a62



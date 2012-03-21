Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATMM-0002tN-6m
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:22 +0100
Received: by mail-wi0-f177.google.com with SMTP id hj13so1837592wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=e5sKd+vF1Aq0Xl4fwYZrk5/66cuzVOMjBOCai7t0LOE=;
	b=UUfa5pYtPbVbvoQDq238nA0OyWOE7X/ClMS6BLcS/0elI0p9eB5fM241RAswL8JImx
	YSZAVvuME4Ap20Rn/S2QbiJSBXZe5KicrpeLDrAGR4OZK+UBotjwl+UeJTtKrXDbcG2X
	LNoUU5+L7ZgGCeJPCY2K2C0DVrGLn0PwET9F+c4gqYComa4gtz1v2QUsLUfsVIOWa8hn
	oo+Riyf7MlwYPPUq0uRxbUatjK60KTzDa1ZsK8h135CP0Q7hskyI26labMAKAJ7aGWl+
	O3mgPsZIgAZz6rrtSVpb9bY5e/74AW2XbIPUrlKRgkclRkVQ2WQ62DMtHWAOnral4akU
	X6SQ==
Received: by 10.180.19.37 with SMTP id b5mr12540111wie.9.1332365850412;
	Wed, 21 Mar 2012 14:37:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm12380331wib.9.2012.03.21.14.37.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:15 +0100
Message-Id: <4dd9f8a25fc156542e61383975d816845263e86c.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/13] tiff: import native support from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 21:46:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
index 6fb4163..80677fc 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
@@ -3,6 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
+BBCLASSEXTEND = "native"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
-- 
1.7.8.5




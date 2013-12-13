Return-Path: <kergoth@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8104A610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:50:21 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so782714eek.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=P9Xw8EZDNvL/lQFRARdTT6PJrQ+GH14K7coipwV3QRo=;
	b=PWIdZwgR/Q8jPhYGbTpFQqsZlDisa6y4GkqxfU+Thvi2pqCeiidL8JgRvCKuOR55zi
	cdEgP1L7WLa6VN9TZqXPlpRwofELik6vXIfHgNB1NsiQTkrDZJcZhAV4skzoK1zUrb+T
	0jMUBD+Ml7KJyngPR2A2wKtnB0bE9GNLSWH9mCt3hz+YYWdUycbNE3F1pHeWZyeCK+tB
	7zY8I24bZcawvAICJdUYDROLb3wHxGpdwOFuncTpzFjdn69M93xeZuv9IzztfaQa+3iK
	EXh9sCnNAK93oU9GRWYLMbRzUUrazyKlRoQWGRnB87jhaLAE01lF4hbXtXO0hP2b1l9z
	laOQ==
X-Received: by 10.14.225.2 with SMTP id y2mr3406293eep.62.1386946220758;
	Fri, 13 Dec 2013 06:50:20 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id o47sm7527284eem.21.2013.12.13.06.50.19
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:50:20 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:50:09 -0700
Message-Id: <09612f896d57e0f02f7fcc60f2b7caf691056135.1386946076.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] xz: make the LICENSE info more accurate
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
X-List-Received-Date: Fri, 13 Dec 2013 14:50:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-extended/xz/xz_5.1.3alpha.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
index b49fbf7..9e2c933 100644
--- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -2,7 +2,22 @@ DESCRIPTION = "utils for managing LZMA compressed files"
 HOMEPAGE = "http://tukaani.org/xz/"
 SECTION = "base"
 
-LICENSE = "GPLv2+ & LGPLv2.1+"
+# The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
+# which is GPLv3 is an m4 macro which isn't shipped in any of our packages,
+# and the LGPL bits are under lib/, which appears to be used for libgnu, which
+# appears to be used for DOS builds. So we're left with GPLv2+ and PD.
+LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_${PN}-dev = "GPLv2+"
+LICENSE_${PN}-staticdev = "GPLv2+"
+LICENSE_${PN}-doc = "GPLv2+"
+LICENSE_${PN}-dbg = "GPLv2+"
+LICENSE_${PN}-locale = "GPLv2+"
+LICENSE_liblzma = "PD"
+LICENSE_liblzma-dev = "PD"
+LICENSE_liblzma-staticdev = "PD"
+LICENSE_liblzma-dbg = "PD"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-- 
1.8.3.4



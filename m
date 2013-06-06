Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC526A87E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 03:51:56 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z11so2761219pdj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+b+lV8R7QtkqDxuuQNV8EiEBM9lpNjhIVRa4gFDuI+A=;
	b=QJDAkQ3UdDxNA4PDjwyZZ0yhIHjKDFRxyZAXEvWChNUry9woVurqGahjL5LKHIvoc2
	JW70f4UciXLjVVpBKEd3giCEt7ZyrbQa/ycZeOAro3d/Y63CZOv5/0g0av+U8XcWWBKA
	ACZg6YE0lfkhPb3SMsFTbLSGQDGgY+cz0tIajNtzazuSv2I+OF5pWdNLdeupEBa5jiLn
	krZB0pSPpEvrZHm2hXG42G3SIqGa/ECVP/vY366ZR4qck8ZCeh2Dvpu0BKdAjlkYuArU
	cYf8HaoVA59oXWbCWPk5uK6GRR3BH3JqIiKY4dNjJj7OTka6OYcIYI3+SS3R2rgT6Knq
	3R0w==
X-Received: by 10.66.219.102 with SMTP id pn6mr8577318pac.123.1370490717182;
	Wed, 05 Jun 2013 20:51:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	rn7sm70832997pbc.12.2013.06.05.20.51.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 20:51:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2013 14:05:40 +1000
Message-Id: <1370491540-21915-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] classes/qmake_base: allow parallel make
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
X-List-Received-Date: Thu, 06 Jun 2013 03:51:56 -0000

Remove MAKEFLAGS= from EXTRA_OEMAKE to allow parallel make.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 52e7fb0..3762887 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -4,7 +4,7 @@ OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
 QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
 
 # We override this completely to eliminate the -e normally passed in
-EXTRA_OEMAKE = ' MAKEFLAGS= '
+EXTRA_OEMAKE = ""
 
 export OE_QMAKE_CC="${CC}"
 export OE_QMAKE_CFLAGS="${CFLAGS}"
-- 
1.8.2.3



Return-Path: <diego.sueiro@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id D2B9E6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:58:11 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id b6so241860yha.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 04:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Wu1R3xWhyws3GYoizIeCjELgvviHP3iAJhNcH9lfJnA=;
	b=KBPmo1Qu8pXz9fqsTVLgWGSlfCws6uEPzTgXFbrou007kl4cgWnMutMN9AmalL6guO
	T62mrjUcWafGKhcUyMT7ho4A0rtpR5QTnx/UcBP2FcBxEE59bj29gOnIkjel/BKyAFAx
	ZbbXROtZneFr0P5JRG/HoyMM4sxSvDiGMft7zdyivoPKXtkkuD4h2nXEBF3LGKU9Oo82
	I572lFy0kYOa9Ut0EAY7wDZLzJywMo2aYAsKnHH1/2ox3x6WIGnWYT3aC9Wdpmm/rnA3
	6jcVOn26OqFaDi4+erRaIt6qwGmwWNfLQoUEWI9fPgeNbJPzU0JbIaQUL5EnErg14n5b
	10rg==
X-Received: by 10.236.150.164 with SMTP id z24mr7159255yhj.75.1393419491932;
	Wed, 26 Feb 2014 04:58:11 -0800 (PST)
Received: from localhost.localdomain ([201.82.73.213])
	by mx.google.com with ESMTPSA id k76sm2416207yho.18.2014.02.26.04.58.10
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 04:58:11 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 09:57:47 -0300
Message-Id: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 12:58:14 -0000

libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
and meta-toolchain-qte respectively.
Whitout this static library, compiling qt apps which needs uitools will fail.

qt4[-embedded]-staticdev is the package that contains this library and is the
only file in it.

Since a static library is shipped, special attention regarding the lincese
should be taken.

Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
---
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index fc1ccba..b040182 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
         libqt${QTLIBPREFIX}xmlpatterns4-dev \
         libsqlite3-dev \
         expat-dev \
+        qt4${QTLIBPREFIX}-staticdev \
         "
-- 
1.7.10.4



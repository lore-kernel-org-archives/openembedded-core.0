Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDA860897
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 13:01:15 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id q10so552351pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=G0d39MUejAndEFEhwZD59Ak6LdfUR7MBOZ/tixkRsNw=;
	b=I+/LmLY1PNdNNm38yy8iAWDjmGmNHs6+PlIS3tLRYocJlH1GyYGZdviyXquSo06VeF
	RJZo3CG9udvCUyBamVYptWRDnnL4KO51T/hhAn73aF5UADlrlI4vZjB28mq+sRe9AKH8
	L0S1cfTWywekxbO8DOo5qBUhq+VKu4snYouuSZjeWUw1gBZ/eeACsKXMRnLJ2Yo8nWpO
	cLHufZv3S+rpFvsz2lhHUnDh4a60GXc4j+l7GXgx9qWdkk3wJnofWXSMosCN+iChqcRc
	LBNxLrz5xAoes0EeTSni5HdbRXqkIoEMxvRdWBoA65FUk1EwDFObXJsGcgF79RNJirIO
	4aJw==
X-Received: by 10.68.219.130 with SMTP id po2mr2492209pbc.68.1371214876633;
	Fri, 14 Jun 2013 06:01:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id tq8sm2231390pbc.30.2013.06.14.06.01.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 06:01:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 23:15:37 +1000
Message-Id: <1371215737-22887-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] qt4: set QMAKE_COMPILER to gcc in mkspec
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
X-List-Received-Date: Fri, 14 Jun 2013 13:01:15 -0000

This avoids the following warning when running qmake:
Project WARNING: qmake spec does not announce the compiler family.
Guessed gcc.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4/g++.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
index d34c62c..8755031 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
@@ -2,6 +2,8 @@
 # qmake configuration for common gcc
 #
 
+QMAKE_COMPILER = gcc
+
 QMAKE_CC       = $(OE_QMAKE_CC)
 QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
 QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-- 
1.8.3



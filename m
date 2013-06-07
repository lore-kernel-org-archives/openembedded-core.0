Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id CD9A06A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:10 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so4149014pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uMInWnN7mtWFJUP1medZVLX6mVZx5xQ1jB3PMfy0e1E=;
	b=nD1qBNIs0i2uAUFW/bkvmS2d52E0pdUO7ieYYMF/LqgkUm2a20uu28FWo/2JVax8cJ
	5bj8HrkL1yrW0oAchPGmJLoCp7uzsCG/82Zp7nleyX/FGJ5qfcf1nZHCw7LJkguhXy4x
	wisPvG6qTFK5txlIieyMp40GIf0YyDfx/kXNZAIEvSs8+SWlQlewfoEVDCUtgg1SUZ86
	UUX4gnauKzDvdr3uvwo6uhSa4Lux/Nu7Iw3ufLCbYJHSwoqB9OblJ1Mo1d7nrN+MfVdW
	E/WFf2G5FV/CgFHF4tJo4G8jHwmgWxsHy2ijCKNC9LePxADLNvCS2/Nzd65YYMqjVuua
	g9QA==
X-Received: by 10.66.149.5 with SMTP id tw5mr1120920pab.87.1370583191627;
	Thu, 06 Jun 2013 22:33:11 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id p2sm1381942pag.22.2013.06.06.22.33.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:48 +1000
Message-Id: <1370584012-28002-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370584012-28002-1-git-send-email-net147@gmail.com>
References: <1370584012-28002-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/5] nativesdk-qt4-tools.inc: update HOMEPAGE
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
X-List-Received-Date: Fri, 07 Jun 2013 05:33:11 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index cfc6fd8..3a825d8 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
 DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
 SECTION = "libs"
-HOMEPAGE = "http://qt.nokia.com"
+HOMEPAGE = "http://qt-project.org/"
 LICENSE = "LGPLv2.1 | GPLv3"
 
 INC_PR = "r13"
-- 
1.8.2.3



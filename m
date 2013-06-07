Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 370706A88D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:33:11 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 10so4337783pdi.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ooyxdqz6pFOLbK8sIHTNlQuxTRx69d9EQS+zl3QsIs8=;
	b=Vnl/eh3O1LGCy7mkmuKGAGqbxAH7Eu5N0se1vMZq+QMD84BNd5E8fEI6rj78VxcwGt
	3+lf96wAMl7mZj48bgaK2DA5eru7xgQKpL5NDjtLMmP5YIDwbJbJl06U0rkh3QvMRbdA
	RKFpMzFBr7MOjahfECdYSso0ssYWIPpFW0DHY63Q4wccMgiVsyMTQNDMZWuP2vWke3zU
	t0tXCZElEMlEoRyQgS3vqmghR0ibrySwCMJQUa1Xu+nYigwiA03M9LsWEDuA8dt192Df
	ftQAU1kIirkt5STq1Y3BvFzZ6fy3ULgJwlj8ctdQ78LJjHXaSE4SasauyXcAuq34pb2r
	47eA==
X-Received: by 10.66.163.38 with SMTP id yf6mr1138861pab.45.1370583192585;
	Thu, 06 Jun 2013 22:33:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id vz8sm1391880pac.20.2013.06.06.22.33.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:33:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:46:51 +1000
Message-Id: <1370584012-28002-5-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370584012-28002-1-git-send-email-net147@gmail.com>
References: <1370584012-28002-1-git-send-email-net147@gmail.com>
Subject: [PATCH 4/5] qt4-native: update HOMEPAGE
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
 meta/recipes-qt/qt4/qt4-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 895d690..a153a37 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Native version of Qt/[X11|Mac|Embedded]"
 DEPENDS = "zlib-native dbus-native"
 SECTION = "libs"
-HOMEPAGE = "http://qt.nokia.com"
+HOMEPAGE = "http://qt-project.org/"
 PROVIDES = "qt4-tools-native"
 
 LICENSE = "LGPLv2.1 | GPLv3"
-- 
1.8.2.3



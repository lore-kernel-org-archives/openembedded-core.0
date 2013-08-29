Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 84DE16BEEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:03 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so347839ead.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LC6rmnyMfygvr0XSnRjYEeLp2QuBpCizGMFi7wSZ2DU=;
	b=O191VAdygCM+jUer5yB5xpBz4u4NwJr1lfXRxXQ1NtjzLCvgz3v2mO5NRdI3SP5qLR
	UxOGAqYq1Ft8AOTJCRhzKBaAt4yi+926DYXW5sekGWeS+vb6NeRH7h7nIvmCDwMo6W1B
	bR9yi2+pYUNu4JvtOxfc/66V3nH7hm/B83P+kpreOMJHO16OPbP2wiliXoh1laCiNdH/
	k2iuwAZU7VC8f0K0QgsbihQmzbShXqBy6zh9QJybRAm8ovzWZyNkq4kTyTHvaE5sqQI4
	P9Nq20D9N3pVWz+/D5NmbPeiCheTUnfjyj8uR8zWek1i9v2RJiag8jhUrEcrOV/FX1D0
	N2kQ==
X-Received: by 10.14.181.132 with SMTP id l4mr3884285eem.77.1377792123970;
	Thu, 29 Aug 2013 09:02:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47234390eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:54 +0200
Message-Id: <538689c89c7c1e36740a6ebd93828d3e34c6ec09.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 07/20] matchbox-wm: Add dependency on libxfixes and libxcursor
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 09e8b7c..b009c4b 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -1,7 +1,7 @@
 SECTION = "x11/wm"
 DESCRIPTION = "Matchbox window manager"
 LICENSE = "GPLv2.0+"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage libxrender startup-notification expat"
+DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxcursor xdamage libxrender startup-notification expat"
 PR = "r5"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-window-manager/${PV}/matchbox-window-manager-${PV}.tar.bz2 \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 015fbc0..e2961b0 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
                     file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
 
 SECTION = "x11/wm"
-DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf"
+DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
 SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
-- 
1.8.3.2



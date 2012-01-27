Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUY-0005Xi-DH
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:38 +0100
Received: by yenr5 with SMTP id r5so841853yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=j5YEWH7NaJEItYyKLCL17KhlCI4Bzube5JFDQ38e1Q8=;
	b=XSPMNXceRXswtR1HqOJ2DxJ88m29bUAhXYWzdUWC6veI8yAay0GhWNsZSlst0B05Ia
	qEPUhg42+QO9a6BKrPU6YNN0E/D+0Opoi1KSri62B+dq2B5wlh3KzIxN3i134s7ATWIX
	WFTCGeB314i2UIRF1L3W4P9pLpHDd9kFfNlC0=
Received: by 10.236.128.140 with SMTP id f12mr11699635yhi.69.1327684429030;
	Fri, 27 Jan 2012 09:13:49 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:48 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:39 -0600
Message-Id: <1200dada43c3e68e8a216994129eb516160ff82c.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 01/10] libc-package: fix typo in LOCALETREESRC default value
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/libc-package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 8cd5fec..440218f 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -80,7 +80,7 @@ rm -rf ${TMP_LOCALE}
 
 
 TMP_LOCALE="/tmp/locale${libdir}/locale"
-LOCALETREESRC ?= "{PKGD}"
+LOCALETREESRC ?= "${PKGD}"
 
 do_prep_locale_tree() {
 	treedir=${WORKDIR}/locale-tree
-- 
1.7.8.rc4




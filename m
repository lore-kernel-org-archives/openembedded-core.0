Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVJHE-0006xM-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:42:56 +0100
Received: by eaad13 with SMTP id d13so2778896eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KQcxlxBWkocRdKSmvIGoS98o7Q4mcP/OXoDerpLmOUA=;
	b=ShOubVeuVFZM3HMBSs/JJPRWgTtdw43HXbpF6T4gR3Dpb8Q67NUbI2gc6GSqYaadzZ
	7E6xjQdBLxaZD+pUwJYeoONxTypAJTgHe6V+z/U9GCYCasOd7vmFLuy0jjfhsmUEzCmJ
	QwamGRf/fDOYattibawq5mSzv0695cQekfbSc=
Received: by 10.213.9.68 with SMTP id k4mr3060169ebk.8.1322555777524;
	Tue, 29 Nov 2011 00:36:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 49sm102950600eec.1.2011.11.29.00.36.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 00:36:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 09:36:08 +0100
Message-Id: <1322555768-9095-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1b0811e1547c7b7e81372248e233867a7df2e2e4.1322554983.git.sgw@linux.intel.com>
References: <1b0811e1547c7b7e81372248e233867a7df2e2e4.1322554983.git.sgw@linux.intel.com>
Subject: [PATCH] mesa-common: allow empty PN
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
X-List-Received-Date: Tue, 29 Nov 2011 08:42:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 7d729b4..df035e6 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -38,6 +38,9 @@ EXTRA_OECONF = "--enable-glu \
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
+# ie mesa-dri could be empty and mesa-dri-dev RDEPENDS on it
+ALLOW_EMPTY_${PN} = "1"
+
 PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgl = "${libdir}/libGL.so.*"
-- 
1.7.8.rc4




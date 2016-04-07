Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48878770FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:54:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u379sPEY023062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 02:54:25 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 02:54:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 02:54:24 -0700
Message-ID: <9fff2f2b6d4c1efa598afef087695fa06c5ea257.1460022843.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460022843.git.liezhi.yang@windriver.com>
References: <cover.1460022843.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] desktop-file-utils-native: disable emacs
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
X-List-Received-Date: Thu, 07 Apr 2016 09:54:25 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) == 410:
| ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0    [vsyscall]
| /bin/bash: line 12:   903 Aborted    emacs --batch $am__subdir_includes -L

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../desktop-file-utils/desktop-file-utils-native_0.22.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
index 6f73564..f899cd2 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "843532672692f98e9b2d6ae6cc8658da562dfde1606c7f33d9d227a344
 inherit autotools native
 
 S = "${WORKDIR}/desktop-file-utils-${PV}"
+
+EXTRA_OECONF += "ac_cv_prog_EMACS=no"
-- 
2.7.4



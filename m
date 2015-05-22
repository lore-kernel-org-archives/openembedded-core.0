Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob18.myregisteredsite.com
	(atl4mhob18.myregisteredsite.com [209.17.115.111])
	by mail.openembedded.org (Postfix) with ESMTP id 955B873263
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:29:13 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob18.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t4M6TDGg031550 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 02:29:13 -0400
Received: (qmail 891 invoked by uid 0); 22 May 2015 06:29:12 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 22 May 2015 06:29:12 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:29:05 +0200
Message-Id: <1432276145-31264-4-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2 3/3] bitbake.conf: Set GITPKGV variable
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
X-List-Received-Date: Fri, 22 May 2015 06:29:15 -0000

Set GITPKGV to mimic the meta-openembedded 'gitpkgv' class. This allows
a recipe to simply set:
PKGV="1.2+${GITPKGV}"
And no longer needs to inherit gitpkgv class.
---
 conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index a35219d..5dafd52 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -47,3 +47,4 @@ TARGET_ARCH = "${BUILD_ARCH}"
 TMPDIR = "${TOPDIR}/tmp"
 WORKDIR = "${TMPDIR}/work/${PF}"
 PERSISTENT_DIR = "${TMPDIR}/cache"
+GITPKGV = "${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
-- 
1.9.1



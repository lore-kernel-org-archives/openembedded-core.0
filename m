Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7CAFD70C0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9B8742E3E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id yofHGM1hkrIT
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 2AC312E42E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 13CBC1465
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 083FB1463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 0636A34005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHd7J8029925
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHd7Md029924
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:39:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:39:02 +0200
Message-Id: <3cf982b7038128a02f0d8e5b669c9c48d21aeb7f.1407951483.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
In-Reply-To: <cover.1407951483.git.pkj@axis.com>
References: <cover.1407951483.git.pkj@axis.com>
Subject: [PATCH 1/3] systemd: Inherit gettext
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:13 -0000

Build fails otherwise if USE_NLS is set to "no".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_213.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 4fb7ffc..ccdc10b 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -15,7 +15,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
 SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
 
-- 
1.9.0



Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBB07F895
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739G4jBxzJD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990290;
	bh=VAN8wEUepNE+LjD2bKxyDzFS/3d6r6NyAhFRmynJdk4=;
	h=From:To:Subject:Date:From;
	b=EmWsLnyUIiyxYnDbEYNHwNPNg48X2YgxGTKDSOzTxy3KMoiZNJDNBjSViWIiqvGLw
	Okw52u8IbRc+y9WNeKqXwj1luNMX3DabaSFyJln60feCqlkjiUK7+VbK8hq7z2kRGo
	aQorr7w/72I9M9m8QLJqpKsAYmhC2cURijQ3Fh2p/bJ8+5AuY5iwWVrGVFOT5YFefz
	VYreTu97K3xZUGQyCVriytbDcPuZXlh6AQVbeDgTejvNlweqgFH+EQrPJakP5ej7ya
	eUFECS9/yp42ZkJ3f6Q+OHeQsOeXX/LPyO9bOnbaB3etzzbB/DXXFSeXs5EgbPxRhy
	iPYwRqYvh1iv24WC38H8wHkTwiReVEM+6wGiiCJdZtk3OOiWY0Un21Od0LCKRO3pvB
	hz7fQe2k35J4kIC/XXl3LBr2upIuGF3N02FZpK+4zcs0FHkwaP9Vf8PJLMhPkqCqwu
	ji7OKOcKrTVmlvi1B2+YR/eSWows7m+BDaREORhaKWHmpTk2pvlzIm5MiCyfX/jCJO
	GVSB6nPzTMVC+5iQvwZ2u4q7lvbCcv+OnsRtvvVLQ+DEqMrAdm/3KnUU2HWTmrjsPM
	TsCY0QFCEUL2SquSsZs0LnkI1wVteaMZxgn3/bdBe8nhMFlYWAUC5156Q0QEWIAaiV
	PQClvaq8t8S0plvsYR+2RUmU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:40 +0200
Message-Id: <20191105214448.2511-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] subversion: set CVE vendor to Apache
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:50 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Subversion.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/subversion/subversion_1.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.11.1.bb b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
index 8abac7408e..9909461bf7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.11.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "9efd2750ca4d72ec903431a24b9c732b6cbb84aad9b7563f59dd96dea5
 
 inherit autotools pkgconfig gettext
 
+CVE_PRODUCT = "apache:subversion"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-- 
2.17.1



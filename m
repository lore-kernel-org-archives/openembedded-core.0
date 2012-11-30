Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeVDB-0003G9-6E
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 19:21:17 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so649152lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=xPNHfvyVQYQ7OgB2gp7dJDer0NIUj6loITXuZX/FIRE=;
	b=dVD0bUO9pmuM5a9FjPzOpEr/Ejhac4ga3vKxvzLS91/VrTCX9tkFgRyD+UqbCwT5In
	0aJ+tWm++6wQe05rH7RGzdBQMeuUeAcBCmqF9HelOKtRR1D2Cjukwv+9fRsVphLouKo8
	KQHAM1kJmKyU5jCvnnL9hxzBruw8svw6XcFNfWIahUcfG5WVmDNf/8o/MavflYtAEyLh
	SZqn9RgCzr3lqwYgcHMaCNitM0PqXRfCNKx99HlZHVqqx3yjVrUpa5TNnhhETRY1t9zS
	J0prsIQuSvZXzH/MI1S15kFeulNB2GiVx8ZUlPBEjWItWPR1DXyxdSqWRaNxprPX2Kgn
	AT2A==
Received: by 10.152.144.10 with SMTP id si10mr2026793lab.55.1354298819218;
	Fri, 30 Nov 2012 10:06:59 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id sq2sm2251024lab.14.2012.11.30.10.06.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 10:06:58 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeUzH-0001ZE-RL; Fri, 30 Nov 2012 20:06:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 20:06:55 +0200
Message-Id: <1354298815-2428-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] grep: update to upstream version 2.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 18:21:17 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-extended/grep/{grep_2.9.bb => grep_2.14.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.9.bb => grep_2.14.bb} (81%)

diff --git a/meta/recipes-extended/grep/grep_2.9.bb b/meta/recipes-extended/grep/grep_2.14.bb
similarity index 81%
rename from meta/recipes-extended/grep/grep_2.9.bb
rename to meta/recipes-extended/grep/grep_2.14.bb
index f936611..386bbd4 100644
--- a/meta/recipes-extended/grep/grep_2.9.bb
+++ b/meta/recipes-extended/grep/grep_2.14.bb
@@ -6,12 +6,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "03e3451a38b0d615cb113cbeaf252dc0"
-SRC_URI[sha256sum] = "e9118eac72ecc71191725a7566361ab7643edfd3364869a47b78dc934a357970"
+SRC_URI[md5sum] = "d4a3f03849d1e17ce56ab76aa5a24cab"
+SRC_URI[sha256sum] = "e70e801d4fbb16e761654a58ae48bf5020621c95c8e35bd864742577685872e1"
 
 inherit autotools gettext
 
-- 
1.7.10.4




Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.2192.1628609851251256388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 08:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id CFEF9200002;
	Tue, 10 Aug 2021 15:37:29 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/1] maintainers.inc: maintainer for alsa-*, flac, lame and speex
Date: Tue, 10 Aug 2021 17:37:15 +0200
Message-Id: <20210810153715.141067-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810153715.141067-1-michael.opdenacker@bootlin.com>
References: <20210810153715.141067-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index fa7ac07baa..6ff0d07276 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -31,14 +31,14 @@ RECIPE_MAINTAINER:pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-acpica = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-acpid = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-adwaita-icon-theme = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-alsa-lib = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-plugins = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-state = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-tools = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-topology-conf = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-utils = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-alsa-utils-scripts = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-alsa-lib = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-plugins = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-state = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-utils-scripts = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -295,7 +295,7 @@ RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmod-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-lame = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
@@ -672,8 +672,8 @@ RECIPE_MAINTAINER:pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER:pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-speex = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-speexdsp = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.25.1


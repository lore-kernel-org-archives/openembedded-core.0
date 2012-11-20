Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tasdw-0000ec-Ar
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 19:33:56 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Nov 2012 10:19:47 -0800
Received: by mail-ee0-f69.google.com with SMTP id b57so3665690eek.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 10:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Yi3YjamjoR88GG44yf9NcSU7cXyI0Ft5InZyacAX0qA=;
	b=hbYBun0xU5K62fasR0lQ+hzMsFVBMJ6mYkRwgJunhs7s3WJwKTvDmi5G5LFflUNFOI
	op+0Sf9phUZ/fl3dcM/AjUS7gLZ4Kq0L8t+XOjIs6K+/pvSop8Sziizw7+b6riSWfXuF
	J+EOV1IIRQjeKSpK+Zc170lO3WpJFj0+QSXl5r4hKBQwbvfRIRLh5jhY2VEdb72GNVhK
	fIw4Ytr/5UphrvR5DyJTtvXdOd2ycgOrq7zmVIUm2A4EdFZDN0NukRE1VMNnD4etwJTE
	ZTgG8c36wV3CO1RzrWldgsAP/eNfZc4VKTQVPEUGwhO9OxjJAZYr/BMgaBWvRiVUBToh
	qG+g==
Received: by 10.216.207.160 with SMTP id n32mr6841789weo.61.1353435585517;
	Tue, 20 Nov 2012 10:19:45 -0800 (PST)
Received: by 10.216.207.160 with SMTP id n32mr6841786weo.61.1353435585305;
	Tue, 20 Nov 2012 10:19:45 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gz3sm18776242wib.2.2012.11.20.10.19.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 10:19:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2012 18:18:11 +0000
Message-Id: <1353435491-26798-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlbBFOraCRuSdlWuRnLvCwtvpxoyXl04qxw1gNqUcRbzX22h0x4+Cv/LgpwYrCwgcl0bTyk5d35hro5gG+5ajHZ73HdCPko51LCl4CWsYTmqSWJ2u0vDaQqBD+taiz+fj3FNHa0C+lWiOJNrvNqtf5XVngsqM6bJjCE0JSsbDwvwcqDWz9EooZNKuvdeMLvIncydO00
Subject: [PATCH] mesa-dri: add correct RPROVIDES for the -dev packages
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
X-List-Received-Date: Tue, 20 Nov 2012 18:33:56 -0000

The -dev packages were RPROVIDEing the non-dev names, which is clearly wrong.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 9e42dbf..d5f83e4 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r4"
+INC_PR = "r5"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -69,7 +69,7 @@ python __anonymous() {
         
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-        pkgs = p[0]
+        pkgs = p[0] + "-dev"
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
-- 
1.7.10




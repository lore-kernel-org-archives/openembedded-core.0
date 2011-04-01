Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0k-0004v2-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:02 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8P5l/rvmNabKObVohRku+0/G3PldLTjQkhl4wWKXirM=;
	b=nxFYi7S0KKNCzCMr7kMILl0ALoo0G5I2dTy/gJFRVljEpv/p/SsZYcI9KP51fvIn9c
	u7ntIhqfsdOD7xHUMOaE+2A+InDJCHIDlA+qi3hy+VXwe2Yh+yTSAslMEsuWBiS1RuTl
	kPVuYImnr/OWYZEmkgO4IPlxuqdb+0sDijGrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Zup7OnYQCtRUjajQrSh5ZYyn5D9eIYYD8sf/2YYq8jbigacKJt0jP5ZIVdqodONEji
	bnk6O/FWKxvrnARtejOSIyg86r/yG6ITonv+eIcX7MT1ZmmXIHrkafLzBKycBbIOX+z8
	Rum3bZZ6YgtuMoc6PhYeK676+4Vca6O/+yXoM=
Received: by 10.43.49.199 with SMTP id vb7mr4744103icb.270.1301632143426;
	Thu, 31 Mar 2011 21:29:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm1183221ibx.18.2011.03.31.21.29.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:54 -0700
Message-Id: <f21d6d34b97edc9d8089ab2f1ab24fa1dc02c5cd.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 15/46] util-linux.inc: remove virtual/libintl from DEPENDS
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:02 -0000

inherit gettext should do it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 913bb1b..447e5b7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1530e36fe1304d4535513de90a290df9
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
                     file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "zlib ncurses virtual/libintl"
-DEPENDS_virtclass-native = "zlib-native ncurses-native lzo-native gettext-native"
-
 inherit autotools gettext
+DEPENDS = "zlib ncurses"
+DEPENDS_virtclass-native_append = " lzo-native"
+
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-linux-ng-${PV}.tar.bz2 \
            file://MCONFIG \
-- 
1.7.4.1




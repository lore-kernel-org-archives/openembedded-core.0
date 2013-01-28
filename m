Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TzmEg-000270-Fs
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 11:46:46 +0100
Received: by mail-wi0-f173.google.com with SMTP id hn17so1257226wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=MshWvPr3dqoOOo/sYh4keMYR5bv9WZng5Idtuyk7zCw=;
	b=Hn5SW8y29ypgHJylFOKlK3BOrOV+olGUQPIAv2kWm4NCXPUFQ8LaLNnT56CI/Ak08E
	i/uQGeBbdX+filNkMycLjKvTrY8dkt6RPRKJBYKOYzuXPsZaGN5tiGdsf36eT6+a1KG+
	n5CGmWmI3zyNER5VDYq2VJLmqEdktnVmgK3PG1/TJ5R8zcT7D4HYpFqFmOnpKnnr8Ex8
	V70uae8AtZ/d7eMBYmVC9+8F47x+EKXZc0rr9XougnPVX9PR8NE20p5uJDWeU0DhTZvG
	8Bb+XhxjosUDXhiyrd43uaLhoonzPA7E/YCVOdWbOkUwBrUolTh3hduzwfrg1Sc/tbBH
	zPoA==
X-Received: by 10.180.20.138 with SMTP id n10mr8933843wie.0.1359369068378;
	Mon, 28 Jan 2013 02:31:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id do1sm12702951wib.7.2013.01.28.02.31.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 02:31:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:31:00 +0100
Message-Id: <1359369060-18964-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][for-danny] gnomebase: depend on gnome-common-native
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
X-List-Received-Date: Mon, 28 Jan 2013 10:46:46 -0000

From: Ross Burton <ross.burton@intel.com>

gnome-common is a build-only dependency so we should depend on the native
variant.  This also resolves an (incorrect) GPLv3 license issue in gnome-common
at build-time.

This will also remove the pointless gnome-common-dev RRECOMMENDS in any -dev
package that uses gnomebase.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/gnomebase.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 19c7f71..91c476c 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -7,7 +7,7 @@ GNOME_COMPRESS_TYPE ?= "bz2"
 SECTION ?= "x11/gnome"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive"
 
-DEPENDS += "gnome-common"
+DEPENDS += "gnome-common-native"
 
 FILES_${PN} += "${datadir}/application-registry  \
 	${datadir}/mime-info \
-- 
1.8.1.1




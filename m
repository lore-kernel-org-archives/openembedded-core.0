Received: from mail-pd0-f172.google.com ([209.85.192.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubiww-0006ll-OZ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 04:57:20 +0200
Received: by mail-pd0-f172.google.com with SMTP id 6so4034531pdd.17
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ivxCj+soptdMBT/Lf8qG2DEztTc9EgJgjcBeeWRFVHg=;
	b=r54VlAMVQx4q7e2mgVDpRZNWD7oHx1ey3Tv8Vk4qkEjaIGw3XjIxpzpHuOsCIqWBv+
	qOGnKy6qQU182gT/KdzyxsaopTfDqMhJbryCgS9vhKL14VcZInStY8CGl/1dRTaooNy0
	xxByOlP06psuLUYqCXXpvx9JS33XSE4Sav25zXxkpWI4IXcF1SG81Ob6p38OmqtwSBqs
	Irl2NAFNcOAQDqyo06hvcnu6hkj42YauHkJTTgVBFFO2H0XEd6b/S0/zGE9chwtRN2qK
	MBspVI+3sHwJwGvUk2HyDqMWRNx0GY8un2KWT1ZiLHAfnYpx3CWnxWG1yrUDEMIYvAz5
	82ug==
X-Received: by 10.66.120.49 with SMTP id kz17mr27630829pab.133.1368412748905; 
	Sun, 12 May 2013 19:39:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 10sm12037840pbm.0.2013.05.12.19.39.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:39:08 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:51:40 +1000
Message-Id: <1368413500-6952-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 02:57:20 -0000

The connmand daemon requires libxtables.so from iptables to start up.
---
 meta/recipes-connectivity/connman/connman.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afc361c..44d9d6e 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
@@ -99,6 +99,7 @@ RPROVIDES_${PN} = "\
 
 RDEPENDS_${PN} = "\
 	dbus \
+	iptables \
 	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
 	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
 	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
-- 
1.8.2.3




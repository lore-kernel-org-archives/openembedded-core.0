Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ubj3q-0008J5-Aa
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 05:04:30 +0200
Received: by mail-pa0-f51.google.com with SMTP id ld10so4246290pab.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 19:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=tQguXlO9d0qXIvGh6y5t5gMzUMomAgE1Fp1CaVFJH1I=;
	b=cZchQsgXmA4uNbsUZ4QT97I4orZHiCzs/zeyGvS+iQEfQ1MxXhu+12Ez5gIhjNLA+5
	VgLCcL0ttwXJqeYO7aMOcXrXqu0gwWYtraFGfmmJCYivEzt5ilUp/LynmKcvDKk7cv2t
	tsbcvlXKvku3akfWgA8ep5VMkbiSaOhUj4C60ikxco7fX3Sxhl49Rcv/dWcUNK6gNmln
	uFVx3nW672s2m7uZOnZ9Nn1UffUzV4c613sZiv3uRNlmyJvudlZ9wnXoMZhMwYKh948V
	zZmd6mU0Q6oIaIxF4NFu+AOJa0OeL0myysJfzwL+4gU8xHLuNuhdukFdoAeo5nwGws3C
	ISnA==
X-Received: by 10.68.88.129 with SMTP id bg1mr27021541pbb.10.1368413176621;
	Sun, 12 May 2013 19:46:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	cc15sm12901399pac.1.2013.05.12.19.46.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 19:46:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 12:58:58 +1000
Message-Id: <1368413938-7757-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 03:04:38 -0000

The connmand daemon requires libxtables.so from iptables to start up.

Signed-off-by: Jonathan Liu <net147@gmail.com>
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




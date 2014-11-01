Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id CA61D6AC4A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Nov 2014 19:35:20 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fa1so9747362pad.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Nov 2014 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=p17yhHjQdclIaO0gIP2ilyvNt2c1kPwANjjlkgh4aIA=;
	b=0FIV5BZnJmem9c94GBY5UKbc9podtT4xuT2oOavN3hqvtZfUbtR5z6WCUCGjprug0K
	xSNHG37udECu67btiYUGsfbMDsNRRFVeyF1om0CMEoAHX1VyMdeE8tax6Ak+uQRg7uV5
	8S5uOKIqCzeCyVbpsxa0RSlTWFJT/hT0dc9IZQjdHZvU6sm9ywf6536PmcMqmorX2Ocl
	kUJRohmO63QXdcWaVXk5VLfg56tE2GwJ9fCickzHmD0Phye9NIy2hD7Oxxq/dhNd5zIN
	x+QuVbUZqSMXcU8MQnSSmEroWxlRqzzUtWALeQSVntk8lL+muNStZ7IUtR+fKQ7b2LrI
	cbog==
X-Received: by 10.70.51.42 with SMTP id h10mr32405419pdo.21.1414870520835;
	Sat, 01 Nov 2014 12:35:20 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	uw6sm13204709pac.41.2014.11.01.12.35.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Nov 2014 12:35:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Nov 2014 12:35:16 -0700
Message-Id: <1414870516-10814-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] pinentry: update 0.9
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
X-List-Received-Date: Sat, 01 Nov 2014 19:35:32 -0000

removed  some EXTRA_OECONF to  fix:
WARNING: QA Issue: pinentry: configure was passed unrecognised options: --disable-glibtest --disable-pinentry-gtk --disable-pinentry-qt [unknown-configure-option]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pinentry/{pinentry_0.8.4.bb => pinentry_0.9.0.bb}        | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry_0.8.4.bb => pinentry_0.9.0.bb} (78%)

diff --git a/meta/recipes-support/pinentry/pinentry_0.8.4.bb b/meta/recipes-support/pinentry/pinentry_0.9.0.bb
similarity index 78%
rename from meta/recipes-support/pinentry/pinentry_0.8.4.bb
rename to meta/recipes-support/pinentry/pinentry_0.9.0.bb
index acc6992..68d2478 100644
--- a/meta/recipes-support/pinentry/pinentry_0.8.4.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.0.bb
@@ -10,17 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
 inherit autotools-brokensep
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
-	"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
-SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
+SRC_URI[md5sum] = "40a05856cb3accf6679987b7899b0f5a"
+SRC_URI[sha256sum] = "90045a07ab8e1a8e1ecf5d19b51691f195525e579fa5d71d7e92c120b05490ab"
 
 EXTRA_OECONF = "--disable-rpath \
-		--disable-dependency-tracking \
-		--disable-glibtest \
-	        --disable-pinentry-gtk \
-	        --disable-pinentry-qt \
+		        --disable-dependency-tracking \
                "
 
 PACKAGECONFIG ??= "ncurses libcap"
-- 
1.9.1



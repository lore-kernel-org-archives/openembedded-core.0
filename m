Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U35Se-0008LY-38
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 14:54:53 +0100
Received: by mail-we0-f178.google.com with SMTP id x48so1130275wey.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 05:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=KRAR1k4lXuy9VumszsTaFIWOaJeEUIvsI7CC3gFn/Pk=;
	b=WPYppmt252wzJmQF1XH9LhL8Kp30EsvjKQkLe+IJkjyINZQolxN7TKJrjgNOIzVysK
	+qoWibrF+M3vs1HvS5USYV00T3NeseSOGR42b/Ki98Fc7MbRPrmT/xv9slXYVeMtgwhZ
	85V5vKncU69fkFyrsm6KWJsrKTvrd6bV/2H1TOwnk4JUVpVIRkoje5Cmb/BAdX7F8MSG
	GQRYfW6FWdaTnnF31q0W07O4mqAfQ6hqDIBGfBZOCan3wDO5O0grsPRRT89qj8vZ1FIJ
	QDk3Wv1tL4aAWbKUYzZFO7/f/oc3iPYG7AjtuVLYpD38ogDniQKyqeIjXz/4g3j8gH/h
	OA0g==
X-Received: by 10.194.174.196 with SMTP id bu4mr49638186wjc.35.1360157941065; 
	Wed, 06 Feb 2013 05:39:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w5sm3033258wif.11.2013.02.06.05.38.59
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 05:39:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 13:36:52 +0000
Message-Id: <1360157812-20111-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkdzXnO7Loi6Jh+C+y3vDKR3GATnvKqG4ecmX4PSgOhSYOYT6noy0Z1eWpHQu2s4lMxfUV3
Subject: [PATCH] connman: be explicit when enabling ofono
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
X-List-Received-Date: Wed, 06 Feb 2013 13:54:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index cacbd1f..41a3a69 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -34,7 +34,7 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
-    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
+    ${@base_contains('DISTRO_FEATURES', '3g', '--enable-ofono', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
-- 
1.7.10.4




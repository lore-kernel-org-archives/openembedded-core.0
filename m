Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 37F436059F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jan 2017 19:53:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l2so54049978wml.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jan 2017 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p6uino9G4ByynbFtO1c52XIMrk1McSaxIqqcde60qqM=;
	b=oa0efkwi+UWXPdVKPK79UZYMS8hOb+XXxRSBQU2OcTyFSGciaI9j+Oh3uT7rNsuz7j
	/VRgwTIGrMn1zFQJKWSqaSVeyzbJaOxa4rsg0NSW+G6Lv9lC1fkScFkyrog7DTE8dajY
	tcUhSKldXuJH5mrWC92Cy7T4sO5X5oKCO4juB/iBK3mnXr9IDz9TYBmKm8Ahr0JyLyzN
	B8CKmNJsZhz0Pg32E+nXbmUCKRAeqf0N+zLgCOvChzUACfxxNSoMPWNypzB9PDwqzr08
	h5m3PwPrAdKY0i2bF4L93Jm+ZDkHPmmOtIJW/1+W43mg5LFy2YM6NORkWij6rRkSxZR2
	+4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p6uino9G4ByynbFtO1c52XIMrk1McSaxIqqcde60qqM=;
	b=TXARykCWBp3ZI3y1QjQZOJ7+WO6aG/MXrU3HKSMwcudntJtlMLC++HzwkfPdleesE9
	y/Aqocj3PQAlBxJejwnM/wPy/S6cBx9VT7mCUOA3C83OXt3UujAiBCqiMiMgzySmtMhv
	6FRBaoDEn+hdHo11daPprM4CCFygl8zjmDQcq0ip46Y7DrWefSSttHBeEkCpAWpURaOp
	efVR/4hAmyWu4bdZ4k2aoQ6pqDnt91VDuiaaq3uue2Gyzsx3Ix9ClyUm8ZTU2HuZWFNI
	Qk9/qFD8e/Dc4cGigeH+dLwi4YEV615spmi8N0b9KOTizDx3JZDJk0Z+IjvEhh7wudIn
	+NZw==
X-Gm-Message-State: AIkVDXJqnTDQMQQu7hWUhkHC8sU9p0DYog+dzAEU2lhBivbDZJHzBt1TUXShdSZqswlk6g==
X-Received: by 10.28.52.76 with SMTP id b73mr52340594wma.8.1483300414838;
	Sun, 01 Jan 2017 11:53:34 -0800 (PST)
Received: from localhost.localdomain (p579F77E4.dip0.t-ipconnect.de.
	[87.159.119.228]) by smtp.googlemail.com with ESMTPSA id
	t194sm63631951wmd.1.2017.01.01.11.53.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Jan 2017 11:53:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Jan 2017 20:53:11 +0100
Message-Id: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sun, 01 Jan 2017 19:53:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index e313da7..1afac7a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
 "
-SRC_URI[md5sum] = "1946e6438b8262a7b8fdadacd0e06ba7"
-SRC_URI[sha256sum] = "d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6"
+SRC_URI[md5sum] = "eefe5992567ba00d6110a540657aaf5c"
+SRC_URI[sha256sum] = "71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c"
 
 inherit autotools pkgconfig
 
-- 
2.5.5



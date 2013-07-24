Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 621C16B331
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:25 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b47so188228eek.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UhPAxLz+5iOJCvIf4CBpy+bkz0m+yis91lITa5VljDc=;
	b=bRsY8NZbdc5HRZQu0LfRRoADmj2ORkLQ1/Bb0QZu967cgxZM1mqvY6K5f4IPTldq5J
	bgLvi4sZZEt+UAOedk1c40+Xj7mUdReuO5QcH1Vv+xVzMChPt6R1xEFhmfrp/YQkhWBS
	JSfkQ/qIWsQQCcVFoarBhUq5lyw1t9zX3q2cXYRY03Py8MSAi4Zn2DKfdJx+u0Fr6gwK
	+jjeVxUymCfAH44J8PBmMoCzZASl5qFOrlrlyY9jSdwzB9jXA3LKeYdFT28JAfsDoqWq
	kww6tLQOLcYeh0ArGWU2cZkizdGUEHzb5BXwsi7bXwvt0cApf6IrG6nkHgru1TfGaJq5
	IBRQ==
X-Received: by 10.15.33.132 with SMTP id c4mr37711879eev.12.1374667345817;
	Wed, 24 Jul 2013 05:02:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm65590168eeo.14.2013.07.24.05.02.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:28 +0200
Message-Id: <3e938c1b95a62d4f78d8b5803faf9741acba1921.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/18] directfb: add PACKAGECONFIG for jpeg2000
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:25 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 97a4c55..7295c35 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -23,6 +23,9 @@ LDFLAGS_append =" -lts -lm"
 
 inherit autotools binconfig pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
+
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
   --enable-libmpeg3=no \
-- 
1.8.3.2



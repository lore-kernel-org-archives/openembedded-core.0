Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrk-0001BA-7K
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:08:22 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:18 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so2391589lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=aZq/6ZzJSxXYeWm5mq9x1ZkecJl+1ByDAbMiuzV0TKA=;
	b=OqlODjQiBpitYiJDXmOzEUzrLL/4U+IUbhieolPxq6aHJ1by5vxd2wdGQSLu3uJLHM
	TgHaiwERkJEvPi0KsJav47GKWZ3VnjflJ2uNgcljM5zUyRSHniM3aHZw/DyJbtpJEgYQ
	5kOaFQFNxKJ0ZNb7sFMwRIJXCUwQZymQbW9lae0YiaKYmwV50hlLXae+FSNCkrXj7n/V
	LmnC5FbqcjGAf+vCxMMrydxrWItZnymsUgB2RqjEJjEwTWEdQW1XVLr1XOaUWjSCoPDg
	+Wdf5cdLOhrBdwsBt6xt4WE8lrKaH6Gx4FR5ROR70BS7P/TOrehSNz61wtaenQ6fBG4J
	N54w==
Received: by 10.180.107.197 with SMTP id he5mr3142044wib.1.1355496795721;
	Fri, 14 Dec 2012 06:53:15 -0800 (PST)
Received: by 10.180.107.197 with SMTP id he5mr3142036wib.1.1355496795642;
	Fri, 14 Dec 2012 06:53:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:21 +0000
Message-Id: <1355496684-1498-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmzkOmO5c6cR0snWY891AFqKcqO1uGEL8YVmiRyJ0vWKROX1qrCRP6LUZv4P/UGpZ7SmZxbkcFCC3SftThavrVQwDyYqok/ALkrRI7JrB8d8VCearqLR9Dhn8tf/M+sPoeMXTYD43zMZ6C1roG23oiLLc9rGneTGA3ahSzHxBv4FzbNsPvguMZQHPGtMekRDA5oEa7k
Subject: [PATCH 6/9] libgcrypt: fix out-of-tree builds
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
X-List-Received-Date: Fri, 14 Dec 2012 15:08:31 -0000
X-List-Received-Date: Fri, 14 Dec 2012 15:08:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 0d891d3..6a0e0cf 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -20,7 +20,7 @@ EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
 # libgcrypt.pc is added locally and thus installed here
 do_install_append() {
 	install -d ${D}/${libdir}/pkgconfig
-	install -m 0644 ${S}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
+	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 }
 
 FILES_${PN}-dev += "${bindir}/dumpsexp ${bindir}/hmac256"
-- 
1.7.10




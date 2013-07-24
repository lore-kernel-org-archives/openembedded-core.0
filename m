Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id AEB906B11C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:26 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so190451ead.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cwrCgGHJ+yazldjUew2uj4KIpA/keRNJo0KiJ8RpowU=;
	b=Ttlq08FlT4IX/rDMDaj3EoxSVIgK41iM5Hfd8dF/j75cnkKPm4zCLgW5+94uVdc1JY
	edoyCL4vCbj7Fpw5oebK8RWnRhJaSPxR855WGlNWf9cwKVdHX1wC6wfnu9f8DpFgZWjy
	m12Jx0hyeVv9uDCix7JaWzE4vA8on4xrk4p5E9OjWQcWvjWpdR9JIABN7zHQQ5HrpMIO
	mOzdq5cKAoSAr7v9Kf/DZq2Fqoy3OhnfzU5w66jrR+1llO08rd9PWi+KwTrT5jPuzmDP
	g10r9EomdxdPqbK42GtvUic+urb2C0d+p2GC+myzz7rt728xfBwKa5RMsU8tx2bN6Np7
	f4tg==
X-Received: by 10.14.95.69 with SMTP id o45mr37486649eef.48.1374667347167;
	Wed, 24 Jul 2013 05:02:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65664196eev.3.2013.07.24.05.02.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:29 +0200
Message-Id: <e9111d28d9bf248c910dd48884b128bf05d6e34b.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/18] distcc: add PACKAGECONFIG for popt
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:27 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index cb5d696..3571732 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -11,8 +11,10 @@ DEPENDS = "avahi"
 GTKCONFIG = "gtk"
 GTKCONFIG_libc-uclibc = ""
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', '${GTKCONFIG}', '', d)} popt"
 PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
+# use system popt by default
+PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-- 
1.8.3.2



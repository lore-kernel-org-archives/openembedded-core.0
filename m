Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 248DD6B2CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:36 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so188164eak.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Gvs0kHfglRu6IgkEUfUDueZLiWgr90FEIGb8Anoiexo=;
	b=ENu0HSgyp2oRxu6XXGAO4agA3sb8oR+8qpFHDOe9jNyjZBnZ0ptxiCRuk7bMJWlOmE
	1Fr6z0pBHX0RR8F4NYQvbP0OpxExfM0SbCo6YU1GhjeJOxWeEA5rzAK00b3oL/J1Be80
	Rbt7Q9+Bp0A0puciPLQeYrIDosRvInRs/SulcOGXrE+DWmqmq/G82ZLf0P1AH0/Yj13U
	vQy5qzeIyv2HcRWDtewFfwy7wTzpmY2zPzRVbW9K1Qs2h3e1tMpWbOYIIMsfwkZlC3nn
	UMLTOCnhmZY4lnunVLOpG4S0uflmWx9z2JQGZGt7BVXQ2gk4QAvPIWGdQcp9JcIqh6mS
	EEYQ==
X-Received: by 10.14.201.68 with SMTP id a44mr11445323eeo.46.1374667357548;
	Wed, 24 Jul 2013 05:02:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm65594770eeb.13.2013.07.24.05.02.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:36 +0200
Message-Id: <32bf6c29a439e4aa325b07190cd9592fa244ace2.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 14/18] socat: add PACKAGECONFIG for tcp-wrappers
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:37 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
index 2f0ee68..f015def 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
@@ -18,6 +18,9 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "39231e512d8052f328552865df15d42f"
 SRC_URI[sha256sum] = "9a167af11a4d3809cbc66f5e2dcb39b6e371251282ef5de6ea6ff0c4be8a953c"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
         ac_cv_ispeed_offset=13 \
-- 
1.8.3.2



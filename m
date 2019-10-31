Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id C2E4C7FA37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:23:05 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v4so5303830lfd.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hYAdSDl5g9JBDEv2o53n8KDuTDZw9toMRx3aGV3VqcQ=;
	b=XwpDRxvMO7R3rabLU9fqr/LOijfs3CC377PAJmWt7w/VF6VduzbLsL0rhJe1JCkI3A
	T2kCycSnaWuo8UZVJTVqSyIJ9miKVBfs0D27Fe2MMkLeEhKW5EclhvyX9CdoRPxqxP2i
	/bf1u77Jt6ulpfDcm19A5q/5NOloeBYVS7b8iKC/IhmBsTWYTC8juzKMkZZyJ6DSXmye
	exxtfidXRYOFPnX4l24BRc3oe/4fInv2sLN3pjnh/prGet+qs2FG0uiVjq2sgIA2x7Ho
	xxpdnhUy/kNFdlKmML3G6tPqfCLdWXH8nX3LAFcgzPKvxCmjmChb3aS4scRHk5S0ctwQ
	DXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hYAdSDl5g9JBDEv2o53n8KDuTDZw9toMRx3aGV3VqcQ=;
	b=T2jXK1Nn0kARd+GDpCXLjutAdo3zdwI9jCQSe6CxZ58vzhxtA9kEI4adPBZanzx4SA
	9HgsyE/cUsNGAga9HH6dwxI3XrE22ESQhBAzH+nsqD19jjl9tVV/8egrUKm+iFn17Zfx
	erRdkZd1W+RAMZsVhBeJNMcJ3ISi152qhcP57CeP2yxYH/II6JDxDEjF58pTOdf5i2jS
	71feroH8b0S3qDaEuUd976fIou3+dVzZasTUXD82KwUg1NJc3ZQVXoGLvyS2p+w+8fkL
	mT4stHQAaYSy3ERyAI59QRxJ4ZL6eejRmWXLju8YCGlrc0h2TkqseRM/lv6QA80zpled
	qsVA==
X-Gm-Message-State: APjAAAXYIXWzRhNrJmLOHNaCJxq2l/V1zKdAOGPy74uymnMTmljvSlBo
	WSkkDcF3GqLe+gphFr0SDLfI0IpsXUA=
X-Google-Smtp-Source: APXvYqy+qXYFhIdCd/0ESp4vBaneEGLP7c0aEQeqNTlPDuFly6Adz7vOPwHYS7x8PoQzFdqYeCvTGg==
X-Received: by 2002:ac2:5097:: with SMTP id f23mr4353811lfm.90.1572542585882; 
	Thu, 31 Oct 2019 10:23:05 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	p88sm2662307ljp.13.2019.10.31.10.23.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 10:23:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:23:03 +0100
Message-Id: <20191031172303.31664-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.26
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
X-List-Received-Date: Thu, 31 Oct 2019 17:23:06 -0000

Changelog:
- Fix issue with memory leak and TLS certificates
- Fix issue with buffer size and TLS PRF handling
- Add support for D-Bus non-root ObjectManager

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.25.bb => ell_0.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.25.bb => ell_0.26.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.25.bb b/meta/recipes-core/ell/ell_0.26.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.25.bb
rename to meta/recipes-core/ell/ell_0.26.bb
index f6201f9bf6..f1f252ce4f 100644
--- a/meta/recipes-core/ell/ell_0.25.bb
+++ b/meta/recipes-core/ell/ell_0.26.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "8a8adc712718c770a72e4df6c9855c26"
-SRC_URI[sha256sum] = "7f2be568219d991d566ca50c58a56e69df9a248619fed758dcd9a4b04e655e5b"
+SRC_URI[md5sum] = "4660e25541071e933a2bb02ef2f94e7d"
+SRC_URI[sha256sum] = "7855b4b8f271ba6ee67d87d0965b975a9a8dbeaa616665ca2248afa3b5fcbc77"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1



Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA417C131
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2019 23:13:30 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id b20so6456322ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2019 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DyIFmOF+rRvFQh3n6rJbQ+qvmy0syTksGwKsMO/x6m0=;
	b=ElwxXWYf93DL5z9Y3HuGLbklViG4ph6vKTmNR/lRriN/6g0WQWV8rqhAGhVLtDhlZR
	WMbht9EGGyD7PKXmIFUY4baOjvrmb7MeLjJg08c8iYvI03zMXAyQObG+9LfAMor2hMgH
	k8CTtRT4x0JjUOtkO1eNJzeQmOjLCQ904erjnKzM3r8I2jL+wypzTwzbtIno8geU+yy8
	r8Jz68/2TGfI5d5/BuQHrtIP1je1/1+8f7ZppfEWHkGkiyyKY34olBPO/wlPv78YrL3s
	VPPADModpnKBJSFjyy8I0hcaI2QtLPizqojzx/QT/45LMypWiP54LD5IzBt13q59NtqA
	K6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DyIFmOF+rRvFQh3n6rJbQ+qvmy0syTksGwKsMO/x6m0=;
	b=hS6w0b7jop2Gr97gorYfTDii94HpSr62GxRyrqr/YmG/Z05ZPrX7cCHc6YXO2M5sdS
	lWLj8PC3Y3uEJpvEjWRiQIOk6os7ahJCBXntQkvqiN7ruCfNq1MFUFVDe46cr8eiMEYd
	G0HDTVM+eH1iNky/HbMyovgMQUQj53raUS7cD9VEq3eYpM5lk75FhwcMKu+LEBL2YJ8h
	b6hx4HcQvkSXlGqzlsDJW6Db7jnRjXXP8G5C35XHHizOQvb1c2XPRxpg3BtaM2dsBrY6
	B7c/A5w+RjquhL1ocGziW9f/Gfe8Oo8Lbu4o1KxK+U8mJwDgu4YrE3NVrImXx9tUFDtl
	Lbpw==
X-Gm-Message-State: APjAAAWS2Ty5BaRIvT98ZPITAwqydqZJXUrOlT6bnbAPN3Kn3a1qGuyp
	rsnHSOhnLZVg/UyL1orAm3VmOUYUKd4=
X-Google-Smtp-Source: APXvYqzwI+OAnQbOeZIMQ7uuup5HJR73WqBdBZF/RN2Zue0BbKyMg9BYpGmZBJePIlSsXsrF3treLw==
X-Received: by 2002:a2e:2953:: with SMTP id u80mr16093139lje.233.1569194010362;
	Sun, 22 Sep 2019 16:13:30 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	a23sm1829930lfl.66.2019.09.22.16.13.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Sep 2019 16:13:29 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 01:13:17 +0200
Message-Id: <20190922231317.27680-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.23
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
X-List-Received-Date: Sun, 22 Sep 2019 23:13:30 -0000

Changelog:
- Add support for checking if uintset is empty.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.22.bb => ell_0.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.22.bb => ell_0.23.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.22.bb b/meta/recipes-core/ell/ell_0.23.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.22.bb
rename to meta/recipes-core/ell/ell_0.23.bb
index b3942fc30e..f6e91ef6fd 100644
--- a/meta/recipes-core/ell/ell_0.22.bb
+++ b/meta/recipes-core/ell/ell_0.23.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "a4e7d74404f11e71775b89f53a8f1c33"
-SRC_URI[sha256sum] = "3c1d6d997e17dfcbe4ebcd1331d9a7be5c64f2f0a0813bc223790e570d8da2e3"
+SRC_URI[md5sum] = "be8214ff5b37012c4314343c8e6bcf15"
+SRC_URI[sha256sum] = "2efd9f7cdf57dedb9f1ba81bec534a3e0432476b1cb35ec0bc69973772a5f89b"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1



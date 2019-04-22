Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4A76D666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 14:36:02 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id p14so10489635ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 07:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yAeYvjDK5PomFGzSOD44Y3QHKsMXDy5sgwN5wvbgKRs=;
	b=j3TcmG3tH+6ZgjRDX7cRGS+TCpwptdf7ejwdVTt7BdxEqbNQLOD8+AYuqU0KW15RAO
	d4aVEgZVW78pgSX34M1vDXbbNVTPHXj9eXa0wWoctGPusiAnQ04IU7t6rfLJsPoS+Ox7
	fWwTtzOy5kbhBcbmrqxRBxi2cQm9F1E3Ou7jmRD125Lnf+0ecx5pNSSQ1XnEpYoSJDZU
	JmvhoLvAAyHBNdPqc825ft8aCALw8XFk+cqLFUBA4NAYb0llxWNaLWEqGay5+3Su8Zj0
	yeyifKJvx5xx4iWNYuKkZBD2GXXpfblnQSU+lerAC/9YQmPkuMoqKHVr7stiMtVy6PDL
	wPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yAeYvjDK5PomFGzSOD44Y3QHKsMXDy5sgwN5wvbgKRs=;
	b=fmhu+TKYKX6OjGDzsJ5OsJ0Sp4AWWrzOAB6mQcIeYtPpQOOIUj2WMxt0BOTUwIRPFd
	xcOi5AT6NJKrg7EwJ9TxuhaicGiXV8iELiGs0qRXNt/cV+dWk0rQ7AupOmj2KAvEUmtI
	bXScTGLYmoRyOXjbUvcfCLfT/sk7Ye3nE6sGBmlDWjMepmcuI2XMWpZhGaGcBjpSaL/P
	DbwQGdXkMYjoZiIPbTZkwtAUU3B1T7actQQsAIsw7EBVi8aRFSFNsmuuNU0CIvUhcBjq
	G4j1sKj4xbjKpE6p4ROzdGy33xSHYrR/3hjLoyggdi9O8ypHf33DnYnDFSPWt6hnqgCL
	GfFw==
X-Gm-Message-State: APjAAAWI41fuojsIwOymnlmJVfchCi+NGU9+aNmvA6+atmFp0SyVeEKE
	43x1eW+MobzSPQt4Hu1kmGOcPDPkaqA=
X-Google-Smtp-Source: APXvYqwk2ziAqWr/oZDMxXQAKFDY4r5L/XoenMqcpnygLRB2juxBjIpUmpIbn8M+94hrmdqcA+pOEw==
X-Received: by 2002:a2e:8906:: with SMTP id d6mr10488922lji.152.1555943763100; 
	Mon, 22 Apr 2019 07:36:03 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	k25sm2708460ljc.14.2019.04.22.07.36.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 07:36:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 16:35:46 +0200
Message-Id: <20190422143546.952-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] pixman: update to 0.38.4
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
X-List-Received-Date: Mon, 22 Apr 2019 14:36:04 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{pixman_0.38.0.bb => pixman_0.38.4.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.38.0.bb => pixman_0.38.4.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
index 49c3d62342..82c2e73e50 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
@@ -34,7 +34,7 @@ SRC_URI += "\
 	    file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
 "
 
-SRC_URI[md5sum] = "04ecad28edcc14e7eb5f7ed6df29c7a0"
-SRC_URI[sha256sum] = "b768e3f7895ddebdc0f07478729d9cec4fe0a9d2201f828c900d67b0e5b436a8"
+SRC_URI[md5sum] = "16a350a8a40116ddf67632a1d2623711"
+SRC_URI[sha256sum] = "84abb7fa2541af24d9c3b34bf75d6ac60cc94ac4410061bbb295b66a29221550"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.17.1



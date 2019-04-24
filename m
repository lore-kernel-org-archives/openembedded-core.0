Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2987A7D676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 18:37:59 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h16so5308253ljg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=n8XyzAP34mYGjEPiLAmbKFmWIWTUeY4mN7XtTleYZ2A=;
	b=YeLpvh4it3iP3icVR9sSIsTF4GQEV3mg+NNuN8u5ec3XrZMs/FmeMwsjdge1n+bVhg
	mnkSoOKzY0MSmXxBrFWK5Hmwht9MrBgWYMT4RrC65BtD85S0PCe6Sgv3AawMJRSukG2H
	0MzizRwtEYdRV5UuKkaGgpC0/MWn7H8DSzoVc998yv2q2bIPEIjWiqwQv2Kl6y+S/PQG
	5MSflDfbklJ7CvHrHjAh8X3DXyo7ETmVh6AXkQIQBoIzHTaPbj0y9SBjzniSQylWyq+E
	T4NFtHbMLsOuAWRbM3IlHnAkvyqCiVIY4JDMyFy7NlgaXHFsVMK9XuImb3MRmZPWvcpj
	Rb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n8XyzAP34mYGjEPiLAmbKFmWIWTUeY4mN7XtTleYZ2A=;
	b=crT+TrLzIkfTjrBHM+iA5v5LrzaRymwXRmcaXVw+awpzaniED5K2m5wBwWl5+WA0vH
	FC4KctQduC+S7V6xVcTWhvXrihorXSposnua1vZwV4cUoskFICF13JxIpUFvaJ4yi1bc
	Nb0rGnrxuQpP7E4BuwshW1k+wrBuaOUA7Cy1r4n5nFF255OoCmEFgK5U0FkdM/4KtUBW
	WXKL8Le3y2CFHj67pNq1UHk1rPGk/VCvbQXzYbIOpZZufNBXYGwmwUdvYQcNPbS5ZvYT
	+CwRzEzvCB5mXJOWLo5USZHCnFFz68/LRIRsoY9uLPHycCy07WYmk6fYedhjjbAxdJ5u
	/vCg==
X-Gm-Message-State: APjAAAUL0Ev2ZtL2+39zj3Sl6geOUiG+YWkiF6ggaRPuJ7+dMjZ5eHLv
	eZIRI/2IW0yKFYCkMzhTogDjnYhhvy8=
X-Google-Smtp-Source: APXvYqxRLVzBLLQtNqpPXVt7LDObfwGTFTW1t00LiWHs6ClzgwuOr5ObzgvdCM2qWA2VppSzTiGCxg==
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr18363341ljl.7.1556131079560;
	Wed, 24 Apr 2019 11:37:59 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id z16sm5382383lfi.9.2019.04.24.11.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 11:37:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 20:37:56 +0200
Message-Id: <20190424183756.11654-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] python-scons: update to 3.0.5
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
X-List-Received-Date: Wed, 24 Apr 2019 18:37:59 -0000

License checksum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n-scons-native_3.0.1.bb => python-scons-native_3.0.5.bb} | 0
 .../python/{python-scons_3.0.1.bb => python-scons_3.0.5.bb} | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.1.bb => python-scons-native_3.0.5.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_3.0.1.bb => python-scons_3.0.5.bb} (63%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta/recipes-devtools/python/python-scons-native_3.0.5.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.5.bb
diff --git a/meta/recipes-devtools/python/python-scons_3.0.1.bb b/meta/recipes-devtools/python/python-scons_3.0.5.bb
similarity index 63%
rename from meta/recipes-devtools/python/python-scons_3.0.1.bb
rename to meta/recipes-devtools/python/python-scons_3.0.5.bb
index d5084b2d16..c010cd94b8 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
 
-SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
-SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
+SRC_URI[md5sum] = "9f9c163e8bd48cf8cd92f03e85ca6395"
+SRC_URI[sha256sum] = "df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e"
 
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1



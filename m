Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8444B7453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 189-v6so10469539wmw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wXFS9+uLWvd/8PFOj1/eqs2+aY+yjqawBOFx3j2vZdg=;
	b=oqC9eGlsEJyvLrxPzq7yctnonevPuYcm1U9XG8lBwj6CUpLzS/d60l8ewBw0HdsTnO
	CzNTqYrwlm996eF5tCmltoBH+UR8TUVQgzEVYvHDXm1X+jnjAMM7S9TVXOlVKcgXaZCb
	89Y6VDD0UPbGqP5Ssnu4Dz0FuYy7dRpiuRfv0DaFrI/MXg6yv3Tu64jHnHatv4Fu5l/W
	7HkGNxrkQWcQ4nCdnk+HpUWSUOCngfr76IsAX3+OvNrhCFxksMeScscpcc2ot3CnoOp0
	DhWs6x5Nn4QQWs8uTMPWtFUEm82HfFGJ6NGs7iZN+pKyYjEyt8Gr09JEet6wNzrVuOA0
	bKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wXFS9+uLWvd/8PFOj1/eqs2+aY+yjqawBOFx3j2vZdg=;
	b=jQ0GRRRtCi2eoSzXhkyDAxDEyUpHuKJ0d5j6lXBOqMtN8S7L7bFMhD20WYb0pQwGhM
	/VG9GoArD/WcCqlQP1My2p+Jk9Fh4S1RPRP2gsa0WOQFobgp9oi2cUUbqw82UTE4lDGH
	+E76C6dYXIfXPH/QLfGN8N2vcLpIgOgWkhwUuIGVjmAWe/DXLsGqxmLOqIwCLshy0CCu
	eKBjepBMcPoplbm3f8LysbgxtL1Lt99uts6qycLScxOSdOwBphQK4w3iu8wMVy8Pqeaw
	x6RKcJfj8Y5rsMfFxrjKCXLJvBg0y1t9YOVgnA+1WDSoVkvgK2M1Qjh0blfX8aobGuve
	byww==
X-Gm-Message-State: ABuFfoipYqVcIqNUV8hPOK+zUeZ+UGikX3btaEsRkQZqAw9M6d/gcyb7
	oXrK1Fne2ZLAfdiDhlRacy4=
X-Google-Smtp-Source: ACcGV62i7HOuqKYUMeMBy5P4Ix7KJi/hgLUzn5b84Ptv93a18PI8URNEqklceDyswEeYTkdVAu77NA==
X-Received: by 2002:a1c:b504:: with SMTP id
	e4-v6mr15494160wmf.134.1540217139104; 
	Mon, 22 Oct 2018 07:05:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:09 +0100
Message-Id: <1540217112-24479-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 10/13] xkeyboard-config: update to 2.25
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
X-List-Received-Date: Mon, 22 Oct 2018 14:05:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{xkeyboard-config_2.24.bb => xkeyboard-config_2.25.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.24.bb => xkeyboard-config_2.25.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb
index 7d0e608..b67dfa5 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.24.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "74c4bdf52382127cb5802c3f2ab441e0"
-SRC_URI[sha256sum] = "91b18580f46b4e4ea913707f6c8d68ab5286879c3a6591462f3b9e760d3ac4d7"
+SRC_URI[md5sum] = "a0238f95118f39f5f685dd28fbd9d24f"
+SRC_URI[sha256sum] = "fec6c25a8d3931bd9afca49a1653b0fa222c85610502d7b77699bb61262934b2"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.7.4



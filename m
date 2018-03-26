Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2E1178792
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m15so7341397pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dT7kSiR15sHGaHIbU3OeCozGqw9GozDiFe5+l7W5DP8=;
	b=eqz3Xeeaut8e6JY2zllUwrgwj4DDXL12pzqu8cQSLdk85ALX0PepGbNOzQJA84FPam
	XE2sxHfIuBIs0Vs1wO0EGmgVKW8bZAP2OHVcl3iicpvXUpUuNOmF6M0+ewPcuip4ZbPp
	21Dka/6zMOdqxHfQkZwZcLLY46u06v2qt6tDsbg6ucaKQUK0Mbq8SokKt0WtdYHOecVr
	yp5624r50grSvlLgSVv23D2gJIFeQSPE8GyeCi0AVD8n46mqcFtVGK9VmhYwA/lCJ/ob
	vudpij9ueBLvL7UoguBEgyCz5r7pHxg8Mqctou0IKGIufMkFvWZychbo/u+Y/D2zmjLc
	dOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dT7kSiR15sHGaHIbU3OeCozGqw9GozDiFe5+l7W5DP8=;
	b=VfOLJ75VpvxftVQGkndohAHxw3FsJSP6env+fEnXQZZI5JK+74W+QaCOTVt2dLvRPh
	9UG187L37W4UL9CgClhYoM1uunxqP03TwbSxTBRF/hvgrCDFLc4jHkC06drLAsutdlJ3
	u65QZN6V97XJHrSqGxIxdn5uYlEn5cwqCea7YdyEVX1OUsBp/hwewWuKuebULkKLo0GC
	zbUNFw4Vrph3P6BGE6tlLarq4SX4/l9QKCwHW3Cse79nGcjhOujSG8KFuP0km0vzwVRg
	I4BjB+UPK+Mu448BNCN9LVy19Ao2Q3tp9QSGwV++NY/v4KWHRGtNVovsDP1MxbLp+fA0
	J/dg==
X-Gm-Message-State: AElRT7Ew9ujvBjPmSXrbPrKp4rdD7YZ3we6A8sbTUxj1j5SAvlxuhcNr
	5NFDhHjIjy9Jbskrx2EpRVbQ2g==
X-Google-Smtp-Source: AG47ELuoT4CHURlA2evsMj3uthgSh/6uiqTKK14RrchaZX5EXQItrGKASKYYp47JUZBBv9AIcnQcdA==
X-Received: by 10.99.65.6 with SMTP id o6mr19844789pga.57.1522074692214;
	Mon, 26 Mar 2018 07:31:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:19 -0700
Message-Id: <70c0937aec0568d871292fcaee96199301262e6b.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 16/21] util-macros: update to 1.19.2
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:31 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.1.bb => util-macros_1.19.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
index b39d787..2680599 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
 
-SRC_URI[md5sum] = "3f8a8e6100556f7f28e469809805dee8"
-SRC_URI[sha256sum] = "472ad0e41d1e0abf5ecafd29460bf1b8d47e53d4b7d3abf1f66d02dc576547b8"
+SRC_URI[md5sum] = "5059b328fac086b733ffac6607164c41"
+SRC_URI[sha256sum] = "9225c45c3de60faf971979a55a5536f3562baa4b6f02246c23e98ac0c09a75b7"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.7.4



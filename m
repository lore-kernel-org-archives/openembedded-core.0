Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D59757ED46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:54:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s15so2086177wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OtXyhs+sUgTwqc76IsAYRei6zx//IAeJTRuQ5Tiz5sg=;
	b=t9cHJPeqMrjJYQOsdEpzfbw1MfTKnfExGruW86lX39zhUU7BqOqmfBvtIhLaJNI3Gy
	pM9kb37CJ525yWliVrEoFG39Y9vIjG3WfXxVfUfECIO2HGxjpVKhrwYTwPxLHPWmkr/4
	eQxtpKn9innIMRMJdU60yKW1mWz16hP7rPW7NbfTM0gruvSHGdOECUkheqrRF/UhvCJm
	O+Tn31xjCfvE+GufO1C2QmJIrQuM7fnzoOpnE4KQGQ0MJzJKBlDxesHlE7GJfWZWE42Z
	gHMRVtyJfLbRfjjWHAwhONS+9NBJeX3FZ8LeNzaBnRq7G9WDlNVn0dwF6fWnwramVJdV
	eV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OtXyhs+sUgTwqc76IsAYRei6zx//IAeJTRuQ5Tiz5sg=;
	b=lMUUjlxcFaG5sRYDs7jT76ILsMpGI8kXJUVXbZdlVszn4ElRKafgXVH24mcSV/TkLw
	Y2pbETBPAT8gLVrV7v8FA+iNgXRr8c+jCPRaoVmsqdKL+JI7tp5OabdzlS/aJpKCJ5Ky
	vgSJLfXLzzf7SmC3TVwrkjPrgSekBiO4tU2Fj9EUQBkgWYD/o/SZ1IhgGPFR7arqndCs
	dEUlQLbdFvnaT4/UDjsjllL+1ZUOTrudcbNoCpBwvcB75xfjC/8ze6U1Q4VRuzdF6JU+
	QEQPvnZpH2q1wFuFLKKVE6RNJ5EL/3Rhg7oKAKvdGrfCORYBlCRmjCSpqYKl/EgOG0nc
	mA8Q==
X-Gm-Message-State: APjAAAXlSbpU1rl5JNrrJ2u2didpYWNivBrJny/dilti+KEphu6WWunC
	E5gMwot1uP8qSQCgWw5kxDrEm9B9L90=
X-Google-Smtp-Source: APXvYqypyNm0CvyxQYSy1WITLiGts3t3qXxAcmSLAAFshoB2F7prHUvK0ZXkznzL2AWQZpU0SRoAHA==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr35494260wmc.22.1563396876150; 
	Wed, 17 Jul 2019 13:54:36 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o20sm58637610wrh.8.2019.07.17.13.54.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 13:54:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 21:54:31 +0100
Message-Id: <20190717205432.31580-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] piglit: upgrade to latest revision
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
X-List-Received-Date: Wed, 17 Jul 2019 20:54:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 4350823f60b..5304f358fa7 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "4294b15e3b84a96f24d1286b73d5832eea267bbf"
+SRCREV = "f0e868ac6fbdc295b2955c1b8f73169e7a52f938"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1



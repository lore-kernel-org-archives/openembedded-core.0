Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3B173166
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 20:52:49 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j124so1432729ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=+NoqS8bJgP21ULokWIHCy57TJgyfQ41CgmgNf+UjXlA=;
	b=qqOz2Vw5kxB87KCD3Rq96vYiVl+s1gqCHubiIWhj0XP5vCAWhdYQhwQtCEXOnVJtvN
	eYQubFckWMhqMOUx0QDgW18S0TaxPLMoYASiUOgVfbIW+7kTz5jBV2eJAnqFMFHihA0G
	BhnFon1ORk2h0v/4AJ13TiUJHMwBfDyrk+oOJkkuAEpYyt7rWA78q8by/4LmQanhN1HQ
	UWqMAFmzzHFzhTzcXecg26tpMg/sigGs/2L3yWJQGvth0019oMO+fdYP0Wz+dmOnvDtg
	pqhTIdHx0wEqoNN1NkpqMxBT1Ny1s2FHfbfe5b8nZLoVhEWEWSvcHTpCD+nQzwDBVnfd
	//JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+NoqS8bJgP21ULokWIHCy57TJgyfQ41CgmgNf+UjXlA=;
	b=QhnQW4yo64CzLiBD+mJpl+LxCKfMAvif4IbS7+qnHzKUKNqj7kVGHU04mjdELDu2Rl
	fPEg5RXf96huqAuvdwVv2Uu1lgUnNIk/SBFIjGXUoEcVVq8BtChjRKl1AYCXGTi1C0Ky
	uJ38dRqnpHl7hKVpTWGi2DWwfWG+a5/mqZkfLoNXsET8YRc1UzF7GR0GBeIvTm2wzWTU
	ydnIxjPcaHnOBT1mp9kuflVBeMT6AH6n3ocvwUEVdO73hQQqjsNfUfCH8umUfAF23vSi
	xq66q35feBRuKe/fdHx5igN0SJF5NPgrDrcgaJv/b1FzNO5NSZt8pS40Uy/Q3rwQqrUi
	2UXg==
X-Gm-Message-State: AEkoout2rAsoQqcCUCTrF/xvoUKV7C+n7cZl4Jngbcy3WgxLPJXnrOVc4bgfa5LuQtVHow==
X-Received: by 10.36.14.140 with SMTP id 134mr26331347ite.98.1469566370025;
	Tue, 26 Jul 2016 13:52:50 -0700 (PDT)
Received: from openSUSE-i7.site (104-247-228-241.cpe.teksavvy.com.
	[104.247.228.241]) by smtp.gmail.com with ESMTPSA id
	k186sm1283388ioe.22.2016.07.26.13.52.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 13:52:49 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:51:45 -0400
Message-Id: <20160726205145.1781-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH] gstreamer1.0-plugins-bad: opengl handling
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
X-List-Received-Date: Tue, 26 Jul 2016 20:52:50 -0000

Enable the opengl configuration option if DISTRO_FEATURES contains opengl.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 9e2b94e..1a342f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -12,7 +12,7 @@ SRC_URI_append = " \
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles2', '', d)}"
 
 # gtk is not in the PACKAGECONFIG variable by default until
 # the transition to gtk+3 is finished
-- 
2.9.2



Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54355719BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:19:36 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m203so18666309wma.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gm4zEi1+ELydTvdVQc6SAPJXcOxqyB7UvMrZ0++XaoI=;
	b=u6CLGSADPPtDOgpfoF7S9dmNEQct8VR+4dbD0muwHp7l1uvb8h5swBtsgA4WkoXDVY
	guDLSZW5p5B+u86CpqYQ/idYIqNUCHKdrWWuky90HwI167rtIzDo28UbkRzZ56+qH18/
	opnfsuq3gqiIgEyrhkDogUScJbj6JTGNLQvt4wUxFyXF/N5cMOsOi4fv/fcjt5+wlxsc
	J1ANYHEVnlKNdz8iWKhzs+HzOR7MBbaJL/z9LqUFSxh/05xKv9uj2k+yhGah3qlZjNus
	f2nl66Ve4f2K9/4U3wpNdU5IjfEII6qFWsMFurg7ccoxxx/t/bDZqC4Mk0DxVTqvLmCs
	Vd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Gm4zEi1+ELydTvdVQc6SAPJXcOxqyB7UvMrZ0++XaoI=;
	b=AkzglXrtgFBy+Hmt0emecPB+MLnRzz2VmJoNc4miBrJ1SdNCMiUZiR9CpYeKsuZxba
	Es1dK4JUFpYutuPQldlueapWytBfqSM7XVOgiTbCvs+rTablxssAA2c1sUryjR9Ost4c
	oHfGcatlUd31sNqNQCJ5lL9WP09BVHE4lIpK8ugv0OlOffwLP9KW3NTtBV3zczOj0UmO
	T4yWqQhNAAdV1zpJpd7CBT1U9ua2hDycB2hWC0xrPItWOAe5HO5RFjE5m+hieJZrC3nd
	qEzFJaTvPAxyNgT74l/JtZiN/JXO1VcHiKYtgF/zM0IDoBT8jlQfBxpdli3UEte+EaT7
	oPTw==
X-Gm-Message-State: AKaTC01ls2zFNHOtvWDIpF+9gX5p4gQ1Nqe8u/VlgC3wTF0sP8bWG6JL1ndLH40+0k+d8Q==
X-Received: by 10.28.91.143 with SMTP id p137mr179607wmb.51.1480983577670;
	Mon, 05 Dec 2016 16:19:37 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	u18sm1150972wmd.1.2016.12.05.16.19.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 16:19:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 01:19:17 +0100
Message-Id: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/5] mesa: update to 13.0.2
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
X-List-Received-Date: Tue, 06 Dec 2016 00:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb} | 0
 meta/recipes-graphics/mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.1.bb => mesa-gl_13.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.1.bb => mesa_13.0.2.bb} (91%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_13.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_13.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_13.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_13.0.1.bb b/meta/recipes-graphics/mesa/mesa_13.0.2.bb
similarity index 91%
rename from meta/recipes-graphics/mesa/mesa_13.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_13.0.2.bb
index 7c9a4b7..ffdd5b4 100644
--- a/meta/recipes-graphics/mesa/mesa_13.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_13.0.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://0012-vc4-Try-compiling-our-FSes-in-multithreaded-mode-on-.patch \
 "
 
-SRC_URI[md5sum] = "72b7f4d0c2407f367484abd201cb8276"
-SRC_URI[sha256sum] = "71962fb2bf77d33b0ad4a565b490dbbeaf4619099c6d9722f04a73187957a731"
+SRC_URI[md5sum] = "9442c2dee914cde3d1f090371ab04113"
+SRC_URI[sha256sum] = "a6ed622645f4ed61da418bf65adde5bcc4bb79023c36ba7d6b45b389da4416d5"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.5.5



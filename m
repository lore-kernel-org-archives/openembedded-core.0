Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 259D760762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l2so68371399wml.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M4CI86VloY6h31Q1M5E5+r8WHVXFssFNwky/OS83rG4=;
	b=fk2n22nPnl2v0rOCHKf7ppLn9XrEkWoa6nXvg5J31qI72FEhDJeyEXd0Y1PL/6aAhX
	cRFmBVTNbK/8oflPmaSZhsQs532iOK3QLK8uPQulrfbdlYpZGEGPj0SPDH/d/t10xbYc
	IJ1JNTuhu74wnLWq3K8w9Rej//DA3Wz6IOkI5PT/sgOPYuD5z5fCppxSPuipgZv8H/iv
	a+YIOOZejrgrPPTZ1q2meDD0fU6/CxZcITsi2zAsZ4324OSofpGxc70ZuGgeBaBDcaDV
	t1t6ZPNxK4+NK67O+suw7xEnT6O38x44+4O+1IUCi9EsImeN0i4I51FR1N/pJnpr1p19
	jp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M4CI86VloY6h31Q1M5E5+r8WHVXFssFNwky/OS83rG4=;
	b=g88r+5haIgT62zBPQlvuzs7XoOnwY7BBmMcXcpb4vUfWshyLs+l8Sirko7HK83w+yo
	WhFlTNowSLA3do/XPvlb/86pjhMnEidYC3vhRdxHnVxY/gQFtylxwgKx4Q/QPMc2Tbzl
	OpXIqzfC/WA+47/w2AwHEpqKCf3EyzTHTWMmDYu/WOXHnUIKgsgSPrqvFgbR7g0j8m3A
	L+kzfTQ8XT0c6/DXQwuBkcyyGbYQbIweg6RIdwGW6qhrugd3D2MdX9KKlyMKERpMEaRA
	oyi7KgFHUXvnhkjwu7g7QtFzL2F6ULGbE3SrI6dVfeC8tB+nN5nYMklu6lOCqKckfJGE
	KnHQ==
X-Gm-Message-State: AIkVDXI36y+C3dY3w0270jfVQiHjpoIp782as8WCs6eBBBfXHwJvVE+k3J2EdaRHP5AJew==
X-Received: by 10.28.9.80 with SMTP id 77mr60639485wmj.68.1483570681857;
	Wed, 04 Jan 2017 14:58:01 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.57.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:00 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:50 -0700
Message-Id: <6ce9c1475cc06356d75f23d1fe01f9766dbe6c5c.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/6] waffle: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

Multiple packageconfigs depend upon virtual/libgl, whose providers require the
opengl distro feature.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/waffle/waffle_1.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/waffle/waffle_1.5.2.bb b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
index f7db1bc..9d6b0e0 100644
--- a/meta/recipes-graphics/waffle/waffle_1.5.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.5.2.bb
@@ -20,6 +20,9 @@ PACKAGECONFIG ??= "glx"
 # libx11 requires x11 in DISTRO_FEATURES.
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
 
+# virtual/libgl requires opengl in DISTRO_FEATURES.
+REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('DEPENDS', 'virtual/libgl', 'opengl', '', d)}"
+
 # I say virtual/libgl, actually wants gl.pc
 PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,-Dwaffle_has_glx=0,virtual/libgl libx11"
 
-- 
2.8.0



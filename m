Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87F7C6160F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:28:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m10so4731205wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oexkhzwGedhez4v0aWB7OxDLWPAWTimFH/twCuTVWlY=;
	b=j/eHO1lygqRoROv00IZCaWuuP/4z7WSHr0DkJDr7xsJL+tCFvy5v91asw10SJHanU5
	Tt6EizrQJKg4ekmaZ4XgdoorDJCTPq1d7gXwyMpdKsS6gHJpvrhv04mk1ugomyRqhpwq
	5F3j3UfPFzl9XYC4fL+V4iZuYya1sUXEovPePx1hN7em94HD1kEYnVngI62lPQK1CtxE
	SU94nFhgakxFN1Q3zbtgUhNEGE3krOEnXjGLHaPZyVsFbdH06xuOwi5VISdQt8NvwyyE
	dVwcEdvWoZ520z2wbUK89MAGTL5+WK75nOU4FjWJnmTSj918sE4BfuhrEEfEFbdMeLkD
	l4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oexkhzwGedhez4v0aWB7OxDLWPAWTimFH/twCuTVWlY=;
	b=KthPmOdrk7Na9C7eZWkeLBvyEZ14nR8NrfBronV0LjQgr96OP9b0WJUbtUYiTvi8kT
	EOd4/sxHISyuwtezlVFLaZqghKI2+lsXEx3PkzuqkE1VK9DaZWKtnlwp0k2sVQtR28A0
	oE9tagteusUxu2uy/tKaf3atY7hwhF8Gl3H99QpsXR9yLS1cAEpwzPBw0BcdZ9BpZw3v
	LfxBhZtlPoEtpCD50/ckq+31xurXczvzuzFSWdl5v8GoSjv4L1ms8GEcrgy47Ou0EY0K
	md40fkAYf6yQ4nB9k7+anyq9xzxmxBNvTHlGZOvWkyuk7wIlAUopOpwoixhy+gueFD8r
	obXQ==
X-Gm-Message-State: APjAAAUStrS5ulZhRrWXSddWpKbn0OkxSYjUUM/DQsMR+SusOsu/JOHf
	2W7WTUKXXtehWFsaI34y5deLUewz
X-Google-Smtp-Source: APXvYqy7WZ094VyBKPxX9b9GceAVzGrT6aqAjsQ/ZkgcDXQ1FJ0vYLuagZG5dxN2OcgSIYFFWHr+nA==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr2630701wmh.131.1582277302154; 
	Fri, 21 Feb 2020 01:28:22 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	f65sm2941504wmf.29.2020.02.21.01.28.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 01:28:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 10:27:29 +0100
Message-Id: <20200221092729.6733-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] p11-kit: upgrade 0.23.18.1 -> 0.23.20
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
X-List-Received-Date: Fri, 21 Feb 2020 09:28:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.18.1.bb => p11-kit_0.23.20.bb} (87%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
similarity index 87%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
index 19895ec269..54b8cc6a70 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
@@ -2,14 +2,14 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit meson gettext pkgconfig gtk-doc
+inherit meson gettext pkgconfig gtk-doc bash-completion
 
 DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
+SRCREV = "762cdaa2cd5c5ec09cc844f9a6bdc551c7f6c8ed"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.25.0



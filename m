Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3284D719BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:19:38 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id kp2so41557025wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=p6PCGzuaY01PnVVCa1ce5AGFisaGNn/vtlzCHS02z64=;
	b=ghVM9J0xuSNwHK4ZY6zk7agwHBj+aqSmgbGvLYQp2+Nf6m0+AJQyK7N7UkRyIgUIxj
	y8bCwbCplMPZIUmK5PK1wBfg5yg9DskpXwURKJwx9n352dYFWdQObqOii93d/0ODRIyG
	NCLDYluV2ydfPXmtfArNf9DI2VvA3jDEZal52d4VcNu/18cx+Y98JXtbKCfQo7wrjrBI
	Qpg/hEJsH/JVLH18eByS49o4ZYVMxzN2id7Yspcky46IjcmCdNEGICnkG6SxudaXcqUs
	CMGi4Jbw7wJb98/Vxof637Ui2FxMhI2dA9SWUdLgA5ZRg5Wk7iOHo+/DrO/3P+iKBlEb
	B8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p6PCGzuaY01PnVVCa1ce5AGFisaGNn/vtlzCHS02z64=;
	b=IL4to5tLjma1vrAb4batPvElAwKcBApgnXir8ojO/jn3yXH+iViBNyfgw+I/zT8Vxu
	7LFpWvnYPR1A3FO3rqin4R5rhLAS/aq91zzNAPzllboaqNryVhmXW7JyliZbrhFSC11N
	iGamgVTDCRC7JVFBD7fXMYQtsFRd6RkCfaK0w6p/sgvEmsJNmjwUC+iojgvSww12M8iO
	q5/r5zNW8i0pOrDwY0whoMHYV43XtlJvcmsQ58NziQ6SLxdgd2ZCYNFtgcaytVewgi8F
	IJKGkEvOwOrWx0OhR2oPGLpIq2DTlLI6QHKYXYgFUJcCdG/XWGV5deVeHxb5aD+Xc5T1
	uNcQ==
X-Gm-Message-State: AKaTC00UsKQtpRswj+EtQBkhlat72QAhWjSvGOhtILIbf3P8d+f4BGRQUrRSCATo7Qh3Cw==
X-Received: by 10.194.123.103 with SMTP id lz7mr59509392wjb.100.1480983579141; 
	Mon, 05 Dec 2016 16:19:39 -0800 (PST)
Received: from localhost.localdomain (p579F7D52.dip0.t-ipconnect.de.
	[87.159.125.82]) by smtp.googlemail.com with ESMTPSA id
	u18sm1150972wmd.1.2016.12.05.16.19.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 16:19:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 01:19:19 +0100
Message-Id: <1480983561-11437-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libsdl2: add EXTRA_OECONF[vardepsexclude] = "MACHINE"
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
X-List-Received-Date: Tue, 06 Dec 2016 00:19:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes Martin's MACHINE checksum test [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129464.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index ac7312b..b104a43 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --enable-sdl-dlopen \
                 --disable-rpath \
                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
+EXTRA_OECONF[vardepsexclude] = "MACHINE"
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-- 
2.5.5



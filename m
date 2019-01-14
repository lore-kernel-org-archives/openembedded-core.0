Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 372C27C07B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 15:03:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id a62so9253295wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MjpQuQtCi6aIXPJPr8oc9WLXfGE9XQE/3IDF9z2rsVY=;
	b=c3tvIaCgPW0j/4d0K/K7utwAsJlqFWczsXnoQOJEJt0rVXLj6IOSqmopXj8vBcoR8F
	z9ijPUob3Boj8ri6JCeIkYlRpfBb5JizCZ9BFXAtmUnVCMAfEMv4rhqTPh5CXiQfighn
	4sfDjtjexnp1dPI8FhOs7C3xlPHJt2qjt/hwNnx6O3odhkhfPud80Q/WLAOaEsQPaTRA
	w/CKJ6o82ybT/0Tn0bXnnKa7nyUPOUmTzdmtViWTJaqYikga2JcFA8DQsGbSyoZ4X220
	nb0ZyPCW/Mov4odfYl8COk/AEuh2drlQAHw3D8Y6wIQFFYIL0LutPBJ5tMjPY7+2pv8W
	HwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MjpQuQtCi6aIXPJPr8oc9WLXfGE9XQE/3IDF9z2rsVY=;
	b=nkSMgpj6cd9ajsf3MEvd0z/8+QzYLQ1W96q2lgrl979GUCFj6B3OXO02gqOwua/vZR
	97VmAxZgc+aDHMZenU4HistbkrZ58FSOUF/naLolI388Pv08UmEjTnnpiKYZ/GCXNZC6
	h24N6Zoraf8Cz5hv8Pa4608nhkQoceryrW63etZvc2GHt1Wd9nHhsWgEvECyD3IL6VtU
	jWQeqjyPx39BhxbRF1zQljyzfGm625HkAm1DY3Na0Wt0b+OMcw86xMSpXHdc4C+z8YFz
	wXC8yrJd0t14m2DIosr2IDhV4ILDJbvmXhHf+gFvAW61O+Rc21xRiLxbZEFu31naZm0E
	OYlw==
X-Gm-Message-State: AJcUukfYAhYpGG4WuZ5zLg7UU/c3K4dnyLSAuuLpZkjT0jWu9NUE5dCb
	TxN02nafmhRlCmsCdEYWVn+v+r8J
X-Google-Smtp-Source: ALg8bN7H9o5Y3/QfY2iCneyHhrsoqBlYuM9WRtimMBz/LpBeUSo1Lz18JgCqrsgyoTC8jYhyWo94Zg==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr12167513wmc.0.1547478213716; 
	Mon, 14 Jan 2019 07:03:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y34sm201725236wrd.68.2019.01.14.07.03.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 07:03:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 16:03:05 +0100
Message-Id: <dbdea65f30310ddd37a412d1ec562d93d93f9265.1547477793.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547477793.git.alex.kanavin@gmail.com>
References: <cover.1547477793.git.alex.kanavin@gmail.com>
Subject: [PATCH 09/23] virglrenderer: add a recipe
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
X-List-Received-Date: Mon, 14 Jan 2019 15:03:33 -0000

This component enables hardware-accelerated GL inside QEMU guests.
For more information, see here:

https://lwn.net/Articles/767970/
https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../virglrenderer/virglrenderer_git.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
new file mode 100644
index 00000000000..60ab256aae7
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "VirGL virtual OpenGL renderer"
+HOMEPAGE = "https://virgil3d.github.io/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
+
+DEPENDS = "libdrm mesa libepoxy"
+PV = "0.7.0"
+SRCREV = "402c228861c9893f64cffbbcb4cb23044b8c721c"
+SRC_URI = "git://anongit.freedesktop.org/virglrenderer"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.17.1



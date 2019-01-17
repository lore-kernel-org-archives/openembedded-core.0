Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 585E77C1FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id i26so8334347lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SZ2W2/gUofKZxM1beHswjPJYzwJ01QUEAOFUEdFzOKo=;
	b=gXTXZCb/Fr2AHYtzUTJJcxlBY26zYice3DsxoZSwZchA5TBJbsojYR+MgkKY0iy+ti
	ncJk9vYx6ig9M2yph/5WnCn+HsYUtukcPbJUvd9XCZL7f04xQBBG9n2Zi/wR3Whzq2KO
	7FFtKSrNZlOP3fehTJZHlmDO+Gpiw6/ZdVef/FjMWo6h1YezmLibTMPdb4D6mTyFe+PN
	TplaR7D8QslfqhtzgTNHPtbQZn9ZmOeYXvZVvcDQmUdCk1afJ5tG+zUafgN1SC+qAlAg
	p5dX+ALmvM2VhbpWE+BWhz59KjZ69AVIWAxhxJde8xkGHTgNamxAySD9dsf0TYJmI4Cl
	yUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SZ2W2/gUofKZxM1beHswjPJYzwJ01QUEAOFUEdFzOKo=;
	b=UsTgoNz0MLTZu3FAeFife5LGJAYXQymSAoSIShIDa0zmCZVUIztEkBDCLKvzfdhgqK
	MzRKSyRwoUhUfgW1vylvxHZE3Zbxbivxw6x67l70C6Ei/V+pX/rnHSTLm3wp2S8/fKEV
	r2KN+5P0EBOoVtZXvk+SDQg7346VXUBigWu0KFhGhtqXyl4/o88a6nnxP583qs4Iba2P
	9HoiweBTUQ1J3FKvmqZMkHLh/bAAkVWZXOn0tMxjLYV0YW68YjI8vhVxRUO6CH6VOst1
	c8Uw5f2c5GeeL0L50LlPuyiClNkMfqez1tkZzg2iYXwue08+phycHda3KeedhOH4blyx
	W2hA==
X-Gm-Message-State: AJcUukcrXA0JLI79OpF60kVH6juSHlE/LPx9Psg/0z1Jmf+4iOoysNIA
	GoydMOtn+HFS9PtoRbCvMRLeJIZK
X-Google-Smtp-Source: ALg8bN64v649/1fSPeCxtdoZQ3ixnjkMQpCY4PJFDIB8MFFYConTt7Y+A3SRyu8VHl3ImuxBhvs/aA==
X-Received: by 2002:a19:4ace:: with SMTP id x197mr10400134lfa.39.1547743233555;
	Thu, 17 Jan 2019 08:40:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:53 +0100
Message-Id: <3ccb255da85dcdb04531e353a2a62e261721f772.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 08/27] virglrenderer: add a recipe
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:33 -0000

This component enables hardware-accelerated GL inside QEMU guests.
For more information, see here:

https://lwn.net/Articles/767970/
https://www.collabora.com/news-and-blog/blog/2018/02/12/virtualizing-gpu-access/
https://www.collabora.com/news-and-blog/blog/2018/05/09/gpu-virtualization-update/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 .../virglrenderer/virglrenderer_git.bb          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8d6eb1afc0d..f369fb13834 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -700,6 +700,7 @@ RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-valgrind = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-virglrenderer = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan = "Ross Burton <ross.burton@intel.com>"
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



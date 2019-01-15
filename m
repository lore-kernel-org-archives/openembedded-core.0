Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3E87BFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m22so3909305wml.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MjpQuQtCi6aIXPJPr8oc9WLXfGE9XQE/3IDF9z2rsVY=;
	b=tu9kcJBi1veygRvwxYlpAcUzFA/VROZMZOAXLxliPXClZCnawN1ld8WdaIiBFPZu7g
	jtHc1rf9ljdkZRldZWh0imMFjxCSacG2jl3/tixqruLmTkorHbKaW4Q2XEAhQRghfB22
	xTxZITYdBKBtC9tvOxMWre+nceLuSxBtTWWYGmj//cOey5mivGV0RkylQQv5leO8ZKB7
	u/of7Rgc3uGFmeds1pTTHeLDm0rQgbywPJW11LDggEeOxhmK9J1tZza51E+kSSztUWuW
	edzHdqECh4gczF8s1xFjantKY4aedY+AwfGwdXAvVsLeVHARkD3cB1ybgKolyULSZNZ/
	Zjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MjpQuQtCi6aIXPJPr8oc9WLXfGE9XQE/3IDF9z2rsVY=;
	b=YEB3+VCou7vij6bs3mcxBbG5HsNE1IQb8m52IJQ0zW9p/mIJ+qdZ868pXhRIEagPa4
	9bEkCRmDtNluCll2mqiQ39uDAqc1KIjP2kFlANwGyeoxh2hTmLSIJ5dPUWGTvCVqMb88
	65+yq0qq+3wy07WgldV7dZGZS90hxkbUyhaVUj6sAYliRIjIu0sy2zKkpfodDqLQT4Wd
	xG20pNWIvsuIs4g29FudMJird3pOCPD4ADxnlklesSszcb4QmWSCt8fNWZMYl1IBBXnj
	r6oy/vBs4nvoDgxgojKtjXzn5Sq8WspRslRrVpRQzvYuD5JvluAk5B8ywojSsAW5H4gZ
	pWrA==
X-Gm-Message-State: AJcUukesbJGw4PFET1l4SN8bVDa7i+jwUsyv9PUcVsDDQUAqNTvELjQW
	f1iUfy/OM+ljDj0Fj4qN7hdA0CXBUK0=
X-Google-Smtp-Source: ALg8bN4yLnBeiR5xulP7K8AmAJ2T6cSMuuLVq11qtDX+E3N9bJe8GKnXedeJqYpVU7Sv+6CvlWk6fQ==
X-Received: by 2002:a1c:26c1:: with SMTP id m184mr3868820wmm.25.1547570352357; 
	Tue, 15 Jan 2019 08:39:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:43 +0100
Message-Id: <437ed385e134ba90e0041013f81f3ede01ae1e74.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 08/22] virglrenderer: add a recipe
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:12 -0000

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



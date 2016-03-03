Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A2A9B77112
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 20:31:38 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n186so6758323wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 12:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uWL5fGW5o7XHkZ0TK5Mq0yLsPI+8ipFfKJDvfLInj08=;
	b=SKkVTojT72ofOzn2RNLwggqcm1IMU3AjO/ATQ/haKkFgtbrDkIN5hk0bTviFay35ne
	cIBo884KZhQbrrVMIdpAH+NiXB9lp9WNPWIA11bZDKR+oilyceJuUw/o7yWsadDR5SDK
	C1buvMoly9Ks/gey+hpiNl5AhbNo8K5kDG56lpXBPZO4q7qvFjr6PkFxhPIPFRONNbOc
	jV1R+dnCeP8U1DcVL7RgeD79GrYjo41vjBucYlyYcHfxOSA8ZIvbMrWqNiaFRVuGPQMB
	Jv5fqSxR3NnumkFtl0N1KFJqa1C0pqWNX9XU/sZene35NMSVQs5AXB3UqCmlXEdJFNJU
	w7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uWL5fGW5o7XHkZ0TK5Mq0yLsPI+8ipFfKJDvfLInj08=;
	b=QnQbifjLK+1J9ccFyXD71dQoOlyjw3vfTEtjOX92oNNL4TMB+TQro6ba3h7gawv72i
	3yDR/HwP2mu0OgEWOcBjdTM6m7ZhaNQR2oJUAzqz96gulbtkNshVuIM2ma9B31fKSdvS
	5Qz826ItbUX3S4dP0zHJ5XLfn14QQxU/4Jizq/NZXtK6M48oZpwA5VHa+B/sF1LFFo+a
	P3Gt/it/MWGuKsGcIMfvSJHNgHnXCgvmntT7gzXQe4rzt4nlZY2zzXi8D4qIoTGJeFB1
	KJdfDRmGzC9i4GYx/XjLrRBYghBqcABkpxjElZ3un0qZAAfZ+SJ2clB9lU+Q8sak5Euv
	P0xw==
X-Gm-Message-State: AD7BkJIN4K3nLvc+dS717n2mm5TTivkBkJUPTUHwVsuAUGn+sILRjUJyndlQpCpH5xnrpw==
X-Received: by 10.194.24.193 with SMTP id w1mr5016693wjf.33.1457037098648;
	Thu, 03 Mar 2016 12:31:38 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	y62sm162930wmg.12.2016.03.03.12.31.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2016 12:31:38 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 21:31:26 +0100
Message-Id: <1457037087-13715-2-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
In-Reply-To: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
References: <1457037087-13715-1-git-send-email-johannes.pointner@gmail.com>
Subject: [yocto][xcursor-transparent-theme][Patch 1/2] xcursor-transparent-theme: Add new recipe for git repo
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
X-List-Received-Date: Thu, 03 Mar 2016 20:31:38 -0000

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../xcursor-transparent-theme_git.bb                 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
new file mode 100644
index 0000000..580967a
--- /dev/null
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Transparent X11 cursor theme for touchscreens"
+HOMEPAGE = "http://www.matchbox-project.org/"
+BUGTRACKER = "http://bugzilla.yoctoproject.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SECTION = "x11/base"
+
+SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
+PV = "0.1.1+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools allarch
+
+FILES_${PN} = "${datadir}/icons/xcursor-transparent/cursors/*"
-- 
2.7.2



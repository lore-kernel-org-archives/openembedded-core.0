Return-Path: <jpewhacker@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F85260B58
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 03:14:43 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id x191so317031ybg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 19:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3DOCm5a3lR5BptgL3brkwTOfBI97jdtH3UalVgRtXFM=;
	b=TrvVhR/SNFBAR26ELUxK3qwU4X7Yo5ydGkhbsKCjvyOTAnYDJuOfK5mQdlIs3KLxhZ
	/eUehBSyRBUJqz93DVK2AphV5YIZdiU5/SlXv820yRzTaPhNqbPTOsMMmtgtD71Tf+3d
	weFeLT7VcfQjGWEgnknxMOKx3H14Pk8hynSnJKjThP+AqM4F0G+8l1kFq0LHYHNZPNIa
	u95j1h5zVHu6wUBcFWskyg0EeQ0CsCrymy6Jx2l1EPGj16Bbo47OhaR0dbf2oszpQgZC
	4Dsn6O8VlKd7CqnVnrRwNLw/I0klCQPWvyug/tCXRlvJef7QN/3ZvNshqLAj0L11yU6F
	nccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3DOCm5a3lR5BptgL3brkwTOfBI97jdtH3UalVgRtXFM=;
	b=NWxydixAUYzoIzKdXXM4xil6k1bdIC4iwyrK2pMldQkooBqc7gfL7ZHMq0NqaUzfUG
	4nzx0IYD3Oezjjb69JeR20YCrwXrimvyLKG8r0nK7zoev99HEI4HxELfHcKJfuK+7ypF
	D9dhMUDNKqJJ6UxUI6mAOx6zZogD50P3kbETNNhhAgUQaCe0c5WRzE/giEHAp0EEaw4d
	HsjPc3EGc43T78xOaI7f0W6XMMfnJX0kfI8peri82zaYJPy8SoDVXxdcBETNqxrLBFLf
	uIgSqNX1ur3B4mv21YQ8EHj3PKSfdv3gsIw6L2O2OXGMF1ZbK04nAzouHfoMVs0Tat1D
	YoPw==
X-Gm-Message-State: APjAAAW4mbTGqgo84EGQ4IfBKVJ1NBgjX5jDVo370oAVDR3zFYprrRBi
	p/Icay+Bi1HGERHfozJwzhvwVOgF
X-Google-Smtp-Source: APXvYqyzpX9AcasU7fOC3opeIVPbPkIOYnY5HMnXAANhibd48anF4kIssOGcIiOtEN2bP8ogdpSiqQ==
X-Received: by 2002:a5b:d07:: with SMTP id y7mr8396793ybp.96.1581477283996;
	Tue, 11 Feb 2020 19:14:43 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:4f37:550:d1b1:6f01])
	by smtp.gmail.com with ESMTPSA id
	h193sm2677370ywc.88.2020.02.11.19.14.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 19:14:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 21:14:34 -0600
Message-Id: <20200212031435.792802-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] recipes-support: Add diffoscope recipe
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
X-List-Received-Date: Wed, 12 Feb 2020 03:14:43 -0000
Content-Transfer-Encoding: 8bit

Diffoscope is the universal diff tool, capable of comparing many
different formats.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 +
 meta/recipes-support/diffoscope/diffoscope_136.bb | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/diffoscope/diffoscope_136.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 171a43615e3..4a267faabce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -146,6 +146,7 @@ RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_136.bb
new file mode 100644
index 00000000000..a00f281deb0
--- /dev/null
+++ b/meta/recipes-support/diffoscope/diffoscope_136.bb
@@ -0,0 +1,15 @@
+SUMMARY = "in-depth comparison of files, archives, and directories"
+HOMEPAGE = "https://diffoscope.org/"
+LICENSE = "GPL-3.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+PYPI_PACKAGE = "diffoscope"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
+SRC_URI[sha256sum] = "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
+
+RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
+
+BBCLASSEXTEND = "native"
-- 
2.23.0



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 469947F82F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w15so4202670wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cwj0CQBoVWll6gGFvw61biw1Y0TLYJbOxManG8ZXFcg=;
	b=S+g4fsVjHQoD9aUxOBF0cyU1LgqYk9iMqC9ZeYyg8ye1qpBqtITbF+G08RxicMTV6y
	PTzba1rSE2A3qRd5RZCVMTvbXrUCmr//aysMKJyNTtTacb5cesNi4qm25ownBqH/Vfbi
	zG0G2ewCcf2iR/J1n69efUWjvR4O9nrbYxE0edHgFTsBsJla7K03tGr798dplKrT8HYi
	vZOaEgqFON/3Dl+xRV+AJDh8qWEZbw0mKAuTT1fmrF8VC9T8qqVQcBAkLUoYgrZjWMEk
	iKjsj8L8znbJnYFeUxNRvLQWvgvjqudrlXV1RkU4mSz3BP8s/RgU7eBAShUdXWO0HGOy
	QJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cwj0CQBoVWll6gGFvw61biw1Y0TLYJbOxManG8ZXFcg=;
	b=hvucva+vthMT634DhOOW5d2c7+hCLukfZywC0lWCtw+xXnaoGpGtTsoirwTIOJHzI3
	1+l/7q+fiiPQuO/een/NGmellPAvDtFZ5nYlaHf3M2RcBLgv/l6KyJ7PDEopmXEpW1X1
	SAju0Xe9SbYqbC1KYHjVg1xSk+Mb7bfLQCH44I4/6NAEMo8vkdf8XMaVtwXhjRQJw0bF
	UToLqCVIzCsRhMiDSL8/VOhbweaEqLimy8kpjtWzgGU2Q9ehZ5P4vuIDlBQaxREkRCuk
	D3AaJYKx8Azwono9elP2NU9HFgAG7WmrM6pTpXOMZz3MKaFIT0nO/qZRLFWjVBhIRcOF
	X+iQ==
X-Gm-Message-State: APjAAAVo9sl1Svnl+r0D96dOCcKmQUVrdgis8WGoG/mZriuSBmvbkKW8
	zgADZWMEPqGFAhmuhprweth3tygb
X-Google-Smtp-Source: APXvYqwsNZ7lZwYHgFxqkEdIAj630CsXT6JQyHR0FjbeMnAsmOlxmvV7FiuqZXUe9m4QQ4ZzAu/oeg==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr10375007wrp.71.1575560659931; 
	Thu, 05 Dec 2019 07:44:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:52 +0100
Message-Id: <20191205154357.121346-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/24] mkfontscale: update to 1.2.1
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:19 -0000

mkfontdir utility has been merged into mkfontscale source tree,
so a separate recipe is no longer needed (and clashes on install).

License-Update: additional copyright claims from Red Hat and Open Group
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-app/mkfontdir_1.0.7.bb               | 22 -------------------
 ...ontscale_1.1.3.bb => mkfontscale_1.2.1.bb} |  9 +++++---
 2 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.3.bb => mkfontscale_1.2.1.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb b/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
deleted file mode 100644
index a453e24876f..00000000000
--- a/meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-app-common.inc
-
-SUMMARY = "A program to create an index of X font files in a directory"
-
-DESCRIPTION = "For each directory argument, mkfontdir reads all of the \
-font files in the directory. The font names and related data are written \
-out to the files \"fonts.dir\", \"fonts.scale\", and \"fonts.alias\".  \
-The X server and font server use these files to find the available font \
-files."
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-RDEPENDS_${PN} += "mkfontscale"
-RDEPENDS_${PN}_class-native += "mkfontscale-native"
-
-BBCLASSEXTEND = "native"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b4fcf2b90cadbfc15009b9e124dc3a3f"
-
-SRC_URI[md5sum] = "18c429148c96c2079edda922a2b67632"
-SRC_URI[sha256sum] = "56d52a482df130484e51fd066d1b6eda7c2c02ddbc91fe6e2be1b9c4e7306530"
diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
index 2a6bec16491..a767ee847b7 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
@@ -10,9 +10,12 @@ is used by the mkfontdir program."
 
 DEPENDS = "util-macros-native zlib libfontenc freetype xorgproto"
 
+PROVIDES += "mkfontdir"
+RPROVIDES_${PN} += "mkfontdir"
+
 BBCLASSEXTEND = "native"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
 
-SRC_URI[md5sum] = "987c438e79f5ddb84a9c5726a1610819"
-SRC_URI[sha256sum] = "1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a"
+SRC_URI[md5sum] = "215940de158b1a3d8b3f8b442c606e2f"
+SRC_URI[sha256sum] = "ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7"
-- 
2.17.1



Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 381EB7F82F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n9so3867403wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V10zCYDH1pIT/xXLFPiWiyjFO46nFOzhlX4FJYcgVxE=;
	b=PhNofQQVxjZtA6yKvuuebhS74R4AnR/N1s1qzISQmcpoRQZnJd9VNZKYf3Ft+c3W7N
	MtSFyhH3MNolMjaEd33DTlpMaq4KD+0MKJNxVNhmdJ28r87fIKu7lrBm6b8d9y2e/Syw
	0+2RsJv1ZS7n00oJ5om4JwoOGYa7XWenakD0VOEyvv4rrDaFg8qk0harFMJ10bD6YWrL
	G3YEJ2HylRHqrl8jVCN7uISBPAuC+zMRx+646T3ccZrpVLucDvTDxKghmJVANNkgnnTi
	1b0X12K+RiLYsf0Nlvr2Qyil2jn4O6ZbLSkEJG0R4CWiL6Ht7XaaW+JLzhe/TxnPUgEp
	DgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V10zCYDH1pIT/xXLFPiWiyjFO46nFOzhlX4FJYcgVxE=;
	b=oVhJedWqYigigbrmBQxA7rODP7sRoVpgy9Ue3Z+/OCICpr8qqIPu1V4V+VF7KR65jj
	lSQZxA7tMR1VfrRI0lc24cga3MzHpUNeieNdWUszlFFLlKRZUPGSrRjZvg0+Mu4Jt+e5
	YZ8uRBsr9JyMOI9IbpJElzoy3EWUo3FAnjIjcRuvLioIZTTgwn/3p3T4y2miBOrj+Kur
	UkMP+SuHKd+TfN2AQaqQAJsA8HtSHWCLXtR43LCoxe8G+HfTwmqE4Xqo10SvE9cm/7d3
	Ut57aIDdJp5h6Yc00ZaLyVSQ9/n/CMhJaGIlO1syH7yhv8HytBOZBGBkX/9eKU1si0UO
	ZI0w==
X-Gm-Message-State: APjAAAWOEPOCt6oCcsAnD8FDGetXIQW5pHeIChmUFIDLOUsuh2oITF7E
	4TiLlGqw0PYQ/7Mk5KNbsKQ4KW3X
X-Google-Smtp-Source: APXvYqxDoEmko2yjzDrnTYn4a33rnU9ncPjM765wOm8KWjDPB1O65Ip8ztHYwEZ+zuueHCOGqj/NtA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr6094039wmk.68.1575560660640; 
	Thu, 05 Dec 2019 07:44:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:53 +0100
Message-Id: <20191205154357.121346-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/24] libxkbcommon: update to 0.9.1
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:20 -0000

Switch over to meson, and add an option for wayland support.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{libxkbcommon_0.8.4.bb => libxkbcommon_0.9.1.bb} | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.8.4.bb => libxkbcommon_0.9.1.bb} (59%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb
similarity index 59%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb
index 0608fd5af86..c147428a149 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.9.1.bb
@@ -9,17 +9,18 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "3c4409058dfd203f641a563358e0187d"
-SRC_URI[sha256sum] = "60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b"
+SRC_URI[md5sum] = "4662756fd73ab0ac9e32efdad8f807f6"
+SRC_URI[sha256sum] = "d4c6aabf0a5c1fc616f8a6a65c8a818c03773b9a87da9fbc434da5acd1199be0"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-inherit autotools pkgconfig
+inherit meson pkgconfig
 
-EXTRA_OECONF = "--disable-docs"
+EXTRA_OEMESON = "-Denable-docs=false"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxcb xkeyboard-config,"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
+PACKAGECONFIG[x11] = "-Denable-x11=true,-Denable-x11=false,libxcb xkeyboard-config,"
+PACKAGECONFIG[wayland] = "-Denable-wayland=true,-Denable-wayland=false,wayland-native wayland wayland-protocols,"
 
 # Fix a following runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
-- 
2.17.1



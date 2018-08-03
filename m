Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id F324678E46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:01:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id h10-v6so5519116wre.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5ec7BOqOiWRTYPno86hOU3jwFRmK4PAsXD/FwfadX9M=;
	b=NW4UZhNR/iK+kUCFp2w+AiYOf+26ubIrYBmw7axcHSaWgXB9NqbxSgJfJvO7gpWlNT
	RMr4L1FC8hGI/HdpfTtR1gDUJ+bOVHSj2yJH2X1DzMuaRWDo2grHzZTYgQQgLuXNCXJq
	hQnt08jZ6iU67Tk14bsE8M1wb4ApnaNwSsDxziHBbg8G2vnTXm3t/a+cFjbu81WWA05S
	9dsJ2oTgZkeqnzp/GiNmPXEh5KTpg5eiE/YiaHTUTMxOO4SNB/VIPiedC/pWZ6W+1CAI
	sMHYKb0InZD2SHA2GlPzr4hmogZxrCM3pQpJfOT53RTgZogGs7ypTBX0LGRa06aLs85l
	YURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5ec7BOqOiWRTYPno86hOU3jwFRmK4PAsXD/FwfadX9M=;
	b=P4rMyuOkv9mpdvQqkbHc2otjjK1IVwW2V6ztcJnLEhQ/qg6u2QvTIJdlX1eNxJ7Urr
	8T7na8sovJiixQL1BMQ0d3ZwMysm81sGNYqzmmOoN5xxJ1p1+A/vkcZSSQ1DH7j8+I0q
	Dq67EU2wRaKiWirRGRAwhD/xXW2X2Y+zeKTR7S+vXTYO4HrVkIVR+s1ccQ8PFsE1GdvN
	GqJHp1f6TDDqiZ43h0uWqR9VtNCf2PHrWpfGfqolrMwdU0zZZraXAZBZLokNv1DnWv3f
	Vdvv67+qaUwHw4PqvoecaNEUTvwdHSHNUJfvjANb8VE7GLj2ZQWwQk6CIjydoeGGI+3+
	4vQg==
X-Gm-Message-State: AOUpUlEA2F8H0LZ/mg0h+hsxBc4s7yq+g/E3wHVZlXH6pBXzbNzcusF6
	MIMfd7Q6bAwkq+OGwACVElK17iFl0vA=
X-Google-Smtp-Source: AAOMgpepHCVJH0a8rnHNFR+BT8X5/zlIL0WNBHZPM0LxFOdat7vHQoGStWculMEn2AV+D1B7nEqkFw==
X-Received: by 2002:adf:b519:: with SMTP id
	a25-v6mr2778729wrd.273.1533304895343; 
	Fri, 03 Aug 2018 07:01:35 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm7753757wmd.32.2018.08.03.07.01.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 07:01:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 15:01:15 +0100
Message-Id: <20180803140115.25450-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180803140115.25450-1-ross.burton@intel.com>
References: <20180803140115.25450-1-ross.burton@intel.com>
Subject: [PATCH 4/4] desktop-file-utils: allow target/nativesdk build, not just native
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
X-List-Received-Date: Fri, 03 Aug 2018 14:01:35 -0000

Also fix the license, as this is GPLv2+ not just v2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...le-utils-native_0.23.bb => desktop-file-utils_0.23.bb} | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.23.bb => desktop-file-utils_0.23.bb} (58%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb
similarity index 58%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb
index 54daabef56c..6446f47189d 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.23.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.23.bb
@@ -1,18 +1,19 @@
 SECTION = "console/utils"
 SUMMARY = "Command line utilities for working with *.desktop files"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "glib-2.0-native"
-
-SRC_URI = "http://freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-${PV}.tar.xz"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
+SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[md5sum] = "599133d51cc9a41bfec186414906b6f1"
 SRC_URI[sha256sum] = "6c094031bdec46c9f621708f919084e1cb5294e2c5b1e4c883b3e70cb8903385"
 
-inherit autotools native
+DEPENDS = "glib-2.0"
 
-S = "${WORKDIR}/desktop-file-utils-${PV}"
+inherit autotools pkgconfig
 
 EXTRA_OECONF += "ac_cv_prog_EMACS=no"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0



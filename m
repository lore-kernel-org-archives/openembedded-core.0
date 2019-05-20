Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB2F17E0AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so8401579wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IF+lK5r5zoeGkzEbeYQmcVHedJr6PRaNRgMG5M5Ryjo=;
	b=jcCK9i21z3o5sYuUiMD/bdv+AsqB3k9BauFtwiNUl/nGpH1SSjpg9S1b0z4L1Z/ztG
	GInnaYL7a3/SWMg//6t/DkpmdEGXNBinSR+8fIwcX29VYwg1nduWYz1dWd++h/4/GX/F
	3myByRDEz/PiC4kLXXrzTlVprYny/E1b39Ziinkd65Cxg49/uSAfhd7H+oiJSHKq1LoG
	TWvOKzf9Igmi6foj2oK53NoNmW5jR5MDS3BpcLTFacB54QwrtFGTKIWGTCblYpZ8vFJ/
	Mo8nt2HdUzPSKZn57IEjT3tbggDnftipUi3kJ+1ED4/NXxAQ6mklZpc0hOpiJ/Crb987
	K5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IF+lK5r5zoeGkzEbeYQmcVHedJr6PRaNRgMG5M5Ryjo=;
	b=Esr70BjuNPhj1Psub5EgI9DvWNqSlJoAO3EHnzLXEQo5SZzJ+8y5bNET7T49YtdGqN
	Xo9o5E6Ol+7f2Hbod1DXAO9Whqz2ch60Hxh01YeIAipSXYR0qmwDNDwYMOYJ66fkP4H7
	9Bs6e7rolz1c6MWDn8w62tQFh+Vw3XYj8jItBI90vQfbmRP4+czS/vPw5Nn/3yfD6VR6
	ecZsFixnXw0JG3e/+CEOt7Y5LvnMIlXRogfUaVv+1kM3f5w2KgG1p2wSWSqbb1gC1hPs
	t4ltieIAZB3BbIRY4m485e2PDkvSxKAR9t2jMJcU3OaWXDicTSfl+UrZC8Mlc/OCpHDp
	wL/w==
X-Gm-Message-State: APjAAAVYp4GAzXnEwU9G5U39oYK19C6N2jFpnygUOrEHO4TJSi5NiD4c
	eoHxCCVQI9RkDMTwRb0+BYGfJ8Ap
X-Google-Smtp-Source: APXvYqyajG5uiZtnquAgbz7Xj9alAqFwwmHl9BXNluuKv/g39ScLEVNdIURFeDbEgE/Sg3rix/huIw==
X-Received: by 2002:adf:afcb:: with SMTP id y11mr41315696wrd.97.1558361533483; 
	Mon, 20 May 2019 07:12:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:24 +0200
Message-Id: <20190520141125.10805-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 41/42] epiphany: update to 3.32.2
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
X-List-Received-Date: Mon, 20 May 2019 14:12:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.32.1.2.bb => epiphany_3.32.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.32.1.2.bb => epiphany_3.32.2.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.2.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.32.2.bb
index 49631d92d79..ff0e34f98d2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            file://0001-web-app-utils-Clean-up-ephy_web_application_create.patch \
            "
-SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
-SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
+SRC_URI[archive.md5sum] = "2a6672b22a0fdb869e5f0a415ac2da34"
+SRC_URI[archive.sha256sum] = "8ae70d9feaba3754c63ab249deeef9b7a31161a372655b4214f148ea2f440cfa"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.17.1



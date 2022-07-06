Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6679C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:47:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.458.1657144074960003320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a6/IwOR6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so9663862wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG/c4eXaT2pEUaTQY5PdWL1vuNgfJp9huai3/GXGCEA=;
        b=a6/IwOR6cWZmF/oIyq7p7yM2irhMiLgliWF0Fe5EKtkpNolHNyozRZ5XOO6ZbZHF90
         XkLfz2bjMs9ljX3DxHCJLwZ2H5QmV0tNGQVTjHEkGmc/Y/lDhGoZEbQfkt+qHKEY3JUY
         QPZftzMERZHF2gCpZvkz7iChBmTq563EZarF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG/c4eXaT2pEUaTQY5PdWL1vuNgfJp9huai3/GXGCEA=;
        b=Jcf3ofas7nhhRpD9uga9KYLtGyMCMm9Z8Az1WM41E8jgQ2n5oOb+yuR9vorE8/H9z5
         Hs04g5wB5BLyHQ5zircj+97oFnvFpB1kx97uqGOjHkWT44ryzm0gPikRQhaRGkrskTFT
         3+nULa+rsq3EKmQCAo5GhxCM3rjQUekXH9YyUE9BOvE2sBhyFdVLVJjijmqzzvy2Z2Pw
         IG6Swh0wzI5Pey2kVmGx81Z/PrC6eHwLOXuj0P/d6VjHPZ4hfRPPcMKQXGM5uAukQQBY
         CtFT7zbCaG32zpuS3tMBV69T8OcRcGK5RlZ1PtWHv/7YlR+S84ib1R0YvIkdhsUsgecN
         dGhQ==
X-Gm-Message-State: AJIora82rlq6UaOElKWTFNebtYLCdwU0BpxHJ5ibl2/7h/9NB8wjf1lg
	F3dH+AzxrhQKN6t0RqKad0PKVKOysTJtIQ==
X-Google-Smtp-Source: 
 AGRyM1tuAgP+dQng24r43G8hpIfuavMwvJHS0d2jiTHv0GYHQbejiAKero3DxAhcBdecS8QQS3fHCw==
X-Received: by 2002:a05:600c:6004:b0:3a0:41db:aae with SMTP id
 az4-20020a05600c600400b003a041db0aaemr691289wmb.171.1657144072816;
        Wed, 06 Jul 2022 14:47:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e441:58cf:44fd:9058])
        by smtp.gmail.com with ESMTPSA id
 q11-20020adfea0b000000b0020fff0ea0a3sm36169755wrm.116.2022.07.06.14.47.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:47:51 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] icon-naming-utils: Resurrect for sato-icon-theme
Date: Wed,  6 Jul 2022 22:47:50 +0100
Message-Id: <20220706214751.1035230-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:47:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167750

To add back sato-icon-theme we need this small util.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../icon-naming-utils_0.8.90.bb               | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb

v2 - Fix home page and license issue

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 18b0624af72..c55b2a09cf9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -261,6 +261,7 @@ RECIPE_MAINTAINER:pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-icon-naming-utils = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-igt-gpu-tools = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
new file mode 100644
index 00000000000..67cbd031002
--- /dev/null
+++ b/meta/recipes-sato/sato-icon-theme/icon-naming-utils_0.8.90.bb
@@ -0,0 +1,29 @@
+HOMEPAGE = "http://tango.freedesktop.org/"
+SUMMARY = "Enables backwards compatibility with current desktop icon themes"
+DESCRIPTION = "A Perl script used for maintaining backwards \
+compatibility with current desktop icon themes, while migrating to the \
+names specified in the Icon Naming Specification. The Icon Naming \
+Utilities map the icon names used by the GNOME and KDE desktops to the \
+icon names proposed in the Icon Naming Specification, and generate the \
+icon files appropriate to the desktop environment you use. The Icon \
+Naming Specification provides a standard list of common icon contexts \
+and names that can be used to make icon themes work in a desktop \
+environment or application that implements the naming specification. "
+LICENSE = "GPL-2.0-only"
+DEPENDS = "libxml-simple-perl-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
+SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
+
+inherit autotools allarch perlnative
+
+do_configure:append() {
+	# Make sure we use our nativeperl wrapper.
+	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
+}
+
+FILES:${PN} += "${datadir}/dtds"
+
+BBCLASSEXTEND = "native"
\ No newline at end of file
-- 
2.34.1



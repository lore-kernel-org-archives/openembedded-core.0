Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6B77D740
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 18:19:57 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id f23so15411995ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VR9q6zi7nkb6AAU26f0I0dAwHaltiqB08H7yRpQNI9U=;
	b=Ivno6IkH5L5A0pDSWO+lt/hPrBQtC3K2ZmyCiiPcDFYF0GbvT+gJAtTC5yVGHpMfMu
	Heya46C2V8TnS3ayAW6u/ttIqjj+4oZ9zB6lUKj/C7rXVZBs/EOaCr0ozRqb7Psayjpj
	U6/S2PTn8SgcBX5O3bWuW1ST0knTvCF2oUSbQwzKRF7+iQgmcr4DHFpKHObdDhhjrYBW
	7xcRvjHpytbTW+mv7BHHEwVirIHDvKzESL1Zv5Ihn4FqebVVie4NxoSWd86O2meuOf5h
	uh8KguO/Bj6Lfhw2lEJK8v1+WCDdUacDM7TmVr/jCq85agugqYhdyvFRQmsT25xTN9Yz
	FGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VR9q6zi7nkb6AAU26f0I0dAwHaltiqB08H7yRpQNI9U=;
	b=kZ51OA14QjGOqCYLoUfHcFA8aGBG2oJiLGkdaBvKGr1i4bINRuVjHCaoKeDqwJvmIW
	QaWUhkeLnal3ycfgUzeH863m269ayjzjfqyE92wMKr6NgZnwiaox1PTijPHS4yxVN5RL
	yLlBUubFYU7eVbqbWCCF5Y4N8eoH4T9FZIxVTL3JKuooPrRt9xqMjF73ggoT8DOPSvzO
	uwOd3jCmk20jbX+4BNT5qA3ogkvJd4tAEN4JQXXDTXVldY1iRU3LnuE82HeimEWkjoRp
	o+8f7yEoZookgn+alBsy9vHgFeRde4cBoQY+u82pIe5GJmAcC+AbBXmkPns1fiHG/8eu
	ggJA==
X-Gm-Message-State: APjAAAXvkM8tx7d7I3OUiLI6rLKcI1oyeLzKajrmJwDzmD6pnLpacYPv
	yTgQ94aTbHdste5IdAFBx8KU70jvpfM=
X-Google-Smtp-Source: APXvYqxvoKUGPwET7gvZX9W5blKLDkK7hth3KMVrB49K1T3V/wA517bVH5RnbJfr82RwDsNwqsgnnA==
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr10945997ljl.7.1554833998151;
	Tue, 09 Apr 2019 11:19:58 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v26sm6883405lja.60.2019.04.09.11.19.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 11:19:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2019 20:19:55 +0200
Message-Id: <20190409181955.13824-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] ell: add recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 18:20:04 -0000

ELL has originally been part of meta-openembedded, but newer versions
of some of the poky components depend on it, e.g. ofono.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/ell/ell_0.18.bb        | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_0.18.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 950b8e8951..62de7d21bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -165,6 +165,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell_0.18.bb
new file mode 100644
index 0000000000..ca27f4dcda
--- /dev/null
+++ b/meta/recipes-core/ell/ell_0.18.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
+low-level functionality for system daemons. It typically has no \
+dependencies other than the Linux kernel, C standard library, and \
+libdl (for dynamic linking). While ELL is designed to be efficient \
+and compact enough for use on embedded Linux platforms, it is not \
+limited to resource-constrained systems."
+SECTION = "libs"
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+DEPENDS = "dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "18e2be697a54811e49bbe34590a13a42"
+SRC_URI[sha256sum] = "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a1748d9ab8ac4ee7e3"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
-- 
2.17.1



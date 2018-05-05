Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5E06D74D40
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:34 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id f20so9817049pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=82ROawBEAeIENCx9rmrG/1VD2PG8n9XJ8SMT+J0mAQM=;
	b=JQcd88VMzh7DngRrshqQEqkQ8W6Xuuma7lO8OxN9Bv5YwY385jBifxeflg1KWn8N0a
	uSKBMoMwCyUjNLaieoApwpEqb6u378nGq+lMSJV1heA4L46zjWpdIKh4PrQmzrakyUT7
	vwZv3xZEKhZf5ptn36i1u0leRj/qdpLCaKUXPbJy9/7Ec/emLEm8xyhCMkxIsR3/QTE9
	wFtpKhlRsVv34mnnOwcZMcXLzys5H97iT4rGEvIvObhu9P7on5SCz5nYeM8xxvWoIYbd
	KB71RKr8Jcp+5MyaWHoTwNbiagvJQvOwEj1IUmbWw+sT/k3rial3461tO/JEka6hj+wV
	JP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=82ROawBEAeIENCx9rmrG/1VD2PG8n9XJ8SMT+J0mAQM=;
	b=UGfKxCgoI6RAFuJc5mscepk+T6GtL6IbkiRelw9i2jiLaXy/jtYVuOsPzsV/SXo8qV
	eE4inrj1JIZIEB8dSUWzMuW0S8pM7F8oS5jnrW0Xxy64PlVxDLvmCEP4ocA3S80LvhoD
	/PwcDZ7KA/srfRU/ewlDxwSg1xC0LTTAfREkOgxyJMIHHKdwcMKxj5t4eGRYFQ165fn9
	xiwzmWf5jGDIexhwln/KjDiH+u+O3VvZXVJCNp55DvpBC/5opgc2wY16KGyDWQJtM6CQ
	Y76t+7wmEAy/FKgjy5vyPkY2qqON42X6b9T0CklHQZybpvpqLAQC3GtnFgKdsr65BiqE
	0i5g==
X-Gm-Message-State: ALQs6tClULx18meS9wBiTK8h5o4sY5hQKmzn9hCecyzGHQG8XUKrACa3
	DLu3NSUTXv21Kz1Y1JF20T+YmA==
X-Google-Smtp-Source: AB8JxZrVV5VeT1ycZOuAOcWoDPTwP9icji4OSqKejXfJF1lVnBgwJGekalerXr6V35hqjJiQvttS5w==
X-Received: by 2002:a17:902:6041:: with SMTP id
	a1-v6mr29451062plt.59.1525479275954; 
	Fri, 04 May 2018 17:14:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:05 -0700
Message-Id: <e684cecc6a2c9c520df8b98da2e211223664c8ce.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 11/27] libnss-nis: Add recipe
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
X-List-Received-Date: Sat, 05 May 2018 00:14:35 -0000

This will substitute the glibc nis module which
has been removed

Skip for non-glibc systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../recipes-extended/libnss-nis/libnss-nis.bb | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/libnss-nis/libnss-nis.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d7d0c1e2da..d8fc181879 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -349,6 +349,7 @@ RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libnotify = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libnss-mdns = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libogg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libomxil = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libowl = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
new file mode 100644
index 0000000000..e0f69b02ef
--- /dev/null
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "NSS module for glibc, to provide NIS support for glibc"
+
+DESCRIPTION = "This package contains the NSS NIS plugin for glibc.\
+This code was formerly part of glibc, but is now standalone to\
+be able to link against TI-RPC for IPv6 support."
+
+HOMEPAGE = "https://github.com/thkukuk/libnss_nis"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+DEPENDS += "libtirpc libnsl2"
+
+PV = "3.0+git${SRCPV}"
+
+SRCREV = "d4aea48657a8e90d7922574b8021ee03915a36cb"
+
+SRC_URI = "git://github.com/thkukuk/libnss_nis \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
+#
+# We will skip parsing this packagegeoup for non-glibc systems
+#
+python __anonymous () {
+    if d.getVar('TCLIBC') != "glibc":
+        raise bb.parse.SkipRecipe("incompatible with %s C library" %
+                                   d.getVar('TCLIBC'))
+}
+
-- 
2.17.0



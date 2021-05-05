Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.9835.1620227988440119441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fFMLmT23;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id u21so3418019ejo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6vrTaWgYRYWKrQ8+D96qAXtFzFaqd16lUZ/WDfT3Tc8=;
        b=fFMLmT23B7puxn1zh7a0RLScyQbIzFShG/qih0N5gW/S5QrtJkXpqD8x25DwpcB6yn
         /zEm0awssviEdD8gga1DFrr0Y2HzxlmGsv6RTNoYphsiaePUrRnMuqrJR7166zGs9QJF
         r9YnGF2nski8SWLPOzJqYT4i9SiQX26f3SlY9TXH5f2V0LrjD2MlNTUsUpDC3SG+cV4z
         AO/DePB8Q8DIATyhUVLF4Wa0yEhxjSE7H8TqsN5wzMK7yERqOQ1VPPXyFCZn2RRClk7t
         KISrCmnEUusCrxcqSgZiS7PHFK7RfWkJdun1rMl/xYWR4mmBBBaB5sTPOns712/O7VXB
         tV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vrTaWgYRYWKrQ8+D96qAXtFzFaqd16lUZ/WDfT3Tc8=;
        b=m4uUvMxJgjjaV2HDLfOEkk7GcFgNBZ2TvXBwpipO0V2HS6P9Ymc/1f4mwchMAZ1R2Z
         7PRFLSw79Cf5SF4KCZroPkbU5eOLkEZUTdzlV7veQiuJR+zmVjrshLyWYvLZX736GIK9
         k50K0glSvfaGgOk1H6g6tzFG0/OgRmLjm4ygIfFTEWarcOmjI758SN5QuklezueL0Q2i
         IEjQj4Vae9m5szjyCK17VDhfeLzo9mT4drOuXKI5l+qEDKLU04Gi1ztbS4V4sTmX+KJA
         OfZi9J95dBRDw8kJaBQqqW1vqH5sv0UbHv5FJEgJZu4lfyGsnN+uSiwLBjPpOxCacMu0
         hJyA==
X-Gm-Message-State: AOAM532/CudLIJPDbHYekL/Ia6TqHBf+4QxvgvmEvUvetAPMJjQSFkuO
	XAJDZ8Lc4zEPz+7rTLb1akzsdhk8J/ytYA==
X-Google-Smtp-Source: ABdhPJypLGtI4oXrYHSEDONO02PQq7tg1CHexFTk+ZHuyLB8aMETxkHREzSC0kx7URLpLYHLdNwP9A==
X-Received: by 2002:a17:906:454:: with SMTP id e20mr28553504eja.17.1620227982415;
        Wed, 05 May 2021 08:19:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
Date: Wed,  5 May 2021 17:18:46 +0200
Message-Id: <20210505151850.660512-57-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to enable gi-docgen, a successor to gtk-doc

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc           |  3 +++
 .../python/python3-markdown_3.3.3.bb               | 14 ++++++++++++++
 .../python/python3-smartypants_2.0.0.bb            | 12 ++++++++++++
 .../python/python3-typogrify_2.0.7.bb              | 14 ++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-markdown_3.3.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-typogrify_2.0.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 140f7b490e..0c3e3628ba 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
new file mode 100644
index 0000000000..c456f05541
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A Python implementation of John Gruber's Markdown."
+HOMEPAGE = "https://python-markdown.github.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "Markdown"
+SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
+SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
new file mode 100644
index 0000000000..8acc971c35
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Translator of plain ASCII punctuation characters into 'smart' typographic punctuation HTML entities"
+HOMEPAGE = "https://pythonhosted.org/smartypants/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "smartypants"
+SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
+
+BBCLASSEXTEND = "native"
+
diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
new file mode 100644
index 0000000000..3becb0dd8d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Filters to enhance web typography, including support for Django & Jinja templates"
+HOMEPAGE = "https://github.com/mintchaos/typogrify"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12bc792d6f5415dbf421f3fd183c6dd2"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "typogrify"
+SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-smartypants"
+
-- 
2.31.1


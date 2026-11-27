Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3714.1795810326810160537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mmPgXHXj;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so69041155e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810325; x=1796415125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvbvhKs7HbK7Mb/c5vuWkKgvd2f+wxMqiKJYOlm+AAw=;
        b=mmPgXHXj3Mwd4uxvgTkLNdzvUHykrOqOAbaAiKMDQPVpFNNaGgusfET0fNRmd8fVVj
         zqq+eaEGHdJ5kAuVGImI+kPe3+kDvQQ9wneW1i2tc/l9+ofbMV6I6Rnt3oYP2+v3MMYa
         VXlO2t15aLinOssMk8NEy8hvqa3elHyHyWYIYnOS35cLp/EO0tjxcMfoUS5lRR6WgG+A
         e23Vd/5JJKQsSlx2E6B/s0Z2bWhB9xV3PxYedG7i6iwTgDH5QEIFP+ZhnvPE0EklZUIv
         JwBbowTfP1BDyQf9d8PZC0swFGGqzBguc27MquvbY5G39i1hU33u8Hqd3xv17lQW4P7t
         BHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810325; x=1796415125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvbvhKs7HbK7Mb/c5vuWkKgvd2f+wxMqiKJYOlm+AAw=;
        b=EJzfPzlBuPIDg6eU7XHDmFjDLu9gERS/nqKwTXdAUhjQbcwLBgGTrpT2nkzv9NfO+Z
         ywT1KEjN0/d0FvhiBfZ7c8paLfFWJ0eXWL1Gt+DaiSOpqEELBD2Mjs7Qq40iuLsI8CMK
         bYUWyyZz4qdwHQpNDpLn6wRTveYMbU9xMbm/h2POmyshbazn5tPw6UJ0FqY9lEhUWvVU
         E0iZtzVQ4Z8WqrpKivDsjkc122U9b3HUgWPGVu7dDsFc3x6CgtGnoPJgukk+blMFa0Bl
         C3KQ5BkK9FBSwDP/41S5uhQ0rTahRFmIz8Jnht0HJFhL3kWsMi7pGC/ztZ9kYGBGU58J
         yrnw==
X-Gm-Message-State: APuU4Z/dU5oOO4cNc1zf8r1VcZkFu+5fWBUDQxbwwGZX/SYf5Ses2ehY
	fiEyGI1N9m8M6K5Jt+5zWj35H0z/EMQeFOt7PQ53Q/BTEUZhODwR2S0e/eI/VA==
X-Gm-Gg: AZFdTZfqIkU5gxRXTN1IpIGCb0zWsZW+OCezFU1b0L0a3Eg8uRgavKPh0lkrGiFVUfB
	cVJOmWm+ICpVQ6cG8F4QoleEhiNybx3ApZV7Jfp7KeIzIIFNF975Z5cQhzheSb+isVYiabhd5dA
	ziipokBILt1Gucx1whlXDuf6K9WnmAmdS3Xc/5BGBTdgWSNHdRhpXI3K2lMNsDPIFAQc4tm59/F
	8K6aAg5UV5mqKSwHQlYYxHyC3vYc0XVGvLg9BpqIJCn7UztC8KLwVx7Tawcxcdcjrm4bZsblFjN
	yWknj+V05Em5Tr2hhfsRVw5LjXDH+kWiVBxR4V8Fyz6fyrWfkeDgzstA3Kf2PkLXS6+/CavEwRg
	Ike4uAVr7kAbBkeSBjrM0PvVrtN4sKpD7jhBZfjEUYs/GF+6tPYGDpq0W17HzfveigqlBs+irH9
	lZ6PSjP+6cCnl9jZm74j6URluWu/u3bdiJ2M7EZ/hPvIalS/FqzRA6cCkOlRV5E49W9RS7iiVib
	8VHZqR5j65oNpR1pcieA8UMiz5C6a1lYtmpAZHHlsOF8qUFKFnnWHXuIrv1RRgMGo+ID0lMymJq
	//DkpNBFc2bXhyeXv+PSfc/9JD8WNOtaV6GBDjshptIzTKz0DnGIlWCMxi7DRYdkCw==
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr559261785e9.30.1795810324844;
        Fri, 27 Nov 2026 12:12:04 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] doxygen: move a recipe from meta-oe
Date: Fri, 27 Nov 2026 21:11:54 +0100
Message-ID: <20261127201159.914833-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251448
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

doxygen is used by wireplumber (pipewire session manager) documentation
in a way that is closely intertwined with gobject introspection support
and is difficult to separate. I thought it's easier to just move doxygen
to core, given that it does not itself require additional dependencies.

The only change in recipe is renaming DESCRIPTION to SUMMARY, as oe-core
requires presence of SUMMARY.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../doxygen/doxygen_1.18.0.bb                 | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/doxygen/doxygen_1.18.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 62de04001e4..6e92380c592 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -162,6 +162,7 @@ RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Kanksha Paturi <Kanksha.Paturi@windrive
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-doxygen = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dropbear = "Harish Kore <harish.kore@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
diff --git a/meta/recipes-devtools/doxygen/doxygen_1.18.0.bb b/meta/recipes-devtools/doxygen/doxygen_1.18.0.bb
new file mode 100644
index 00000000000..222d7766205
--- /dev/null
+++ b/meta/recipes-devtools/doxygen/doxygen_1.18.0.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Doxygen is the de facto standard tool for generating documentation from annotated C++ sources."
+HOMEPAGE = "http://www.doxygen.org/"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "bison-native flex-native"
+
+SRC_URI = "\
+    git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
+"
+
+SRCREV = "8e760943e5d9581a444cf327f43a0b4d20d29482"
+
+
+UPSTREAM_CHECK_GITTAGREGEX = "Release_(?P<pver>\d+(\_\d+)+)"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE += "\
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
+"
+
+do_install:append() {
+    find ${B}/generated_src -type f -exec sed -i -e 's;${B}/;;g' -e 's;${S}/;;g' {} +
+
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/mscgen_language.hpp
+
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/ce_parse.hpp
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.16518.1591198492378574607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lb9KD410;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id x207so1842330pfc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wdo1EwnlT5a7HwU1/pZBHEJgLqlRxfC9ZuuAECuGUzw=;
        b=lb9KD410dZfcLJ4b9aE88rutx2Ad/6f2nfLwvzG4j7eXT5IqePGN9qluLs2XzD3Gg2
         qfHVPrO7YDy9ajxjumTpBx8z+XAayQOhSKgcQKqww+IjeeEMxaLqxJyWbyQVdywxACl9
         eN97rUTR3lkFypVLTIV3/DM9egFBJ4zbeyhLEAB3Prtrdy/k2r5kCMq3btJRLb29dgPf
         DcRnI6Mk44QPnMfQalRwycAfNWPDzNDUiqTFxgk2aIr43sueHEGRAwNcHjdezVyxCzhe
         p2wik8p2H9uhq170je5MUpFEVlVJfQA9jrgHJ51+pcPSZ1ViQz+naR5sKUE3GYLZbDtr
         fOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wdo1EwnlT5a7HwU1/pZBHEJgLqlRxfC9ZuuAECuGUzw=;
        b=IcLdC8a2IC9iq3483UlVj63vgGcwU0pzLPcH7D5GHdOTi2F2TqSMkiVnyENe0Hp+cy
         7Pu6nCIEFQgVK6OKWgEtrRLMwDzGTR8tZzt531pEz8E4/GID7VJJuUIr/h2EMRae1xC1
         VutTEAB+I0MwK8MNXS1gwmU58ZShBngobJ3dMZoRO02brRlhFIQvqOGkixISJNUNymn1
         kueEX+Meb2FsS+9TNI5iGTJpnfM3doqKTGnCiYD8BkRDPhwzqSfccDKVwSwJ7JKLm5JC
         JIV/ZuXPLmMathrIk7P8Aeq+iuaB7f0CPyHFnrNBX4EWBPAaPaHS09BkVlbgSS7R/ets
         X2DQ==
X-Gm-Message-State: AOAM533TVNto08u5dNNIwsKsDMQUoiruRQz880OcTd/JcV6IVQHeVCQH
	y+M57GdDpGxoBKtPsarMD3ETpDZ807Y=
X-Google-Smtp-Source: ABdhPJxse/HlYuzqSBVPAHL/HBpehRw7PWwoCEATQEUDbOvaGIGNasPxwcLhXhP67/sJMgx66Gshcg==
X-Received: by 2002:a05:6a00:150c:: with SMTP id q12mr30576107pfu.270.1591198491372;
        Wed, 03 Jun 2020 08:34:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] pyelftools: Import from meta-python
Date: Wed,  3 Jun 2020 05:33:59 -1000
Message-Id: <0a8cdaa90f4dd2d09b0b471dafd868a4dcad4ed3.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
References: <cover.1591197295.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Imports the pyelftools recipes from meta-python, as of 7c02c7d41
("gnome-themes-extra: correct the recipe name").

This recipe is commonly used by other layers, so moving it into
OE-core helps to cut down on layer dependencies.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 910ffaf5beed42936588c95b0c7c1b1ad67f99d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 +
 .../python/python3-pyelftools_0.25.bb              | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a20a1d810a..a429b70e9b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -590,6 +590,7 @@ RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-
 RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
new file mode 100644
index 0000000000..03d96db3c2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.25.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
+HOMEPAGE = "https://github.com/eliben/pyelftools"
+SECTION = "devel/python"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
+
+SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
+SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
+
+PYPI_PACKAGE = "pyelftools"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


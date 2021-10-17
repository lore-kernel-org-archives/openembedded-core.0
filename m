Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F96C433FE
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 01:41:47 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.18008.1634434899422198887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xr4g2qFh;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id t184so10934093pfd.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 18:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RhnyTyhoY6sG0bmUxJmPoEDBe7uWJm/05meZp6pGnxU=;
        b=Xr4g2qFhvzhZpBjUDF15AhFk+Wm/D1eA0ESS/U1g4jR0Hwdl9N2XMUsGbqejoWX60p
         3l8svh83jpbUx7JKTap6ZffHbnbETVPL6jk1zpAfwIsIqf3bqTvYmJO15vc+Y36FTZ/6
         foBdT4Byhb8qavQ65m1v5oCXE6mjShYM1d0M71Xpk7cHRga4ihf9uc/mIDIfZ+6noQd9
         sISdvaLHelifB9UkHYfJm0UzgfMx/BSJSD1oNLZ/vVUTFIkeZgDm/az4dxXaUFzMCEzP
         zvgu5KTqRjVn+uRHfpt7zulaTCHa+6pqaQ7RwBMUl0m3smTEWz7GkSBwPPt38r65aEAK
         NHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RhnyTyhoY6sG0bmUxJmPoEDBe7uWJm/05meZp6pGnxU=;
        b=n45mQnd1odpGFD3yam7mvNs/8QVYQwTyoQwO+rCPKIdenGqE630QZfDh/zB1TxAxBN
         /ZkkTKnEd4dhS9MuQycxBy/hncyjM0ZRudfdqqWfB2hRgg6Llv5GqLW1AfHfj0rSYEzt
         +97jdfHEK2mjtVpnnQUwOmL18GxTbVobhE91z68uPju0EAJU1VufcmEvQfvfqxNkGhyX
         4tQZQGodRdBz45N2DyD9tAcmmZUrSPHvCormowbMilVuFUHCBgPe/ybeMDST/7vWMZ+A
         W+tp0acZ1nnfDu+gks4CzXWwj+7VYep22wCfNbE7AJx5f6Oz5U9/QHblPt68krmjcnsW
         xKVw==
X-Gm-Message-State: AOAM531OpXFhGyfWB1Je6tdB0kEBY7/5jArHNzP0achPKFapxQXGxeln
	2u6wDdScZe3IVwxmekUIXyuSfN0M0jI=
X-Google-Smtp-Source: 
 ABdhPJyu7XEey4ZvEM+7TLT421XPOwWGFYPKDBdrkdlgyffAVJdBvP9ES02g9UOVkCXh6isRnq4MlA==
X-Received: by 2002:a63:8542:: with SMTP id
 u63mr16306470pgd.402.1634434898795;
        Sat, 16 Oct 2021 18:41:38 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 gf23sm9227891pjb.26.2021.10.16.18.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 18:41:38 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/3] python3-tomli: add recipe for 1.2.1
Date: Sun, 17 Oct 2021 01:41:20 +0000
Message-Id: <20211017014121.414803-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017014121.414803-1-timothy.t.orling@intel.com>
References: <20211017014121.414803-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 01:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157022

A lil' TOML parser

This is a runtime dependency for setuptools-scm upgrade as well as for
several other Python Packaging Authority (pypa) tools that will be
replacing distutils and setuptools in the future.

Upstream does not have a setup.py, but rather relies on flit_core to
build. This introduces a circular dependency, as flit_core has a runtime
dependency on tomli.

Borrow a setup.py from Gentoo until a better solution is found by
upstream Python Packaging Authority (pypa).

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../python/python3-tomli_1.2.1.bb             | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-tomli_1.2.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3ffb065804..baec2bef4d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -637,6 +637,7 @@ RECIPE_MAINTAINER:pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@in
 RECIPE_MAINTAINER:pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-toml = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER:pn-python3-tomli = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <timothy.t.orling@intel.com>"
diff --git a/meta/recipes-devtools/python/python3-tomli_1.2.1.bb b/meta/recipes-devtools/python/python3-tomli_1.2.1.bb
new file mode 100644
index 0000000000..f62690ff2d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-tomli_1.2.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A lil' TOML parser"
+DESCRIPTION = "Tomli is a Python library for parsing TOML. Tomli is fully \
+compatible with TOML v1.0.0."
+HOMEPAGE = "https://github.com/hukkin/tomli"
+BUGTRACKER = "https://github.com/hukkin/tomli/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "a5b75cb6f3968abb47af1b40c1819dc519ea82bcc065776a866e8d74c5ca9442"
+
+do_configure:prepend() {
+cat > ${S}/setup.py <<-EOF
+from setuptools import setup
+setup(name="tomli", version="${PV}", packages=["tomli"], package_data={"": ["*"]})
+EOF
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2



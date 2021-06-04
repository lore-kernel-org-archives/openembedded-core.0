Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.5972.1622797844293646272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cThGuJZ2;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id ho18so2439942ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P1MfgVUIWIea0HGuywDqUNdzjQ00v+ksbIr+eETLX3E=;
        b=cThGuJZ2bSFTFWIKsNKkK6s/B4ndIsbQdhLoLrIk1MLCoJ/BtBLr73zHBg+766jEwv
         lq1R5APykgF/aAs0ib04TSRFGAkiDQefnTE6H6LHhbqmuJ32VyjhIEgkq+URio4wdDl+
         5WLcP6qqE+wh+tTHtcza2GmqEp+RvAHJHrMeGkrECm853OYpJ3WWZqqHAcjANH9CqenX
         y4UMBJGPZnejdTU1ih7IkL3i6afnw+jZ0I01Zftr8QhLJ2pXSFCXKyLbMRI1Ab4OMJTm
         PEkmMzrSpYErYqpPRxoTtddVyvAnM0tK6vJPcl2Rk86bKJp+0bODGOFeL9MlgCjwAbW0
         m0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P1MfgVUIWIea0HGuywDqUNdzjQ00v+ksbIr+eETLX3E=;
        b=slcdi5E0ipODVOGVmo9BjY/X4DtMxBTaHTn/E9znsEg6S4RrMv6kjgwJI9nRVt0+8P
         e5CIhRZyW8XPH5KE1IuiM+ssV+jZ/o4WCm+zv6CpFuPH1ocSjKETYgzfWPQ+dsrYkSVE
         910IKj7iWJ/6Vj39j9EJ/DvUQ3LGwnhQK1rgzyVIwt2tXrhARWoI9C3YDm9TxraScTSH
         XweSm2rjdsV1+7cohlpkiqHwGnIhR4uspWwGWkGmWeCoRECpqw4LkpNg3J49ioEcWtGx
         PtgqCjkaHX8NQ3YdIsrlneJOzaIBqXKn0Deatkc8cs454eI24NOu9Nvfhwgau6kSnbIN
         euEw==
X-Gm-Message-State: AOAM533wpSxaBpeHsElVbuGjueUXp9u1gavTT2CPQ95HW2MtMYPmrQ7O
	3BhnOdreFPuYZFzU633TpurGAFI/6epL8Q==
X-Google-Smtp-Source: ABdhPJyzBKxLXnI9YEgX5ZDn81PU7vHojGsLiDNwzk5gVOGVipOyL9qmsSharnD1fJZRSG3c1JvWnA==
X-Received: by 2002:a17:906:4d56:: with SMTP id b22mr3154583ejv.78.1622797842925;
        Fri, 04 Jun 2021 02:10:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/11] perlcross fix
Date: Fri,  4 Jun 2021 11:10:30 +0200
Message-Id: <20210604091030.1380877-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc            | 2 +-
 meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6024d57717..89dec1f86a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -558,7 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-perl-cross = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-perlcross = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 83b7b415af..339075f0c4 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -8,6 +8,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 # but is not provided inside the release tarballs
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
 
+inherit allarch
+
 SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
            file://README.md \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
@@ -27,9 +29,9 @@ do_configure () {
 do_compile () {
 }
 
-do_install() {
+do_install_class-native() {
     mkdir -p ${D}/${datadir}/perl-cross/
-    cp -rfp ${S}/* ${D}/${datadir}/perl-cross/
+    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
 }
 
 BBCLASSEXTEND = "native"
-- 
2.31.1


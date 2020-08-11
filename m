Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.3434.1597186160196472133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 15:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KLDhgfwl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id y3so282758wrl.4
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 15:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jB5rg1c7XlMlbsdQaw72fGUwEjpbUULBcC2+Cpk06IA=;
        b=KLDhgfwl2LzX93QZ+vlOr2jpB0sefcJJ4wL0lbOHOJiCja8NMOeyietfpPSOsU84JL
         Me11+CPzGzp2qL32gXAQ1AT5mKqa/FXaltKrj2tQ1WwB5FkDAiuEV++0w/7xYXxdw66u
         kEQWCejlJ/Ths8Ntdftmro8DLnXcFn6h6z5vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jB5rg1c7XlMlbsdQaw72fGUwEjpbUULBcC2+Cpk06IA=;
        b=OAyqZDr+EOkrjvWsqQ41PSN8Os08h9WfkUQpFZR3drW/tFmInqQo0P6KH4flAzxXpZ
         pvkqCq3Cmi+tbhxnNnzQOYU+bvN+L9GL4HgbbNNfmb8eP9pnVX3he5UMppKdPNmcRVpy
         eiNSKv3FlezUsVN0fDupwAJ2rq3HTXa3sMVSuRPu0AOy8eaMaGYgvmjpiG9JD5yVa+Hk
         VdcYbopwlSep4rufnMVD4G/4YnmMTjDn9EIUF7kaQzYJSxrhZ/ljEF2EtA6YZlelywe/
         2Il9C6o/tLWSffOfQPZ7mljYjkUScw+74FZCcvfiXFpWba2XPCefVm9MTdUwwy3wUtoO
         RkLA==
X-Gm-Message-State: AOAM530yjQugz/sQaPfcJ12tdD4vAz3HSoeknCusz4IPSSZ1Qn4RKxH1
	lRsO3ds1xma+opOjvHVbVxLBC5qC6wLF5Q==
X-Google-Smtp-Source: ABdhPJxpj5qJ/C6UF5/dZIKTwGU9lPDO/f9Xt82nm+ZnMA6zZ/VALR3keEQNKVjn1+NHjo+LReZi3w==
X-Received: by 2002:adf:9795:: with SMTP id s21mr30550858wrb.418.1597186158415;
        Tue, 11 Aug 2020 15:49:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.a.c.c.d.f.6.e.e.7.9.e.9.0.c.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:ec09:e97e:e6fd:cca9])
        by smtp.gmail.com with ESMTPSA id f6sm483752wme.32.2020.08.11.15.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:49:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] build-compare: Drop recipe
Date: Tue, 11 Aug 2020 23:49:16 +0100
Message-Id: <20200811224916.895597-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200811224916.895597-1-richard.purdie@linuxfoundation.org>
References: <20200811224916.895597-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we no longer have the packagefeed-stability class, we no longer need
need build-compare as it was the only user of it. Therefore drop
the recipe too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../build-compare/build-compare_git.bb        | 29 -------------------
 3 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/build-compare/build-compare_git.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 2f9e1b11328..56055f7798a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -22,7 +22,6 @@ DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
 DISTRO_PN_ALIAS_pn-bootchart2 = "Fedora=bootchart2 Opensuse=bootchart"
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-build-appliance-image = "OSPDT"
-DISTRO_PN_ALIAS_pn-build-compare = "Opensuse=build-compare Fedora=build-compare"
 DISTRO_PN_ALIAS_pn-builder = "OE-Core"
 DISTRO_PN_ALIAS_pn-buildtools-tarball = "OE-Core"
 DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3d29af40d68..285553b4f3c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -80,7 +80,6 @@ RECIPE_MAINTAINER_pn-bootchart2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bsd-headers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
deleted file mode 100644
index 74a954db469..00000000000
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Build Result Compare Script"
-DESCRIPTION = "This package contains scripts to find out if the build result\
-differs to a former build."
-HOMEPAGE = "https://github.com/openSUSE/build-compare"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "git://github.com/openSUSE/build-compare.git"
-
-# Date matches entry in build-compare.changes and date of SRCREV.
-#
-SRCREV = "102d844ce052c6dec6c56ee1d471bde72a1b4633"
-PE = "1"
-PV = "2020.05.29+git${SRCPV}"
-UPSTREAM_CHECK_COMMITS = "1"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 755 functions.sh ${D}/${bindir}
-    install -m 755 pkg-diff.sh ${D}/${bindir}
-    install -m 755 same-build-result.sh ${D}/${bindir}
-    install -m 755 srpm-check.sh ${D}/${bindir}
-}
-
-RDEPENDS_${PN} += "bash"
-- 
2.25.1


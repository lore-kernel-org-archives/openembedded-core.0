Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1601.1794529995706515404
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 16:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gCKCb0MQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so373524a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529995; x=1795134795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDwR1H07fJk3JPoW+0tbL8PpvywvtKa+sUpb9A1JJLM=;
        b=gCKCb0MQL+kwN7dkxQVJTvqENLp96Kn8jqqQDrE/TyaAxTYihJyNhsmgK+OJ+obd4b
         p094+5ixYXWxopaUvnCfhoFDekcMl4ka0I831Es5W3IdPObV8xjjsFXQiK9Z+sYWkyrN
         XrvCpONfqRF81VdZvpDI7NAITqJWw0+f2Lxn9Pb/67mAcWviqyXpE1KyFmg1GMiutv7I
         WCFOEuJeT4m/lpu4lduglMEgMBFfAk8BaIyp/lUWAkwLtRz5w5lp+P6JdD2VjyfYgUq+
         bWkhy0PzJOc9PqKhRV6kq6WvpPYkH+ojcNAQoHa2BKxGvEqNTbnfwoigxC4Zr5yCXcoy
         3dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529995; x=1795134795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDwR1H07fJk3JPoW+0tbL8PpvywvtKa+sUpb9A1JJLM=;
        b=DzMVdGkKWrIGsLLZfTJAhiZKAm3LV2Nqk2QJShv0CdNc7+8FKOQV71zO4a9FGmOPZ6
         RCIWrYXvSS4T8yWS5m0QvmN7c/fJTJPeKIRfg2qJt18WxINaDMB/WEFx52BfvzMVoiVp
         fXFooiYeIEEf8mMrak7hYUjdCEIdYDzIkY55k8OYYhYXujrk5XyjXi4ncXJu8oxkad9W
         aOCzSFvUgGBMTsBvnA1trd9YgtVokpc8r+AyOGNNUwUFmbTO85x6Yq+KHOqVJ+1Bc2bB
         Al/Z0onZdTdnpxTAxGpzHWGQoP92o0Dq6NFe47sYqgWw2hzXFGcFuBtmpE+ZNUsac0bl
         41GA==
X-Gm-Message-State: APuU4Z9MGK6YyqvHj9BgaBRwaaF8vsoHdo/fYfRbN0zFKfb6bYUt5qHf
	6osqJuMVyM0miyyNeI/dytXViic8VENW+NU1ArS6gaxYoCZ/lAqgj5xBmw0THA==
X-Gm-Gg: AYBFou2/aLxFF6pn8iSm+LDRoSJnCyTFB3quiKQ03+mGxrb4DbgDDSPxP+1LaOVREfw
	AToiYC6AnEOxwla493R7cM/Vs5iagtXx/MJHaT6Tho1XU4XWeo4/IaccE2BNpjKAWPSgVK4rTEN
	D5QAHSSfOSsiU0SD8guVbaoyi0mHUJkjl5j5OZ4A/33qu7hGKPj1qaZsUBFoVyl1w1UDk7Df7HK
	EhhJaDlAKT17qvEBheYBcTTibzZvHEdNHjiwqBAVUk7JKfYZtEfpMvXUvKm4ESCGvDF9uza8N19
	ujIAK70aM1ZYggwRp2R1WyAUjzVc8RjrSYgQcgLgE5Z1rimUA2ilD+NS36/E5LfFRNlP23c7Pkf
	QM21gKwExQVcr9rehq9QpWpYGGcecYXPy24Z4xB8Nk8iKaAUMzLv1BCiJkcBuqcClTSKjOg7kg0
	2QaXfvAw4xGsAbmVznLUyGqT63c1e/s1e1QPqUUphOa7xwwWy4g2x04EItkMNLgFUuWs9j3+rMY
	S454P6GKy4RsmBkCAFs3cnqbLkUhFhX8efr93c27kPTD9gMcHEMizEKP853uOa866ZZGza6eq/b
	M5AhTwP2IOrhBC8oX7+9WDQ3A8OJHllNLlo6xjteXFvRwjuO/y63XbUn
X-Received: by 2002:a17:90b:1b01:b0:3ab:2d46:1dd2 with SMTP id 98e67ed59e1d1-3b1b08798bcmr602641a91.6.1794529994969;
        Thu, 12 Nov 2026 16:33:14 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm388932a12.8.2026.11.12.16.33.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 16:33:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/5] libclass-inspector-perl: add recipe for 1.36
Date: Thu, 12 Nov 2026 16:32:58 -0800
Message-ID: <20261113003302.20809-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113003302.20809-1-tim.orling@konsulko.com>
References: <20261113003302.20809-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 00:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250133
Content-Type: text/plain; charset="utf-8"

Class::Inspector is a runtime dependency of File::ShareDir, which
XML::Parser requires since 2.48 to locate its encoding maps.

Tested by building target, native and nativesdk and running ptest on
qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../perl/libclass-inspector-perl_1.36.bb      | 36 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libclass-inspector-perl_1.36.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0a7bc016e0..c0f0dd44c1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -326,6 +326,7 @@ RECIPE_MAINTAINER:pn-libcap-ng = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Venkata Adhitya Navuduri <venkata.navuduri@windriver.com>"
+RECIPE_MAINTAINER:pn-libclass-inspector-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bef45bb4d5..7e1267f7d6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -34,6 +34,7 @@ PTESTS_FAST = "\
     libatomic-ops \
     libcap \
     libcheck \
+    libclass-inspector-perl \
     libconfig \
     libconvert-asn1-perl \
     libexif \
diff --git a/meta/recipes-devtools/perl/libclass-inspector-perl_1.36.bb b/meta/recipes-devtools/perl/libclass-inspector-perl_1.36.bb
new file mode 100644
index 0000000000..b65c6a1370
--- /dev/null
+++ b/meta/recipes-devtools/perl/libclass-inspector-perl_1.36.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Get information about a class and its structure"
+DESCRIPTION = "Class::Inspector allows you to get information \
+               about a loaded class. Most or all of this \
+               information can be found in other ways, but they \
+               aren't always very friendly, and usually involve a \
+               relatively high level of Perl wizardry, or strange \
+               and unusual looking code."
+HOMEPAGE = "https://metacpan.org/release/Class-Inspector"
+BUGTRACKER = "https://github.com/plicease/Class-Inspector/issues"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2a7c9eabf506fa8737d9971cc308b473"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PL/PLICEASE/Class-Inspector-${PV}.tar.gz"
+SRC_URI[sha256sum] = "cc295d23a472687c24489d58226ead23b9fdc2588e522f0b5f0747741700694e"
+
+S = "${UNPACKDIR}/Class-Inspector-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-base \
+    perl-module-exporter \
+    perl-module-file-spec \
+    perl-module-strict \
+    perl-module-utf8 \
+    perl-module-warnings \
+"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-config \
+    perl-module-constant \
+    perl-module-test-more \
+    perl-module-vars \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0


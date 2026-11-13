Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1602.1794529999213500704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 16:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WnkPOJM9;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so142991b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529998; x=1795134798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymSM7s/TXDR0Lq3YPLCpx82s6TJ0g3HGPrY2oXr2nac=;
        b=WnkPOJM9ooZ1MX+3cIJT3gxe0C/4/EDS2QtcBvvRA9/O9FotsHMYrgzUu6pGy9sVrL
         LS5dg8D6SBHwqjuVgolmPHufEmq38/qlHNgORHwCqNwxdSdHYqfe1UKOT23NaT8Pdvtu
         mlb8BFH2zpSOMuWlmdAcnMpxjMpJFBQU6fSLdviEJEMRTOoxe5ORs1+g2Zf1MPstHZNq
         gSNOlR+I3LJKiRPjQJhOKJQRbqNIenxADLluNuiilAMtsWCwmZ5PCc3iuNE5v3qfzoOi
         U11ww9nJIW08j4VChPO/oUtLb4nd+TVf0IMIOaw6TWWsBsmAyumYjEB2QmK3Cs/e2qEQ
         lpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529998; x=1795134798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymSM7s/TXDR0Lq3YPLCpx82s6TJ0g3HGPrY2oXr2nac=;
        b=j87gUt9nPv6TmcjK8XsN7HfJ78QTiCvcD5KimOrntTlb/0ZEkoUsxWe3XI1P3xK5gJ
         nFAW0S16OT2EEQDNP1xv3DhG/aFxiw0AJTKXNXTb0tfeg5Wn7M9tXJeuHc2p1MRSXKw3
         GcljPTb0DFJJCRW2bSZ5sfpDthHwuU1Xv3mxKDqgbHlF0o6jDErHqZ2VDMCvhQD0dYlJ
         cCcNUri0NAWFQMUhLNvzM/vcXxPVKzxitUFLwCC0TNifK6V9WVmrxpqF4ZoeXlhav6sW
         dvmPSr6K/S9JcXGuezrch+xKbeesxEnY+VMd8iardtrC5B6DnroM713TV7HSjEAr205W
         q4RA==
X-Gm-Message-State: APuU4Z9VPkBwy+/m0Fr9hbR9z4xGx7UDWzjDlHVW+tGgu9T1o2mRk5MM
	sv72fA9xvEzwhb38C3NFjHpfZvXgHQvq7+66zwwjKzwlsf9xO3PsI+4lGaU6oDz9
X-Gm-Gg: AYBFou0hdHCDqgjpu8CZh6wA3v9acdJ1gdseQ6t1gP80CHAJnezuOnSmYPuHi5zUr7e
	WLbxmFb9oN3b/A5RSpkkCHEROltA+jpTWOYaM9LtjvKB2sRtNC5UmaHDMKT3eSniCEtVb0UHhc4
	FP8+sTSPq0zDTpvf2L6zyAE6T82VErtfrc+xWfHoyc5IAZGkgdpMjDEivJP4pjXNBVJa+lloDGI
	AkBt3oTwcNC3DluapnEvsM3RMXet4V0IhjtTZS3q+5Qo0qZKCCDljX04NfsLJHzJWi5Xu6tT4Pv
	Jq1/W/D/cD0EzLhQ40UK8QsxFA5XXZvov9fanYYLISDe3xCBbHz1FjlSwf2oqUIKrBJZHl2HJs/
	jp+Bkbk2O+lYAG0euZfm6PeaXi8VKfbD9et2x84j5keBsxqleziL2ILQSTj2OWBYgdOXoelh99F
	rM2jEj6tmcNoc0qpUP8zjRZ+57KG51uPtiiXFGAwVoESVQpO5lLqeXiMZMaM7DgvVTh/StN8CYW
	7e8TBV7lyU7wzBVqO6d2r+7XisQJeguvysNm/uSRzLnhgu946wJaYJ+8d9WmgEHPmte4g47f6vz
	nK1v+2hxRUVvR7P/rWBA/OBDV0C+qFkao/7QMgmPIjNz0YxUJcsA+uGR
X-Received: by 2002:a05:6a20:6a25:b0:3e2:5d77:4bf3 with SMTP id adf61e73a8af0-3f7a20be142mr782835637.0.1794529998404;
        Thu, 12 Nov 2026 16:33:18 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm388932a12.8.2026.11.12.16.33.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 16:33:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/5] libfile-sharedir-install-perl: add recipe for 0.14
Date: Thu, 12 Nov 2026 16:32:59 -0800
Message-ID: <20261113003302.20809-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113003302.20809-1-tim.orling@konsulko.com>
References: <20261113003302.20809-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 00:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250134
Content-Type: text/plain; charset="utf-8"

File::ShareDir::Install is a configure-time dependency of File::ShareDir
and of XML::Parser since 2.48.

It needs ExtUtils::MM_Unix at runtime: MakeMaker loads MM_$^O
dynamically, so perl-rdepends does not pick it up.

Tested by building target, native and nativesdk and running ptest on
qemux86-64. The tests that write a Makefile skip on target, as they
need a configured source tree.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libfile-sharedir-install-perl_0.14.bb     | 35 +++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libfile-sharedir-install-perl_0.14.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c0f0dd44c1..da62e12451 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -344,6 +344,7 @@ RECIPE_MAINTAINER:pn-libexif = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfakekey = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfaketime = "Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>"
 RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libfile-sharedir-install-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libfm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm-extra = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfontenc = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7e1267f7d6..5920db483b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -38,6 +38,7 @@ PTESTS_FAST = "\
     libconfig \
     libconvert-asn1-perl \
     libexif \
+    libfile-sharedir-install-perl \
     libgpg-error\
     libksba \
     libmd \
diff --git a/meta/recipes-devtools/perl/libfile-sharedir-install-perl_0.14.bb b/meta/recipes-devtools/perl/libfile-sharedir-install-perl_0.14.bb
new file mode 100644
index 0000000000..b7964eeb3e
--- /dev/null
+++ b/meta/recipes-devtools/perl/libfile-sharedir-install-perl_0.14.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Install shared files"
+DESCRIPTION = "File::ShareDir::Install allows you to install \
+               read-only data files from a distribution. It is a \
+               companion module to File::ShareDir, which allows \
+               you to locate these files after installation."
+HOMEPAGE = "https://metacpan.org/release/File-ShareDir-Install"
+BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=File-ShareDir-Install"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a8070807ef71bcb5c0523e6dfa84727"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/File-ShareDir-Install-${PV}.tar.gz"
+SRC_URI[sha256sum] = "8f9533b198f2d4a9a5288cbc7d224f7679ad05a7a8573745599789428bc5aea0"
+
+S = "${UNPACKDIR}/File-ShareDir-Install-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-io-dir \
+    perl-module-strict \
+    perl-module-warnings \
+"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-config \
+    perl-module-file-path \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0


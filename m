Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1605.1794530001758990604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 16:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TxyVQZml;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed1414df17so2887625ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 16:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530001; x=1795134801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBEigf2yrLYw8N4hkHe/BR17m45NeGS/myic355N1gg=;
        b=TxyVQZml1p0lqOKU/q1GHRfq9T6TdOto8RiBJLMd1Ag9KWfyGkfUycVanwV9qV0gfv
         PxuwfWTd8+7bpVlUra4ZBTEhRaz0JZPx7G19wICNSwEZFoeIpukuWzBokvf8ms524yqH
         f/sGRzQ4aFoOwPGr9Daoo74J4h20tGTjgivNotIV+OmhOnrIyA1tqzkG/4j4Lum2SwqP
         BYMEus3fJf/lFCMJwQR6Uv7K5VJcHKwlsnrtgFE3tr5rWDCA0ETUalu8VDgeHGyL52e1
         UWCEef6hBdGlywHx5ieIoT2Ep2T+3aMb9xbFBx443JKSZKDJEDD1Qmn5Mwrl3+4QCLp7
         CJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530001; x=1795134801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBEigf2yrLYw8N4hkHe/BR17m45NeGS/myic355N1gg=;
        b=I1CMOqaTMFP/VN6UYFxBwgTxcFaSG/YAMFIs9sszOfiMIIVKBkilAD+7SQiuxJn+Yn
         d4cIj4fWxSvuxPLfNuFnqDk/JZn5HlKJVgNcl+PaMrmXH3uBU4saUye3q/kkg/kEy4Nf
         nyU0wp6q3vp4WmfmJPgRZ631VyFEJa3KMlx0yDtMug2uOThS/y3pEtDPp+hkwsksCjdd
         bAM8SBLFDrstuCS/qL4aV100MyHTMS3prNq3JhIpEppOAju3ltuUVgQ1SH819FgCsXWI
         FyrNCDE1yiYHHGCKmsPGvcnpJmh6L3jp/avdUAtlqyG6IQaZUWSkjU9sSzscwygZHubH
         ecqA==
X-Gm-Message-State: APuU4Z/yIlp49xWShkczWKSXwC8RX/SIm3EikdRxYIf9L1/WssBiWLlx
	1E73wgPqbBWVqt9fIRzFicQcggKv4vrdqjRJoLHVOlF7fH3Ts+wJAOxqDgbTajuz
X-Gm-Gg: AYBFou0DTeBZjSzvGpLLLWMt4f/Si6fW0aOCvhCvlEpwBGTpUcYtnNaFSRuhq/XdIty
	hPpUSyXfnlLRzgiF3g5FOS7HLMD/R55Km0GGd68zRdhFQZuR5uhdVZFA6YrssckEANgIt1N7JXi
	mLSqgyruHc0J4tyoZcMDWXhHOUU6H9kF3de9IRj98Omdq3n1sa/GlW+REEdmnMDZjrvz4Dus/yD
	sWJc7rZtpMikzrNLAKM/MVDB2E0jF0aG5iC3bK2Ic0Xa4Rbi3uW/WaThoc7Gg9NdI1Qv8Yobtlt
	shr/B7ED6lY24LBzUqlAlnq+JQ6pLI24ntviE5LZKkh+WdCXGcbJdEeiMY4OIPncF2FRk34TSuV
	bRqCjzW9t0S/65z0M/2nLBbVrvdH6xkwiO1iIjp5cmt7FpNy9oP3S9zJ1lIVRQssZQc4fyWxnCy
	7EbV118IwMy2pMaRinSGWjaDw6Q1yVaLQMA2tPolGSqfhr7/poe3x6gNuk1WcZyqejfA3ee8MHp
	WoEZ5qZd7lf3loEFqB/6jRBXONPBHMhG2DGTrtRQNlLFZZTu8Vtv0Ds3FuwpF31sa2ZZGCBR9Rx
	VZNgcN2DgFQlCHmfanhDn3xqBWeoDw1raf+slbkVn2f/J0DtyTYakL0BXw==
X-Received: by 2002:a05:6a21:7804:b0:3de:46cc:b63c with SMTP id adf61e73a8af0-3f7a70ac201mr558576637.11.1794530000928;
        Thu, 12 Nov 2026 16:33:20 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186fc81sm388932a12.8.2026.11.12.16.33.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 16:33:19 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/5] libfile-sharedir-perl: add recipe for 1.118
Date: Thu, 12 Nov 2026 16:33:00 -0800
Message-ID: <20261113003302.20809-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113003302.20809-1-tim.orling@konsulko.com>
References: <20261113003302.20809-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 00:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250135
Content-Type: text/plain; charset="utf-8"

XML::Parser uses File::ShareDir at runtime since 2.48 to locate its
encoding maps.

Tested by building target, native and nativesdk and running ptest on
qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../perl/libfile-sharedir-perl_1.118.bb       | 41 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libfile-sharedir-perl_1.118.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index da62e12451..66eb3fd39a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -345,6 +345,7 @@ RECIPE_MAINTAINER:pn-libfakekey = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfaketime = "Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>"
 RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfile-sharedir-install-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libfile-sharedir-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libfm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm-extra = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfontenc = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5920db483b..ddcb8bc9b4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -39,6 +39,7 @@ PTESTS_FAST = "\
     libconvert-asn1-perl \
     libexif \
     libfile-sharedir-install-perl \
+    libfile-sharedir-perl \
     libgpg-error\
     libksba \
     libmd \
diff --git a/meta/recipes-devtools/perl/libfile-sharedir-perl_1.118.bb b/meta/recipes-devtools/perl/libfile-sharedir-perl_1.118.bb
new file mode 100644
index 0000000000..4f0ac73035
--- /dev/null
+++ b/meta/recipes-devtools/perl/libfile-sharedir-perl_1.118.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Locate per-dist and per-module shared files"
+DESCRIPTION = "File::ShareDir provides a way to access read-only \
+               data files installed alongside a Perl distribution \
+               or module, as installed by \
+               File::ShareDir::Install."
+HOMEPAGE = "https://metacpan.org/release/File-ShareDir"
+BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=File-ShareDir"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2a22a4899749b8c0c56bc4de923f05e9"
+
+DEPENDS += "libfile-sharedir-install-perl-native"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/File-ShareDir-${PV}.tar.gz"
+SRC_URI[sha256sum] = "3bb2a20ba35df958dc0a4f2306fc05d903d8b8c4de3c8beefce17739d281c958"
+
+S = "${UNPACKDIR}/File-ShareDir-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    libclass-inspector-perl \
+    perl-module-base \
+    perl-module-carp \
+    perl-module-constant \
+    perl-module-cwd \
+    perl-module-exporter \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-strict \
+    perl-module-warnings \
+"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-file-basename \
+    perl-module-file-path \
+    perl-module-parent \
+    perl-module-posix \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0


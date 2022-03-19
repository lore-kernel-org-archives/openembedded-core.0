Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B1C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.4771.1647674179892081053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n1lNjzO9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id r7so5922524wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bkPXBEeBwgJhPzfIORTpiIlsglAyhIxDvTqe+Zjzh/Y=;
        b=n1lNjzO9pdZQlVNn7cFui1V4bXGq91DXyVx7d9PZAmp2M+jkGkmWRqTYZm53WnVe9M
         7aDcDbQwDaGpe0DmjW8ONAZRNShk+q8Xa8utDz+aee+pTLSqPb2SXszBl2M68oGfZkXO
         IrPq8zvqn/akMT3kEn+LGuO3Pht4D5jEuErSlLaPNtav/P0j77Iuxq/BENR9rcctP+Rw
         HPsR+K2EmSCk5FrcWVlj9F7lPt7dR/SNcq9II8YzYzVjFyHjgEoRuFjLLHuazaI6kW1P
         lc+U9jkdP1R/EiQuscuKQ0L6QIUj9NaRup/7EYSVwxuqAelMlxTbbCv3TnNf8kGZNaHd
         oStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bkPXBEeBwgJhPzfIORTpiIlsglAyhIxDvTqe+Zjzh/Y=;
        b=NXKz+G00YugtdadOrU/MX53W+Y0to/PVHiQx5qaiGAXmo/vk4klpZX/lplCfrjLG/M
         dB4hkGl2XVeybzGg92wq7Hi+n3IqMsVR6oVW60e0PK0OOMeyoMByvyiIwpMWXVm5DoVU
         HpxlEhcmwaldxJpthlUYpYeU9FGEYG0z5tPKyi7C/bbOjWAWOcyzT0/Mqi8U4NfePtFC
         CEXZT3Q0TORlybJ+yy86trzKl6wLgtVrr3c3cjJyLMO0kttjsaGYRFkbVAWfcDe7ptWj
         7ejU8V4ATGZabDi8fD0erXLAKk05doVFdFGIiKbIU+qNnOPEmq6RpIKt9vWMrB4MUZ8o
         1W2w==
X-Gm-Message-State: AOAM532AwC5wJIUOLduyJGMkITRaGR3+onls07kURCujl9AX5ZkIPy/+
	C0Kcs1O2iDbd+TDp3rGvWRCji+bPtUQ=
X-Google-Smtp-Source: 
 ABdhPJxFb4TQg8P+YNAoqlKiPhVcxe+MaZw5FMiUxNNGXJk1hmu+Jfd7LJjrJRDxfpIYEsukcxP0ow==
X-Received: by 2002:a05:600c:1d0f:b0:38c:8ff8:e703 with SMTP id
 l15-20020a05600c1d0f00b0038c8ff8e703mr3811196wms.202.1647674178167;
        Sat, 19 Mar 2022 00:16:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/11] perl-cross: update 1.3.6 -> 1.3.7
Date: Sat, 19 Mar 2022 08:15:59 +0100
Message-Id: <20220319071605.152904-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163461

Drop upstreamed patches.

0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
is replaced with a tweak to configure parameters.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...nc_sel.sh-disable-thread_safe_nl_lan.patch | 27 --------
 ...h-do-not-hardcode-prefix-lib-as-libr.patch | 69 -------------------
 ...h-do-not-quote-the-argument-to-comma.patch | 29 --------
 ...{perlcross_1.3.6.bb => perlcross_1.3.7.bb} |  5 +-
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 5 files changed, 2 insertions(+), 129 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.6.bb => perlcross_1.3.7.bb} (77%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
deleted file mode 100644
index 744e4e09c3..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d22f2bb5afcd278b68999f5ce0362328fc8c7723 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 3 Jun 2021 18:50:56 +0200
-Subject: [PATCH] cnf/configure_func_sel.sh: disable thread_safe_nl_langinfo_l
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/115]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- cnf/configure_func_sel.sh | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cnf/configure_func_sel.sh b/cnf/configure_func_sel.sh
-index f48294f..90d350d 100644
---- a/cnf/configure_func_sel.sh
-+++ b/cnf/configure_func_sel.sh
-@@ -97,5 +97,9 @@ else
- 	result "irrelevant"
- fi
- 
--# Assume nl_langinfo_l is threadsafe if available
--define d_thread_safe_nl_langinfo_l "$d_nl_langinfo_l"
-+# thread_safe_nl_langinfo_l is not enabled by default
-+# by upstream, and causes t/Langinfo.t to fail when it is
-+# (starting from 5.34.0). This means the configuration is
-+# either not well tested, or not at all tested, so we should
-+# pick a safer option.
-+define d_thread_safe_nl_langinfo_l "undef"
diff --git a/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
deleted file mode 100644
index 386ea3f27f..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 19c1987b455998d2959a5fdf3d1ed911d35e70f2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 2 Jan 2019 17:55:35 +0100
-Subject: [PATCH] configure_path.sh: do not hardcode $prefix/lib as library
- path
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/123]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- cnf/configure_args.sh |  2 +-
- cnf/configure_path.sh | 11 ++++++-----
- 2 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/cnf/configure_args.sh b/cnf/configure_args.sh
-index 29ca4f5..3297fb3 100644
---- a/cnf/configure_args.sh
-+++ b/cnf/configure_args.sh
-@@ -155,7 +155,7 @@ while [ $i -le $# -o -n "$n" ]; do
- 		help) mode="help" ;;
- 		regen|regenerate) mode="regen" ;;
- 		keeplog) defuser "$a" 1 ;;
--		prefix|html[13]dir|libsdir)	defuser $a "$v" ;;
-+		prefix|html[13]dir|libsdir|libdir)	defuser $a "$v" ;;
- 		man[13]dir|otherlibsdir)	defuser $a "$v" ;;
- 		siteprefix|sitehtml[13]dir)	defuser $a "$v" ;;
- 		siteman[13]dir|vendorman[13]dir)defuser $a "$v" ;;
-diff --git a/cnf/configure_path.sh b/cnf/configure_path.sh
-index fe7eac7..bcba8b8 100644
---- a/cnf/configure_path.sh
-+++ b/cnf/configure_path.sh
-@@ -30,6 +30,7 @@ definst() {
- 	define "$1" "$installpath$v"
- }
- 
-+define libdir "$prefix/lib"
- define sharedir "$prefix/share"
- define html1dir "$sharedir/doc/$perlname/html"
- define html3dir "$sharedir/doc/$perlname/html"
-@@ -38,16 +39,16 @@ define man1ext "1"
- define man3dir "$sharedir/man/man3"
- define man3ext "3"
- define bin "$prefix/bin"
--define lib "$prefix/lib"
-+define lib "$libdir"
- define scriptdir "$prefix/bin"
- define libsdirs ' '
--defrel privlib "$prefix/lib/$package/$version"
--defrel archlib "$prefix/lib/$package/$version/$archname"
-+defrel privlib "$libdir/$package/$version"
-+defrel archlib "$libdir/$package/$version/$archname"
- define perlpath "$prefix/bin/$perlname"
- define d_archlib 'define'
- 
- define sitebin	"$prefix/bin"
--defrel sitelib_stem "$prefix/lib/$package/site_perl"
-+defrel sitelib_stem "$libdir/$package/site_perl"
- define sitelib "$sitelib_stem/$version"
- define sitearch "$sitelib_stem/$version/$archname"
- define siteprefix "$prefix"
-@@ -145,7 +146,7 @@ vendortest() {
- }
- 
- vendorpath vendorbin "$vendorprefix/bin"
--vendorpath vendorlib_stem "$vendorprefix/lib/$package/vendor_perl"
-+vendorpath vendorlib_stem "$libdir/$package/vendor_perl"
- vendorpath vendorlib "$vendorlib_stem/$version"
- vendorpath vendorarch "$vendorlib_stem/$version/$archname"
- vendorpath vendorscript "$vendorprefix/bin"
diff --git a/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
deleted file mode 100644
index 1d90b0fda7..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a66811c487ecf8ba8724879c253bb10dfa82aeb5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 1 Jun 2018 19:57:32 +0300
-Subject: [PATCH] configure_tool.sh: do not quote the argument to 'command'
-
-As it seems to break things if the argument has spaces and arguments in it.
-
-Upstream-Status: Backport [443f7bd08b19e71a2e838dcb6cde176998cd350f]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- cnf/configure_tool.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cnf/configure_tool.sh b/cnf/configure_tool.sh
-index 32201c0..461bc68 100644
---- a/cnf/configure_tool.sh
-+++ b/cnf/configure_tool.sh
-@@ -2,7 +2,7 @@
- 
- tryprog() {
- 	log "trying $1=$2"
--	if command -v "$2" 1>/dev/null 2>/dev/null; then
-+	if command -v $2 1>/dev/null 2>/dev/null; then
- 		define "$1" "$2"
- 		result "$2"
- 		return 0
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
similarity index 77%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
index 75d5ea6d36..99a9ca1027 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
@@ -12,16 +12,13 @@ inherit allarch
 
 SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross \
            file://README.md \
-           file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
-           file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://determinism.patch \
-           file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5"
+SRC_URI[perl-cross.sha256sum] = "77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 8a1db7ed35..60a7aff906 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -57,6 +57,7 @@ do_configure:class-target() {
     -Dusethreads \
     -Dsoname=libperl.so.5 \
     -Dvendorprefix=${prefix} \
+    -Dvendorlibdir=${libdir} \
     -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
     -Dlibpth='${libdir} ${base_libdir}' \
     -Dglibpth='${libdir} ${base_libdir}' \
-- 
2.30.2



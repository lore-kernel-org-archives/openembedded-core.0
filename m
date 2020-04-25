Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.357.1587835715631992144
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r+6LEBaT;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id d15so13797132wrx.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0Q/hJ1jpDroDxs8iUkIGq65AY8+J8uSUdzFKVUMCBE=;
        b=r+6LEBaTRuA0LMMVHXYjkX9E5qPTgOXxSrS4zzcVacNqtd0dyh3/D++KN9RI0KFAZ2
         sLSdr/pMQrkf2Wvd1VzdtwTIsvlQMn2WI9KI6F1oa1ppsbbHoW/w734dcwS7smMsG8In
         2JGZIvw1R+nrg0IWx6rZWBuTyEGTB1KJdoh96ApXEx1HC81kFeNu0fu8FK1MKfo4nz21
         vmuWMOV5a2sWmqRoQFroFN4+eVyGtsHQYZLh/hX0JT95RlN5oFEgZ1mx6J+lG4O2GpCx
         wBCzfCncHWUfnVuZVT9lsknxDOv4qOfovIHXKXWechpbbmHksweWVxt938TyodObLPN3
         3rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0Q/hJ1jpDroDxs8iUkIGq65AY8+J8uSUdzFKVUMCBE=;
        b=qa45kIEY0By2VU5JdO/n7tXf42pTYUAMtkb79qMMGgMpcm4OmmFSJBBz52ZOrarpTs
         IOJ9R2COBe56H4JGL+xfqt8nzOBQuV/uSe1toQkT/6wAoWGgHjJhV9AlWlUhulvGlP0k
         DDPG7d9166Q2BlpC9h6swfb2pllDtIs4jInSWJp6CD3IM76fc3Zx7MQKK0eAVAww/hNt
         iIDfsCzVuGs3feLLLK25I+Dnm5qsBdSbQtMTFtqOFebl6BAuxNrt/ZXUahq5KBtDjfiY
         Q8pTG4DlLCiMJYLJjlpuLIfy6OaNrkJCuiy5LEIsqzVrzcKTS1BlAvoO/ieuSWjXXVXd
         IO9w==
X-Gm-Message-State: AGi0PuaWdnP/o3B5GVEJ14uU0dKa967LYELU6ALAkCwsoqkSpae3opoM
	HFRoK2RaFHa934vDdot9htaVVnsw
X-Google-Smtp-Source: APiQypLUMcs3wW8g+0PzFMc4m5fKQ9elDDC2w4RbJjkpd5Ht1XEmBwY7lc1ZXOFUf9yiZahIZnAPVw==
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr18928484wrw.277.1587835713818;
        Sat, 25 Apr 2020 10:28:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/15] perl: update to 5.30.2
Date: Sat, 25 Apr 2020 19:28:07 +0200
Message-Id: <20200425172814.27370-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

racefix.patch was merged to perl-cross
determinism.patch was partially merged to perl-cross

0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
is no longer needed as issue is addressed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...correctly-exclude-unbuilt-extensions.patch | 27 -------------------
 .../perl/files/determinism.patch              | 13 ---------
 .../recipes-devtools/perl/files/racefix.patch | 24 -----------------
 .../perl/{perl_5.30.1.bb => perl_5.30.2.bb}   | 10 +++----
 4 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
 delete mode 100644 meta/recipes-devtools/perl/files/racefix.patch
 rename meta/recipes-devtools/perl/{perl_5.30.1.bb => perl_5.30.2.bb} (97%)

diff --git a/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch b/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
deleted file mode 100644
index 0f3a2c6327..0000000000
--- a/meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b0d53cfd785f64002128ac5eecc4aed0663d9c30 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 9 Jan 2020 17:26:55 +0100
-Subject: [PATCH] tests: adjust to correctly exclude unbuilt extensions
-
-Issue is reported here:
-https://github.com/arsv/perl-cross/issues/85
-
-Upstream-Status: Inappropriate [issue caused by perl-cross]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- t/TEST | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/t/TEST b/t/TEST
-index a9c844f..8d3505f 100755
---- a/t/TEST
-+++ b/t/TEST
-@@ -419,7 +419,7 @@ sub _tests_from_manifest {
- 	while (<MANI>) {
- 	    if (m!^((?:cpan|dist|ext)/(\S+)/+(?:[^/\s]+\.t|test\.pl)|lib/\S+?(?:\.t|test\.pl))\s!) {
- 		my $t = $1;
--		my $extension = $2;
-+		my $extension = $1."/".$2;
- 
- 		# XXX Generates way too many error lines currently.  Skip for
- 		# v5.22
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
index ed4d06f5ec..ccdd52a0d0 100644
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ b/meta/recipes-devtools/perl/files/determinism.patch
@@ -21,19 +21,6 @@ RP 2020/2/7
 Upstream-Status: Pending [75% submitted]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
 
-Index: perl-5.30.1/cnf/configure_attr.sh
-===================================================================
---- perl-5.30.1.orig/cnf/configure_attr.sh
-+++ perl-5.30.1/cnf/configure_attr.sh
-@@ -131,7 +131,7 @@ if not hinted d_c99_variadic_macros 'sup
- 	try_start
- 	try_add '#include <stdio.h>'
- 	try_add '#define foo(fmt, ...) printf(fmt, __VA_ARGS__)'
--	try_add 'int main(void) { foo("%i\n", 1234); return 0; }'
-+	try_add 'int main(void) { foo("%i", 1234); return 0; }'
- 	try_compile
- 	resdef d_c99_variadic_macros 'supported' 'missing'
- fi
 Index: perl-5.30.1/cnf/configure_mods.sh
 ===================================================================
 --- perl-5.30.1.orig/cnf/configure_mods.sh
diff --git a/meta/recipes-devtools/perl/files/racefix.patch b/meta/recipes-devtools/perl/files/racefix.patch
deleted file mode 100644
index bac42d26ae..0000000000
--- a/meta/recipes-devtools/perl/files/racefix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-In our builds Config_heavy.pl sometimes has lines:
-cwarnflags=XXX
-ccstdflags=XXX
-and sometimes does not.
-The reason is that this information is pulled from cflags by configpm and yet
-there is no dependency in the Makefile. Add one to fix this.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/89]
-RP 2020/2/19
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: perl-5.30.1/Makefile
-===================================================================
---- perl-5.30.1.orig/Makefile
-+++ perl-5.30.1/Makefile
-@@ -204,7 +204,7 @@ configpod: $(CONFIGPOD)
- git_version.h lib/Config_git.pl: make_patchnum.pl | miniperl$X
- 	./miniperl_top make_patchnum.pl
- 
--lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh \
-+lib/Config.pm lib/Config_heavy.pl lib/Config.pod: config.sh cflags \
- 		lib/Config_git.pl Porting/Glossary | miniperl$X
- 	./miniperl_top configpm
- 
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.2.bb
similarity index 97%
rename from meta/recipes-devtools/perl/perl_5.30.1.bb
rename to meta/recipes-devtools/perl/perl_5.30.2.bb
index 9d747aa5b4..778c420b2e 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.3.1/perl-cross-1.3.1.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.3.2/perl-cross-1.3.2.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -20,10 +20,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
-           file://0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch \
            file://0001-PATCH-perl-134117-Close-DATA-in-loc_tools.pl.patch \
            file://determinism.patch  \
-           file://racefix.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
@@ -32,10 +30,8 @@ SRC_URI_append_class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.md5sum] = "6438eb7b8db9bbde28e01086de376a46"
-SRC_URI[perl.sha256sum] = "bf3d25571ff1ee94186177c2cdef87867fd6a14aa5a84f0b1fb7bf798f42f964"
-SRC_URI[perl-cross.md5sum] = "1e463b105cfa56d251a86979af23e3a7"
-SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d1590551e40694f21200141d"
+SRC_URI[perl.sha256sum] = "66db7df8a91979eb576fac91743644da878244cf8ee152f02cd6f5cd7a731689"
+SRC_URI[perl-cross.sha256sum] = "defa12f0ad7be0b6c48b4f76e2fb5b37c1b37fbeb6e9ebe938279cd539a0c20c"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.26.1


Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1DB7F828
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q10so4155154wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oYTQzeU2TtPO8sApyqsJ2WGrorzYi2qXu2AeEuDuuZc=;
	b=l77kVceYgsElB8j6hfo0+bS8YI/yXWb+Ry6l8/9C4XlYb4B5k22IKprPKARsQE4/hg
	X/TgrrQOZpEJw0zbweOj4FXERADkq1b6rzhmP6Xgt771NRTf1K40HUOffuzituN7NyLs
	vFICxYg8AEbmIFIoqyWSLJVox+4xjNRnAaIqS/qby0SODNlfbyJHvlr9uzj+u0faIdT0
	VH9dNddvxBoiuUFIncdr9zqylYFruHJqg9hHuvOP+yqJh7jlGuwmypE1N4+7jLfg+Idl
	DabO/mGoaKdQ4vD9I6b4wX3TGiWdCpwL3mbm4gqZx9OX+ydEykUJLZeKgDMwHyftvlrp
	o+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oYTQzeU2TtPO8sApyqsJ2WGrorzYi2qXu2AeEuDuuZc=;
	b=Pjtpo2xeqmMKb355NCWs45JHlzzKqX2XZeZ557BsprEa6bMCWUsbcrzEdEiIn/1Ru4
	+hxH/4xUy7F6KxdOZSkQk1qRj5Xw5C9Uea1MmAJn7S++1RBOOswfZZQORIE01OIQejLA
	0t4NnNy0Pgahp5DmlXIFBS0lWSuSn08hi5ptgQKTbWqycM5VFdz/Cv61agEF9xwvYac1
	3Z2gb7AgboAaX0Eou+KF/VCz6458CLsN1ADR8CbsNLlV7v50qHAm+uGK6stgdCamOMKK
	t1vDKMG3hNv5PaIv5oUm0a1fBlkcVTqzdxQOhf+7qOzeOsw0I9cVGOclCYPJRhIXi5an
	RZkg==
X-Gm-Message-State: APjAAAVl8ffK2l4MzonV+ma2Qj1T+Y6QnoFi5K43ErND3goylbJG9rf2
	icvXofhz3yiDoyAVeTJsGHbvgenK
X-Google-Smtp-Source: APXvYqwdxSLcDAe24mLhO1Ya2ZvR/1tWV3M9SSfibJu5WJ/OuxRL6wOwzjJyQF+aFshaGXJzeUX/TQ==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr10444056wrn.283.1575560653501; 
	Thu, 05 Dec 2019 07:44:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:44 +0100
Message-Id: <20191205154357.121346-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/24] perl: update to 5.30.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2019 15:44:13 -0000

Drop fix-setgroup.patch as the upstream has fixed the issue.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../perl/files/fix-setgroup.patch             | 49 -------------------
 .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}   | 11 ++---
 2 files changed, 5 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/fix-setgroup.patch
 rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb} (97%)

diff --git a/meta/recipes-devtools/perl/files/fix-setgroup.patch b/meta/recipes-devtools/perl/files/fix-setgroup.patch
deleted file mode 100644
index 2b490e60676..00000000000
--- a/meta/recipes-devtools/perl/files/fix-setgroup.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Test script to reproduce the problem:
-
-#!/usr/bin/env perl
-$) = "2 2";
-print $!;
-
-Result from perl 5.28 under strace:
-
-setgroups(1, [2])                       = 0
-setresgid(-1, 2, -1)                    = 0
-
-Result from perl 5.30 under strace:
-
-setgroups(1, [-1])                      = -1 EINVAL (Invalid argument)
-setresgid(-1, 2, -1)                    = 0
-
-Patch which broke this upstream:
-https://perl5.git.perl.org/perl.git/commitdiff/5d4a52b5c68a11bfc97c2e24806993b84a61eade
-
-Issue is that the new function changes the endptr to the end of the
-scanned number and needs to be reset to the end of the string for 
-each iteration of the loop.
-
-[YOCTO #13391]
-
-RP
-2019/6/14
-Upstream-Status: Pending
-
-Index: perl-5.30.0/mg.c
-===================================================================
---- perl-5.30.0.orig/mg.c
-+++ perl-5.30.0/mg.c
-@@ -3179,6 +3256,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
- 	    const char *p = SvPV_const(sv, len);
-             Groups_t *gary = NULL;
-             const char* endptr = p + len;
-+            const char* realend = p + len;
-             UV uv;
- #ifdef _SC_NGROUPS_MAX
-            int maxgrp = sysconf(_SC_NGROUPS_MAX);
-@@ -3209,6 +3287,7 @@ Perl_magic_set(pTHX_ SV *sv, MAGIC *mg)
-                     Newx(gary, i + 1, Groups_t);
-                 else
-                     Renew(gary, i + 1, Groups_t);
-+                endptr = realend;
-                 if (grok_atoUV(p, &uv, &endptr))
-                     gary[i] = (Groups_t)uv;
-                 else {
diff --git a/meta/recipes-devtools/perl/perl_5.30.0.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
similarity index 97%
rename from meta/recipes-devtools/perl/perl_5.30.0.bb
rename to meta/recipes-devtools/perl/perl_5.30.1.bb
index 1d906a75150..9b1f1af0729 100644
--- a/meta/recipes-devtools/perl/perl_5.30.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.3/perl-cross-1.3.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.3.1/perl-cross-1.3.1.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -18,7 +18,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://perl-dynloader.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
-           file://fix-setgroup.patch \
            file://0001-enc2xs-Add-environment-variable-to-suppress-comments.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            "
@@ -26,10 +25,10 @@ SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
 
-SRC_URI[perl.md5sum] = "9770584cdf9b5631c38097645ce33549"
-SRC_URI[perl.sha256sum] = "851213c754d98ccff042caa40ba7a796b2cee88c5325f121be5cbb61bbf975f2"
-SRC_URI[perl-cross.md5sum] = "4dda3daf9c4fe42b3d6a5dd052852a48"
-SRC_URI[perl-cross.sha256sum] = "49edea1ea2cd6c5c47386ca71beda8d150c748835781354dbe7f75b1df27e703"
+SRC_URI[perl.md5sum] = "6438eb7b8db9bbde28e01086de376a46"
+SRC_URI[perl.sha256sum] = "bf3d25571ff1ee94186177c2cdef87867fd6a14aa5a84f0b1fb7bf798f42f964"
+SRC_URI[perl-cross.md5sum] = "1e463b105cfa56d251a86979af23e3a7"
+SRC_URI[perl-cross.sha256sum] = "edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d1590551e40694f21200141d"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.17.1



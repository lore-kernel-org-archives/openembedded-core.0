Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC55A60088
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jul 2016 08:19:34 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c74so11896329pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jul 2016 01:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SzkRdgrjqxz0N2nchFYfbY+5xPFaAEvuD5BYvQqQkjY=;
	b=A+3F7NE9AKksMP3L+ka2Md2jcFjKBE2XIeLHAgnIqhhvWmPeprjJ6sCq/8ZxSMRpT8
	1ggvD8g/jCi0GXX9NMq+ys8mMNc9yKcCkImhvJL1H5YyiQgh4ZCzIucOXAl5Q2rPLPLY
	hwKdxUWJtXlveJCafo7jlnfoVEaT5zJO5EUNOknHq4KfgpjVq0SbVYctd1TG7AyaQ0Ql
	e9+VioVW6OJGXpR7U0jI3LMVlZ3z8FVdN+dgvgfgYp0Xhj5ryplpsQmrf2Y3bfCF02X1
	nVEcZ82LXOdbD2SCa/sVW8xYjCsc9FaQtOxaJcabuiYJ+YBG3XDo7A2qSM0G1L+Z1UNY
	KYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SzkRdgrjqxz0N2nchFYfbY+5xPFaAEvuD5BYvQqQkjY=;
	b=PZSjkEmcMwERRBb+XXahhYigacotg3+LeGdKMMDNLGo2UptViyjJ3UMlYOcv0ftBAd
	OJlEVpwkFOiYtlj5//g1hOtVapIBupMmQCVbabYZRmZKQfwGOfW2yFc5vbxWNysSN/6H
	Sb2uqBNbsq0xRwyxaIIjS1tluSumobvjGNX/lYQatllAJrZc5Jn85Q4fpugkm5lg2hxc
	rTZhKi5hwvMTMfXlZD0y6lA6WJ2LqPy47WlAH44nvppWnPXCP1VFh2QtUazaoWu7Vq0M
	2uintV2vaN8za+89c7eMYBO4qsF2GQqSVXJWQ/jIzOK9aGeFIYLTneKOYNer0WMnYI55
	i8AQ==
X-Gm-Message-State: ALyK8tKk0QMxcrUgM0C65pvQxNNlCSyY/aiAIyyziFqdtSlnjRd8OmAo+12jL4AFmqlG/Q==
X-Received: by 10.98.99.132 with SMTP id x126mr4152452pfb.48.1467447575278;
	Sat, 02 Jul 2016 01:19:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	z189sm3076306pfb.34.2016.07.02.01.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jul 2016 01:19:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Jul 2016 01:19:27 -0700
Message-Id: <20160702081927.7365-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Sat, 02 Jul 2016 08:19:35 -0000

- libc-package.bbclass: Do not use --old-style
  This option has been dropped from latest glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-package.bbclass                      | 4 ++--
 meta/recipes-core/glibc/cross-localedef-native_2.24.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.24.bb                  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4f321d4..6624746 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -290,7 +290,7 @@ python package_do_split_gconvs () {
                 bb.error("locale_arch_options not found for target_arch=" + target_arch)
                 raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
 
-            localedef_opts += " --force --old-style --no-archive --prefix=%s \
+            localedef_opts += " --force  --no-archive --prefix=%s \
                 --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
                 % (treedir, treedir, datadir, locale, encoding, outputpath, name)
 
@@ -298,7 +298,7 @@ python package_do_split_gconvs () {
                 (path, i18npath, gconvpath, localedef_opts)
         else: # earlier slower qemu way 
             qemu = qemu_target_binary(d) 
-            localedef_opts = "--force --old-style --no-archive --prefix=%s \
+            localedef_opts = "--force --no-archive --prefix=%s \
                 --inputfile=%s/i18n/locales/%s --charmap=%s %s" \
                 % (treedir, datadir, locale, encoding, name)
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index 79c3132..c921211 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV_glibc ?= "76a0b73e8102c5bfb5cb791e34992472f5d1d33e"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 77630e3..a5e1ad6 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV ?= "76a0b73e8102c5bfb5cb791e34992472f5d1d33e"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
-- 
2.9.0



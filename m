Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE3E46013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:30:30 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id us13so2382485pab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 11:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IeAQWa1MXGUpxLZb8ViQ7IC48nqdbWkcmyQzPNMlUrI=;
	b=YMF8lNbmkZBLnn880kdQg+CntVKYRxLMnGbHc5eXuZbsX/JEE+X65iLc8XZvaUghI8
	FzDn6L/7usNOk7E00qQnbObGYMtpTCqx+H9V1VrGlaxtUgyPbeG2WZsej5wv0IF5X6tM
	we5gXx+WtCGptg+B1yLwBZvgyKdRpRnQph3kFNNxHisEXx33e7hQQVpBCTZxBFBrN/du
	JwlWCKhMolO56gvrTNzySTDavA/exh0akCzwKyZrrsdd4mS4W7Oq+cra7g+N3Gkyw7fj
	4PF0KuwMSvxQIhgss5qNG/BRzkJB/l1KjTKLNy+QBH8zSBKu6Es96JUGlkUBiJo2uTEc
	fehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=IeAQWa1MXGUpxLZb8ViQ7IC48nqdbWkcmyQzPNMlUrI=;
	b=IJWHv0jRHyyJVoTjfBoDy3J5t3+wWEH6QtefhI46ps6Pi8xULqLIqFKc+oQNQPR2wx
	DgW+s6LVVcl8i/HlL4X+fM5I3f38kxAGgKy9DXGr3tlcsIJxE51ISiHKJS7sKRUorxT3
	SShrziLc9e+bV3XpaHjbUCLAEYQlJ0c8g8NKtNbj7IqJ+6QomJUZqr+KN2tgolMHGYlg
	HjXZ+I72RKIY1HEBS5cuB+7IoBpgN3hrc7fLPSfOQbrD257O+7JJSvxPjkUyo8Q0QBgn
	66Ebj5R0tSSurgG4EQLdMqEbzh4r7aaQQSRX7viFNdXxuRCwqcauhBYU9xeayhUVV5PV
	VGQA==
X-Gm-Message-State: ALyK8tI9rkrhB7CMWfcxmHjGxMGrZpn7NyMPxm0r8YqS6mv+0/boSasBvFoQBNBuYsjsaw==
X-Received: by 10.66.249.161 with SMTP id yv1mr2462218pac.39.1467914915622;
	Thu, 07 Jul 2016 11:08:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id j8sm6106747paj.22.2016.07.07.11.08.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 11:08:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:08:27 -0700
Message-Id: <6420800e1e7660addae87de6493e2fd40c18b2c5.1467914773.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
References: <35285b0dd386fd16e53678361ee33e8525671a21.1467914773.git.raj.khem@gmail.com>
In-Reply-To: <cover.1467914773.git.raj.khem@gmail.com>
References: <cover.1467914773.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 07 Jul 2016 18:30:33 -0000

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
index 79c3132..104e38b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -22,7 +22,7 @@ GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV_glibc ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 77630e3..f0c6a03 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV ?= "d461c9682d4954076f9ee9e07be903c2eef8e73b"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
-- 
2.9.0



Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 66657762B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:26 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ho8so157838882pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=XNunPw/7W+TNTJ/vFwgmWXyCoGrma3ynjn6Ij50ev2Q=;
	b=08zaEeafntc+V7IXV3kXvGSPAaC+96VnQch4mn3Rz3vhyQ0mcE9E2Avbp8Juksoeby
	uxbNhqjyhCOhXBn9T+04gFaxcv+tiTwyC0NweL5JkLdPfqJMvSZuii6Q1FwViPhzGF6C
	DlLJZiLminA+25ucDxLKR3DvBlz6iiTGIyh2F5XhUt65ZDCGdG3EdqTKsZdvByrgATqH
	t6z+HkuyM39/7TeHeUIPRtNRb2k1W1DGw3BBh/tJPy+xKUm8nZHZvk4FBnT+G/Qp/Cje
	/hgXsBeFfe9n/Xg7lUNK4ubOeBb3YeShcasSMRREkiIIkPOgjkNx3WFvdfq3al9FxdVP
	yxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XNunPw/7W+TNTJ/vFwgmWXyCoGrma3ynjn6Ij50ev2Q=;
	b=Ezu2iZRXIo8587pIlJp7OQmJt7nT3Qzrz6VjbFJMTfAylEMBWMP+qeUF308ruO1Aag
	hON5AmDOhUz1xM5pKqkDKN02/6+9+LesttohqbtFXHNvHmejNNwkaxBwMu2F+3+c1c4O
	W7FJdBnxolQw7UXlqDLMejqT1RYKpa97ObxIoyrbsCJLtFO6077pGs9lyY9wgaMjZU42
	ePaGBaxgFhvOFkUMkebcbVoKz/1xMWdM/bnHdzipxhLc6Z3EwRBayoExaDlipbkkuV74
	znj5SPjZHK0DpOTeuBc81fMCfOBR+gtrUDft9e9n5M+9PmWAOBDuUiEZR00KGaqrvKBj
	10Qg==
X-Gm-Message-State: ALoCoQkI+ZY33qG6/4QTSZvrmAgG7Y5mBnK5+8xa9pixBKAWPeIzUIoeenCMl5pRgoygwhbvkbtisuGQ/hJk7G/7gJb2l+f69Q==
X-Received: by 10.66.117.199 with SMTP id kg7mr28558750pab.105.1453030645378; 
	Sun, 17 Jan 2016 03:37:25 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:00 -0800
Message-Id: <89c840f61a93e7c93f227f875b3707c9243cb859.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 27/73] dpkg: Add musleabi to known architectures
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:27 -0000

Remove a glibc specific patch to be applied only for native version,
this is a dpkg-native specific patch needed for Centos 5.8, this patch
should be redone to be glibc independent for it to be applied to all
types of dpkg recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0006-add-musleabi-to-known-target-tripets.patch | 42 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
new file mode 100644
index 0000000..a6b0088
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -0,0 +1,42 @@
+From f8910022dc3ec622272f168cd0022dbdf6dff93a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Dec 2015 23:05:41 +0000
+Subject: [PATCH] add musleabi to known target tripets
+
+helps compiling dpkg for musl/arm-softfloat
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ ostable      | 1 +
+ triplettable | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/ostable b/ostable
+index 3bb6819..d0ffdc7 100644
+--- a/ostable
++++ b/ostable
+@@ -15,6 +15,7 @@
+ uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
+ uclibc-linux		linux-uclibc		linux[^-]*-uclibc
+ musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
++musleabi-linux		linux-musleabi		linux[^-]*-musleabi
+ musl-linux		linux-musl		linux[^-]*-musl
+ gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
+ gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
+diff --git a/triplettable b/triplettable
+index 1213584..70d24c1 100644
+--- a/triplettable
++++ b/triplettable
+@@ -6,6 +6,7 @@
+ uclibceabi-linux-arm	uclibc-linux-armel
+ uclibc-linux-<cpu>	uclibc-linux-<cpu>
+ musleabihf-linux-arm	musl-linux-armhf
++musleabi-linux-arm	musl-linux-armel
+ musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
index 4c3fa4f..dd1109b 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
@@ -1,17 +1,18 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
 SRC_URI += "file://noman.patch \
             file://remove-tar-no-timestamp.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
-            file://glibc2.5-sync_file_range.patch \
             file://add_armeb_triplet_entry.patch \
 	    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
 	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
 	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
+	    file://0006-add-musleabi-to-known-target-tripets.patch \
            "
 
 SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
-- 
2.7.0


